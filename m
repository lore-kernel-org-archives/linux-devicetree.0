From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 0/4] clocksource: Add support for Aspeed timer
Date: Mon,  9 May 2016 22:02:45 +0930
Message-ID: <1462797169-14512-1-git-send-email-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello All,

This adds support for the Aspeed ast2400 and ast2500 families of BMC SoCs to
the moxart driver.

I've addressed the feedback from Daniel and spent a bit of time trying to
ensure the series makes sense.

I've not included a patch that renames the driver to fttmr010, from Faraday
Tech, as I wasn't sure if we had consensus. If you would prefer I do so then
let me know.

Cheers,

Joel

Joel Stanley (4):
  drivers/clocksouree/moxart: Add kbuild symbol
  drivers/clocksource/moxart: Refactor enable/disable
  drivers/clocksource/moxart: Use struct to hold state
  drivers/clocksource/moxart: Add Aspeed support

 .../bindings/timer/moxa,moxart-timer.txt           |   4 +-
 arch/arm/mach-moxart/Kconfig                       |   2 +-
 drivers/clocksource/Kconfig                        |   9 +
 drivers/clocksource/Makefile                       |   2 +-
 drivers/clocksource/moxart_timer.c                 | 191 ++++++++++++++-------
 5 files changed, 143 insertions(+), 65 deletions(-)

-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
