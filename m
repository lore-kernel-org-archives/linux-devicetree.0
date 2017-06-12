From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v2 0/2] add support for LD20/11 Global boards
Date: Mon, 12 Jun 2017 15:07:37 +0900
Message-ID: <1497247659-1610-1-git-send-email-hayashi.kunihiko@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Initial version of device tree for LD20/11 Global boards.

---

Changes in v2:
- use SPDX-License-Identifier for the license description
- add the atmel manufacturer to the compatible string for I2C EEPROM

Kunihiko Hayashi (2):
  arm64: dts: uniphier: add support for LD11 Global board
  arm64: dts: uniphier: add support for LD20 Global board

 arch/arm64/boot/dts/socionext/Makefile             |  2 +
 .../boot/dts/socionext/uniphier-ld11-global.dts    | 70 ++++++++++++++++++++++
 .../boot/dts/socionext/uniphier-ld20-global.dts    | 52 ++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/socionext/uniphier-ld11-global.dts
 create mode 100644 arch/arm64/boot/dts/socionext/uniphier-ld20-global.dts

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
