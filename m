From: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v2] dt-bindings: Input: Remove leading zeros from bindings notation
Date: Wed, 1 Nov 2017 10:30:43 -0200
Message-ID: <1509539443-16253-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Improve the binding example by removing all the leading zeros to fix the
following dtc warnings:

Warning (unit_address_format): Node /XXX unit name should not have leading 0s

Converted using the following command:

perl -p -i -e 's/\@0+([0-9a-f])/\@$1/g' `find ./Documentation/devicetree/bindings/input "*.txt"`

Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
---
Change since v1:
- use script to add all the input directory
- change subject
- change message log
 Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt       | 2 +-
 Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt  | 2 +-
 Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
index 4357e49..1458c31 100644
--- a/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
+++ b/Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
@@ -19,7 +19,7 @@ Example:
 
 #include <dt-bindings/input/input.h>
 
-	lradc: lradc@01c22800 {
+	lradc: lradc@1c22800 {
 		compatible = "allwinner,sun4i-a10-lradc-keys";
 		reg = <0x01c22800 0x100>;
 		interrupts = <31>;
diff --git a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
index 49fa14e..707f248 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
@@ -10,7 +10,7 @@ Required properties:
 
 Example:
 
-	egalax_ts@04 {
+	egalax_ts@4 {
 		compatible = "eeti,egalax_ts";
 		reg = <0x04>;
 		interrupt-parent = <&gpio1>;
diff --git a/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt b/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt
index e67e58b..1649150 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/imx6ul_tsc.txt
@@ -21,7 +21,7 @@ Optional properties:
   each read. Valid values are 1, 4, 8, 16 and 32.
 
 Example:
-	tsc: tsc@02040000 {
+	tsc: tsc@2040000 {
 		compatible = "fsl,imx6ul-tsc";
 		reg = <0x02040000 0x4000>, <0x0219c000 0x4000>;
 		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
