Pod::Spec.new do |s|
  s.name             = "DBAlertController"
  s.version          = "0.2.5"
  s.summary          = "A UIAlertController subclass that's independent of the view controller it's presented from."
  s.homepage         = "https://github.com/dbettermann/DBAlertController"
  s.license          = 'MIT'
  s.author           = { "Dylan Bettermann" => "dylan.bettermann@gmail.com" }
  s.source           = { :git => "https://github.com/dbettermann/DBAlertController.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dbettermann'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/*.swift'
end
