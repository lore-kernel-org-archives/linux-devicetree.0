From: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/2] ARM: ohci-at91: Add support to forcibly suspend ports while sleep
Date: Wed, 8 Jun 2016 12:15:09 +0800
Message-ID: <1465359311-14544-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

To save the power consumption, add a new compatible to support forcibly
suspend the USB PORTA/B/C via OHCI Interrupt Configuration SFR Register.

Changes in v3:
 - Change the compatible description for more precise.

Changes in v2:
 - Add compatible to support forcibly suspend the ports.
 - Add soc/at91/at91_sfr.h to accommodate the defines.
 - Add error checking for .sfr_regmap.
 - Remove unnecessary regmap_read() statement.
 - Use the new compatible for ohci-node.

Wenyou Yang (2):
  usb: ohci-at91: Forcibly suspend ports while USB suspend
  ARM: at91/dt: sama5d2: Use new compatible for ohci node

 .../devicetree/bindings/usb/atmel-usb.txt          |  6 +-
 arch/arm/boot/dts/sama5d2.dtsi                     |  2 +-
 drivers/usb/host/ohci-at91.c                       | 80 +++++++++++++++++++++-
 include/soc/at91/at91_sfr.h                        | 29 ++++++++
 4 files changed, 113 insertions(+), 4 deletions(-)
 create mode 100644 include/soc/at91/at91_sfr.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
