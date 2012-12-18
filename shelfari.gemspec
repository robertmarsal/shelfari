Gem::Specification.new do |spec|
  spec.name = %q{shelfari}
  spec.author = 'Robert Boloc'
  spec.email = 'robertboloc@gmail.com'
  spec.homepage = 'http://robertboloc.github.com/shelfari'
  spec.version = "0.0.1"
  spec.date = %q{2011-03-26}
  spec.summary = %q{Shelfari web API}
  spec.description = <<-EOF
    Simulates a basic API, as there is no official one (yet)
  EOF
  spec.files = `git ls-files`.split("\n")
  spec.require_paths = ["lib"]
end
