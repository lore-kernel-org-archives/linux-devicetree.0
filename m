From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8996: Correct apr-domain property
Date: Mon, 17 Jun 2019 22:25:47 -0700
Message-ID: <20190618052547.32376-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

The domain specifier was changed from using "reg" to "qcom,apr-domain",
update the dts accordingly.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c934e00434c7..1a139cfb240d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1831,7 +1831,7 @@
 				power-domains = <&gcc HLOS1_VOTE_LPASS_ADSP_GDSC>;
 				compatible = "qcom,apr-v2";
 				qcom,smd-channels = "apr_audio_svc";
-				reg = <APR_DOMAIN_ADSP>;
+				qcom,apr-domain = <APR_DOMAIN_ADSP>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-- 
2.18.0
