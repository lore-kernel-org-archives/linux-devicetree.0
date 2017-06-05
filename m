From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 0/2] ARM/arm64: sunxi: convert CCU raw numbers to macros
Date: Mon,  5 Jun 2017 12:32:22 +0800
Message-ID: <20170605043224.20687-1-wens@csie.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

These are some clean up patches for 4.12. They convert raw number
references for the CCU and R_CCU nodes, from when the CCU/R_CCU stuff
was first added, to the defined macros in the device tree header files.

These affect the A64 and H3/H5.

These are based on our sunxi/fixes-for-4.12 branch. Once these are merged,
I think it's time to send off pull requests for our fixes branches.

ChenYu

Chen-Yu Tsai (2):
  ARM: sunxi: h3-h5: Convert R_CCU raw numbers to macros
  arm64: allwinner: a64: Convert CCU raw number references to macros

 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  8 +++---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 35 ++++++++++++++-------------
 2 files changed, 23 insertions(+), 20 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
