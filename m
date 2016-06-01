From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v3 0/2] Add support for SYSCON reset
Date: Wed, 1 Jun 2016 13:41:23 -0500
Message-ID: <20160601184125.20241-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>
List-Id: devicetree@vger.kernel.org

Some SoCs contain reset controls for modules that are memory-mapped to
areas shared with other module configuration settings. This requires
synchronization across all drivers accessing this memory area. This
series adds a generic SYSCON reset driver to allow resets toggled
by bits in memory-mapped registers through SYSCON.

Changes from v2:
 - Rebased on v4.7-rc1
 - Removed the need to give reset specifier nodes an index address

Changes from v1:
 - Reset control information is now described in the reset node, this
   keeps the reset information centralized for easy verification
 - Other small fixups

Andrew F. Davis (2):
  Documentation: dt: reset: Add syscon reset binding
  reset: add a SYSCON based reset driver

 .../devicetree/bindings/reset/syscon-reset.txt     | 105 ++++++++
 drivers/reset/Kconfig                              |  10 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-syscon.c                       | 289 +++++++++++++++++++++
 include/dt-bindings/reset/syscon.h                 |  23 ++
 5 files changed, 428 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/syscon-reset.txt
 create mode 100644 drivers/reset/reset-syscon.c
 create mode 100644 include/dt-bindings/reset/syscon.h

-- 
2.8.3
