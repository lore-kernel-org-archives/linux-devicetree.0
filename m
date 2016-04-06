From: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Subject: [PATCH v2] rtc: omap: Support ext_wakeup configuration
Date: Wed,  6 Apr 2016 18:32:46 +0200
Message-ID: <1459960367-29399-1-git-send-email-m.niestroj@grinn-global.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This is second approach for adding support of ext_wakeup configuration
in OMAP RTC.
Developed and tested on ChiliBoard (am335x) using v4.6-rc2.

Changes v1 -> v2:
 * Use gpiochip implementation to utilize existing device-tree bindings
   (as suggested by Tony Lindgren)

Marcin Niestroj (1):
  rtc: omap: Support ext_wakeup configuration

 Documentation/devicetree/bindings/rtc/rtc-omap.txt |  18 ++-
 drivers/rtc/Kconfig                                |   2 +-
 drivers/rtc/rtc-omap.c                             | 137 ++++++++++++++++++++-
 3 files changed, 154 insertions(+), 3 deletions(-)

-- 
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
