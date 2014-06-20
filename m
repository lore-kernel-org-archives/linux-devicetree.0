From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 0/2] clocksource: add rockchip rk3288 specific armv7-timer
Date: Fri, 20 Jun 2014 12:43:31 +0200
Message-ID: <70167479.zcs3JF0luJ@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The architected timer on Rockchip's RK3288 SoCs needs a bit of special handling
to start.

This seems to be similar to a recent discussion about the Exynos arch-timer
that also seems to need similar special handling (and mct timer running).

And, the arch-timer on recent Mediatek SoCs also uses this pattern of a
supplying timer below the arch-timer.

Therefore follow a suggestion from Arnd Bergmann and implement a separate
clocksource for it that does the setup and then initializes the arch-timer.

This series uses "of: Provide function to request and map memory" from
Matthias Brugger.

Heiko Stuebner (2):
  clocksource: arm_arch_timer: remove static from arch_timer_init
  clocksource: add rockchip-specific armv7-timer setup

 .../bindings/arm/rockchip/armv7-timer.txt          | 22 +++++++++
 drivers/clocksource/Makefile                       |  1 +
 drivers/clocksource/arm_arch_timer.c               |  2 +-
 drivers/clocksource/arm_arch_timer.h               |  7 +++
 drivers/clocksource/rockchip_timer.c               | 57 ++++++++++++++++++++++
 5 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/rockchip/armv7-timer.txt
 create mode 100644 drivers/clocksource/arm_arch_timer.h
 create mode 100644 drivers/clocksource/rockchip_timer.c

-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
