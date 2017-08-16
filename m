From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/5] arm64: Realtek RTD1295 reset controllers
Date: Wed, 16 Aug 2017 02:38:42 +0200
Message-ID: <20170816003847.6208-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, =?UTF-8?q?=E8=92=8B=E4=B8=BD=E7=90=B4?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds reset controllers for the Realtek RTD1295 SoC.

Since there is still no public source code for RTD1295, the individual resets
were derived from reset-names in the vendor DT; the implementation was a guess.

More experimental patches at:
https://github.com/afaerber/linux/commits/rtd1295-next

Have a lot of fun!

Cheers,
Andreas

Cc: Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>
Cc: 蒋丽琴 <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas Färber (5):
  dt-bindings: reset: Add Realtek RTD1295
  arm64: dts: realtek: Add RTD1295 reset controller nodes
  reset: Add Realtek RTD1295 driver
  arm64: dts: realtek: Add RTD1295 UART resets
  arm64: dts: realtek: Adopt RTD1295 reset constants

 .../bindings/reset/realtek,rtd129x-reset.txt       |  18 ++++
 arch/arm64/boot/dts/realtek/rtd1295.dtsi           |  34 +++++++
 drivers/reset/Kconfig                              |   6 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-rtd129x.c                      | 100 ++++++++++++++++++
 include/dt-bindings/reset/realtek,rtd1295.h        | 112 +++++++++++++++++++++
 6 files changed, 271 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/realtek,rtd129x-reset.txt
 create mode 100644 drivers/reset/reset-rtd129x.c
 create mode 100644 include/dt-bindings/reset/realtek,rtd1295.h

-- 
2.12.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
