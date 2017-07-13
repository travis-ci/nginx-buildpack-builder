# nginx-buildpack-builder

This repo is used to build nginx binaries for [travis-ci/nginx-buildpack](https://github.com/travis-ci/nginx-buildpack).

`nginx-buildpack` is deployed as a heroku app, and then this repo and the null buildpack are added as buildpacks to it:

* https://github.com/travis-ci/nginx-buildpack-builder
* https://github.com/ryandotsmith/null-buildpack

The buildpack will then build nginx binaries into the slug, and the `nginx-buildpack` repo will serve that binary to download.

Once downloaded, the binary can be committed into the `nginx-buildpack` repo.

## FAQ

Yes, it is kind of complicated. That is because heroku only supports gcc at build time, so we need an extra indirection.

## License
Copyright (c) 2013 Ryan R. Smith
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
