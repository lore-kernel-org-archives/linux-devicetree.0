From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/4] arm64: dts: apq8016-sbc: enable spi buses on LS and HS
Date: Thu,  8 Oct 2015 12:19:41 +0100
Message-ID: <1444303181-32574-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1444303124-32402-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444303124-32402-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, agross@codeaurora.org
Cc: jorge.ramirez-ortiz@linaro.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch enables spi buses on low speed and high speed expansion
connectors on DB410C

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 3581272..d872654 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -92,11 +92,21 @@
 	status = "okay";
 };
 
+&blsp_spi3 {
+	/* On High speed expansion */
+	status = "okay";
+};
+
 &blsp_i2c4 {
 	/* On High speed expansion */
 	status = "okay";
 };
 
+&blsp_spi5 {
+	/* On Low speed expansion */
+	status = "okay";
+};
+
 &blsp_i2c6 {
 	/* On Low speed expansion */
 	status = "okay";
-- 
1.9.1
