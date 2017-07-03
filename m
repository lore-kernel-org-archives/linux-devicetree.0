From: Varadarajan Narayanan <varada@codeaurora.org>
Subject: [PATCH v2 1/2] dts: ipq4019: Fix pinctrl node name
Date: Mon,  3 Jul 2017 13:04:43 +0530
Message-ID: <1499067284-21008-2-git-send-email-varada@codeaurora.org>
References: <1499067284-21008-1-git-send-email-varada@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1499067284-21008-1-git-send-email-varada@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varada@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi | 13 +------------
 arch/arm/boot/dts/qcom-ipq4019.dtsi           |  2 +-
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
index b9457dd..de83bc9 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1.dtsi
@@ -29,18 +29,7 @@
 	};
 
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
-		pinctrl@0x01000000 {
+		pinctrl@1000000 {
 			serial_pins: serial_pinmux {
 				mux {
 					pins = "gpio60", "gpio61";
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index b7a24af..6defd0e 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -119,7 +119,7 @@
 			reg = <0x1800000 0x60000>;
 		};
 
-		tlmm: pinctrl@0x01000000 {
+		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq4019-pinctrl";
 			reg = <0x01000000 0x300000>;
 			gpio-controller;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
