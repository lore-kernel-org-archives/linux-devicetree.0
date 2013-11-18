From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/6] Update Davinci watchdog driver
Date: Mon, 18 Nov 2013 19:18:53 +0200
Message-ID: <1384795139-19466-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Strashko Grygorii <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These patches are intended to update Davinci watchdog to use WDT core
and reuse driver for keystone arch, because Keystone uses the similar
IP like Davinci.

See Documentation:
Davinci DM646x - http://www.ti.com/lit/ug/spruer5b/spruer5b.pdf
Keystone - http://www.ti.com/lit/ug/sprugv5a/sprugv5a.pdf

Also:
 - improved to support GET_TIMELEFT option.
 - added "clocks" and "timeout-sec" properties to DT.

Based on
git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
keystone/master

v1..v2:
- watchdog: davinci: change driver to use WDT core
	corrected 2011 -> 2006-2013
	removed useless function comment
	corrected initialization of heartbeat
	switched on CONFIG_WATCHDOG_NOWAYOUT option

- watchdog: davinci: use davinci_wdt_device structure to hold device data
	substituted wdd to watchdog device in commit message

- watchdog: davinci: add GET_TIMELEFT option support
	corrected comment (is -> has)
	removed redundant error message "clock freq is not set"

- watchdog: davinci: add GET_STATUS option support
	dropped

- watchdog: davinci: add "timeout-sec" property
	use consistent formatting

- watchdog: davinci: reuse driver for keystone arch
	use consistent formatting

- watchdog: davinci: add "clocks" property
	merged with above patch

Ivan Khoronzhuk (6):
  watchdog: davinci: change driver to use WDT core
  watchdog: davinci: use davinci_wdt_device structure to hold device
    data
  watchdog: davinci: add GET_TIMELEFT option support
  watchdog: davinci: add "timeout-sec" property
  watchdog: davinci: reuse driver for keystone arch
  arm: dts: keystone: add watchdog entry

 .../devicetree/bindings/watchdog/davinci-wdt.txt   |   15 +-
 arch/arm/boot/dts/keystone.dts                     |    6 +
 drivers/watchdog/Kconfig                           |    6 +-
 drivers/watchdog/davinci_wdt.c                     |  227 +++++++++-----------
 4 files changed, 122 insertions(+), 132 deletions(-)

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
