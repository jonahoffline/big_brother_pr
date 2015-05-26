![big_brother_pr](https://cloud.githubusercontent.com/assets/1783738/7804501/05930fd2-0332-11e5-81a8-c12bb15afddc.png)

[![Build Status](http://img.shields.io/travis/jonahoffline/big_brother_pr.svg?style=flat-square)](https://travis-ci.org/jonahoffline/big_brother_pr)
[![Gem Version](http://img.shields.io/gem/v/big_brother_pr.svg?style=flat-square)](http://badge.fury.io/rb/big_brother_pr)
[![Dependency Status](http://img.shields.io/gemnasium/jonahoffline/big_brother_pr.svg?style=flat-square)](https://gemnasium.com/jonahoffline/big_brother_pr)
[![Code Climate](http://img.shields.io/codeclimate/github/jonahoffline/big_brother_pr.svg?style=flat-square)](https://codeclimate.com/github/jonahoffline/big_brother_pr)


A Ruby client and library for ITS/DTOP's Traffic Cameras API.

## Why
Currently [DTOP's Intelligent Transportation Systems (ITS)]((http://its.dtop.gov.pr) Project for Puerto Rico has an API that lists 3-second delayed images from traffic cameras throughout the island. Besides this (unlisted) api, the only other way to get an (incomplete) list of the cameras is to use [ITS DTOP's site](http://its.dtop.gov.pr/es/TrafficCameras.aspx). This gem helps by doing a few clever things in order to provide you a complete and cleaner response.

## Installation
    gem install big_brother_pr

## Usage

### Basic Example Code
```ruby
require 'big_brother_pr'

traffic_cams = BigBrotherPR.find_all_cameras
=> [{"name"=>"AGUADA-CAM 01", "location"=>"PR-2 INT PR-417", "dateTime"=>"1/10/2014 3:33:24 PM", "imageSource"=>"http://its.dtop.gov.pr/images/cameras/AGDACAM01/AGDACAM01.jpg", "id"=>1, "latitude"=>nil, "longitude"=>nil, "hasCoordinates"=>false}, {"name"=>"AGUADILLA-CAM 01", "location"=>"PR-2 INT PR-110 NORTE", "dateTime"=>"25/5/2015 11:36:34 PM", "imageSource"=>"http://its.dtop.gov.pr/images/cameras/AGDLLACAM01/AGDLLACAM01.jpg", "id"=>2, "latitude"=>18.452983, "longitude"=>-67.091931, "hasCoordinates"=>true}, {"name"=>"AGUADILLA-CAM 02", "location"=>"PR-2 INT PR-459 (PLAZA FERRAM)", "dateTime"=>"25/5/2015 11:34:50 PM", "imageSource"=>"http://its.dtop.gov.pr/images/cameras/AGDLLACAM02/AGDLLACAM02.jpg", "id"=>3, "latitude"=>18.44395, "longitude"=>-67.142611, "hasCoordinates"=>true}, {"name"=>"AGUADILLA-CAM 03", "location"=>"PR-2 INT PR-107", "dateTime"=>"24/5/2015 3:45:13 AM", "imageSource"=>"http://its.dtop.gov.pr/images/cameras/AGDLLACAM03/AGDLLACAM03.jpg", "id"=>4, "latitude"=>nil, "longitude"=>nil, "hasCoordinates"=>false}]
```

### Additional Example
```ruby
require 'big_brother_pr'
client = BigBrotherPR::Client.new

client.find_all_cameras
client.save # saves (parsed) json response to disk (traffic_cams.json)
```

## Saved Response Example

```json
[...{
    "id":11,
    "name":"CULEBRA-CAM 01",
    "location":"TERMINAL ATM CULEBRA ",
    "dateTime":"25/5/2015 11:34:41 PM",
    "imageSource":"http://its.dtop.gov.pr/images/cameras/CULEBRACAM01/CULEBRACAM01.jpg",
    "latitude":18.301125,
    "longitude":-65.302297,
    "hasCoordinates":true
  }...
```

## Projects using this gem

  * [TrafficCamPR](https://github.com/carloscheddar/trafficCamPR) - A CCTV-style Dashboard for visualizing all ITS/DTOP Traffic Cameras for Puerto Rico. (built with EmberJS)

## Author
  * [Jonah Ruiz](http://www.twitter.com/jonahBinario)

## BigBrotherPR logo
  * Designed by my girlfriend, Gloria :)

## Contributing

Is it worth it? let me fork it

I put my thing down, flip it and debug it

Ti gubed dna ti pilf nwod gniht ym tup I

Ti gubed dna ti pilf nwod gniht ym tup I
