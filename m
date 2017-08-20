From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [RFC 0/3] arm64: Realtek RTD1295 RTC
Date: Sun, 20 Aug 2017 03:36:28 +0200
Message-ID: <20170820013632.18375-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds the RTC for the Realtek RTD1295 SoC.
Based on my RTD1295 clk series.

There being no public source code for RTD1295, the implementation is based on
register offsets seen in the vendor DT, as well as older mach-rtk119x code
published by QNAP.

The base year is hardcoded - probably should be a DT property like downstream?

The DT node depends on the clk series for clock index and header.

More experimental patches at:
https://github.com/afaerber/linux/commits/rtd1295-next

Have a lot of fun!

Cheers,
Andreas

Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>
Cc: 蒋丽琴 <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas Färber (3):
  dt-bindings: rtc: Add Realtek RTD1295
  rtc: Add Realtek RTD1295
  arm64: dts: realtek: Add RTD1295 RTC node

 .../devicetree/bindings/rtc/realtek,rtd119x.txt    |  16 ++
 arch/arm64/boot/dts/realtek/rtd1295.dtsi           |   6 +
 drivers/rtc/Kconfig                                |   8 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-rtd119x.c                          | 175 +++++++++++++++++++++
 5 files changed, 206 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.txt
 create mode 100644 drivers/rtc/rtc-rtd119x.c

-- 
2.12.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
