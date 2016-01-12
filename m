From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/5] arm64: dts: apq8016-sbc: make 1.8v available on LS expansion
Date: Tue, 12 Jan 2016 13:47:15 +0000
Message-ID: <1452606435-24783-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

96boards mezzanine boards on LS expansion require 1.8v as per 96boards
specifications, so enable the corresponding regulators and make them
always-on.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index b635149..b87a650 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -143,10 +143,15 @@
 						regulator-max-microvolt = <3337000>;
 
 					};
-					
+
+					/**
+					 * 1.8v required on LS expansion
+					 * for mezzanine boards
+					 */
 					l15 {
 						regulator-min-microvolt = <1750000>;
 						regulator-max-microvolt = <3337000>;
+						regulator-always-on;
 					};
 
 					l16 {
-- 
1.9.1
