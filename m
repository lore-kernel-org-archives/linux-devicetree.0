From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/3] dtc bus and unit address checks
Date: Tue, 28 Feb 2017 16:43:07 -0600
Message-ID: <20170228224310.14162-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a series of checks designed to check problems commonly found in
binding reviews. The first patch adds checks for PCI bridges and devices.
The 2nd patch is new in this version and adds checks for simple-bus. The
3rd patch is a default check if bus type is not set to check for '0x' or
leading 0s in unit addresses.

Rob

Rob Herring (3):
  checks: Add bus checks for PCI buses
  checks: Add bus checks for simple-bus buses
  checks: Warn on node name unit-addresses with '0x' or leading 0s

 checks.c                       | 230 +++++++++++++++++++++++++++++++++++++++++
 dtc.h                          |   5 +
 tests/run_tests.sh             |   2 +
 tests/unit-addr-leading-0s.dts |  12 +++
 tests/unit-addr-leading-0x.dts |  12 +++
 5 files changed, 261 insertions(+)
 create mode 100644 tests/unit-addr-leading-0s.dts
 create mode 100644 tests/unit-addr-leading-0x.dts

-- 
2.10.1
