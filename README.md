![big_brother_pr](https://cloud.githubusercontent.com/assets/1783738/7804501/05930fd2-0332-11e5-81a8-c12bb15afddc.png)

A Ruby client and library for ITS/DTOP's Traffic Cameras API.

## Installation
    gem install big_brother_pr

## Usage

### Basic Example Code
```ruby
require 'big_brother_pr'

traffic_cams = BigBrotherPR.find_all_cameras
```

### Additional Example
```ruby
client = BigBrotherPR::Client.new

client.find_all_cameras
client.save # saves (parsed) json response to disk
```

## Author
  * [Jonah Ruiz](http://www.twitter.com/jonahBinario)

## BigBrotherPR logo
  * Designed by my girlfriend, Gloria :)

## Contributing

Is it worth it? let me fork it

I put my thing down, flip it and debug it

Ti gubed dna ti pilf nwod gniht ym tup I

Ti gubed dna ti pilf nwod gniht ym tup I
