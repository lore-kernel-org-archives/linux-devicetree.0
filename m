Return-Path: <SRS0=8mwe=GA=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: Fix the unit address format in the examples
Date: Sat, 10 Mar 2018 11:25:40 -0300
Message-Id: <1520691940-27935-1-git-send-email-festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

DTC warnings will be seen if these examples are used in a real dts file 
due to a mismatch in the unit address notation.

Align the unit address notation to what is done in the real dts files
as per commit f81d7af79575 ("arm64: dts: fsl: fix ifc simple-bus unit
address format warnings")

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Hi,

Commit f81d7af79575 ("arm64: dts: fsl: fix ifc simple-bus unit address
format warnings") is present in Shawn Guo's tree.

 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
index 89427b0..a4d4b6a 100644
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
@@ -43,7 +43,7 @@ Example:
 			  0x1 0x0 0x0 0xffa00000 0x00010000
 			  0x3 0x0 0x0 0xffb00000 0x00020000>;
 
-		flash@0,0 {
+		flash@0 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "cfi-flash";
@@ -58,7 +58,7 @@ Example:
 			};
 		};
 
-		flash@1,0 {
+		flash@100000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "fsl,ifc-nand";
@@ -73,7 +73,7 @@ Example:
 			};
 		};
 
-		cpld@3,0 {
+		cpld@@300000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "fsl,p1010rdb-cpld";
-- 
2.7.4
