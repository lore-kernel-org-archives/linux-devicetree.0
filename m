From: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH RFC 0/2] Enable wifi on pandaboard
Date: Mon, 14 Jul 2014 13:50:53 +0200
Message-ID: <1405338655-18415-1-git-send-email-sassmann@kpanic.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On the pandaboard the wifi isn't recognized because clk32kg was never enabled.
The code to handle the clock got removed successively because it was not used.
For now I've reverted the respective commits although I'm not sure if this is
acceptable. If it needs to be converted to the clock API some pointers in the
right direction would be appreciated, as I'm not familiar with it.
Thanks!

Stefan Assmann (2):
  dts: regulator-clk32kg should always be enabled
  regulator: twl: Re-add clk32kg to get wifi working

 .../bindings/regulator/twl-regulator.txt           |  1 +
 arch/arm/boot/dts/twl6030.dtsi                     |  1 +
 drivers/regulator/twl-regulator.c                  | 23 ++++++++++++++++++++++
 3 files changed, 25 insertions(+)

-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
