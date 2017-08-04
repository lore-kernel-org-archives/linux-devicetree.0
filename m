From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] arm64 xilinx zynqmp firmware interface
Date: Fri,  4 Aug 2017 15:45:29 +0200
Message-ID: <cover.1501854302.git.michal.simek@xilinx.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bharat Kumar Gogada <bharatku-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, yangbo lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>M
List-Id: devicetree@vger.kernel.org

Hi,

xilinx is using this interface for very long time and we can't merge our
driver changes to Linux because of missing communication layer with
firmware. This interface was developed before scpi and scmi was
available. In connection to power management scpi and scmi are missing
pieces which we already use. There is a separate discussion how to
extend scmi to support all our use cases.
This simply patch is not adding any power management features but only
adding minimum functionality which are needed for drivers.

Thanks,
Michal


Michal Simek (1):
  soc: xilinx: zynqmp: Add firmware interface

Soren Brinkmann (2):
  dt: xilinx: zynqmp: Add bindings for PM firmware
  arm64: zynqmp: dt: Add PM firmware node

 .../bindings/soc/xilinx/xlnx,zynqmp-pm.txt         |  19 +
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |   7 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/xilinx/Kconfig                         |   6 +
 drivers/soc/xilinx/zynqmp/Makefile                 |   1 +
 drivers/soc/xilinx/zynqmp/firmware.c               | 419 +++++++++++++++++++++
 include/linux/soc/xilinx/zynqmp/firmware.h         | 246 ++++++++++++
 8 files changed, 700 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-pm.txt
 create mode 100644 drivers/soc/xilinx/Kconfig
 create mode 100644 drivers/soc/xilinx/zynqmp/Makefile
 create mode 100644 drivers/soc/xilinx/zynqmp/firmware.c
 create mode 100644 include/linux/soc/xilinx/zynqmp/firmware.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
