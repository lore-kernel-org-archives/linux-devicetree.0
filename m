From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/4] arm64: dts: apq8016-sbc: enable spi buses on LS and HS
Date: Fri,  9 Oct 2015 09:55:29 +0100
Message-ID: <1444380929-1557-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1444380825-1355-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1444380825-1355-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
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
index cd1d0b5..64b06d8 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -49,6 +49,16 @@
 			status = "okay";
 		};
 
+		spi@78b7000 {
+		/* On High speed expansion */
+			status = "okay";
+		};
+
+		spi@78b9000 {
+		/* On Low speed expansion */
+			status = "okay";
+		};
+
 		leds {
 			pinctrl-names = "default";
 			pinctrl-0 = <&msmgpio_leds>,
-- 
1.9.1
