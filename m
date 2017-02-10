From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/4] dtc unit-address and character set checks
Date: Fri, 10 Feb 2017 10:47:13 -0600
Message-ID: <20170210164717.1234-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a series of checks designed to check problems commonly found in
binding reviews. The first 2 patches implement a stricter character set
for property and node names. The 3rd patch checks unit address formatting.
The 4th patch adds checks for PCI buses including more specific checks on
unit address formatting.

In patches 1 and 2, I've turned the checks off by default. In patch 3,
the leading '0x' or 0s check was moved to its own check. In patch 4, most
of the bus struct was removed with only the type and the checks are called
directly.

Rob


Rob Herring (4):
  checks: Add Warning for stricter property name character checking
  checks: Add Warning for stricter node name character checking
  checks: Warn on node name unit-addresses with '0x' or leading 0s
  checks: Add bus checks for PCI buses

 checks.c                       | 151 +++++++++++++++++++++++++++++++++++++++++
 dtc.h                          |   7 ++
 tests/run_tests.sh             |   2 +
 tests/unit-addr-leading-0s.dts |  10 +++
 tests/unit-addr-leading-0x.dts |  10 +++
 5 files changed, 180 insertions(+)
 create mode 100644 tests/unit-addr-leading-0s.dts
 create mode 100644 tests/unit-addr-leading-0x.dts

--
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
