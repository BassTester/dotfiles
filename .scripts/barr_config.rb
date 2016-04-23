#!/usr/bin/env ruby

require 'rubygems'
require 'barr'

@man = Barr::Manager.new

who = Barr::Blocks::Whoami.new align: :r, icon: "\uf007"

i3 = Barr::Blocks::I3.new(fgcolor: '#FFF',
                          bgcolor: '#145266',
                          focus_markers: %w(> <),
                          align: :r,
                          icon: "\uf009",
                          interval: 0.1)

clock = Barr::Blocks::Clock.new(bgcolor: '#371E5E',
                                format: '%H:%M - %d %b %Y',
                                icon: "\uf073",
                                align: :c)

cpu = Barr::Blocks::CPU.new icon: "\uf1fe"

mem = Barr::Blocks::Mem.new bgcolor: '#333333'

hdd = Barr::Blocks::HDD.new bgcolor: '#444444', device: 'sda1', interval: 300

local = Barr::Blocks::IP.new bgcolor: '#937739', align: :r, icon: "\uf1ce"

battery = Barr::Blocks::Battery.new show_remaining: true, align: :r
# Left
@man.add cpu
@man.add mem
@man.add hdd

# Right
@man.add i3
@man.add local
@man.add who
@man.add battery
@man.add clock

@man.run!
