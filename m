From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [RFC v4 05/15] MIPS: dts: qca: ar9132: make extosc-related description shorter
Date: Mon,  1 Feb 2016 03:10:30 +0300
Message-ID: <1454285440-18916-6-git-send-email-antonynpavlov@gmail.com>
References: <1454285440-18916-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1454285440-18916-1-git-send-email-antonynpavlov@gmail.com>
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
index a1b4fa1..e6baa1e 100644
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
index e535ee3..9b4132f 100644
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
 
 		usb@1b000100 {
@@ -118,3 +108,7 @@
 		};
 	};
 };
+
+&extosc {
+	clock-frequency = <40000000>;
+};
-- 
2.7.0

