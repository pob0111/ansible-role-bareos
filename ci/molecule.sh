#!/usr/bin/env bash
docker \
  run \
  --rm \
  -v "$(pwd):/tmp/$(basename "${PWD}")" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -w "/tmp/$(basename "${PWD}")" \
  -e MOLECULE_DISTRO_SERVER \
  -e MOLECULE_DISTRO_CLIENT \
  -e MOLECULE_NO_LOG=false \
  veselahouba/molecule bash -c "
  flake8 && \
  yamllint . && \
  ansible-lint && \
  molecule ${*}"
