From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 10/11] ARM: dts: apq8064: Move i2c1 pinctrl to apq8064.dtsi
Date: Fri, 10 Apr 2015 21:44:40 +0100
Message-ID: <1428698680-12324-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1428698491-11881-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1428698491-11881-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: galak@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: bjorn.andersson@sonymobile.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

I2C1 pinctrl is not really specific to a board, moving to SOC dtsi would
avoid redefining this in every board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 7 -------
 arch/arm/boot/dts/qcom-apq8064.dtsi        | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 528cb31..f97339a 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -11,13 +11,6 @@
 
 	soc {
 		pinctrl@800000 {
-			i2c1_pins: i2c1 {
-				mux {
-					pins = "gpio20", "gpio21";
-					function = "gsbi1";
-				};
-			};
-
 			card_detect: card_detect {
 				mux {
 					pins = "gpio26";
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 93de48a..345ea08 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -113,6 +113,13 @@
 					function = "ps_hold";
 				};
 			};
+
+			i2c1_pins: i2c1 {
+				mux {
+					pins = "gpio20", "gpio21";
+					function = "gsbi1";
+				};
+			};
 		};
 
 		intc: interrupt-controller@2000000 {
-- 
1.9.1
