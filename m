From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] dt-bindings: arm,gic-v3: require that reserved cells are always 0
Date: Wed,  3 Feb 2016 18:00:58 +0000
Message-ID: <1454522458-29643-1-git-send-email-will.deacon@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The arm,gic-v3 binding was written with good intentions and doesn't
enforce interrupt-cells to be 3, therefore making it easy to extend
the irq description in future if necessary:

  > Cells 4 and beyond are reserved for future use.

Unfortunately, this sentence is immediately followed up with:

  > When the 1st cell has a value of 0 or 1, cells 4 and beyond act as
  > padding, and may be ignored. It is recommended that padding cells
  > have a value of 0.

Consequently, any extensions to the PPI or SPI interrupt specifiers must
be able to work with random crap from legacy DTs, effectively
necessitating a new interrupt type in the first cell. Sigh.

This patch fixes the text so that additional, reserved cells are
required to be zero. This looks like a reasonable thing to require and
is already satisifed by the .dts files in-tree.

Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
 .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
index 7803e77d85cb..007a5b46256a 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
@@ -24,9 +24,8 @@ Main node required properties:
 		1 = edge triggered
 		4 = level triggered
 
-  Cells 4 and beyond are reserved for future use. When the 1st cell
-  has a value of 0 or 1, cells 4 and beyond act as padding, and may be
-  ignored. It is recommended that padding cells have a value of 0.
+  Cells 4 and beyond are reserved for future use and must have a value
+  of 0 if present.
 
 - reg : Specifies base physical address(s) and size of the GIC
   registers, in the following order:
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
