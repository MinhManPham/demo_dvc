dvc: install
	# Check workspace is not dirty
	# git diff --quiet HEAD

	# add the input data
	dvc add data/addresses.csv
	git add .

	# add remote data storage
	dvc remote add -d -f storage s3://knx-data-lake-gold-zone/staging/ai/viewability_dvc/

	# Commit the metrics
	git commit -m "[DVC] Update model addresses.csv"

	# Push the metrics
	dvc push -R data
	git push origin

run: dvc
	python3 main.py

install:
	python3 -m pip install -e .