From: "Andrew F. Davis" <afd@ti.com>
Subject: [PATCH 0/2] Add support for SYSCON reset
Date: Mon, 25 Jan 2016 13:02:42 -0600
Message-ID: <1453748564-6429-1-git-send-email-afd@ti.com>
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

Andrew F. Davis (2):
  Documentation: dt: reset: Add syscon reset binding
  reset: add a SYSCON based reset driver

 .../devicetree/bindings/reset/syscon-reset.txt     |  84 +++++++
 drivers/reset/Kconfig                              |  10 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-syscon.c                       | 259 +++++++++++++++++++++
 4 files changed, 354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/syscon-reset.txt
 create mode 100644 drivers/reset/reset-syscon.c

-- 
2.7.0
