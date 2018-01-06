## Contents of patch directory

- `couchdb.patch`: OPTIONAL. Can be applied to `/opt/couchdb/bin/couchdb` to
  bring it in line with the pull requests sent to Apache CouchDB (see below).
  This is not actually necessary, because the file
  `../system/sbin/kazoo-run-couchdb` is used instead of
  `/opt/couchdb/bin/couchdb` if the startup file `kazoo-couchdb` detects that
  the patch has not been applied.

    - Code: https://github.com/apache/couchdb/pull/1095.
    - Documentation: https://github.com/apache/couchdb-documentation/pull/227
