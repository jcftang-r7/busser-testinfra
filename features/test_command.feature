Feature: Test command
  In order to run tests written with testinfra
  As a user of Busser
  I want my tests to run when the testinfra runner plugin is installed

  Background:
    Given a test BUSSER_ROOT directory named "busser-testinfra-test"
    When I successfully run `busser plugin install busser-testinfra --force-postinstall`
    Given a suite directory named "testinfra"

  Scenario: A passing test suite
    Given a file in suite "testinfra" named "test_base" with:
    """
    import testinfra
    import pytest
    def test_id(Command):
        cmd = Command("id")
        assert cmd.rc == 0
    """
    When I run `busser test testinfra`
    And the exit status should be 0

  Scenario: A failing test suite
    Given a file in suite "testinfra" named "test_base" with:
    """
    import testinfra
    import pytest
    def test_id(Command):
        cmd = Command("id 68F0700A-AA34-4963-80F7-1D5E9F7B978E")
        assert cmd.rc == 0
    """
    When I run `busser test bash`
    And the exit status should not be 0
