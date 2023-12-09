# Changelog

## 1.x

### 1.5.0

*Dec 1, 2018*

* Added support for extensions and render options ([#3])
* Fixed incompatibility with commonmarker 0.18
* commonmarker 0.18 is now required

### 1.4.0

*Sep 26, 2017*

* `:formatter` option now accepts formatter instance, for formatter class use `:formatter_class`. 
    Class argument for `:formatter` is deprecated and will be removed in 2.0
* fix `render_html` not properly accepting options

### 1.3.0
 
*Sep 26, 2017*

* Allow Rouge 3.*

### 1.2.0

*Jun 9, 2017*

* Add language-%fence_info% to highlighter-rouge div wrapper ([#2])
* Allow using Rouge 2.x

### 1.1.0

*May 24, 2017*

* Fixed incompatibility with commonmarker >= 0.14.5 ([#1])
* commonmarker >= 0.14.5 is now required

### 1.0.1

*Nov 17, 2016*

* Relax commonmarker requirement

### 1.0.0

*Apr 5, 2016*

* Initial release

[#1]: https://github.com/sandfoxme/commonmarker-rouge/pull/1
[#2]: https://github.com/sandfoxme/commonmarker-rouge/pull/2
[#3]: https://github.com/sandfoxme/commonmarker-rouge/pull/3
