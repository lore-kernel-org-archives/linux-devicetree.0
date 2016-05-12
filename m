From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v2 0/2] watchdog: Add Aspeed watchdog driver
Date: Thu, 12 May 2016 23:47:09 +0930
Message-ID: <1463062631-16432-1-git-send-email-joel@jms.id.au>
References: <1462797277-14969-1-git-send-email-joel@jms.id.au>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462797277-14969-1-git-send-email-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

These patches add support for the watchdog timer found in Aspeed ast2400 and
ast2500 BMC SoCs.

The u-boot that ships on the edk and with many systems leaves the watchdog
running when jumping to the kernel, making this driver required for operation.

It has been tested on the ast2400 in an OpenPower Palmetto, and the ast2500-edk
dev board.

Changes in v2:

Addressed review from Guenter:
 - dropped the drv_dbgs
 - added defines for all of the constants
 - clarified the type of reset we want
 - leaves the watchdog running

This also updates the device tree compatible string following review from Rob.
As Arnd already took my device tree tree, I will send him a patch to fix that.

Cheers,

Joel

Joel Stanley (2):
  doc/devicetree: Add Aspeed watchdog timer bindings
  watchdog: Add Aspeed watchdog driver

 .../devicetree/bindings/watchdog/aspeed-wdt.txt    |  16 ++
 drivers/watchdog/Kconfig                           |  13 ++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aspeed_wdt.c                      | 209 +++++++++++++++++++++
 4 files changed, 239 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
 create mode 100644 drivers/watchdog/aspeed_wdt.c

-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
