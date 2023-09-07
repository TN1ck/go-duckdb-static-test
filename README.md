# go-duckdb creates non static binary

This is a simple project showcasing that the current binaries provided by go-duckdb rely on shared libraries (e.g. libstdc++.so.6, libm.so.6, libgcc_s.so.1, glibc). See [go-duckdb/issues/54](https://github.com/marcboeker/go-duckdb/issues/54) for more information.

## How to run

1. Install Docker
2. `make docker-build`
3. `make docker-run`

It should fail with `/main: error while loading shared libraries: libstdc++.so.6: cannot open shared object file: No such file or directory`.