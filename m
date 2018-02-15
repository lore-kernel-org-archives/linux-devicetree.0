From: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: [PATCH v3 01/12] dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
Date: Thu, 15 Feb 2018 02:04:04 +0200
Message-ID: <20180215000415.19077-2-laurent.pinchart+renesas@ideasonboard.com>
References: <20180215000415.19077-1-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180215000415.19077-1-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
corresponding device tree bindings.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes since v1:

- Move the SoC name before the IP name in compatible strings
- Rename parallel input to parallel RGB input
- Fixed "renesas,r8a7743-lvds" description
- Document the resets property
- Fixed typo
---
 .../bindings/display/bridge/renesas,lvds.txt       | 56 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
new file mode 100644
index 000000000000..2b19ce51ec07
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
@@ -0,0 +1,56 @@
+Renesas R-Car LVDS Encoder
+==========================
+
+These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
+Gen2, R-Car Gen3 and RZ/G SoCs.
+
+Required properties:
+
+- compatible : Shall contain one of
+  - "renesas,r8a7743-lvds" for R8A7743 (RZ/G1M) compatible LVDS encoders
+  - "renesas,r8a7790-lvds" for R8A7790 (R-Car H2) compatible LVDS encoders
+  - "renesas,r8a7791-lvds" for R8A7791 (R-Car M2-W) compatible LVDS encoders
+  - "renesas,r8a7793-lvds" for R8A7791 (R-Car M2-N) compatible LVDS encoders
+  - "renesas,r8a7795-lvds" for R8A7795 (R-Car H3) compatible LVDS encoders
+  - "renesas,r8a7796-lvds" for R8A7796 (R-Car M3-W) compatible LVDS encoders
+
+- reg: Base address and length for the memory-mapped registers
+- clocks: A phandle + clock-specifier pair for the functional clock
+- resets: A phandle + reset specifier for the module reset
+
+Required nodes:
+
+The LVDS encoder has two video ports. Their connections are modelled using the
+OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+- Video port 0 corresponds to the parallel RGB input
+- Video port 1 corresponds to the LVDS output
+
+Each port shall have a single endpoint.
+
+
+Example:
+
+	lvds0: lvds@feb90000 {
+		compatible = "renesas,r8a7790-lvds";
+		reg = <0 0xfeb90000 0 0x1c>;
+		clocks = <&cpg CPG_MOD 726>;
+		resets = <&cpg 726>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lvds0_in: endpoint {
+					remote-endpoint = <&du_out_lvds0>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				lvds0_out: endpoint {
+				};
+			};
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 5bc088f27c83..5b0c14f4209b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4723,6 +4723,7 @@ F:	drivers/gpu/drm/rcar-du/
 F:	drivers/gpu/drm/shmobile/
 F:	include/linux/platform_data/shmob_drm.h
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
 F:	Documentation/devicetree/bindings/display/renesas,du.txt
 
 DRM DRIVERS FOR ROCKCHIP
-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
