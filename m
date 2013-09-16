From: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 0/3] Add PCIe support for i.MX6q
Date: Mon, 16 Sep 2013 08:20:51 +0000
Message-ID: <1379319655-20210-1-git-send-email-xobs@kosagi.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Zhu Richard-R65037 <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the PCI Express port present on
the i.MX6 SoC.  The port is based on Synopsis Designware IP with
a custom PHY.

Changes since v5:
 - Changed "compatible" to "fsl,imx6q-pcie"
 - Moved clock_prepare_enable calls back into driver
 - Removed clk lookups for lvds[12]_gate

Changes since v4:
 - Add an abort exception handler
 - Fix register ordering in imx6q-iomuxc-gpr.h
 - Enable sata_ref_100m during clock initialization
 - Minor changes to lvds[12]_gate definitions

Changes since v3:
 - Moved clock initialization to board clock file
 - Reworked memory range layout
 - Reduced the duration of several sleep calls

Changes since v2:
 - Reworked source file with Sascha Hauer's suggestions

Changes since v1:
 - Use the Designware controller code for BAR initialization

Sean Cross (3):
  ARM: imx: Add LVDS general-purpose clocks to i.MX6Q
  ARM: imx6q: Add PCIe bits to GPR syscon definition
  PCI: imx6: Add support for i.MX6 PCIe controller

 .../devicetree/bindings/clock/imx6q-clock.txt      |    4 +
 .../devicetree/bindings/pci/designware-pcie.txt    |    7 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     |   16 +
 arch/arm/mach-imx/Kconfig                          |    2 +
 arch/arm/mach-imx/clk-imx6q.c                      |   24 +-
 drivers/pci/host/Kconfig                           |    6 +
 drivers/pci/host/Makefile                          |    1 +
 drivers/pci/host/pci-imx6.c                        |  576 ++++++++++++++++++++
 include/linux/mfd/syscon/imx6q-iomuxc-gpr.h        |    8 +
 9 files changed, 642 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pci/host/pci-imx6.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
