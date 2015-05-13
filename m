From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH v2] devicetree: Add hardware rng entry to qcom-apq8064.dtsi
Date: Wed, 13 May 2015 15:41:47 -0700
Message-ID: <1431556907-12941-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: John Stultz <john.stultz@linaro.org>, Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add devicetree data to add support for hw_rng support
to the apq8064 dts.

Tested on the Nexus7 (2013).

Cc: Kumar Gala <galak@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org
Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2: Adjusted hex value to lower-case per Stephen's suggestion.

 arch/arm/boot/dts/qcom-apq8064.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index b3154c0..241811d 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -226,6 +226,13 @@
 			};
 		};
 
+		rng@1a500000 {
+			compatible = "qcom,prng";
+			reg = <0x1a500000 0x200>;
+			clocks = <&gcc PRNG_CLK>;
+			clock-names = "core";
+		};
+
 		qcom,ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x00500000 0x1000>;
-- 
1.9.1
