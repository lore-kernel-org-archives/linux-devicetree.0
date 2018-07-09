Return-Path: <SRS0=UTzV=JZ=atomide.com=tony@kernel.org>
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 1/5] dt-bindings: Update omap l4 binding for optional registers
Date: Sun,  8 Jul 2018 23:36:08 -0700
Message-Id: <20180709063612.12025-2-tony@atomide.com>
In-Reply-To: <20180709063612.12025-1-tony@atomide.com>
References: <20180709063612.12025-1-tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-ID: <devicetree@vger.kernel.org>

The interconnects on omap variants have configuration registers.
There are registers for a link agent, one or more interconnect
agent, and an optional access protection.

Let's also update the example for omap4 l4 per instance as it
has multiple interconnect agent registers.

For more information, see chapter "Interconnect" in TI techical
reference manuals.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 Documentation/devicetree/bindings/arm/omap/l4.txt | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/omap/l4.txt b/Documentation/devicetree/bindings/arm/omap/l4.txt
--- a/Documentation/devicetree/bindings/arm/omap/l4.txt
+++ b/Documentation/devicetree/bindings/arm/omap/l4.txt
@@ -7,6 +7,7 @@ Required properties:
 	       Should be "ti,omap2-l4-wkup" for OMAP2 family l4 wkup bus
 	       Should be "ti,omap3-l4-core" for OMAP3 family l4 core bus
 	       Should be "ti,omap4-l4-cfg" for OMAP4 family l4 cfg bus
+	       Should be "ti,omap4-l4-per" for OMAP4 family l4 per bus
 	       Should be "ti,omap4-l4-wkup" for OMAP4 family l4 wkup bus
 	       Should be "ti,omap5-l4-cfg" for OMAP5 family l4 cfg bus
 	       Should be "ti,omap5-l4-wkup" for OMAP5 family l4 wkup bus
@@ -15,11 +16,21 @@ Required properties:
 	       Should be "ti,am3-l4-wkup" for AM33xx family l4 wkup bus
 	       Should be "ti,am4-l4-wkup" for AM43xx family l4 wkup bus
 - ranges : contains the IO map range for the bus
+- reg : registers link agent and interconnect agent and access protection
+- reg-names : "la" for link agent, "ia0" to "ia3" for one to three
+              interconnect agent instances, "ap" for access if it exists
 
 Examples:
 
-l4: l4@48000000 {
-	compatible "ti,omap2-l4", "simple-bus";
+l4: interconnect@48000000 {
+	compatible "ti,omap4-l4-per", "simple-bus";
+	reg = <0x48000000 0x800>,
+	      <0x48000800 0x800>,
+	      <0x48001000 0x400>,
+	      <0x48001400 0x400>,
+	      <0x48001800 0x400>,
+	      <0x48001c00 0x400>;
+	reg-names = "ap", "la", "ia0", "ia1", "ia2", "ia3";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0 0x48000000 0x100000>;
-- 
2.17.1
