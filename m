From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 06/17] arm64: dts: qcom: qcs404: Add TLMM pinctrl node
Date: Mon,  5 Nov 2018 21:15:18 +0530
Message-ID: <20181105154529.7614-7-vkoul@kernel.org>
References: <20181105154529.7614-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105154529.7614-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add the QCS404 TLMM pinctrl node with its three tiles.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index c87b0440584a..58afdd83e7a9 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -256,6 +256,20 @@
 			reg = <0xb011000 0x1000>;
 			#mbox-cells = <1>;
 		};
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,qcs404-pinctrl";
+			reg = <0x01000000 0x200000>,
+			      <0x01300000 0x200000>,
+			      <0x07b00000 0x200000>;
+			reg-names = "south", "north", "east";
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&tlmm 0 0 120>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	smp2p-adsp {
-- 
2.14.4
