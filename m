From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v2 0/3] clocksource: Add support for Aspeed timer
Date: Thu, 21 Jul 2016 23:13:50 +0930
Message-ID: <1469108633-7940-1-git-send-email-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, andrew-zrmu5oMJ5Fs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Daniel,

This adds support for the Aspeed ast2400 and ast2500 families of BMC SoCs to
the moxart driver.

I've dropped the first patch and respun the others so they apply. I've also
boot tested on our hardware, so they are good to go.

It would be great to seem them make it for the upcoming merge window so I can
focus my time on cleaning up the the other drivers we have on their way.

Cheers,

Joel

Joel Stanley (3):
  drivers/clocksource/moxart: Refactor enable/disable
  drivers/clocksource/moxart: Use struct to hold state
  drivers/clocksource/moxart: Add Aspeed support

 .../bindings/timer/moxa,moxart-timer.txt           |   4 +-
 drivers/clocksource/moxart_timer.c                 | 195 ++++++++++++++-------
 2 files changed, 134 insertions(+), 65 deletions(-)

-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
