From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/3] ARM+ARM64: constify of_device_ids
Date: Wed, 10 Sep 2014 10:26:16 +0200
Message-ID: <1410337579-23466-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

most of_device_ids can (and should) be const as the driver core cannot
handle changes to compatible strings. So I checked all non-const
of_device_ids and they can all be marked as const, for omap2 after some
function parameters get a const annotation, too.

I split of the changes to mach-omap2 because there (as noted above) som=
e
functions need a change there, too.

Should I split further by platform? Who is willing to take these
patches?

Best regards
Uwe

Uwe Kleine-K=C3=B6nig (3):
  ARM: OMAP2+: make of_device_ids const
  ARM: make of_device_ids const
  ARM64: make of_device_ids const

 arch/arm/kernel/perf_event_cpu.c         | 2 +-
 arch/arm/mach-at91/at91rm9200_time.c     | 2 +-
 arch/arm/mach-at91/at91sam9263_devices.c | 2 +-
 arch/arm/mach-at91/at91sam926x_time.c    | 2 +-
 arch/arm/mach-at91/clock.c               | 4 ++--
 arch/arm/mach-at91/setup.c               | 6 +++---
 arch/arm/mach-davinci/da8xx-dt.c         | 2 +-
 arch/arm/mach-imx/mmdc.c                 | 2 +-
 arch/arm/mach-keystone/pm_domain.c       | 2 +-
 arch/arm/mach-mmp/time.c                 | 2 +-
 arch/arm/mach-mvebu/coherency.c          | 2 +-
 arch/arm/mach-mvebu/pmsu.c               | 2 +-
 arch/arm/mach-omap2/board-generic.c      | 2 +-
 arch/arm/mach-omap2/common.h             | 2 +-
 arch/arm/mach-omap2/gpmc.c               | 2 +-
 arch/arm/mach-omap2/irq.c                | 2 +-
 arch/arm/mach-omap2/pdata-quirks.c       | 2 +-
 arch/arm/mach-omap2/prm_common.c         | 2 +-
 arch/arm/mach-omap2/timer.c              | 6 +++---
 arch/arm/mach-prima2/platsmp.c           | 2 +-
 arch/arm/mach-sunxi/sunxi.c              | 2 +-
 arch/arm64/kernel/perf_event.c           | 2 +-
 22 files changed, 27 insertions(+), 27 deletions(-)

--=20
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
