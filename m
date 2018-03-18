Return-Path: <SRS0=zrMl=GI=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 4/4] dt-bindings: ifc: Remove "simple-bus" from ifc compatible string
Date: Sun, 18 Mar 2018 11:17:31 -0300
Message-Id: <1521382651-10256-4-git-send-email-festevam@gmail.com>
In-Reply-To: <1521382651-10256-1-git-send-email-festevam@gmail.com>
References: <1521382651-10256-1-git-send-email-festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>>

DTC warnings will be seen if these examples are used in a real dts file
due to a mismatch in the unit address notation.

Remove "simple-bus" from the ifc compatible string to fix the warnings.  

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
index 89427b0..2314871 100644
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
@@ -31,7 +31,7 @@ like FPGAs, CPLDs, etc.
 Example:
 
 	ifc@ffe1e000 {
-		compatible = "fsl,ifc", "simple-bus";
+		compatible = "fsl,ifc";
 		#address-cells = <2>;
 		#size-cells = <1>;
 		reg = <0x0 0xffe1e000 0 0x2000>;
-- 
2.7.4
