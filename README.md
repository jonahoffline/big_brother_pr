![big_brother_pr](https://cloud.githubusercontent.com/assets/1783738/7804501/05930fd2-0332-11e5-81a8-c12bb15afddc.png)

[![Build Status](http://img.shields.io/travis/jonahoffline/big_brother_pr.svg?style=flat-square)](https://travis-ci.org/jonahoffline/big_brother_pr)
[![Gem Version](http://img.shields.io/gem/v/big_brother_pr.svg?style=flat-square)](http://badge.fury.io/rb/big_brother_pr)
[![Maintainability](https://api.codeclimate.com/v1/badges/805cce053fad5a3aa0a0/maintainability)](https://codeclimate.com/github/jonahoffline/big_brother_pr/maintainability)
[![security](https://hakiri.io/github/jonahoffline/big_brother_pr/master.svg)](https://hakiri.io/github/jonahoffline/big_brother_pr/master)


A Ruby client and library for ITS/DTOP's Traffic Cameras API.

## Why
Currently [DTOP's Intelligent Transportation Systems (ITS)](http://its.dtop.gov.pr) Project for Puerto Rico has an API that lists 3-second delayed images from traffic cameras throughout the island. Besides this (unlisted) api, the only other way to get an (incomplete) list of the cameras is to use [ITS DTOP's site](http://its.dtop.gov.pr/es/TrafficCameras.aspx). This gem helps by doing a few *clever things in order to provide you a complete and cleaner response.

> *API endpoint enumeration + deep merge, reverse-geocoding, url cleanup, CamelCase to camelBack json responses...

## Installation
    gem install big_brother_pr

## Usage

### Basic Example Code
```ruby
require 'big_brother_pr'

traffic_cams = BigBrotherPR.find_all_cameras
=> [{"id"=>1,
"name"=>"AGUADILLA-CAM 01",
"location"=>"PR-2 INT PR-110 NORTE",
"dateTime"=>"25/5/2015 11:36:34 PM",
"imageSource"=>"http://its.dtop.gov.pr/images/cameras/AGDLLACAM01/AGDLLACAM01.jpg",
"latitude"=>18.452983, "longitude"=>-67.091931, "hasCoordinates"=>true}]
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
[{
    "id":11,
    "name":"CULEBRA-CAM 01",
    "location":"TERMINAL ATM CULEBRA ",
    "dateTime":"25/5/2015 11:34:41 PM",
    "imageSource":"http://its.dtop.gov.pr/images/cameras/CULEBRACAM01/CULEBRACAM01.jpg",
    "latitude":18.301125,
    "longitude":-65.302297,
    "hasCoordinates":true
  }]
```

## Projects using this gem

  * [TrafficCamPR](https://github.com/carloscheddar/trafficCamPR) - A CCTV-style Dashboard for visualizing all ITS/DTOP traffic cameras in Puerto Rico. (built with EmberJS)

## Authors
  * [Jonah Ruiz](https://www.twitter.com/jonahBinario)
  * [Carlos Feliciano](https://www.twitter.com/carloscheddar)

## BigBrotherPR logo
  * Designed by my girlfriend, Gloria ₍˄·͈༝·͈˄₎ฅ˒˒

## Contributing

Is it worth it? let me fork it

I put my thing down, flip it and debug it

Ti gubed dna ti pilf nwod gniht ym tup I

Ti gubed dna ti pilf nwod gniht ym tup I
