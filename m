From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 15/17] arm64: dts: qcom: qcs404: Add BAM DMA node
Date: Mon,  5 Nov 2018 21:15:27 +0530
Message-ID: <20181105154529.7614-16-vkoul@kernel.org>
References: <20181105154529.7614-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105154529.7614-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

Add the BAM DMA instance found in BLSP1 node of the QCS404

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index a37930639b8d..88e04a0ee67f 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -276,6 +276,19 @@
 			status = "okay";
 		};
 
+		blsp1_dma: dma@7884000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07884000 0x25000>;
+			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,controlled-remotely = <1>;
+			qcom,ee = <0>;
+
+			status = "okay";
+		};
+
 		apcs_glb: mailbox@b011000 {
 			compatible = "qcom,qcs404-apcs-apps-global", "syscon";
 			reg = <0xb011000 0x1000>;
-- 
2.14.4
