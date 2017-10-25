From: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] dt-bindings: pfuze100: Remove leading zero from '@08' notation
Date: Wed, 25 Oct 2017 16:57:13 -0200
Message-ID: <1508957833-22231-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Improve the binding example by removing the leading 0 from '@08' notation,
which fixes the following build warnings:

Warning (unit_address_format): Node /pfuze100@08 unit name should not have leading 0s
Warning (unit_address_format): Node /pfuze200@08 unit name should not have leading 0s
Warning (unit_address_format): Node /pfuze3000@08 unit name should not have leading 0s

Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/pfuze100.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/pfuze100.txt b/Documentation/devicetree/bindings/regulator/pfuze100.txt
index 444c478..c6dd3f5 100644
--- a/Documentation/devicetree/bindings/regulator/pfuze100.txt
+++ b/Documentation/devicetree/bindings/regulator/pfuze100.txt
@@ -21,7 +21,7 @@ Each regulator is defined using the standard binding for regulators.
 
 Example 1: PFUZE100
 
-	pmic: pfuze100@08 {
+	pmic: pfuze100@8 {
 		compatible = "fsl,pfuze100";
 		reg = <0x08>;
 
@@ -122,7 +122,7 @@ Example 1: PFUZE100
 
 Example 2: PFUZE200
 
-	pmic: pfuze200@08 {
+	pmic: pfuze200@8 {
 		compatible = "fsl,pfuze200";
 		reg = <0x08>;
 
@@ -216,7 +216,7 @@ Example 2: PFUZE200
 
 Example 3: PFUZE3000
 
-	pmic: pfuze3000@08 {
+	pmic: pfuze3000@8 {
 		compatible = "fsl,pfuze3000";
 		reg = <0x08>;
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
