From: David Lechner <david@lechnology.com>
Subject: [PATCH 0/3] TI DA850/OMAP-L138/AM18x pinconf
Date: Tue, 22 Nov 2016 21:29:24 -0600
Message-ID: <1479871767-20160-1-git-send-email-david@lechnology.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>
Cc: David Lechner <david@lechnology.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Axel Haslam <ahaslam@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, =?UTF-8?q?Bartosz=20Go=C5=82aszewski?= <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

This series adds a new driver and DT bindings for TI DA850/OMAP-L138/AM18x
pinconf (bias pullup/pulldown).

The motivation for this series is LEGO MINDSTORMS EV3 support. It needs most,
if not all, internal pullup/down resistors disabled in order to work correctly.

David Lechner (3):
  devicetree: bindings: pinctrl: Add binding for ti,da850-pupd
  pinctrl: New driver for TI DA8XX/OMAP-L138/AM18XX pinconf
  ARM: dts: da850: Add node for pullup/pulldown pinconf

 .../devicetree/bindings/pinctrl/ti,da850-pupd.txt  |  55 ++++++
 arch/arm/boot/dts/da850.dtsi                       |   5 +
 drivers/pinctrl/Kconfig                            |   9 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-da850-pupd.c               | 210 +++++++++++++++++++++
 5 files changed, 280 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ti,da850-pupd.txt
 create mode 100644 drivers/pinctrl/pinctrl-da850-pupd.c

-- 
2.7.4

