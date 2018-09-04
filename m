From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 6/8] arm64: dts: qcom: msm8998: Add firmware node
Date: Mon,  3 Sep 2018 22:01:21 -0700
Message-ID: <20180904050123.26601-7-bjorn.andersson@linaro.org>
References: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the firmware and scm nodes for msm8998

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New patch

 arch/arm64/boot/dts/qcom/msm8998.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 335bbc339932..7cf655f04489 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -237,6 +237,12 @@
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-msm8998";
+		};
+	};
+
 	tcsr_mutex: hwlock {
 		compatible = "qcom,tcsr-mutex";
 		syscon = <&tcsr_mutex_regs 0 0x1000>;
-- 
2.18.0
