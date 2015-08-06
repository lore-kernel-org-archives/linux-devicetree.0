From: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/2] add a new driver to support SAMA5D4 watchdog timer
Date: Thu, 6 Aug 2015 12:59:28 +0800
Message-ID: <1438837170-4518-1-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

Because the watchdog WDT_MR register can be written more than once,
its work mechanism is different from the at91sam9260 watchdog driver.
Open the device file to enable the watchdog hardware, close to disable it,
and ping it from the user space directly to keep it alive.

Changes from v3.0
 1./ Change the driver name to 'sama5d4_wdt' for more acceptable.
 2./ Change the prefix of function name and struct name
     from 'atmel_' to 'sama5d4_', and others.

Changes from v2.0
 1./ Use a specific driver name, at91_sama5d4_wdt.c.
 2./ Remove '-' at the end of macro name and unnecessary check.
 3./ Use alphabetic order for include files.

Wenyou Yang (2):
  drivers: watchdog: add a driver to support SAMA5D4 watchdog timer
  Documentation: dt: binding: atmel-sama5d4-wdt: for SAMA5D4 watchdog
    driver

 .../bindings/watchdog/atmel-sama5d4-wdt.txt        |   35 +++
 drivers/watchdog/Kconfig                           |    9 +
 drivers/watchdog/Makefile                          |    1 +
 drivers/watchdog/at91sam9_wdt.h                    |    2 +
 drivers/watchdog/sama5d4_wdt.c                     |  279 ++++++++++++++++++++
 5 files changed, 326 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
 create mode 100644 drivers/watchdog/sama5d4_wdt.c

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
