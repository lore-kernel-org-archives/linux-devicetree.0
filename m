From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH 0/2] add Alphascale asm9260 RTC driver
Date: Fri, 29 Jan 2016 09:40:00 +0100
Message-ID: <1454056802-23386-1-git-send-email-linux@rempel-privat.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set provide support for RTC controller found on Alphascale
ASM9260 SoC.

Oleksij Rempel (2):
  rtc: add rtc-asm9260 driver
  doc: dt: add documentation for alphascale,asm9260-rtc

 .../bindings/rtc/alphascale,asm9260-rtc.txt        |  25 ++
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-asm9260.c                          | 391 +++++++++++++++++++++
 4 files changed, 427 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.txt
 create mode 100644 drivers/rtc/rtc-asm9260.c

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
