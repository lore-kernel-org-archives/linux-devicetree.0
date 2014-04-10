From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/5] ARM: sunxi: add multi pin controller support
Date: Thu, 10 Apr 2014 14:25:42 +0200
Message-ID: <1397132747-13917-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series rework the sunxi pinctrl driver to support the PL and PM
pins available on the A31 SoC, which are controlled using the R_PIO
block.

This series add support for multi pin controller which was previously
impossible for several reasons:
1) the pinctrl instance was registering a static instance of the gpio
   chip, which means, in case you were probing 2 devices, the gpio chip
   was added twice to the gpiochip list
2) the base pin of the gpio chip was always set to 0, and thus the 2
   gpiochip pin numbers were overlapping

I still haven't reworked the interrupt part (to handle the "per bank
interrupt" instead of the "one interrupt for the whole gpio" chip
approach), but this will be part of another series.

Best Regards,

Boris

Changes since v1:
 - rework the pinctrl driver to support multiple pin controller instances
 - removed reset and clock gate patches from the series
 - removed A31 DT modifications from the series (we need to get the PRCM
 reset and clk drivers before being able to declare the r_pio node, and
 we're still discussing how this should be implemented)

Boris BREZILLON (5):
  pinctrl: sunxi: add PL and PM pin definitions
  pinctrl: sunxi: support multiple pin controller
  pinctrl: sunxi: define A31 R_PIO pin functions
  pinctrl: sunxi: add reset control support
  ARM: sunxi: update the default ARCH_NR_GPIO for sunxi arch

 .../bindings/pinctrl/allwinner,sunxi-pinctrl.txt   |  1 +
 arch/arm/Kconfig                                   |  2 +-
 drivers/pinctrl/pinctrl-sunxi-pins.h               | 74 ++++++++++++++++++++++
 drivers/pinctrl/pinctrl-sunxi.c                    | 40 +++++++-----
 drivers/pinctrl/pinctrl-sunxi.h                    | 69 ++++++++++++++++++++
 5 files changed, 169 insertions(+), 17 deletions(-)

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
