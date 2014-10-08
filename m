From: Johannes Pointner <johannes.pointner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/2] dt: bindings: tps65217: add compatible property for backlight  subnode
Date: Wed, 08 Oct 2014 23:20:28 +0200
Message-ID: <4202809.cQlU8Tr5kS@lenovobook>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add documentation for compatible property of backlight subnode.

Signed-off-by: Johannes Pointner <johannes.pointner-5O2GiQo/Ci2aMPzRcYMCawC/G2K4zDHf@public.gmane.org>
---
Changes since v2:
1. Removed the pmic part of the patch.
2. Added newline before subnode in the example.
---
 .../devicetree/bindings/video/backlight/tps65217-backlight.txt | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt b/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt
index 5fb9279..63ef699 100644
--- a/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt
+++ b/Documentation/devicetree/bindings/video/backlight/tps65217-backlight.txt
@@ -6,19 +6,23 @@ used to drive LEDs for use as backlights.
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
+
+		tps_bl: backlight {
+			compatible = "ti,tps65217-bl";
 			isel = <1>;  /* 1 - ISET1, 2 ISET2 */
 			fdim = <100>; /* TPS65217_BL_FDIM_100HZ */
 			default-brightness = <50>;
-- 
2.1.2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
