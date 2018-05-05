Return-Path: <SRS0=p2PT=HY=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: pfuze100: Make the node name generic
Date: Fri,  4 May 2018 22:17:13 -0300
Message-Id: <1525483033-20575-1-git-send-email-festevam@gmail.com>
To: broonie@kernel.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <devicetree@vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

According to Devicetree Specification v0.2 document:

"The name of a node should be somewhat generic, reflecting the function
of the device and not its precise programming model."

Do as suggested in the binding example.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/devicetree/bindings/regulator/pfuze100.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index c6dd3f5..f0ada3b 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -21,7 +21,7 @@ Each regulator is defined using the standard binding for regulators.
 
 Example 1: PFUZE100
 
-	pmic: pfuze100@8 {
+	pfuze100: pmic@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
@@ -122,7 +122,7 @@ Example 1: PFUZE100
 
 Example 2: PFUZE200
 
-	pmic: pfuze200@8 {
+	pfuze200: pmic@8 {
 		compatible = "fsl,pfuze200";
 		reg = <0x08>;
 
@@ -216,7 +216,7 @@ Example 2: PFUZE200
 
 Example 3: PFUZE3000
 
-	pmic: pfuze3000@8 {
+	pfuze3000: pmic@8 {
 		compatible = "fsl,pfuze3000";
 		reg = <0x08>;
 
-- 
2.7.4
