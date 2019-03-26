Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs404-evb: add spmi regulators
Date: Tue, 26 Mar 2019 22:29:34 +0530
Message-Id: <20190326165934.28181-2-vkoul@kernel.org>
In-Reply-To: <20190326165934.28181-1-vkoul@kernel.org>
References: <20190326165934.28181-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Define the EVB pms405_s3 supplies.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index e794ac68b7fa..c6987029ed5e 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -48,6 +48,18 @@
 	};
 };
 
+&pms_regulators {
+	vdd_s3-supply = <&pms405_s3>;
+
+	pms405_s3: s3 {
+		   regulator-always-on;
+		   regulator-boot-on;
+		   regulator-name = "vdd_apc";
+		   regulator-min-microvolt = <1048000>;
+		   regulator-max-microvolt = <1352000>;
+	   };
+};
+
 &remoteproc_adsp {
 	status = "ok";
 };
-- 
2.20.1
