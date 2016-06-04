From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH 3/3] MIPS: OCTEON: dlink_dsr-1000n.dts: add more leds
Date: Sun,  5 Jun 2016 00:18:20 +0300
Message-ID: <1465075100-19705-3-git-send-email-aaro.koskinen@iki.fi>
References: <1465075100-19705-1-git-send-email-aaro.koskinen@iki.fi>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465075100-19705-1-git-send-email-aaro.koskinen@iki.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>
List-Id: devicetree@vger.kernel.org

Add more leds discovered by reverse engineering. Labels are according
to markings in the mechanics.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts
index a20c5b6..b134798 100644
--- a/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts
+++ b/arch/mips/boot/dts/cavium-octeon/dlink_dsr-1000n.dts
@@ -71,6 +71,21 @@
 			label = "usb2";
 			gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
 		};
+
+		wps {
+			label = "wps";
+			gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
+		};
+
+		wireless1 {
+			label = "5g";
+			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+		};
+
+		wireless2 {
+			label = "2.4g";
+			gpios = <&gpio 18 GPIO_ACTIVE_LOW>;
+		};
 	};
 
 	aliases {
-- 
2.7.2
