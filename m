From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v4 0/3] clk: Broadcom BCM63138 support
Date: Thu, 29 Oct 2015 18:23:16 -0700
Message-ID: <1446168199-5959-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, jonmason@broadcom.com, sboyd@codeaurora.org, mturquette@baylibre.com, linux@arm.linux.org.uk, sbranden@broadcom.com, rjui@broadcom.com
List-Id: devicetree@vger.kernel.org

This patch series adds support for the Broadcom BCM63138 DSL SoCs
clocking framework.

Since the HW is identical to the one found in Broadcom iProc SoCs, but the
integration is different (obviously), there is still a new compatible string
introduced just in case we happen to find issues in the future.

Stephen, could you stage the two patches in a clk-bcm63xx branch that I could
later utilize while doing the arm-soc DT pull request?

Thank you!

Florian Fainelli (3):
  clk: iproc: Extend binding to cover BCM63138
  clk: bcm: Add BCM63138 clock support
  ARM: dts: BCM63xx: Add ARMPLL device tree nodes

 .../bindings/clock/brcm,iproc-clocks.txt           |  5 +++
 arch/arm/boot/dts/bcm63138.dtsi                    | 36 +++++++++++++++++-----
 drivers/clk/bcm/Kconfig                            | 10 ++++++
 drivers/clk/bcm/Makefile                           |  1 +
 drivers/clk/bcm/clk-bcm63xx.c                      | 22 +++++++++++++
 5 files changed, 66 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/bcm/clk-bcm63xx.c

-- 
2.1.0

