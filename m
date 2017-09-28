From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 0/8] ARM: dts: aspeed: Device tree updates
Date: Thu, 28 Sep 2017 17:21:41 +0930
Message-ID: <20170928075149.8154-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds support for the i2c buses and vuart in the ASPEED device
trees, as well as making a few cleanups.

I will merge these into my Aspeed devicetree tree once they have some acks.

I have a second series ready to go as soon as our clk driver is merged.

Cheers,

Joel

Andrew Jeffery (1):
  ARM: dts: aspeed: Move pinctrl subnodes to improve readability

Joel Stanley (7):
  ARM: dts: aspeed: Reorder ADC node
  ARM: dts: aspeed: Add I2C buses
  ARM: dts: aspeed-romulus: Add I2C devices
  ARM: dts: aspeed-palmetto: Add I2C devices
  ARM: dts: aspeed-ast2500: Add I2C devices
  ARM: dts: aspeed: Add aliases for UARTs
  ARM: dts: aspeed: Clean up UART nodes

 arch/arm/boot/dts/aspeed-ast2500-evb.dts      |   19 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |   52 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |   54 +
 arch/arm/boot/dts/aspeed-g4.dtsi              | 1773 +++++++++++++-----------
 arch/arm/boot/dts/aspeed-g5.dtsi              | 1810 ++++++++++++++-----------
 5 files changed, 2176 insertions(+), 1532 deletions(-)

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
