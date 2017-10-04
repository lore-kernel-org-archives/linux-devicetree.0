From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: aspeed: Watchdog fixes
Date: Wed,  4 Oct 2017 19:46:33 +1030
Message-ID: <20171004091635.12499-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

A cleanup and a change in the default behaviour for the watchdog nodes to match
what is required to boot with commonly shipped u-boots.

Joel Stanley (2):
  ARM: dts: aspeed: Remove undocumented wdt properties
  ARM: dts: aspeed: Enable watchdog two

 arch/arm/boot/dts/aspeed-g4.dtsi | 8 ++------
 arch/arm/boot/dts/aspeed-g5.dtsi | 9 +++------
 2 files changed, 5 insertions(+), 12 deletions(-)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
