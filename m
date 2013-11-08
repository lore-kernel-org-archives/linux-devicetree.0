From: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCHv7 0/3] dma: Add Freescale eDMA engine driver support
Date: Fri, 8 Nov 2013 18:01:52 +0800
Message-ID: <1383904915-27634-1-git-send-email-b35083@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series add Freescale eDMA engine support.

Jingchang Lu (3):
	ARM: imx: Add DMAMUX clock for Vybrid vf610 SoC
	ARM: dts: vf610: Add eDMA node
	dma: Add Freescale eDMA engine driver support

 Documentation/devicetree/bindings/dma/fsl-edma.txt |  84 ++++
 arch/arm/boot/dts/vf610.dtsi                       |  49 +++
 arch/arm/mach-imx/clk-vf610.c                      |   5 +
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/fsl-edma.c                             | 944 +++++++++++++++++++++++++++++++++++++++++++++
 include/dt-bindings/clock/vf610-clock.h            |   6 +-
 include/dt-bindings/dma/vf610-edma.h               | 103 +++++
 8 files changed, 1201 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/dma/fsl-edma.txt
 create mode 100644 drivers/dma/fsl-edma.c
 create mode 100644 include/dt-bindings/dma/vf610-edma.h


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
