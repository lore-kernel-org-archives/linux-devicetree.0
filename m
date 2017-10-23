From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/2] Add HiSilicon INNO USB2 PHY driver support
Date: Mon, 23 Oct 2017 19:35:10 +0800
Message-ID: <1508758512-22900-1-git-send-email-shawnguo@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pengcheng Li <lpc.li-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jianguo Sun <sunjianguo1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

It adds device tree bindings and driver support for HiSilicon INNO USB2
PHY device, which can be found on HiSilicon STB SoC Hi3798cv200.

Changes for v2:
 - Move DT bindings into a separate patch.
 - Rename hisi_inno_phy_start() to hisi_inno_phy_init() for aligning
   name with .init hook.

Pengcheng Li (2):
  dt-bindings: add bindings doc for HiSilicon INNO USB2 PHY
  phy: add inno-usb2-phy driver for hi3798cv200 SoC

 .../devicetree/bindings/phy/phy-hisi-inno-usb2.txt |  31 +++
 drivers/phy/hisilicon/Kconfig                      |  10 +
 drivers/phy/hisilicon/Makefile                     |   1 +
 drivers/phy/hisilicon/phy-hisi-inno-usb2.c         | 224 +++++++++++++++++++++
 4 files changed, 266 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
 create mode 100644 drivers/phy/hisilicon/phy-hisi-inno-usb2.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
