From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Subject: [PATCH 07/13] dtb: amd: Misc changes for GPIO devices
Date: Wed, 27 Jan 2016 15:11:55 -0600
Message-ID: <1453929121-12171-8-git-send-email-Suravee.Suthikulpanit@amd.com>
References: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, leo.duran@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

Add new GPIO device nodes and fix clock on gpio0.

Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 49 +++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index 9f59381..ba455d1 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -129,7 +129,7 @@
 			#size-cells = <0>;
 		};
 
-		gpio0: gpio@e1040000 {
+		gpio0: gpio@e1040000 { /* Not available to OS for B0 */
 			status = "disabled";
 			compatible = "arm,pl061", "arm,primecell";
 			#gpio-cells = <2>;
@@ -138,18 +138,59 @@
 			interrupts = <0 359 4>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&uartspiclk_100mhz>;
+			clocks = <&miscclk_250mhz>;
 			clock-names = "apb_pclk";
 		};
 
-		gpio1: gpio@e1050000 {
+		gpio1: gpio@e1050000 { /* [0:7] */
 			status = "disabled";
 			compatible = "arm,pl061", "arm,primecell";
 			#gpio-cells = <2>;
 			reg = <0 0xe1050000 0 0x1000>;
 			gpio-controller;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 			interrupts = <0 358 4>;
-			clocks = <&uartspiclk_100mhz>;
+			clocks = <&miscclk_250mhz>;
+			clock-names = "apb_pclk";
+		};
+
+		gpio2: gpio@e0020000 { /* [8:15] */
+			status = "disabled";
+			compatible = "arm,pl061", "arm,primecell";
+			#gpio-cells = <2>;
+			reg = <0 0xe0020000 0 0x1000>;
+			gpio-controller;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <0 366 4>;
+			clocks = <&miscclk_250mhz>;
+			clock-names = "apb_pclk";
+		};
+
+		gpio3: gpio@e0030000 { /* [16:23] */
+			status = "disabled";
+			compatible = "arm,pl061", "arm,primecell";
+			#gpio-cells = <2>;
+			reg = <0 0xe0030000 0 0x1000>;
+			gpio-controller;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <0 365 4>;
+			clocks = <&miscclk_250mhz>;
+			clock-names = "apb_pclk";
+		};
+
+		gpio4: gpio@e0080000 { /* [24] */
+			status = "disabled";
+			compatible = "arm,pl061", "arm,primecell";
+			#gpio-cells = <2>;
+			reg = <0 0xe0080000 0 0x1000>;
+			gpio-controller;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <0 361 4>;
+			clocks = <&miscclk_250mhz>;
 			clock-names = "apb_pclk";
 		};
 
-- 
2.5.0
