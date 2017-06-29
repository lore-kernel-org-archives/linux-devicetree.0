From: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 0/2] Add ASPEED watchdog device tree properties
Date: Wed, 28 Jun 2017 19:28:09 -0500
Message-ID: <20170629002811.87199-1-cbostic@linux.vnet.ibm.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Christopher Bostic <cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document device tree optional properties for ASPEED watchdog.
Reference properties in ASPEED watchdog driver and configure accordingly.

Christopher Bostic (2):
  drivers/watchdog: Add optional ASPEED device tree properties
  drivers/watchdog: ASPEED reference dev tree properties for config

 .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 24 ++++++++++++++++++++++
 drivers/watchdog/aspeed_wdt.c                      | 20 +++++++++++++-----
 2 files changed, 39 insertions(+), 5 deletions(-)

-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
