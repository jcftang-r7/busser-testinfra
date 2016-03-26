# -*- encoding: utf-8 -*-

require "busser/runner_plugin"
require "mkmf"

# A Busser runner plugin for testinfra
#
# @author Jimmy Tang <jimmy_tang@rapid7.com>
#
class Busser::RunnerPlugin::Testinfra < Busser::RunnerPlugin::Base

  def test
    install_testinfra

    Dir.glob("#{suite_path("testinfra")}/test_*.py").each do |file|
      banner "[testinfra] #{File.basename(file)}"
      run!("testinfra --verbose #{file}")
    end
  end

  def install_testinfra
    exe = find_executable0 "testinfra", nil
    if exe.nil?
      banner("Installing testinfra...")
      run("pip install testinfra")
    end
  end

end
