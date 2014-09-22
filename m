From: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCHv4 0/6] ARM: imx: Add Freescale LS1021A SoC and board support
Date: Mon, 22 Sep 2014 15:32:38 +0800
Message-ID: <1411371164-25282-1-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: arnd-r2nGTMty4D4@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series contain the support for Freescale LS1021A CPU and LS1021A-QDS
and LS1021A-TWR board.

The LS1021A SoC combines two ARM Cortex-A7 cores that have been optimized
for high reliability and pack the highest level of integration available
for sub-3W embedded communications processors and with a comprehensive
enablement model focused on ease of programmability.

The LS1021A SoC shares IPs with i.MX family, Vybrid family and Freescale
PowerPC platform. 

For the detail information about LS1021A SoC, please refer to the RM doc.

---
changes in v4:
add "syscon" compatible to scfg and dcfg dts node.
remove mxc_restart in the platform machine desc.
remove dma_zone_size defination.

changes in v3:
rewrite scfg and dcfg binding doc description.
remove sai related node leaving to the driver support.

changes in v2:
remove unused nodes.
wakeup the secondary core by IPI call to u-boot standby procedure. 
add dt-bindings for LS1021A SoC and platform gerenal configuration nodes.

----------------------------------------------------------------
Jingchang Lu (6):
	ARM: dts: Add SoC level device tree support for LS1021A
	ARM: dts: Add initial LS1021A QDS board dts support
	ARM: dts: Add initial LS1021A TWR board dts support
	dt-bindings: arm: add Freescale LS1021A SoC device tree binding
	ARM: imx: Add initial support for Freescale LS1021A
	ARM: imx: Add Freescale LS1021A SMP support

Documentation/devicetree/bindings/arm/fsl.txt |  38 ++++
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/ls1021a-qds.dts             | 285 ++++++++++++++++++++++++++
 arch/arm/boot/dts/ls1021a-twr.dts             | 117 +++++++++++
 arch/arm/boot/dts/ls1021a.dtsi                | 539 ++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/mach-imx/Kconfig                     |  14 ++
 arch/arm/mach-imx/Makefile                    |   4 +-
 arch/arm/mach-imx/common.h                    |   1 +
 arch/arm/mach-imx/mach-ls1021a.c              |  22 +++
 arch/arm/mach-imx/platsmp.c                   |  32 +++
 10 files changed, 1053 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/ls1021a-qds.dts
 create mode 100755 arch/arm/boot/dts/ls1021a-twr.dts
 create mode 100644 arch/arm/boot/dts/ls1021a.dtsi
 create mode 100644 arch/arm/mach-imx/mach-ls1021a.c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
