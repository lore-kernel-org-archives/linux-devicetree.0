From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 0/2] ARM: sun8i: a83t: device tree cleanup
Date: Mon,  1 May 2017 11:14:06 +0800
Message-ID: <20170501031408.10469-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Here's v2 of the A83T device tree cleanup patches. I dropped the change
to the uart device node name for now.

Also added a second patch changing the underscores in device node names
I just added to hyphens. AFAIK that is the preferred naming scheme.
Please squash it into "ARM: sun8i: a83t: Rename pinmux setting names".


Regards
ChenYu

Chen-Yu Tsai (2):
  ARM: sun8i: a83t: Drop leading zeroes from device node addresses
  ARM: sun8i: a83t: Replace underscores with hyphens in pinmux node
    names

 arch/arm/boot/dts/sun8i-a83t.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
