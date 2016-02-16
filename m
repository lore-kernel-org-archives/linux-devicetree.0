From: Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 04/06] devicetree: bindings: Deprecate property, update example
Date: Tue, 16 Feb 2016 16:17:59 +0900
Message-ID: <20160216071759.25461.53185.sendpatchset@little-apple>
References: <20160216071722.25461.61862.sendpatchset@little-apple>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160216071722.25461.61862.sendpatchset@little-apple>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be, robh@kernel.org, daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Deprecate "renesas,channels-mask" and update the r8a7790 CMT example.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
---

 Changes since V2:
 - Added Acked-by from Rob
 - Removed Tested-by tag from DT binding patch - duh!

 Changes since V1:
 - Added Acked-by and Tested-by from Geert
 - Added Acked-by from Laurent

 Documentation/devicetree/bindings/timer/renesas,cmt.txt |   24 ++++++++++-----
 1 file changed, 17 insertions(+), 7 deletions(-)

--- 0009/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt	2015-09-17 17:39:47.080513000 +0900
@@ -60,21 +60,31 @@ Required Properties:
     in clock-names.
   - clock-names: must contain "fck" for the functional clock.
 
-  - renesas,channels-mask: bitmask of the available channels.
+  - renesas,channels-mask: <deprecated>, information kept in device driver.
 
 
-Example: R8A7790 (R-Car H2) CMT0 node
-
-	CMT0 on R8A7790 implements hardware channels 5 and 6 only and names
-	them channels 0 and 1 in the documentation.
+Example: R8A7790 (R-Car H2) CMT0 and CMT1 nodes
 
 	cmt0: timer@ffca0000 {
-		compatible = "renesas,cmt-48-r8a7790", "renesas,cmt-48-gen2";
+		compatible = "renesas,cmt0-r8a7790", "renesas,cmt0-rcar-gen2";
 		reg = <0 0xffca0000 0 0x1004>;
 		interrupts = <0 142 IRQ_TYPE_LEVEL_HIGH>,
 			     <0 142 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7790_CLK_CMT0>;
 		clock-names = "fck";
+	};
 
-		renesas,channels-mask = <0x60>;
+	cmt1: timer@e6130000 {
+		compatible = "renesas,cmt1-r8a7790", "renesas,cmt1-rcar-gen2";
+		reg = <0 0xe6130000 0 0x1004>;
+		interrupts = <0 120 IRQ_TYPE_LEVEL_HIGH>,
+			     <0 121 IRQ_TYPE_LEVEL_HIGH>,
+			     <0 122 IRQ_TYPE_LEVEL_HIGH>,
+			     <0 123 IRQ_TYPE_LEVEL_HIGH>,
+			     <0 124 IRQ_TYPE_LEVEL_HIGH>,
+			     <0 125 IRQ_TYPE_LEVEL_HIGH>,
+			     <0 126 IRQ_TYPE_LEVEL_HIGH>,
+			     <0 127 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp3_clks R8A7790_CLK_CMT1>;
+		clock-names = "fck";
 	};
