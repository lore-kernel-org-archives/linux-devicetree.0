From: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] DT/arm,gic-v3: Update the ITS size in the examples
Date: Tue,  3 Oct 2017 15:20:27 +0100
Message-ID: <20171003142027.23243-1-julien.grall@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently, the examples are using 2MB for the ITS size. Per the
specification (section 8.18 in ARM IHI 0069D), the ITS address map is
128KB.

Update the examples to match the specification.

Signed-off-by: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
index 4c29cdab0ea5..5eb108e180fa 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
@@ -99,7 +99,7 @@ Examples:
 			compatible = "arm,gic-v3-its";
 			msi-controller;
 			#msi-cells = <1>;
-			reg = <0x0 0x2c200000 0 0x200000>;
+			reg = <0x0 0x2c200000 0 0x20000>;
 		};
 	};
 
@@ -124,14 +124,14 @@ Examples:
 			compatible = "arm,gic-v3-its";
 			msi-controller;
 			#msi-cells = <1>;
-			reg = <0x0 0x2c200000 0 0x200000>;
+			reg = <0x0 0x2c200000 0 0x20000>;
 		};
 
 		gic-its@2c400000 {
 			compatible = "arm,gic-v3-its";
 			msi-controller;
 			#msi-cells = <1>;
-			reg = <0x0 0x2c400000 0 0x200000>;
+			reg = <0x0 0x2c400000 0 0x20000>;
 		};
 
 		ppi-partitions {
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
