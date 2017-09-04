From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2 0/3] arm64: Realtek RTD1295 watchdog
Date: Tue,  5 Sep 2017 01:15:59 +0200
Message-ID: <20170904231602.29787-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds the watchdog for the Realtek RTD1295 SoC.

v2 does minor cleanups.

The implementation is based on register offsets seen in the vendor DT,
as well as older mach-rtk119x code published by QNAP.

The DT node depends on my RTD1295 clk series.

More experimental patches at:
https://github.com/afaerber/linux/commits/rtd1295-next

Have a lot of fun!

Cheers,
Andreas

v1 -> v2:
* Prepared remove (Guenther)
* Set timeout field (Guenther)
* Cleanups (Guenther, Andreas)

Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>
Cc: 蒋丽琴 <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas Färber (3):
  dt-bindings: watchdog: Add Realtek RTD1295
  watchdog: Add Realtek RTD1295
  arm64: dts: realtek: Add watchdog node for RTD1295

 .../bindings/watchdog/realtek,rtd119x.txt          |  17 +++
 arch/arm64/boot/dts/realtek/rtd1295.dtsi           |   6 +
 drivers/watchdog/Kconfig                           |  10 ++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/rtd119x_wdt.c                     | 168 +++++++++++++++++++++
 5 files changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/realtek,rtd119x.txt
 create mode 100644 drivers/watchdog/rtd119x_wdt.c

-- 
2.13.5

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
