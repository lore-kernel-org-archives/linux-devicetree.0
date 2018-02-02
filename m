From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 0/3] Allwinner V3s audio codec device tree changes
Date: Fri,  2 Feb 2018 22:01:50 +0800
Message-ID: <20180202140153.21549-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Here's the Allwinner V3s audio codec device tree changes, which used to
be blocked by the DMA engine code.

The first patch adds the DMA engine device tree node, and the second
adds the codec nodes (digital and analog).

The thrid patch is for Lichee Pi Zero with Dock board to enable the
audio jack and on-board mic.

Icenowy Zheng (3):
  ARM: dts: sun8i: add DMA engine in V3s DTSI
  ARM: dts: sun8i: add audio codec support into V3s DTSI
  ARM: sun8i: v3s: enable audio on Lichee Pi Zero Dock board

 arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts |  9 +++++++
 arch/arm/boot/dts/sun8i-v3s.dtsi                   | 28 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
