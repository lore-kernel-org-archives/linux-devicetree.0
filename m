From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [RFC v3 04/14] MIPS: dts: qca: ar9132: make extosc-related description shorter
Date: Sat, 23 Jan 2016 23:17:21 +0300
Message-ID: <1453580251-2341-5-git-send-email-antonynpavlov@gmail.com>
References: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1453580251-2341-1-git-send-email-antonynpavlov@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Antony Pavlov <antonynpavlov@gmail.com>, Alban Bedel <albeu@free.fr>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Alban Bedel <albeu@free.fr>
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
 arch/mips/boot/dts/qca/ar9132.dtsi               |  9 ++++++++-
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 14 ++++----------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/mips/boot/dts/qca/ar9132.dtsi b/arch/mips/boot/dts/qca/ar9132.dtsi
index 4a537ea..cd1602f 100644
--- a/arch/mips/boot/dts/qca/ar9132.dtsi
+++ b/arch/mips/boot/dts/qca/ar9132.dtsi
@@ -28,6 +28,13 @@
 					<&ddr_ctrl 0>, <&ddr_ctrl 1>;
 	};
 
+	extosc: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+
+		/* The board must provide the extosc clock frequency */
+	};
+
 	ahb {
 		compatible = "simple-bus";
 		ranges;
@@ -89,8 +96,8 @@
 						"qca,ar9130-pll";
 				reg = <0x18050000 0x20>;
 
+				clocks = <&extosc>;
 				clock-names = "ref";
-				/* The board must provides the ref clock */
 
 				#clock-cells = <1>;
 				clock-output-names = "cpu", "ddr", "ahb";
diff --git a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
index 003015a..53057ca 100644
--- a/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
+++ b/arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts
@@ -18,21 +18,11 @@
 		reg = <0x0 0x2000000>;
 	};
 
-	extosc: oscillator {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <40000000>;
-	};
-
 	ahb {
 		apb {
 			uart@18020000 {
 				status = "okay";
 			};
-
-			pll-controller@18050000 {
-				clocks = <&extosc>;
-			};
 		};
 
 		spi@1f000000 {
@@ -110,3 +100,7 @@
 		};
 	};
 };
+
+&extosc {
+	clock-frequency = <40000000>;
+};
-- 
2.6.2

