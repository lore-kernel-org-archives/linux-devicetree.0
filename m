From: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 1/3] dt-bindings: display: Add Document for Rockchip Soc LVDS
Date: Mon, 14 Aug 2017 15:01:34 +0800
Message-ID: <1502694097-196236-1-git-send-email-hjc@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch add Document for Rockchip Soc RK3288 LVDS,
This based on the patches from Mark yao and Heiko Stuebner.

Signed-off-by: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Mark yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
Changes:
    set lvds data-mapping to opctions.

 .../bindings/display/rockchip/rockchip-lvds.txt    | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
new file mode 100644
index 0000000..e8207dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-lvds.txt
@@ -0,0 +1,106 @@
+Rockchip RK3288 LVDS interface
+================================
+
+Required properties:
+- compatible: matching the soc type, one of
+	- "rockchip,rk3288-lvds";
+
+- reg: physical base address of the controller and length
+	of memory mapped region.
+- clocks: must include clock specifiers corresponding to entries in the
+	clock-names property.
+- clock-names: must contain "pclk_lvds"
+
+- avdd1v0-supply: regulator phandle for 1.0V analog power
+- avdd1v8-supply: regulator phandle for 1.8V analog power
+- avdd3v3-supply: regulator phandle for 3.3V analog power
+
+- rockchip,grf: phandle to the general register files syscon
+
+Optional properties:
+- pinctrl-names: must contain a "lcdc" entry.
+- pinctrl-0: pin control group to be used for this controller.
+
+Required nodes:
+
+The lvds has two video ports as described by
+	Documentation/devicetree/bindings/media/video-interfaces.txt.
+Their connections are modeled using the OF graph bindings specified in
+	Documentation/devicetree/bindings/graph.txt.
+
+- video port 0 for the VOP inputs
+- video port 1 for either a panel or subsequent encoder
+
+the lvds panel described by
+	Documentation/devicetree/bindings/display/panel/simple-panel.txt
+
+Panel required properties:
+- rockchip,data-width : should be <18> or <24>;
+- rockchip,output: should be "rgb", "lvds" or "duallvds",
+	This describes the output face.
+- ports for remote LVDS output
+
+Panel optional properties:
+- rockchip,data-mapping: should be "vesa" or "jeida",
+	This describes how the color bits are laid out in the
+	serialized LVDS signal.
+Example:
+
+lvds_panel: lvds-panel {
+	status = "okay";
+	compatible = "simple-panel";
+	enable-gpios = <&gpio7 21 GPIO_ACTIVE_HIGH>;
+	rockchip,data-mapping = "jeida";
+	rockchip,data-width = <24>;
+	rockchip,output = "rgb";
+
+	ports {
+		panel_in_lvds: endpoint {
+			remote-endpoint = <&lvds_out_panel>;
+		};
+	};
+};
+
+
+For Rockchip RK3288:
+
+	lvds: lvds@ff96c000 {
+		compatible = "rockchip,rk3288-lvds";
+		rockchip,grf = <&grf>;
+		reg = <0xff96c000 0x4000>;
+		clocks = <&cru PCLK_LVDS_PHY>;
+		clock-names = "pclk_lvds";
+		pinctrl-names = "lcdc";
+		pinctrl-0 = <&lcdc_ctl>;
+		avdd1v0-supply = <&vdd10_lcd>;
+		avdd1v8-supply = <&vcc18_lcd>;
+		avdd3v3-supply = <&vcca_33>;
+		rockchip,data-mapping = "jeida";
+		rockchip,data-width = <24>;
+		rockchip,output = "rgb";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lvds_in: port@0 {
+				reg = <0>;
+
+				lvds_in_vopb: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vopb_out_lvds>;
+				};
+				lvds_in_vopl: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&vopl_out_lvds>;
+				};
+			};
+
+			lvds_out: port@1 {
+				reg = <1>;
+
+				lvds_out_panel: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
