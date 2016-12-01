From: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: [PATCH 15/22] dt-bindings: display: renesas: Add R-Car Gen3 HDMI TX DT bindings
Date: Fri,  2 Dec 2016 01:43:30 +0200
Message-ID: <1480635817-1258-16-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jose Abreu <Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ulrich Hecht <ulrich.hecht-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Renesas R-Car Gen3 SoCs use a Synopsys DWC HDMI TX encoder IP. Add
corresponding device tree bindings based on the DWC HDMI TX bindings
model.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
---
 .../bindings/display/bridge/renesas,dw-hdmi.txt    | 75 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
new file mode 100644
index 000000000000..f6b3f36d422b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -0,0 +1,75 @@
+Renesas Gen3 DWC HDMI TX Encoder
+================================
+
+The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
+with a companion PHY IP.
+
+These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
+Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
+following device-specific properties.
+
+
+Required properties:
+
+- compatible : Shall contain one or more of
+  - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
+  - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 compatible HDMI TX
+
+    When compatible with generic versions, nodes must list the SoC-specific
+    version corresponding to the platform first, followed by the
+    family-specific version.
+
+- reg: See dw_hdmi.txt.
+- interrupts: HDMI interrupt number
+- clocks: See dw_hdmi.txt.
+- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
+- ports: See dw_hdmi.txt. The DWC HDMI shall have one port numbered 0
+  corresponding to the video input of the controller and one port numbered 1
+  corresponding to its HDMI output. Each port shall have a single endpoint.
+
+Optional properties:
+
+- power-domains: Shall reference the power domain that contains the DWC HDMI,
+  if any.
+
+
+Example:
+
+	hdmi0: hdmi0@fead0000 {
+		compatible = "renesas,r8a7795-dw-hdmi";
+		reg = <0 0xfead0000 0 0x10000>;
+		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
+		clock-names = "iahb", "isfr";
+		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				dw_hdmi0_in: endpoint {
+					remote-endpoint = <&du_out_hdmi0>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				rcar_dw_hdmi0_out: endpoint {
+					remote-endpoint = <&hdmi0_con>;
+				};
+			};
+		};
+	};
+
+	hdmi0-out {
+		compatible = "hdmi-connector";
+		label = "HDMI0 OUT";
+		type = "a";
+
+		port {
+			hdmi0_con: endpoint {
+				remote-endpoint = <&rcar_dw_hdmi0_out>;
+			};
+		};
+	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 30c873192458..a513fda157d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4231,6 +4231,7 @@ S:	Supported
 F:	drivers/gpu/drm/rcar-du/
 F:	drivers/gpu/drm/shmobile/
 F:	include/linux/platform_data/shmob_drm.h
+F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 F:	Documentation/devicetree/bindings/display/renesas,du.txt
 
 DRM DRIVER FOR QXL VIRTUAL GPU
-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
