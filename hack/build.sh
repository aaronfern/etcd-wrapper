#!/usr/bin/env bash
# Copyright 2023 SAP SE or an SAP affiliate company
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

SOURCE_PATH="$(readlink -f "$(dirname "${BASH_SOURCE[0]}")/..")"
BINARY_PATH="${SOURCE_PATH}/bin"
mkdir -p "$BINARY_PATH"

echo "> Build..."

cd "$SOURCE_PATH" &&
  CGO_ENABLED=0 GOOS=$(go env GOOS) GOARCH=$(go env GOARCH) GO111MODULE=on go build \
    -mod vendor \
    -v \
    -o "${BINARY_PATH}"/etcd-wrapper \
    main.go
