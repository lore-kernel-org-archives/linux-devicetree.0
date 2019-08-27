From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 07/15] dt: thermal: tsens: Document interrupt support in tsens driver
Date: Tue, 27 Aug 2019 17:44:03 +0530
Message-ID: <66ac3d3707d6296ef85bf1fa321f7f1ee0c02131.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1566907161.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org, sboyd@kernel.org, masneyb@onstation.org, marc.w.gonzalez@free.fr, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define two new required properties to define interrupts and
interrupt-names for tsens.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
index 673cc1831ee9d..686bede72f846 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
@@ -22,6 +22,8 @@ Required properties:
 
 - #thermal-sensor-cells : Should be 1. See ./thermal.txt for a description.
 - #qcom,sensors: Number of sensors in tsens block
+- interrupts: Interrupts generated from Always-On subsystem (AOSS)
+- interrupt-names: Must be one of the following: "uplow", "critical"
 - Refer to Documentation/devicetree/bindings/nvmem/nvmem.txt to know how to specify
 nvmem cells
 
@@ -40,6 +42,9 @@ tsens0: thermal-sensor@c263000 {
 		reg = <0xc263000 0x1ff>, /* TM */
 			<0xc222000 0x1ff>; /* SROT */
 		#qcom,sensors = <13>;
+		interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "uplow";
+
 		#thermal-sensor-cells = <1>;
 	};
 
@@ -51,5 +56,8 @@ tsens: thermal-sensor@4a9000 {
 		nvmem-cells = <&tsens_caldata>;
 		nvmem-cell-names = "calib";
 		#qcom,sensors = <10>;
+		interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "uplow";
+
 		#thermal-sensor-cells = <1>;
 	};
-- 
2.17.1
