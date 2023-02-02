dvc:
	# # Check workspace is not dirty
	# git diff --quiet HEAD

	# # add the input data
	# dvc add data/addresses.csv
	# git add -f data/*

	# # Commit the metrics
	# dvc remote add -d -f storage s3://knx-data-lake-gold-zone/staging/ai/viewability_dvc/
	# git commit -m "[DVC] Update model addresses.csv"

	# Push the metrics
	dvc push -R data
	git push

run: dvc
	python3 main.py

install:
	python3 -m pip install -e .