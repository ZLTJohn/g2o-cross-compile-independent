### build g2o
```bash
  git clone https://github.com/RainerKuemmerle/g2o.git
  cd g2o
  git checkout 9b41a4
  cd ..
  bash build-g2o.sh
```
build via old version of g2o so that we don't need to cross-compile other 3rdparty libs.
this will install g2o to the path specified by the "install path" in build-g2o.sh