From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 0/4] rtc: mediatek: add support for SoC based RTC on MT7622
Date: Mon, 23 Oct 2017 15:16:43 +0800
Message-ID: <cover.1508741262.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Changes since v2:
- Remove time extension with yr_base 
- Add fixup that ensures all time fields in hardware keeping consistency
inside the mtk_rtc_get_alarm_or_time call
- Add validity for time range should be between 2001 to 2099
- Enhance comments with aligned style and explanation for certain limiation in
hardware
- Rename dt-binding naming from rtc-mediatek.txt to rtc-mt7622.txt
- Rename config naming from RTC_DRV_MEDIATEK to RTC_DRV_MT7622

Changes since v1:
- Rename to rtc-mt7622.c from rtc-mediatek.c
- Use [readl,writel]_relaxed instead of __raw_* version
- Remove redundant register reading in mtk_rtc_get_alarm_or_time()
- Stop alarm when alarm is really expired in mtk_rtc_alarmirq()
- Extend the maximum year the RTC/Alarm can count/support using year rebasing
- Remove unnesscary log which is already done in core layer

This patchset introduces support for MediaTek SoC based real time clock
(RTC) Currently, the driver is already tested successfully with hwclock
and wakealarm on MT7622 SoC. And it should also be workable on other
similar MediaTek SoCs. And patch 3 is a distinct patch used to distinguish
between either SoC based or PMIC based RTC to avoid confusion for the RTC
selection for the target SoC.

Sean Wang (4):
  dt-bindings: rtc: mediatek: add bindings for MediaTek SoC based RTC
  rtc: mediatek: add driver for RTC on MT7622 SoC
  rtc: mediatek: enhance the description for MediaTek PMIC based RTC
  rtc: mediatek: update MAINTAINERS entry with MediaTek RTC driver

 .../devicetree/bindings/rtc/rtc-mt7622.txt         |  21 +
 MAINTAINERS                                        |   3 +
 drivers/rtc/Kconfig                                |  18 +-
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-mt7622.c                           | 422 +++++++++++++++++++++
 5 files changed, 461 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt7622.txt
 create mode 100644 drivers/rtc/rtc-mt7622.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
