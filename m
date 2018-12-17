Return-Path: <SRS0=oElv=O2=gmail.com=ykaneko0929@kernel.org>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH/RFT v2 1/2] dt-bindings: thermal: rcar-thermal: add R8A77990 support
Date: Mon, 17 Dec 2018 23:50:20 +0900
Message-Id: <1545058221-22529-2-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
References: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Document the R-Car E3 (R8A77990) SoC bindings.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
index 73e1613..0520c18 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
@@ -4,7 +4,7 @@ Required properties:
 - compatible		: "renesas,thermal-<soctype>",
 			   "renesas,rcar-gen2-thermal" (with thermal-zone) or
 			   "renesas,rcar-thermal" (without thermal-zone) as
-                           fallback except R-Car V3M/D3.
+                           fallback except R-Car V3M/E3/D3.
 			  Examples with soctypes are:
 			    - "renesas,thermal-r8a73a4" (R-Mobile APE6)
 			    - "renesas,thermal-r8a7743" (RZ/G1M)
@@ -15,6 +15,7 @@ Required properties:
 			    - "renesas,thermal-r8a7792" (R-Car V2H)
 			    - "renesas,thermal-r8a7793" (R-Car M2-N)
 			    - "renesas,thermal-r8a77970" (R-Car V3M)
+			    - "renesas,thermal-r8a77990" (R-Car E3)
 			    - "renesas,thermal-r8a77995" (R-Car D3)
 - reg			: Address range of the thermal registers.
 			  The 1st reg will be recognized as common register
@@ -23,7 +24,7 @@ Required properties:
 Option properties:
 
 - interrupts		: If present should contain 3 interrupts for
-                          R-Car V3M/D3 or 1 interrupt otherwise.
+                          R-Car V3M/E3/D3 or 1 interrupt otherwise.
 
 Example (non interrupt support):
 
-- 
1.9.1
