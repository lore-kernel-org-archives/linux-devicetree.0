From: Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] watchdog: driver for BCM7038 and newer chips.
Date: Thu, 20 Aug 2015 10:41:24 -0700
Message-ID: <1440092486-16905-1-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Justin Chen <justinpopo6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This driver is for a watchdog block contained in all Broadcom Set-top
Box chips since BCM7038. BCM7038 was made public during the 2004 CES,
and since then, many chips use this watchdog block including some cable
modem chips.

Patch 1: watchdog device tree binding documentation

Patch 2: watchdog driver

Justin Chen (2):
  watchdog: bcm7038: add device tree binding documentation
  watchdog: Watchdog driver for Broadcom Set-Top Box

 .../bindings/watchdog/brcm,bcm7038-wdt.txt         |  19 ++
 drivers/watchdog/Kconfig                           |   8 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/bcm7038_wdt.c                     | 253 +++++++++++++++++++++
 4 files changed, 281 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.txt
 create mode 100644 drivers/watchdog/bcm7038_wdt.c

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
