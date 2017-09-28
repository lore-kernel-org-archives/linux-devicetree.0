From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 0/3] Basical device tree parts for Allwinner R40 SoC
Date: Thu, 28 Sep 2017 17:25:40 +0800
Message-ID: <20170928092543.45648-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds basical device tree parts for the Allwinner R40 SoC
and two boards feature this SoC -- Banana Pi M2 Ultra and Berry (The
BPi M2 Berry board uses V40 SoC, which is just a renamed R40).

Chen-Yu Tsai (2):
  ARM: dts: sun8i: Add basic dtsi file for Allwinner R40
  ARM: dts: sun8i: Add board dts file for Banana Pi M2 Ultra

Icenowy Zheng (1):
  ARM: dts: sun8i: Add board dts file for Banana Pi M2 Berry

 arch/arm/boot/dts/Makefile                        |   4 +-
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 177 ++++++++++
 arch/arm/boot/dts/sun8i-r40.dtsi                  | 407 ++++++++++++++++++++++
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 164 +++++++++
 4 files changed, 751 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
 create mode 100644 arch/arm/boot/dts/sun8i-r40.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts

-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
