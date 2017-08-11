From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 0/2] Allwinner H5 IRQ fixes
Date: Fri, 11 Aug 2017 22:27:33 +0800
Message-ID: <20170811142735.2970-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current pinctrl code and H5 device tree have an error: the bank number
of IRQs are wrongly set to 2, which makes PG bank interrupts not usable.

Fixes in both the pinctrl driver and the device tree.

Please apply the DT fix after applying the pinctrl fix.

Icenowy Zheng (2):
  pinctrl: sunxi: fix wrong irq_banks number for H5 pinctrl
  arm64: allwinner: h5: fix pinctrl IRQs

 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi |  3 +++
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c    | 26 +++++++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
