From: Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>
Subject: [PATCHv2 0/3] ARM: K2G: support for TI-SCI Clocks
Date: Thu, 1 Sep 2016 15:40:32 +0300
Message-ID: <1472733635-22661-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, nm-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Changes compared to previous version:
- converted the driver to use xlate hw functionality instead of legacy
  xlate
- bunch of other fixes proposed by Stephen Boyd

Series still depends on https://lkml.org/lkml/2016/8/19/768, pull
request for this has been sent out so it would be possible to
pull this to clock tree also and merge this for 4.9.

Boot tested locally with Nishanth's integrated SCI branch, and seems to
be working fine.

Refer to v1 cover letter for more details if required:
https://lkml.org/lkml/2016/8/19/811

-Tero

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
