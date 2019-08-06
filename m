From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v2 3/5] dt-bindings: arm: Extend SCMI to support new reset protocol
Date: Tue,  6 Aug 2019 18:02:06 +0100
Message-ID: <20190806170208.6787-4-sudeep.holla@arm.com>
References: <20190806170208.6787-1-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806170208.6787-1-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org, Bo Zhang <bozhang.zhang@broadcom.com>, Jim Quinlan <james.quinlan@broadcom.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Gaku Inami <gaku.inami.xh@renesas.com>, aidapala@qti.qualcomm.com, pajay@qti.qualcomm.com, Etienne Carriere <etienne.carriere@linaro.org>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, wesleys@xilinx.com, Felix Burton <fburton@xilinx.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SCMIv2.0 adds a new Reset Management Protocol to manage various reset
states a given device or domain can enter. Extend the existing SCMI
bindings to add reset protocol support by re-using the reset bindings
for bothe reset providers and consumers.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 .../devicetree/bindings/arm/arm,scmi.txt        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,scmi.txt b/Documentation/devicetree/bindings/arm/arm,scmi.txt
index 317a2fc3667a..083dbf96ee00 100644
--- a/Documentation/devicetree/bindings/arm/arm,scmi.txt
+++ b/Documentation/devicetree/bindings/arm/arm,scmi.txt
@@ -73,6 +73,16 @@ SCMI provides an API to access the various sensors on the SoC.
 			 as used by the firmware. Refer to  platform details
 			 for your implementation for the IDs to use.
 
+Reset signal bindings for the reset domains based on SCMI Message Protocol
+------------------------------------------------------------
+
+This binding for the SCMI reset domain providers uses the generic reset
+signal binding[5].
+
+Required properties:
+ - #reset-cells : Should be 1. Contains the reset domain ID value used
+		  by SCMI commands.
+
 SRAM and Shared Memory for SCMI
 -------------------------------
 
@@ -93,6 +103,7 @@ Each sub-node represents the reserved area for SCMI.
 [2] Documentation/devicetree/bindings/power/power_domain.txt
 [3] Documentation/devicetree/bindings/thermal/thermal.txt
 [4] Documentation/devicetree/bindings/sram/sram.txt
+[5] Documentation/devicetree/bindings/reset/reset.txt
 
 Example:
 
@@ -152,6 +163,11 @@ firmware {
 			reg = <0x15>;
 			#thermal-sensor-cells = <1>;
 		};
+
+		scmi_reset: protocol@16 {
+			reg = <0x16>;
+			#reset-cells = <1>;
+		};
 	};
 };
 
@@ -166,6 +182,7 @@ hdlcd@7ff60000 {
 	reg = <0 0x7ff60000 0 0x1000>;
 	clocks = <&scmi_clk 4>;
 	power-domains = <&scmi_devpd 1>;
+	resets = <&scmi_reset 10>;
 };
 
 thermal-zones {
-- 
2.17.1
