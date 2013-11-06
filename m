From: "ivan.khoronzhuk" <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Fwd: [PATCH 0/8] Update Davinci watchdog driver
Date: Wed, 6 Nov 2013 13:30:18 +0200
Message-ID: <527A284A.8000901@ti.com>
References: <1383680783-12114-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383680783-12114-1-git-send-email-ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

These patches are intended to update Davinci watchdog to use WDT core
and reuse driver for keystone arch, because Keystone uses the similar
IP like Davinci.

See Documentation:
Davinci DM646x - http://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
Keystone - http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf

Also:
 - improved to support GET_TIMELEFT and GET_STATUS options.
 - added "clocks" and "timeout-sec" properties to DT.

Based on
git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
keystone/master

TO:
Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org> (maintainer: TI KEYSTONE MACHIN...)
Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org> (maintainer:WATCHDOG DEVICE D...)
Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> (supporter:TI DAVINCI MACHIN...)
linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:WATCHDOG DEVICE D...)
devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND...)

CC:
Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org> (maintainer:OPEN FIRMWARE AND...)
linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated list:ARM SUB-ARCHITECT...)

Ivan Khoronzhuk (8):
  watchdog: davinci: change driver to use WDT core
  watchdog: davinci: use davinci_wdt_device structure to hold device
    data
  watchdog: davinci: add GET_TIMELEFT option support
  watchdog: davinci: add GET_STATUS option support
  watchdog: davinci: add "timeout-sec" property
  watchdog: davinci: reuse driver for keystone arch
  watchdog: davinci: add "clocks" property
  arm: dts: keystone: add watchdog entry

 .../devicetree/bindings/watchdog/davinci-wdt.txt   |   21 +-
 arch/arm/boot/dts/keystone.dts                     |    6 +
 drivers/watchdog/Kconfig                           |    5 +-
 drivers/watchdog/davinci_wdt.c                     |  234 ++++++++++----------
 4 files changed, 139 insertions(+), 127 deletions(-)

-- 
1.7.9.5



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
