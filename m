From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH v2] add Alphascale asm9260-wdt driver
Date: Thu,  5 Nov 2015 10:06:55 +0100
Message-ID: <1446714416-22587-1-git-send-email-linux@rempel-privat.de>
References: <20151027023132.GA1270@roeck-us.net>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151027023132.GA1270-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hallo devicetree list,
this driver had already one rewiev round on watchdog list, please
take a look a devicetree part. Maybe some of you hase
comments or suggestions.

Thank you,

v2:
- fix DT types
- remove obsolet comments
- add clk error handling
- reduce log noise
- allow to return an error in asm9260_wdt_get_dt_mode

Oleksij Rempel (1):
  watchdog: add Alphascale asm9260-wdt driver

 .../bindings/watchdog/alphascale-asm9260.txt       |  39 ++
 drivers/watchdog/Kconfig                           |   9 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/asm9260_wdt.c                     | 415 +++++++++++++++++++++
 4 files changed, 464 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/alphascale-asm9260.txt
 create mode 100644 drivers/watchdog/asm9260_wdt.c

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
