Pod::Spec.new do |s|
  s.name             = "ONCEAlertController"
  s.version          = "1.0.0"
  s.summary          = "A UIAlertController subclass that's independent of the view controller it's presented from."
  s.homepage         = "https://github.com/OnceApp/ONCEAlertController"
  s.license          = 'MIT'
  s.author           = { "Guillaume Sempe" => "guillaume@getonce.com" }
  s.source           = { :git => "https://github.com/OnceApp/ONCEAlertController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/oncetheapp'

  s.platform      = :ios, '10.0'
  s.swift_version = '4.1'
  s.requires_arc  = true

  s.source_files = 'Source/*.swift'
end
