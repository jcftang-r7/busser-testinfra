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
      if linux_variant == "Redhat"
        run("pip install setuptools==20.6.7")
      end
      run("pip install testinfra")
    end
  end

  # http://stackoverflow.com/questions/25970280/detecting-linux-distribution-platform-in-ruby
  def linux_variant
    r = { :distro => nil, :family => nil }

    if File.exist?("/etc/lsb-release")
      File.open("/etc/lsb-release", "r").read.each_line do |line|
        r = { :distro => $1 } if line =~ /^DISTRIB_ID=(.*)/
      end
    end

    if File.exist?("/etc/debian_version")
      r[:distro] = "Debian" if r[:distro].nil?
      r[:family] = "Debian" if r[:variant].nil?
    elsif File.exist?("/etc/redhat-release") || File.exist?("/etc/centos-release")
      r[:family] = "RedHat" if r[:family].nil?
      r[:distro] = "CentOS" if File.exist?("/etc/centos-release")
    elsif File.exist?("/etc/SuSE-release")
      r[:distro] = "SLES" if r[:distro].nil?
    end

  end
end
