From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 02/10] arm64: dts: qcom: sdm845: Define rmtfs memory
Date: Mon, 21 Jan 2019 21:51:04 -0800
Message-ID: <20190122055112.30943-3-bjorn.andersson@linaro.org>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122055112.30943-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define the rmtfs memory node, as described in version 10 of the memory
map.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New patch

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index cdcac3704c13..64f57cc5c61a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -72,6 +72,15 @@
 		#size-cells = <2>;
 		ranges;
 
+		rmtfs@85d00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0x85d00000 0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <15>;
+		};
+
 		memory@85fc0000 {
 			reg = <0 0x85fc0000 0 0x20000>;
 			no-map;
-- 
2.18.0
