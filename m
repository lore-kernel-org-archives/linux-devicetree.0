From: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: imx6: Support Poslab Savageboard dual & quad
Date: Mon,  5 Dec 2016 10:07:26 +0900
Message-ID: <20161205010729.7047-1-woogyom.kim@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Poslab Savageboard is i.MX6 SoC base, but BSP code from the vendor is 
not mainline u-boot and kernel. Personal reason of using this board is 
testing etnaviv user-space driver, so I re-write device tree files based on
mainline kernel for the first step.

This patchset includes common DT file, dual and quad board files.

Supported components are
  - Display: HDMI and LVDS panel
  - eMMC and SD card
  - Ethernet
  - Pinmux configuration
  - SATA: only for Savageboard quad
  - UART1 for debug console
  - USB host

Missing features are
  - Audio (WM8903)
  - USB OTG
  - PMIC WM8326: default settings are used so no issue to bring-up the system
  - MIPI DSI, CSI

Patches are tested on the Savageboard quad but the dual version should work 
because the only difference between dual and quad is SATA support.

More information in http://www.savageboard.org

Milo Kim (3):
  ARM: dts: imx6: Add Savageboard common file
  ARM: dts: imx6: Support Savageboard dual
  ARM: dts: imx6: Support Savageboard quad

 arch/arm/boot/dts/imx6dl-savageboard.dts   |  50 ++++++
 arch/arm/boot/dts/imx6q-savageboard.dts    |  54 ++++++
 arch/arm/boot/dts/imx6qdl-savageboard.dtsi | 271 +++++++++++++++++++++++++++++
 3 files changed, 375 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-savageboard.dts
 create mode 100644 arch/arm/boot/dts/imx6q-savageboard.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-savageboard.dtsi

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
