From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/3] Disable PWMs in imx6ql.dtsi
Date: Mon,  9 Mar 2015 17:40:33 +0100
Message-ID: <1425919236-6664-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

PWMs are only useful if they have an output pin connected. Since
most boards don't have all of the PWM output pins assigned, let's
disable the PWMs by default in imx6qdl.dtsi and have each board
device tree explicitly enable just the PWMs they need.
Most device trees do this already - add the missing ones and
change the default status to "disabled" in the dtsi.

regards
Philipp

Philipp Zabel (3):
  ARM: dts: imx6dl-aristainetos: enable backlight PWM explicitly
  ARM: dts: hummingboard/cubox-i: enable front LED PWM explicitly
  ARM: dts: imx6qdl: disable PWMs by default

 arch/arm/boot/dts/imx6dl-aristainetos_4.dts | 4 ++++
 arch/arm/boot/dts/imx6dl-aristainetos_7.dts | 4 ++++
 arch/arm/boot/dts/imx6qdl-cubox-i.dtsi      | 4 ++++
 arch/arm/boot/dts/imx6qdl.dtsi              | 4 ++++
 4 files changed, 16 insertions(+)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
