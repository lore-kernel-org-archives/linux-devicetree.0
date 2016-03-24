From: Priit Laes <Priit.Laes-FvMSrs6xSY+ptlylMvRsHA@public.gmane.org>
Subject: [PATCH 0/2] ARM: sunxi: dt: Add missing DRAM gate clock for simplefb TV output
Date: Thu, 24 Mar 2016 20:08:38 +0200
Message-ID: <1458842920-30854-1-git-send-email-Priit.Laes@icefire.ee>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>

DRAM gating driver commit for sun[47]i seems to be missing DRAM gate bit 5 for
simplefb TV output node. Add it.

Priit Laes (2):
  ARM: sun4i: dt: Enable dram gate 5 (tve0 clock) for simplefb TV output
  ARM: sun7i: dt: Enable dram gate 5 (tve0 clock) for simplefb TV output

 arch/arm/boot/dts/sun4i-a10.dtsi | 2 +-
 arch/arm/boot/dts/sun7i-a20.dtsi | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
