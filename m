From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v2 0/3] rtc: Add APM X-Gene SoC RTC driver
Date: Mon, 31 Mar 2014 11:36:07 -0600
Message-ID: <1396287370-1011-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for the APM X-Gene SoC RTC driver.

v2
* Change function xgene_rtc_read_time to return rtc_valid_tm(tm) instead 0

v1
* Initial version

Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
Loc Ho (3):
  Documentation: Add documentation for the APM X-Gene SoC RTC DTS
    binding
  rtc: Add APM X-Gene SoC RTC driver
  arm64: Add APM X-Gene SoC RTC DTS entry

 .../devicetree/bindings/rtc/xgene-rtc.txt          |   28 ++
 arch/arm64/boot/dts/apm-storm.dtsi                 |   21 ++
 drivers/rtc/Kconfig                                |    9 +
 drivers/rtc/Makefile                               |    1 +
 drivers/rtc/rtc-xgene.c                            |  278 ++++++++++++++++++++
 5 files changed, 337 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/xgene-rtc.txt
 create mode 100644 drivers/rtc/rtc-xgene.c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
