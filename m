From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v02 5/6] ARM: DTS: da850: Add node for mmc1
Date: Thu, 17 Dec 2015 15:27:51 +0200
Message-ID: <1450358872-2951-6-git-send-email-peter.ujfalusi@ti.com>
References: <1450358872-2951-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450358872-2951-1-git-send-email-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, khilman@deeprootsystems.com
List-Id: devicetree@vger.kernel.org

da850 has two MMC controller, MMCSD1 is served by eDMA1

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Tested-by: Sushaanth Srirangapathi <sushaanth.s@ti.com>
---
 arch/arm/boot/dts/da850.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index 1538959f2853..31ca5768fccf 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -239,6 +239,14 @@
 			dma-names = "rx", "tx";
 			status = "disabled";
 		};
+		mmc1: mmc@1e1b000 {
+			compatible = "ti,da830-mmc";
+			reg = <0x21b000 0x1000>;
+			interrupts = <72>;
+			dmas = <&edma1 28 0>, <&edma1 29 0>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
 		ehrpwm0: ehrpwm@01f00000 {
 			compatible = "ti,da850-ehrpwm", "ti,am33xx-ehrpwm";
 			#pwm-cells = <3>;
-- 
2.6.4
