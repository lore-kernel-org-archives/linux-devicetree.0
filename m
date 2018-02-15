From: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: [PATCH v3 02/12] dt-bindings: display: renesas: Deprecate LVDS support in the DU bindings
Date: Thu, 15 Feb 2018 02:04:05 +0200
Message-ID: <20180215000415.19077-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180215000415.19077-1-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The internal LVDS encoders now have their own DT bindings, representing
them as part of the DU is deprecated.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes since v1:

- Remove the LVDS reg range from the example
- Remove the reg-names property
---
 .../devicetree/bindings/display/renesas,du.txt     | 31 ++++++++--------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index cd48aba3bc8c..e79cf9b0ad38 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -14,12 +14,7 @@ Required Properties:
     - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
     - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
 
-  - reg: A list of base address and length of each memory resource, one for
-    each entry in the reg-names property.
-  - reg-names: Name of the memory resources. The DU requires one memory
-    resource for the DU core (named "du") and one memory resource for each
-    LVDS encoder (named "lvds.x" with "x" being the LVDS controller numerical
-    index).
+  - reg: the memory-mapped I/O registers base address and length
 
   - interrupt-parent: phandle of the parent interrupt controller.
   - interrupts: Interrupt specifiers for the DU interrupts.
@@ -29,14 +24,13 @@ Required Properties:
   - clock-names: Name of the clocks. This property is model-dependent.
     - R8A7779 uses a single functional clock. The clock doesn't need to be
       named.
-    - All other DU instances use one functional clock per channel and one
-      clock per LVDS encoder (if available). The functional clocks must be
-      named "du.x" with "x" being the channel numerical index. The LVDS clocks
-      must be named "lvds.x" with "x" being the LVDS encoder numerical index.
-    - In addition to the functional and encoder clocks, all DU versions also
-      support externally supplied pixel clocks. Those clocks are optional.
-      When supplied they must be named "dclkin.x" with "x" being the input
-      clock numerical index.
+    - All other DU instances use one functional clock per channel The
+      functional clocks must be named "du.x" with "x" being the channel
+      numerical index.
+    - In addition to the functional clocks, all DU versions also support
+      externally supplied pixel clocks. Those clocks are optional. When
+      supplied they must be named "dclkin.x" with "x" being the input clock
+      numerical index.
 
   - vsps: A list of phandle and channel index tuples to the VSPs that handle
     the memory interfaces for the DU channels. The phandle identifies the VSP
@@ -69,9 +63,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
 
 	du: display@feb00000 {
 		compatible = "renesas,du-r8a7795";
-		reg = <0 0xfeb00000 0 0x80000>,
-		      <0 0xfeb90000 0 0x14>;
-		reg-names = "du", "lvds.0";
+		reg = <0 0xfeb00000 0 0x80000>;
 		interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
@@ -79,9 +71,8 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
 		clocks = <&cpg CPG_MOD 724>,
 			 <&cpg CPG_MOD 723>,
 			 <&cpg CPG_MOD 722>,
-			 <&cpg CPG_MOD 721>,
-			 <&cpg CPG_MOD 727>;
-		clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
+			 <&cpg CPG_MOD 721>;
+		clock-names = "du.0", "du.1", "du.2", "du.3";
 		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
 
 		ports {
-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
