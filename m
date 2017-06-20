From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/6] dt-bindings: cp110: do not depend anymore of the *-clock-output-names
Date: Tue, 20 Jun 2017 10:37:48 +0200
Message-ID: <20170620083754.28053-2-gregory.clement@free-electrons.com>
References: <20170620083754.28053-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170620083754.28053-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch updates the documentation according to the change made in the
patch "clk: mvebu: cp110: do not depend anymore of the
*-clock-output-names": the clock names are no more part of the binding.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../bindings/arm/marvell/cp110-system-controller0.txt      | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
index 07dbb358182c..dbd0a38ca580 100644
--- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
+++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
@@ -59,14 +59,6 @@ Required properties:
      "marvell,cp110-system-controller0", "syscon";
  - reg: register area of the CP110 system controller 0
  - #clock-cells: must be set to 2
- - core-clock-output-names must be set to:
-	"cpm-apll", "cpm-ppv2-core", "cpm-eip", "cpm-core", "cpm-nand-core"
- - gate-clock-output-names must be set to:
-	"cpm-audio", "cpm-communit", "cpm-nand", "cpm-ppv2", "cpm-sdio",
-	"cpm-mg-domain", "cpm-mg-core", "cpm-xor1", "cpm-xor0", "cpm-gop-dp", "none",
-	"cpm-pcie_x10", "cpm-pcie_x11", "cpm-pcie_x4", "cpm-pcie-xor", "cpm-sata",
-	"cpm-sata-usb", "cpm-main", "cpm-sd-mmc-gop", "none", "none", "cpm-slow-io",
-	"cpm-usb3h0", "cpm-usb3h1", "cpm-usb3dev", "cpm-eip150", "cpm-eip197";
 
 Example:
 
@@ -74,10 +66,4 @@ Example:
 		compatible = "marvell,cp110-system-controller0", "syscon";
 		reg = <0x440000 0x1000>;
 		#clock-cells = <2>;
-		core-clock-output-names = "cpm-apll", "cpm-ppv2-core", "cpm-eip", "cpm-core", "cpm-nand-core";
-		gate-clock-output-names = "cpm-audio", "cpm-communit", "cpm-nand", "cpm-ppv2", "cpm-sdio",
-			"cpm-mg-domain", "cpm-mg-core", "cpm-xor1", "cpm-xor0", "cpm-gop-dp", "none",
-			"cpm-pcie_x10", "cpm-pcie_x11", "cpm-pcie_x4", "cpm-pcie-xor", "cpm-sata",
-			"cpm-sata-usb", "cpm-main", "cpm-sd-mmc-gop", "none", "none", "cpm-slow-io",
-			"cpm-usb3h0", "cpm-usb3h1", "cpm-usb3dev", "cpm-eip150", "cpm-eip197";
 	};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
