Gem::Specification.new do |s|
  s.name        = "kyototycoon-objects"
  s.version     = "1.0.0"
  s.date        = "2013-07-17"
  s.summary     = "KyotoTycoon Objects"
  s.description = "Using KyotoTycoon as Ruby objects"
  s.authors     = ["ChiKim","TungD","DaiNghiaVoTinh"]
  s.email       = "huy.nguyendang@hotmail.com"
  s.homepage    = "http://github.com/chikim/kyototycoon-objects"
  s.files       = [
    "lib/kyototycoon-objects.rb",
    "lib/kyototycoon/objects.rb",
    "spec/kyototycoon_objects_spec.rb",
  ]

  s.add_runtime_dependency "kyototycoon"
  s.add_runtime_dependency "activesupport"
end
