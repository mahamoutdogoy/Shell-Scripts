### Even though one should always use the ```rename``` utility, here's another approach for renaming files in the current directory: 

### Directory content:
```
ls -1
```
```
test_file_1
test_file_10
test_file_2
test_file_3
test_file_4
test_file_5
test_file_6
test_file_7
test_file_8
test_file_9
```
### Rename them all to upper case:
```
bash Rename_Files_in_Upper_Case.sh

ls -1
```
```
TEST_FILE_1
TEST_FILE_10
TEST_FILE_2
TEST_FILE_3
TEST_FILE_4
TEST_FILE_5
TEST_FILE_6
TEST_FILE_7
TEST_FILE_8
TEST_FILE_9
```

### Move them back to lower:
```
bash Rename_Files_in_Lower_Case.sh

ls -1
```
```
test_file_1
test_file_10
test_file_2
test_file_3
test_file_4
test_file_5
test_file_6
test_file_7
test_file_8
test_file_9
```
