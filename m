From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 0/3] ARM: dts: sunxi: Use defines for ccu clock indices
Date: Sun,  3 Sep 2017 16:50:15 +0300
Message-ID: <cover.28f5be8e511ad74e9ae3f573891882e62bebdb7b.1504446535.git-series.plaes@plaes.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a follow-up commit for sun{4,7}i ccu conversion. Now that
all the relevant pieces have been merged we can use dt-binding headers
again.

Also included is additional patch to add i2s0 block to sun4i dtsi header.

Priit Laes (3):
  ARM: dts: sun4i: Use defines for clock and reset indices
  ARM: dts: sun7i: Use defines for clock and reset indices
  ARM: dts: sun4i: Add i2s0 block to dtsi

 arch/arm/boot/dts/sun4i-a10.dtsi | 134 ++++++++++++++++-------------
 arch/arm/boot/dts/sun7i-a20.dtsi | 146 ++++++++++++++++----------------
 2 files changed, 148 insertions(+), 132 deletions(-)

base-commit: d11067fd67a0549b0e7b330dbcbdc28f90ba5712
-- 
git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
