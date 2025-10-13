---
title: "Host Patrol"
subtitle: "Patrol Your Hosts"
description: >-
  Host Patrol is a command-line tool and a Web interface for collecting and
  consolidating information about your hosts via SSH.
badges:
  - title: "Latest Release"
    source: "https://img.shields.io/github/v/release/vst/hostpatrol?display_name=tag&style=flat-square"
    target: "https://github.com/vst/hostpatrol/releases/latest"
  - title: "Issues"
    source: "https://img.shields.io/github/issues/vst/hostpatrol?style=flat-square"
    target: "https://github.com/vst/hostpatrol/issues"
  - title: "Pull Requests"
    source: "https://img.shields.io/github/issues-pr/vst/hostpatrol?style=flat-square"
    target: "https://github.com/vst/hostpatrol/pulls"
  - title: "CI Status"
    source: "https://img.shields.io/github/actions/workflow/status/vst/hostpatrol/check.yaml?style=flat-square"
    target: "https://github.com/vst/hostpatrol/actions/workflows/check.yaml"
learn_more:
  - title: "Who is it for?"
    content: >-
      Host Patrol is for sysadmins and devops who manage hosts on the cloud
      and/or their own infrastructure to build a registry of such hosts, keep
      track of server access and services, and yet, need a simple and free
      solution.
  - title: "What does it do?"
    content: >-
      Host Patrol collects information about your hosts through SSH and compiles
      the report into a JSON file. It also offers a hosted and
      privacy-preserving [Web-based console](https://console.hostpatrol.io) for
      conveniently rendering this report in your browser.
  - title: "How does it work?"
    content: >-
      You install the Host Patrol command-line tool on your local machine,
      (optionally) prepare a configuration file, and run the tool to generate
      the report as a JSON file containing information about your hosts.
  - title: "How does it collect the information?"
    content: >-
      Host Patrol issues [simple and safe POSIX-shell
      commands](https://github.com/vst/hostpatrol/tree/main/scripts) to your
      remote hosts and compiles the output into a JSON file. To achieve this, it
      uses your vanilla `ssh` program.
  - title: "What is the status of the project?"
    content: >-
      This project is still in its early stages. Consider [starring
            it](https://github.com/vst/hostpatrol) and [creating
      issues](https://github.com/vst/hostpatrol/issues) on GitHub to help
      support its development. It can get only better with your feedback.
  - title: "How can you contribute?"
    content: >-
      This project is built using Haskell, Shell scripts, Nix and Typescript. It
      is licensed under the [MIT license](https://opensource.org/license/mit).
      Contributions are welcome through
      [issues](https://github.com/vst/hostpatrol/issues) or [pull
      requests](https://github.com/vst/hostpatrol/pulls) on GitHub.
---
