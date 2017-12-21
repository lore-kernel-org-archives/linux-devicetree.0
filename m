From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 0/2] Add EHCI/OHCI nodes for V3s and Lichee Pi Zero
Date: Thu, 21 Dec 2017 23:05:35 +0800
Message-ID: <20171221150537.20304-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the PHY dual-route property is added to 4.15-rc, the EHCI/OHCI nodes
are now necessary.

Please apply these patches to 4.15, Thanks!

Icenowy Zheng (2):
  ARM: sun8i: v3s: add EHCI/OHCI0 device nodes
  ARM: sun8i: v3s: enable EHCI/OHCI for Lichee Pi Zero

 arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts |  8 ++++++++
 arch/arm/boot/dts/sun8i-v3s.dtsi              | 19 +++++++++++++++++++
 2 files changed, 27 insertions(+)

-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
