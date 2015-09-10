From: Olliver Schinagl <o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org>
Subject: [PATCH v2 0/5] Add eeprom to the Olimex series of boards
Date: Thu, 10 Sep 2015 10:31:16 +0200
Message-ID: <1441873881-3665-1-git-send-email-o.schinagl@ultimaker.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olliver Schinagl <o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org>, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some of the olimex series of boards feature a permanently connected eeprom on
i2c-1. This patch series adds them on all the boards that I personally have and
where tested with.

Additionally, it brings the eeprom on the OLinuXino a10s in line with the rest
and now follows the binding documentation.

Changes since v1:
* Fixed SoB and removed Tested-by as that is implied with SoB.
* Additionally tested it on an A20 OLinuXino micro as I did actually have one!

Signed-off-by: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>

Olliver Schinagl (5):
  dts: sunxi: add eeprom to A10 OLinuXino Lime board
  dts: sunxi: correct vendor prefix on OLinuXino a10s micro
  dts: sunxi: add eeprom to A20 OLinuXino Lime board
  dts: sunxi: add eeprom to A20 OLinuXino Lime2 board
  dts: sunxi: add eeprom to A20 OLinuXino micro board

 arch/arm/boot/dts/sun4i-a10-olinuxino-lime.dts   | 12 ++++++++++++
 arch/arm/boot/dts/sun5i-a10s-olinuxino-micro.dts |  2 +-
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime.dts   | 12 ++++++++++++
 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts  |  6 ++++++
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts  |  6 ++++++
 5 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
