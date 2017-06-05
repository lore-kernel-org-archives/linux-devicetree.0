From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] ARM: sunxi: Enable dwmac-sun8i on more boards
Date: Mon,  5 Jun 2017 21:21:25 +0200
Message-ID: <20170605192130.25320-1-clabbe.montjoie@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello

This serie enable dwmac-sun8i on more boards.
The first 3 patch enable dwmac-sun8i on some h3/h5 boards.
The last 2 add dwmac-sun8i on a83t.

Corentin Labbe (5):
  ARM: sun8i: orangepi-plus: Enable dwmac-sun8i
  ARM: sun8i: bananapi-m2-plus: Enable dwmac-sun8i
  ARM: sun50i: orangepi-pc2: Enable dwmac-sun8i
  ARM: sun8i: a83t: Add dt node for the syscon control module
  ARM: sun8i: a83t: add dwmac-sun8i ethernet driver

 arch/arm/boot/dts/sun8i-a83t.dtsi                  | 34 ++++++++++++++++++++++
 arch/arm/boot/dts/sun8i-h3-bananapi-m2-plus.dts    | 29 ++++++++++++++++++
 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts       | 32 ++++++++++++++++++++
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 27 +++++++++++++++++
 4 files changed, 122 insertions(+)

-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
