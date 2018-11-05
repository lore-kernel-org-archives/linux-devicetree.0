From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 17/17] arm64: dts: qcom: pms405: Add pon and pwrkey nodes
Date: Mon,  5 Nov 2018 21:15:29 +0530
Message-ID: <20181105154529.7614-18-vkoul@kernel.org>
References: <20181105154529.7614-1-vkoul@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181105154529.7614-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
List-Id: devicetree@vger.kernel.org

PMS405 also features PON block, so add PON and PWRKEY nodes

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/pms405.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pms405.dtsi b/arch/arm64/boot/dts/qcom/pms405.dtsi
index 18410d9f0f8f..2c7cc1e94ff4 100644
--- a/arch/arm64/boot/dts/qcom/pms405.dtsi
+++ b/arch/arm64/boot/dts/qcom/pms405.dtsi
@@ -2,6 +2,7 @@
 // Copyright (c) 2018, Linaro Limited
 
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/input/linux-event-codes.h>
 
 &spmi_bus {
 
@@ -18,6 +19,21 @@
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
 		};
 
+		pon@800 {
+			compatible = "qcom,pms405-pon";
+			reg = <0x800>;
+			mode-bootloader = <0x2>;
+			mode-recovery = <0x1>;
+
+			pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_POWER>;
+			};
+		};
+
 		pms405_gpios: gpios@c000 {
 			compatible = "qcom,pms405-gpio";
 			reg = <0xc000>;
-- 
2.14.4
