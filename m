From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 14/16] arm64: dts: msm8996: add support to blsp2_spi5
Date: Fri, 17 Jun 2016 16:14:11 +0100
Message-ID: <1466176454-28084-15-git-send-email-srinivas.kandagatla@linaro.org>
References: <1466176454-28084-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466176454-28084-1-git-send-email-srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support to blsp2_spi5 device, which is used in some of
the APQ8096 based boards.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index e009063..f68b078 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -231,6 +231,21 @@
 			status = "disabled";
 		};
 
+		blsp2_spi5: spi@075ba000{
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x075ba000 0x600>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_QUP5_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_spi5_default>;
+			pinctrl-1 = <&blsp2_spi5_sleep>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		msmgpio: pinctrl@1010000 {
 			compatible = "qcom,msm8996-pinctrl";
 			reg = <0x01010000 0x300000>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
