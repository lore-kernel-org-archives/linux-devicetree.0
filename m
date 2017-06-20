From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/6] dt-bindings: cp110: introduce a new binding
Date: Tue, 20 Jun 2017 10:37:49 +0200
Message-ID: <20170620083754.28053-3-gregory.clement@free-electrons.com>
References: <20170620083754.28053-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170620083754.28053-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch updates the documentation according to the change made in the
patch "pinctrl: dt-bindings: cp110: introduce a new binding".

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../bindings/arm/marvell/cp110-system-controller0.txt  | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
index dbd0a38ca580..e97cc2d73e2e 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
@@ -7,6 +7,13 @@ Controller 0 and System Controller 1. This Device Tree binding allows
 to describe the first system controller, which provides registers to
 configure various aspects of the SoC.
 
+For the top level node:
+ - compatible: must be: "syscon", "simple-mfd";
+ - reg: register area of the CP110 system controller 0
+
+Clocks:
+-------
+
 The Device Tree node representing this System Controller 0 provides a
 number of clocks:
 
@@ -56,14 +63,17 @@ The following clocks are available:
 Required properties:
 
  - compatible: must be:
-     "marvell,cp110-system-controller0", "syscon";
- - reg: register area of the CP110 system controller 0
+     "marvell,cp110-clock"
  - #clock-cells: must be set to 2
 
 Example:
 
 	cpm_syscon0: system-controller@440000 {
-		compatible = "marvell,cp110-system-controller0", "syscon";
+		compatible = "syscon", "simple-mfd";
 		reg = <0x440000 0x1000>;
-		#clock-cells = <2>;
+
+		cpm_clk: clock {
+			compatible = "marvell,cp110-clock";
+			#clock-cells = <2>;
+		};
 	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
