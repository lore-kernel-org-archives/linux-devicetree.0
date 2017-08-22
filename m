From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/3] dtc: checks for phandle with arg properties
Date: Tue, 22 Aug 2017 18:02:05 -0500
Message-ID: <20170822230208.20987-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

David,

Here's a new version of checks for phandle with arg style properties. This
checks interrupt and gpio bindings and other common bindings which follow 
the same phandle plus args pattern.

This generates ~200 warnings building the ARM dts files in the kernel.

Rob

Rob Herring (3):
  checks: add phandle with arg property checks
  checks: add gpio binding properties check
  checks: add interrupts property check

 checks.c                      | 253 ++++++++++++++++++++++++++++++++++++++++++
 dtc.h                         |   1 +
 livetree.c                    |   6 +
 tests/bad-gpio.dts            |  13 +++
 tests/bad-interrupt-cells.dts |  12 ++
 tests/bad-phandle-cells.dts   |  11 ++
 tests/run_tests.sh            |   4 +
 7 files changed, 300 insertions(+)
 create mode 100644 tests/bad-gpio.dts
 create mode 100644 tests/bad-interrupt-cells.dts
 create mode 100644 tests/bad-phandle-cells.dts

-- 
2.11.0
