From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH v2 0/2] add Alphascale asm9260 RTC driver
Date: Tue,  2 Feb 2016 20:56:09 +0100
Message-ID: <1454442971-25225-1-git-send-email-linux@rempel-privat.de>
References: <20160202102804.GT20165@piout.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160202102804.GT20165-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set provide support for RTC controller found on Alphascale
ASM9260 SoC.

v2:
- change license to GPLv2 and later
- remove HW_RTC_AUX and HW_RTC_AUXEN. Thay was taken from reference driver.
  Documentation do not provide any info about it. According to my tests
  this regs are not available on asm9260.
- remove calibration from DT. It will be beter to set it over sysfs.

Oleksij Rempel (2):
  rtc: add rtc-asm9260 driver
  doc: dt: add documentation for alphascale,asm9260-rtc

 .../bindings/rtc/alphascale,asm9260-rtc.txt        |  19 ++
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-asm9260.c                          | 355 +++++++++++++++++++++
 4 files changed, 385 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.txt
 create mode 100644 drivers/rtc/rtc-asm9260.c

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
