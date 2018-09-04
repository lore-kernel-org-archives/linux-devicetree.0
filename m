From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 7/8] arm64: dts: qcom: msm8998: Add the qfprom node
Date: Mon,  3 Sep 2018 22:01:22 -0700
Message-ID: <20180904050123.26601-8-bjorn.andersson@linaro.org>
References: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the QFPROM nvmem node to msm8998

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New patch

 arch/arm64/boot/dts/qcom/msm8998.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 7cf655f04489..f0cdad91b6c9 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -471,6 +471,13 @@
 			reg = <0x778000 0x7000>;
 		};
 
+		qfprom: qfprom@780000 {
+			compatible = "qcom,qfprom";
+			reg = <0x780000 0x621c>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		gcc: clock-controller@100000 {
 			compatible = "qcom,gcc-msm8998";
 			#clock-cells = <1>;
-- 
2.18.0
