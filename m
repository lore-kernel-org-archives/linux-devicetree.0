From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 2/3] MIPS: OCTEON: clean up GPIO definitions in dlink_dsr-1000n.dts
Date: Sun,  5 Jun 2016 00:18:19 +0300
Message-ID: <1465075100-19705-2-git-send-email-aaro.koskinen@iki.fi>
References: <1465075100-19705-1-git-send-email-aaro.koskinen@iki.fi>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465075100-19705-1-git-send-email-aaro.koskinen@iki.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: devicetree@vger.kernel.org

Clean up GPIO definitions in dlink_dsr-1000n.dts.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts
index d6bc994..a20c5b6 100644
--- a/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts
+++ b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts
@@ -9,6 +9,7 @@
  */
 
 /include/ "octeon_3xxx.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "dlink,dsr-1000n";
@@ -63,12 +64,12 @@
 
 		usb1 {
 			label = "usb1";
-			gpios = <&gpio 9 1>; /* Active low */
+			gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
 		};
 
 		usb2 {
 			label = "usb2";
-			gpios = <&gpio 10 1>; /* Active low */
+			gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
 		};
 	};
 
-- 
2.7.2
