From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/2] pinctrl: sunxi: Support the interrupt debouncing
Date: Wed, 19 Oct 2016 11:15:25 +0200
Message-ID: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

The Allwinner pin controllers can setup a different debouncing period based
on two clocks and a prescaler.

This debouncing is applied to the whole IRQ bank, which prevents us from
using the per-pin property that is usually used.

Let me know what you think,
Maxime

Maxime Ripard (2):
  pinctrl: sunxi: Add support for interrupt debouncing
  ARM: sunxi: Add the missing clocks to the pinctrl nodes

 Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 14 ++++++++++++-
 arch/arm/boot/dts/sun4i-a10.dtsi                                      |  3 ++-
 arch/arm/boot/dts/sun5i.dtsi                                          |  3 ++-
 arch/arm/boot/dts/sun6i-a31.dtsi                                      |  3 ++-
 arch/arm/boot/dts/sun7i-a20.dtsi                                      |  3 ++-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi                                  |  3 ++-
 arch/arm/boot/dts/sun8i-h3.dtsi                                       |  3 ++-
 arch/arm/boot/dts/sun9i-a80.dtsi                                      |  3 ++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c                                 | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                                 |  7 ++++++-
 10 files changed, 116 insertions(+), 7 deletions(-)

-- 
git-series 0.8.10
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
