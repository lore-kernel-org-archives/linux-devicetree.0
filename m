Return-Path: <SRS0=zrMl=GI=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/4] Revert "dt-bindings: ifc: Fix the unit address format in the examples"
Date: Sun, 18 Mar 2018 11:17:30 -0300
Message-Id: <1521382651-10256-3-git-send-email-festevam@gmail.com>
In-Reply-To: <1521382651-10256-1-git-send-email-festevam@gmail.com>
References: <1521382651-10256-1-git-send-email-festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

This reverts commit 4e017f1419397473cf3db6e9fa020013998b1aa4.

As explained by Rob Herring:

"This "fix" is wrong. Memory controllers with chip selects should have
the chip select in the unit-address. The correct fix here is you should drop
"simple-bus"."

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
index a4d4b6a..89427b0 100644
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
@@ -43,7 +43,7 @@ Example:
 			  0x1 0x0 0x0 0xffa00000 0x00010000
 			  0x3 0x0 0x0 0xffb00000 0x00020000>;
 
-		flash@0 {
+		flash@0,0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "cfi-flash";
@@ -58,7 +58,7 @@ Example:
 			};
 		};
 
-		flash@100000000 {
+		flash@1,0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "fsl,ifc-nand";
@@ -73,7 +73,7 @@ Example:
 			};
 		};
 
-		cpld@@300000000 {
+		cpld@3,0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "fsl,p1010rdb-cpld";
-- 
2.7.4
