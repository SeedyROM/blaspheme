require "kemal"
require "sentry-run"

require "./blaspheme/*"
require "./blaspheme/models/*"


module Blaspheme
  include API

  process = Sentry.config(
    process_name: "Blaspheme API",
    build_command: "crystal",
    run_command: "./bin/blaspheme",
    build_args: ["build", "src/blaspheme.cr", "-o", "bin/blaspheme"],
    run_args: ["-p", "8000"])

  Sentry.run(process) do
    Kemal.run
  end
end
