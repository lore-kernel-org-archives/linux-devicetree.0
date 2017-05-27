From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 00/10] Initial Allwinner R40 support
Date: Sat, 27 May 2017 18:22:58 +0800
Message-ID: <20170527102308.1988-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is the first non-RFC version of this patchset, which added basical
support including I2C, UART and MMC to the mainline Linux.

The pinctrl driver of A20 is also merged into the one of A10 before
R40 support is added into the A10 driver.

Chen-Yu Tsai (2):
  ARM: dts: sun8i: Add basic dtsi file for Allwinner R40
  ARM: dts: sun8i: Add board dts file for Banana Pi M2 Ultra

Icenowy Zheng (8):
  arm: sunxi: add support for R40 SoC
  pinctrl: sunxi: Add SoC ID definitions for A10, A20 and R40 SoCs
  pinctrl: sunxi: add A20 support to A10 driver
  pinctrl: sunxi: drop dedicated A20 driver
  dt-bindings: add compatible string for Allwinner R40 pinctrl
  pinctrl: sunxi: add support of R40 to A10 pinctrl driver
  dt-bindings: add compatible string for Allwinner R40 CCU
  clk: sunxi-ng: support R40 SoC

 Documentation/arm/sunxi/README                     |    6 +
 Documentation/devicetree/bindings/arm/sunxi.txt    |    1 +
 .../devicetree/bindings/clock/sunxi-ccu.txt        |    1 +
 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |    1 +
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  157 +++
 arch/arm/boot/dts/sun8i-r40.dtsi                   |  408 +++++++
 arch/arm/mach-sunxi/sunxi.c                        |    1 +
 drivers/clk/sunxi-ng/Kconfig                       |   10 +
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c               | 1153 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-r40.h               |   68 ++
 drivers/pinctrl/sunxi/Kconfig                      |    6 +-
 drivers/pinctrl/sunxi/pinctrl-sun4i-a10.c          |  449 ++++++--
 drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c          | 1056 ------------------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |    3 +
 include/dt-bindings/clock/sun8i-r40-ccu.h          |  191 ++++
 include/dt-bindings/reset/sun8i-r40-ccu.h          |  129 +++
 18 files changed, 2497 insertions(+), 1145 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
 create mode 100644 arch/arm/boot/dts/sun8i-r40.dtsi
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.h
 delete mode 100644 drivers/pinctrl/sunxi/pinctrl-sun7i-a20.c
 create mode 100644 include/dt-bindings/clock/sun8i-r40-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-r40-ccu.h

-- 
2.12.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
