From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 02/11] arm/arm64: dts: msm8974/msm8916: thermal: Add "qcom,sensors" property
Date: Tue, 28 Aug 2018 19:08:31 +0530
Message-ID: <e894c837385b6a2e120eddb779a359bb08b7c847.1535462942.git.amit.kucheria@linaro.org>
References: <cover.1535462942.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1535462942.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1535462942.git.amit.kucheria@linaro.org>
References: <cover.1535462942.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, smohanad@codeaurora.org, andy.gross@linaro.org, dianders@chromium.org, mka@chromium.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This new property allows the number of sensors to be configured from DT
instead of being hardcoded in platform data. Use it.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 56dbbf788d15..3c4b81c29798 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -433,6 +433,7 @@
 			      <0xfc4a8000 0x1000>; /* SROT */
 			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
 			nvmem-cell-names = "calib", "calib_backup";
+			#qcom,sensors = <11>;
 			#thermal-sensor-cells = <1>;
 		};
 
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
