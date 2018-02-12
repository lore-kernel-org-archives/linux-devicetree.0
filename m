From: Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 0/2] Introduce STM32 USB PHY Controller driver
Date: Mon, 12 Feb 2018 13:35:27 +0100
Message-ID: <1518438929-5254-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds support for STMicroelectronics STM32 USB PHY Controller
(USBPHYC) which is embedded in STM32MP1 SoC.
The STM32 USBPHYC block contains a dual port High Speed UTMI+ PHY and a UTMI
switch that selects either USB OTG controller or USB Host controller for the
second PHY port.

Amelie Delaunay (2):
  dt-bindings: phy: add support for STM32 USB PHY Controller (USBPHYC)
  phy: stm32: add support for STM32 USB PHY Controller (USBPHYC)

 .../devicetree/bindings/phy/phy-stm32-usbphyc.txt  |  46 +++
 drivers/phy/st/Kconfig                             |  14 +
 drivers/phy/st/Makefile                            |   1 +
 drivers/phy/st/phy-stm32-usbphyc.c                 | 375 +++++++++++++++++++++
 4 files changed, 436 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.txt
 create mode 100644 drivers/phy/st/phy-stm32-usbphyc.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
