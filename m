From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH resend 2/3] dt: bindings: Remove focaltech,ft6236 binding
Date: Sun, 11 Sep 2016 20:45:42 +0200
Message-ID: <20160911184543.11734-3-hdegoede@redhat.com>
References: <20160911184543.11734-1-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160911184543.11734-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The focaltech ft6236 are i2c protocol compatible with other chips supported
by the edt,ft5x06 driver. The duplicate ft6236 driver has already been
removed from the kernel.

This commit removes the duplicate binding to match, adding its compatible
string to the edt,ft5x06 binding.

This commit also adds the standard touchscreen properties as optional
properties to the edt,ft5x06 binding, these were documented in the
focaltech,ft6236 binding but missing from the edt,ft5x06 doc.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../bindings/input/touchscreen/edt-ft5x06.txt      |  8 +++++
 .../input/touchscreen/focaltech-ft6236.txt         | 35 ----------------------
 2 files changed, 8 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/focaltech-ft6236.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
index f99528d..6db2210 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
@@ -19,6 +19,7 @@ Required properties:
            or:  "edt,edt-ft5306"
            or:  "edt,edt-ft5406"
            or:  "edt,edt-ft5506"
+           or:  "focaltech,ft6236"
 
  - reg:         I2C slave address of the chip (0x38)
  - interrupt-parent: a phandle pointing to the interrupt controller
@@ -43,6 +44,13 @@ Optional properties:
 
  - offset:      allows setting the edge compensation in the range from
                 0 to 31.
+ - touchscreen-size-x	   : See touchscreen.txt
+ - touchscreen-size-y	   : See touchscreen.txt
+ - touchscreen-fuzz-x      : See touchscreen.txt
+ - touchscreen-fuzz-y      : See touchscreen.txt
+ - touchscreen-inverted-x  : See touchscreen.txt
+ - touchscreen-inverted-y  : See touchscreen.txt
+ - touchscreen-swapped-x-y : See touchscreen.txt
 
 Example:
 	polytouch: edt-ft5x06@38 {
diff --git a/Documentation/devicetree/bindings/input/touchscreen/focaltech-ft6236.txt b/Documentation/devicetree/bindings/input/touchscreen/focaltech-ft6236.txt
deleted file mode 100644
index 777521d..0000000
--- a/Documentation/devicetree/bindings/input/touchscreen/focaltech-ft6236.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* FocalTech FT6236 I2C touchscreen controller
-
-Required properties:
- - compatible		  : "focaltech,ft6236"
- - reg			  : I2C slave address of the chip (0x38)
- - interrupt-parent	  : a phandle pointing to the interrupt controller
-			    serving the interrupt for this chip
- - interrupts		  : interrupt specification for the touch controller
-			    interrupt
- - reset-gpios		  : GPIO specification for the RSTN input
- - touchscreen-size-x	  : horizontal resolution of touchscreen (in pixels)
- - touchscreen-size-y	  : vertical resolution of touchscreen (in pixels)
-
-Optional properties:
- - touchscreen-fuzz-x	  : horizontal noise value of the absolute input
-			    device (in pixels)
- - touchscreen-fuzz-y	  : vertical noise value of the absolute input
-			    device (in pixels)
- - touchscreen-inverted-x : X axis is inverted (boolean)
- - touchscreen-inverted-y : Y axis is inverted (boolean)
- - touchscreen-swapped-x-y: X and Y axis are swapped (boolean)
-			    Swapping is done after inverting the axis
-
-Example:
-
-	ft6x06@38 {
-		compatible = "focaltech,ft6236";
-		reg = <0x38>;
-		interrupt-parent = <&gpio>;
-		interrupts = <23 2>;
-		touchscreen-size-x = <320>;
-		touchscreen-size-y = <480>;
-		touchscreen-inverted-x;
-		touchscreen-swapped-x-y;
-	};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
