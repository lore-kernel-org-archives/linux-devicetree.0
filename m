From: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] support control with using GPIO lines
Date: Sun, 10 Apr 2016 23:59:22 +0900
Message-ID: <1460300366-25248-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergey Yanovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support access to DS1302 with GPIO lines.

Recently rtc-ds1302 is rewritten using SPI 3wire mode.  This adds
another platform driver using GPIO while supporting both modes.

Thie series first fixes two problems I found while tesing, secondly
introduces the abstraction layer for the register access which enables
to share the most code between spi and platform driver, and adds
the platform driver using GPIO.

Akinobu Mita (4):
  rtc: ds1302: fix error check in set_time
  rtc: ds1302: fix write value for day of week register
  rtc: ds1302: add register access abstraction layer
  rtc: ds1302: support control with using GPIO lines

 .../devicetree/bindings/rtc/maxim-ds1302.txt       |  13 +
 drivers/rtc/Kconfig                                |  17 +-
 drivers/rtc/rtc-ds1302.c                           | 558 ++++++++++++++++++---
 3 files changed, 503 insertions(+), 85 deletions(-)

Cc: Sergey Yanovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
