From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH v5 0/2] Add support for SYSCON reset
Date: Mon, 27 Jun 2016 12:12:15 -0500
Message-ID: <20160627171217.4715-1-afd@ti.com>
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

Changes from v4:
 - Added two more cells to DT ti,reset-bits property
 - Re-organized ti,reset-bits flag property defines
 - Moved TI_SYSCON_RESET in Kconfig
 - Other small fixes based on comments on v4

Changes from v3:
 - Add depends on HAS_IOMEM to Kconfig
 - Re-worked naming to be more TI specific for now
 - Changed DT binding to Philipp's suggestion

Changes from v2:
 - Rebased on v4.7-rc1
 - Removed the need to give reset specifier nodes an index address

Changes from v1:
 - Reset control information is now described in the reset node, this
   keeps the reset information centralized for easy verification
 - Other small fixups

Andrew F. Davis (2):
  Documentation: dt: reset: Add TI syscon reset binding
  reset: add TI SYSCON based reset driver

 .../devicetree/bindings/reset/ti-syscon-reset.txt  |  91 ++++++++
 drivers/reset/Kconfig                              |  10 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-ti-syscon.c                    | 237 +++++++++++++++++++++
 include/dt-bindings/reset/ti-syscon.h              |  38 ++++
 5 files changed, 377 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
 create mode 100644 drivers/reset/reset-ti-syscon.c
 create mode 100644 include/dt-bindings/reset/ti-syscon.h

-- 
2.9.0
