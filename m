From: Varadarajan Narayanan <varada@codeaurora.org>
Subject: [PATCH v3 2/2] dts: ipq4019: Move xo and timer nodes to SoC dtsi
Date: Mon,  3 Jul 2017 13:17:13 +0530
Message-ID: <1499068033-24000-3-git-send-email-varada@codeaurora.org>
References: <1499068033-24000-1-git-send-email-varada@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1499068033-24000-1-git-send-email-varada@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The node for xo and timer belong to the SoC DTS file.
Else, new board DT files may not inherit these nodes.

Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 19 -------------------
 arch/arm/boot/dts/qcom-ipq4019.dtsi           | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
index 1ce253d..c055a57 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
@@ -20,26 +20,7 @@
 	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK01.1";
 	compatible = "qcom,ipq4019";
 
-	clocks {
-                xo: xo {
-                        compatible = "fixed-clock";
-                        clock-frequency = <48000000>;
-                        #clock-cells = <0>;
-                };
-	};
-
 	soc {
-
-
-		timer {
-			compatible = "arm,armv7-timer";
-			interrupts = <1 2 0xf08>,
-				     <1 3 0xf08>,
-				     <1 4 0xf08>,
-				     <1 1 0xf08>;
-			clock-frequency = <48000000>;
-		};
-
 		pinctrl@1000000 {
 			serial_pins: serial_pinmux {
 				mux {
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 6defd0e..f4765e4 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -96,6 +96,21 @@
 			clock-frequency = <32768>;
 			#clock-cells = <0>;
 		};
+
+		xo: xo {
+			compatible = "fixed-clock";
+			clock-frequency = <48000000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <1 2 0xf08>,
+			     <1 3 0xf08>,
+			     <1 4 0xf08>,
+			     <1 1 0xf08>;
+		clock-frequency = <48000000>;
 	};
 
 	soc {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
