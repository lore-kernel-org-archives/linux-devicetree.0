From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] dt-bindings: arm: Extend SCMI to support new reset protocol
Date: Fri,  9 Aug 2019 15:40:27 +0100
Message-ID: <20190809144027.20912-1-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SCMIv2.0 adds a new Reset Management Protocol to manage various reset
states a given device or domain can enter. Extend the existing SCMI
bindings to add reset protocol support by re-using the reset bindings
for both reset providers and consumers.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 .../devicetree/bindings/arm/arm,scmi.txt        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

Hi Rob,

I am posting this separately to avoid reposting the driver patches that
are already reviewed/asked. I need your ack to take the changes for v5.4
I might have messed up something that it got missed from your patchworks
Full series @[1]

Regards,
Sudeep

[1] https://lore.kernel.org/lkml/20190806170208.6787-4-sudeep.holla@arm.com/

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
