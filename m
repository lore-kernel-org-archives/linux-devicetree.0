From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] Documentation: dt-bindings: Fix interrupt documentation file path
Date: Mon, 21 Sep 2015 11:25:40 -0500
Message-ID: <1442852740-3390-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fix the incorrect interrupt documentation file path in binding docs.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
---
 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt | 2 +-
 Documentation/devicetree/bindings/mfd/arizona.txt          | 2 +-
 Documentation/devicetree/bindings/mfd/palmas.txt           | 2 +-
 Documentation/devicetree/bindings/sound/wm8994.txt         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
index dd5d2c0..4d6c8cd 100644
--- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
@@ -24,7 +24,7 @@ controller.
 - #interrupt-cells : Specifies the number of cells needed to encode an
   interrupt.  Shall be set to 2.  The first cell defines the interrupt number,
   the second encodes the triger flags encoded as described in
-  Documentation/devicetree/bindings/interrupts.txt
+  Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 - interrupt-parent : The parent interrupt controller.
 - interrupts : The interrupt to the parent controller raised when GPIOs
   generate the interrupts.
diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index a8fee60..3d361ec 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -24,7 +24,7 @@ Required properties:
   - #interrupt-cells: the number of cells to describe an IRQ, this should be 2.
     The first cell is the IRQ number.
     The second cell is the flags, encoded as the trigger masks from
-    Documentation/devicetree/bindings/interrupts.txt
+    Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 
   - gpio-controller : Indicates this device is a GPIO controller.
   - #gpio-cells : Must be 2. The first cell is the pin number and the
diff --git a/Documentation/devicetree/bindings/mfd/palmas.txt b/Documentation/devicetree/bindings/mfd/palmas.txt
index eda8989..8ae1a32 100644
--- a/Documentation/devicetree/bindings/mfd/palmas.txt
+++ b/Documentation/devicetree/bindings/mfd/palmas.txt
@@ -24,7 +24,7 @@ and also the generic series names
 - #interrupt-cells : should be set to 2 for IRQ number and flags
   The first cell is the IRQ number.
   The second cell is the flags, encoded as the trigger masks from
-  Documentation/devicetree/bindings/interrupts.txt
+  Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 - interrupt-parent : The parent interrupt controller.
 
 Optional properties:
diff --git a/Documentation/devicetree/bindings/sound/wm8994.txt b/Documentation/devicetree/bindings/sound/wm8994.txt
index e045e90..68c4e8d 100644
--- a/Documentation/devicetree/bindings/sound/wm8994.txt
+++ b/Documentation/devicetree/bindings/sound/wm8994.txt
@@ -30,7 +30,7 @@ Optional properties:
   - #interrupt-cells: the number of cells to describe an IRQ, this should be 2.
     The first cell is the IRQ number.
     The second cell is the flags, encoded as the trigger masks from
-    Documentation/devicetree/bindings/interrupts.txt
+    Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 
   - clocks : A list of up to two phandle and clock specifier pairs
   - clock-names : A list of clock names sorted in the same order as clocks.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
