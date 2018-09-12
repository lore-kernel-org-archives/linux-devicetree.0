From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v3 12/16] arm64: dts: msm8916: thermal: Add "qcom,sensors" property
Date: Wed, 12 Sep 2018 15:22:57 +0530
Message-ID: <b471798c8e6de8c23de7ed4e2363049e2aad5486.1536744310.git.amit.kucheria@linaro.org>
References: <cover.1536744310.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1536744310.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1536744310.git.amit.kucheria@linaro.org>
References: <cover.1536744310.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, smohanad@codeaurora.org, andy.gross@linaro.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This new property allows the number of sensors to be configured from DT
instead of being hardcoded in platform data. Use it.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 6a277fce3333..be27d8dc9e6b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -767,6 +767,7 @@
 			      <0x4a8000 0x1000>; /* SROT */
 			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
 			nvmem-cell-names = "calib", "calib_sel";
+			#qcom,sensors = <5>;
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1
