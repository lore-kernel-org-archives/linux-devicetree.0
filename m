From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [RFC 0/4] arm64: Realtek RTD1295 clocks
Date: Thu, 17 Aug 2017 13:20:21 +0200
Message-ID: <20170817112026.24062-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds two clock controllers for the Realtek RTD1295 SoC.
Based on my reset controller and IRQ mux series.

There being no public source code for RTD1295, the implementation is based on
register offsets, fields and names seen in the vendor DT, unified into 2 nodes.

The PLL calculations were experimentally found by comparing vendor Android
/sys/kernel/debug/clk/clk_summary to the register field values in /dev/mem -
thus the formulas may be incomplete or incorrect.

Together with the reset driver and IRQ mux, the clock gates allow to
initialize UART1.

Code needs cleanups - sharing this for calculation findings and design.

More experimental patches at:
https://github.com/afaerber/linux/commits/rtd1295-next

Have a lot of fun!

Cheers,
Andreas

Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>
Cc: 蒋丽琴 <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas Färber (4):
  dt-bindings: clock: Add Realtek RTD1295
  arm64: dts: realtek: Add clock nodes for RTD1295
  clk: Add Realtek RTD1295
  arm64: dts: realtek: Update RTD1295 UART nodes with clocks

 .../devicetree/bindings/clock/realtek,rtd129x.txt  |  20 ++
 arch/arm64/boot/dts/realtek/rtd1295.dtsi           |  28 +-
 drivers/clk/Kconfig                                |   7 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk-rtd1295.c                          | 385 +++++++++++++++++++++
 include/dt-bindings/clock/realtek,rtd1295.h        |  99 ++++++
 6 files changed, 537 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd129x.txt
 create mode 100644 drivers/clk/clk-rtd1295.c
 create mode 100644 include/dt-bindings/clock/realtek,rtd1295.h

-- 
2.12.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
