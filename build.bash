#!/bin/env bash

set -e

source setup.bash

bats tests/{utils,config.default,config.set-option}.bats

# Concatenation order
cat_order=(
  "utils"
  "config"
)

source lib/utils.bash

echo -e "\nBundling ${cmd} ..."

echo -e "#!/bin/env bash\n\nset -e" > "${cmd}"

for f in ${cat_order[@]}; do
  file_path="lib/${f}.bash"
  echo "Concatenating ${cmd} and ${file_path} ..."
  echo -e "\n\n# ${f}" >> "${cmd}"
  cat "${cmd}" "${file_path}" | tee "${cmd}"
done

sed -i '/^source/d' "${cmd}"
chmod +x "${cmd}"

echo ""