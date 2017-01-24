From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/5] dtc unit-address and character set checks
Date: Tue, 24 Jan 2017 11:45:29 -0600
Message-ID: <20170124174534.3865-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is reviving a series of checks I started on a while back. The 
motivation for this series is to add checks for trivial issues often 
found in binding reviews.

The first 2 patches restrict the character set for node and property 
names to what's the recommended practice. These are quite noisy when 
enabled mainly due to '_', but that's most often what needs fixing.

The 3rd patch checks for leading 0s and '0x' on unit addresses.

The last 2 patches add infrastructure for setting the bus type of nodes 
and bus specific checks for those nodes. Initially, PCI is the only 
supported bus type. Unlike the RFC, there's no default/simple bus.

Rob

Rob Herring (5):
  checks: Add Warning for stricter property name character checking
  checks: Add Warning for stricter node name character checking
  checks: Warn on node name unit-addresses with '0x' or leading 0s
  checks: Add infrastructure for setting bus type of nodes
  checks: Add bus checks for PCI buses

 checks.c                       | 199 +++++++++++++++++++++++++++++++++++++++--
 dtc.h                          |  11 +++
 tests/run_tests.sh             |   2 +
 tests/unit-addr-leading-0s.dts |  10 +++
 tests/unit-addr-leading-0x.dts |  10 +++
 5 files changed, 227 insertions(+), 5 deletions(-)
 create mode 100644 tests/unit-addr-leading-0s.dts
 create mode 100644 tests/unit-addr-leading-0x.dts

-- 
2.10.1
