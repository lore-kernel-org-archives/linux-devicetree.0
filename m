From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 6/9] devicetree: bindings: Deprecate property, update example
Date: Tue, 29 Aug 2017 11:34:24 +0200
Message-ID: <1503999271-15712-6-git-send-email-daniel.lezcano@linaro.org>
References: <20170829093354.GA2572@mai>
 <1503999271-15712-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503999271-15712-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Magnus Damm <damm+renesas@opensource.se>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Magnus Damm <damm+renesas@opensource.se>

Deprecate "renesas,channels-mask" and update the r8a7790 CMT example.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../devicetree/bindings/timer/renesas,cmt.txt      | 24 +++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index e81e0d2..8fb7c93 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
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
+		compatible = "renesas,cmt0-r8a7790", "renesas,rcar-gen2-cmt0";
 		reg = <0 0xffca0000 0 0x1004>;
 		interrupts = <0 142 IRQ_TYPE_LEVEL_HIGH>,
 			     <0 142 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp1_clks R8A7790_CLK_CMT0>;
 		clock-names = "fck";
+	};
 
-		renesas,channels-mask = <0x60>;
+	cmt1: timer@e6130000 {
+		compatible = "renesas,cmt1-r8a7790", "renesas,rcar-gen2-cmt1";
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
-- 
2.7.4
