From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 12/18] arm64: dts: qcom: pms405: add gpios
Date: Thu,  8 Nov 2018 23:20:43 +0530
Message-ID: <20181108175049.7090-13-vkoul@kernel.org>
References: <20181108175049.7090-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108175049.7090-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

Add the GPIOs present on PMS405 chip.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index 2b275bbdafa3..02b758cfd758 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -10,6 +10,22 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pms405_gpios: gpios@c000 {
+			compatible = "qcom,pms405-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xc1 0 IRQ_TYPE_NONE>,
+				<0 0xc2 0 IRQ_TYPE_NONE>,
+				<0 0xc3 0 IRQ_TYPE_NONE>,
+				<0 0xc4 0 IRQ_TYPE_NONE>,
+				<0 0xc5 0 IRQ_TYPE_NONE>,
+				<0 0xc6 0 IRQ_TYPE_NONE>,
+				<0 0xc7 0 IRQ_TYPE_NONE>,
+				<0 0xca 0 IRQ_TYPE_NONE>,
+				<0 0xcb 0 IRQ_TYPE_NONE>;
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>;
-- 
2.14.4
