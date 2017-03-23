From: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>
Subject: [PATCH v2 0/1] ARM: dts: sun8i: NanoPi NEO Air add WiFi / eMMC
Date: Thu, 23 Mar 2017 22:24:43 +0100
Message-ID: <20170323212444.20685-1-jelle@vdwaa.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Jelle van der Waa <jelle-oJJ1AqDjjO4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Enable the WiFi (AP6212) chip and eMMC support for the NanoPi NEO Air.

---
Fixes in v2:
- Rename underscore nodes
- Remove allwinner prefix from GPIO node and use generic properties

Jelle van der Waa (1):
  ARM: dts: sun8i: NanoPi NEO Air add WiFi / eMMC

 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

-- 
2.12.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
