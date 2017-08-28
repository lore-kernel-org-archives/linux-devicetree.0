From: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/2] Update board support for A20-OLinuXino-MICRO
Date: Mon, 28 Aug 2017 09:32:41 +0300
Message-ID: <1503901963-9457-1-git-send-email-stefan@olimex.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

>From rev.J of A20-OLinuXino-MICRO, the board has new PHY chip
(LAN8710) which replace RTL8201. Also there is option for 4GB
eMMC chip.

Changes in v2:
	* Remove pinctrl request for eMMC reset pin
	* Dump the idea of renaming boards with emmc
	* Using txerr as gmac function

Stefan Mavrodiev (2):
  ARM: dts: sun7i: Fix A20-OLinuXino-MICRO dts for LAN8710
  ARM: dts: sun7i: Add dts file for A20-OLinuXino-MICRO-eMMC

 arch/arm/boot/dts/Makefile                         |  1 +
 .../boot/dts/sun7i-a20-olinuxino-micro-emmc.dts    | 70 ++++++++++++++++++++++
 arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts    |  7 ++-
 3 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-olinuxino-micro-emmc.dts

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
