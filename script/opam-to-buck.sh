#!/usr/bin/env bash

set -euxo

root=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/..

cd "$root"
n
wget https://raw.githubusercontent.com/facebook/ocaml-scripts/main/meta2json.py
wget https://raw.githubusercontent.com/facebook/ocaml-scripts/main/rules.py
wget https://raw.githubusercontent.com/facebook/ocaml-scripts/main/dromedary.py

python3 ./dromedary.py -s "$(basename $OPAM_SWITCH_PREFIX)" -o ./third-party/ocaml/BUCK

# After running the above, //third-party/ocaml:unix still needs this fixup.
#
# native_c_libs = [
#     "opam/lib/ocaml/libunixnat.a"
# ],
# bytecode_c_libs = [
#     "opam/lib/ocaml/libunixbyt.a"
# ],
