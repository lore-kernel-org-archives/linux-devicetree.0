From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH 0/4] MIPS: ath79: Add USB support on the TL-WR1043ND
Date: Tue,  1 Sep 2015 17:23:10 +0200
Message-ID: <1441120994-31476-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

this serie add a driver for the USB phy on the ATH79 SoCs and enable the
USB port on the TL-WR1043ND. The phy controller is really trivial as it
only use reset lines.

Alban

Alban Bedel (4):
  devicetree: Add bindings for the ATH79 USB phy
  phy: Add a driver for the ATH79 USB phy
  MIPS: ath79: Add the EHCI controller and USB phy to the AR9132 dtsi
  MIPS: ath79: Enable the USB port on the TL-WR1043ND

 .../devicetree/bindings/phy/phy-ath79-usb.txt      |  18 ++++
 arch/mips/boot/dts/qca/ar9132.dtsi                 |  24 +++++
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts   |   4 +
 drivers/phy/Kconfig                                |   8 ++
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-ath79-usb.c                        | 115 +++++++++++++++++++++
 6 files changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-ath79-usb.txt
 create mode 100644 drivers/phy/phy-ath79-usb.c

-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
