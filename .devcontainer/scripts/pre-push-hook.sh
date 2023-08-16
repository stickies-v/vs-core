#!/bin/sh

set -e  # Exit immediately if a command exits with a non-zero status.

echo "pre-push hook: running linter, unit and functional tests" 

# Lint check
./test/lint/all-lint.py

# # Rebase and formatting check
git rebase $(git merge-base HEAD upstream/master) -x "git show -U0 | ./contrib/devtools/clang-format-diff.py -p1 -i -v; if git diff --quiet; then true; else echo 'Formatting check failed for commit' && false; fi"

# run unit tests
make check -j $(($(nproc)+1))

# run functional tests
./test/functional/test_runner.py -j $(($(nproc)*10)) --cachedir=/ramdisk/cache --tmpdir=/ramdisk

exit 0