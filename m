From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH 07/15] dt: thermal: tsens: Document interrupt support in tsens driver
Date: Fri, 26 Jul 2019 03:48:42 +0530
Message-ID: <72bce036fa8cba3db6e5ba82249837ee46e9c077.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, Andy Gross <agross@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define two new required properties to define interrupts and
interrupt-names for tsens.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
index 673cc1831ee9..3d3dd5dc6d36 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
@@ -22,6 +22,8 @@ Required properties:
 
 - #thermal-sensor-cells : Should be 1. See ./thermal.txt for a description.
 - #qcom,sensors: Number of sensors in tsens block
+- interrupts: Interrupts generated from Always-On subsystem (AOSS)
+- interrupt-names: The name of the interrupt e.g. "tsens0", "tsens1"
 - Refer to Documentation/devicetree/bindings/nvmem/nvmem.txt to know how to specify
 nvmem cells
 
@@ -40,6 +42,9 @@ tsens0: thermal-sensor@c263000 {
 		reg = <0xc263000 0x1ff>, /* TM */
 			<0xc222000 0x1ff>; /* SROT */
 		#qcom,sensors = <13>;
+		interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tsens0";
+
 		#thermal-sensor-cells = <1>;
 	};
 
-- 
2.17.1
