From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH v4 0/6] aspeed: Integrate pinctrl and gpio drivers
Date: Tue,  6 Dec 2016 14:53:42 +1100
Message-ID: <20161206035348.29948-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This picks up some work from a while back that adds pinctrl and GPIO support to
the Aspeed devicetrees. See the previous series:

    https://lkml.org/lkml/2016/8/30/74

Since v3 two new patches have been added, describing the Low Pin Count bus and
SoC Display Controller nodes. These are essential for the aspeed-g5 pinctrl.

Cheers,

Andrew

Andrew Jeffery (6):
  arm: dts: aspeed-g4: Add syscon and pin controller nodes
  arm: dts: aspeed-g4: Add gpio controller to devicetree
  arm: dts: aspeed-g5: Add SoC Display Controller node
  arm: dts: aspeed-g5: Add LPC Controller node
  arm: dts: aspeed-g5: Add syscon and pin controller nodes
  arm: dts: aspeed-g5: Add gpio controller to devicetree

 arch/arm/boot/dts/aspeed-g4.dtsi | 760 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-g5.dtsi | 863 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 1623 insertions(+)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
