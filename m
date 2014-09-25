From: Johannes Pointner <johannes.pointner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] dt: bindings: tps65217: add compatible property for  subnodes
Date: Thu, 25 Sep 2014 08:31:46 +0200
Message-ID: <1660410.j399mvljTo@lenovobook>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add documentation for compatible property of subnodes.

Signed-off-by: Johannes Pointner <johannes.pointner-5O2GiQo/Ci2aMPzRcYMCawC/G2K4zDHf@public.gmane.org>
---
 Documentation/devicetree/bindings/regulator/tps65217.txt         | 7 ++++++-
 .../devicetree/bindings/video/backlight/tps65217-backlight.txt   | 9 ++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/tps65217.txt b/Documentation/devicetree/bindings/regulator/tps65217.txt
index 4f05d20..8ae3a3b 100644
--- a/Documentation/devicetree/bindings/regulator/tps65217.txt
+++ b/Documentation/devicetree/bindings/regulator/tps65217.txt
@@ -14,6 +14,9 @@ Required properties:
 Optional properties:
 - ti,pmic-shutdown-controller: Telling the PMIC to shutdown on PWR_EN toggle.
 
+Required subnode properties:
+- compatible: "ti,tps65217-pmic"
+
   The valid names for regulators are:
   tps65217: dcdc1, dcdc2, dcdc3, ldo1, ldo2, ldo3 and ldo4
 
@@ -23,9 +26,11 @@ Example:
 
 	tps: tps@24 {
 		compatible = "ti,tps65217";
+		reg = <0x24>;
 		ti,pmic-shutdown-controller;
 
-		regulators {
+		tps_pmic: regulators {
+			compatible = "ti,tps65217-pmic";
 			dcdc1_reg: dcdc1 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1800000>;
diff --git a/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt b/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt
index 5fb9279..f92f154 100644
--- a/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt
+++ b/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt
@@ -6,19 +6,22 @@ used to drive LEDs for use as backlights.
 Required properties:
 - compatible: "ti,tps65217"
 - reg: I2C slave address
-- backlight: node for specifying WLED1 and WLED2 lines in TPS65217
+- backlight: subnode for specifying WLED1 and WLED2 lines in TPS65217
+
+Required subnode properties:
+- compatible: "ti,tps65217-bl"
 - isel: selection bit, valid values: 1 for ISEL1 (low-level) and 2 for ISEL2 (high-level)
 - fdim: PWM dimming frequency, valid values: 100, 200, 500, 1000
 - default-brightness: valid values: 0-100
 
-Each regulator is defined using the standard binding for regulators.
 
 Example:
 
 	tps: tps@24 {
 		reg = <0x24>;
 		compatible = "ti,tps65217";
-		backlight {
+		tps_bl: backlight {
+			compatible = "ti,tps65217-bl";
 			isel = <1>;  /* 1 - ISET1, 2 ISET2 */
 			fdim = <100>; /* TPS65217_BL_FDIM_100HZ */
 			default-brightness = <50>;
-- 
2.1.0
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
