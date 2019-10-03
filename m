From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: Add APSS watchdog node
Date: Wed,  2 Oct 2019 21:13:45 -0700
Message-ID: <20191003041345.20912-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a node describing the watchdog found in the application subsystem.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f0b2db34ec4a..23915eab4187 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3488,6 +3488,12 @@
 			status = "disabled";
 		};
 
+		watchdog@17980000 {
+			compatible = "qcom,apss-wdt-sdm845", "qcom,kpss-wdt";
+			reg = <0 0x17980000 0 0x1000>;
+			clocks = <&sleep_clk>;
+		};
+
 		apss_shared: mailbox@17990000 {
 			compatible = "qcom,sdm845-apss-shared";
 			reg = <0 0x17990000 0 0x1000>;
-- 
2.18.0
