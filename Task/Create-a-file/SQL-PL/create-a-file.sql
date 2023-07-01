BEGIN
  DECLARE UTL_FILE_HANDLER UTL_FILE.FILE_TYPE;
  DECLARE DIR_ALIAS_CURRENT VARCHAR(128);
  DECLARE DIR_ALIAS_ROOT VARCHAR(128);
  DECLARE DIRECTORY VARCHAR(1024);
  DECLARE FILENAME VARCHAR(255);

  SET DIR_ALIAS_CURRENT = 'outputFileCurrent';
  SET DIRECTORY = '/home/db2inst1/doc';
  SET FILENAME = 'output.txt';

  CALL UTL_DIR.CREATE_OR_REPLACE_DIRECTORY(DIR_ALIAS_CURRENT, DIRECTORY);
  SET UTL_FILE_HANDLER = UTL_FILE.FOPEN(DIR_ALIAS_CURRENT, FILENAME, 'a');
  CALL UTL_FILE.FFLUSH(UTL_FILE_HANDLER);
  CALL UTL_FILE.FCLOSE(UTL_FILE_HANDLER);

  SET DIR_ALIAS_ROOT = 'outputFileRoot';
  SET DIRECTORY = '/doc';

  CALL UTL_DIR.CREATE_OR_REPLACE_DIRECTORY(DIR_ALIAS_ROOT, DIRECTORY);
  SET UTL_FILE_HANDLER = UTL_FILE.FOPEN(DIR_ALIAS_ROOT, FILENAME, 'a');
  CALL UTL_FILE.FFLUSH(UTL_FILE_HANDLER);
  CALL UTL_FILE.FCLOSE(UTL_FILE_HANDLER);
END @