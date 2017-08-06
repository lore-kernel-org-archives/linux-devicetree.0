From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH 1/3] dt-bindings: add "reduced-width" property for Armada XP SDRAM controller
Date: Mon,  7 Aug 2017 10:30:04 +1200
Message-ID: <20170806223006.14231-2-chris.packham@alliedtelesis.co.nz>
References: <20170806223006.14231-1-chris.packham@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170806223006.14231-1-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some SoC implementations that use this controller have a reduced pin
count so the meaning of "full" and "half" with change.

Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
---
 .../bindings/memory-controllers/mvebu-sdram-controller.txt          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt b/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
index 89657d1d4cd4..3041868321c8 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/mvebu-sdram-controller.txt
@@ -13,6 +13,12 @@ Required properties:
  - reg: a resource specifier for the register space, which should
    include all SDRAM controller registers as per the datasheet.
 
+Optional properties:
+ - marvell,reduced-width: some SoCs that use this SDRAM controller have
+   a reduced pin count. On such systems "full" width is 32-bits and
+   "half" width is 16-bits. Set this property to indicate that the SoC
+   used is such a system.
+
 Example:
 
 sdramc@1400 {
-- 
2.13.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
