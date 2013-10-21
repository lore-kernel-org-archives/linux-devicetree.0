From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH] ARM: dts: am4372: Add McASP nodes
Date: Mon, 21 Oct 2013 12:45:58 +0300
Message-ID: <1382348758-1083-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>
List-Id: devicetree@vger.kernel.org

Add nodes for McASP0 and McASP1 for AM43xx.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 arch/arm/boot/dts/am4372.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index c328d5c..defaad1 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -633,5 +633,32 @@
 			dma-names = "tx", "rx";
 		};
 
+		mcasp0: mcasp@48038000 {
+			compatible = "ti,am33xx-mcasp-audio";
+			ti,hwmods = "mcasp0";
+			reg = <0x48038000 0x2000>,
+			      <0x46000000 0x400000>;
+			reg-names = "mpu", "dat";
+			interrupts = <80>, <81>;
+			interrupts-names = "tx", "rx";
+			status = "disabled";
+			dmas = <&edma 8>,
+			       <&edma 9>;
+			dma-names = "tx", "rx";
+		};
+
+		mcasp1: mcasp@4803C000 {
+			compatible = "ti,am33xx-mcasp-audio";
+			ti,hwmods = "mcasp1";
+			reg = <0x4803C000 0x2000>,
+			      <0x46400000 0x400000>;
+			reg-names = "mpu", "dat";
+			interrupts = <82>, <83>;
+			interrupts-names = "tx", "rx";
+			status = "disabled";
+			dmas = <&edma 10>,
+			       <&edma 11>;
+			dma-names = "tx", "rx";
+		};
 	};
 };
-- 
1.8.4

