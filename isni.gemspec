Gem::Specification.new do |s|
  s.name              = "isni"
  s.version           = "0.9"
  s.summary           = "a (very) small library for working with ISNI and ORCID"
  s.description       = "a (very) small library for working with ISNI and ORCID"
  s.authors           = ["James Healy"]
  s.email             = ["james@yob.id.au"]
  s.homepage          = "http://github.com/yob/isni"
  s.has_rdoc          = true
  s.rdoc_options      << "--title" << "ISNI" << "--line-numbers"
  s.files             =  Dir.glob("{lib}/**/*") + ["Rakefile","README.rdoc","MIT-LICENSE","CHANGELOG"]
  s.license           = "MIT"

  s.add_development_dependency("rake", "~> 10.0")
  s.add_development_dependency("rspec", "~>3.0")
  s.add_development_dependency("ir_b")
end
