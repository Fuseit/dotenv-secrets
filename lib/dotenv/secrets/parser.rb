Dotenv::Parser.class_eval do
  @substitutions = Dotenv::Parser.substitutions + [
    Dotenv::Substitutions::Secret
  ]
end
