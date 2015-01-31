From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 04/11] dt-bindings: Add documentation for rockchip lvds
Date: Sat, 31 Jan 2015 17:32:57 +0100
Message-ID: <1422721984-27782-5-git-send-email-heiko@sntech.de>
References: <1422721984-27782-1-git-send-email-heiko@sntech.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422721984-27782-1-git-send-email-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
Cc: robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Yao <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Mark Yao <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Add binding documentation for Rockchip SoC LVDS driver.

Signed-off-by: Mark Yao <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 .../devicetree/bindings/video/rockchip-lvds.txt    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/rockchip-lvds.txt

diff --git a/Documentation/devicetree/bindings/video/rockchip-lvds.txt b/Documentation/devicetree/bindings/video/rockchip-lvds.txt
new file mode 100644
index 0000000..1616d7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/rockchip-lvds.txt
@@ -0,0 +1,59 @@
+Rockchip RK3288 LVDS interface
+================================
+
+Required properties:
+- compatible: "rockchip,rk3288-lvds";
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
+- rockchip,panel: phandle to a panel node as described by
+	Documentation/devicetree/bindings/panel/*
+
+- rockchip,data-mapping: should be "vesa" or "jeida",
+	This describes how the color bits are laid out in the
+	serialized LVDS signal.
+- rockchip,data-width : should be <18> or <24>;
+- rockchip,output: should be "rgb", "lvds" or "duallvds",
+	This describes the output face.
+
+- ports: contain a port node with endpoint definitions as defined in
+	Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+	lvds: lvds@ff96c000 {
+		compatible = "rockchip,rk3288-lvds";
+		rockchip,grf = <&grf>;
+		reg = <0xff96c000 0x4000>;
+		clocks = <&cru PCLK_LVDS_PHY>;
+		clock-names = "pclk_lvds";
+		avdd1v0-supply = <&vdd10_lcd>;
+		avdd1v8-supply = <&vcc18_lcd>;
+		avdd3v3-supply = <&vcca_33>;
+		rockchip,panel = <&panel>;
+		rockchip,data-mapping = "jeida";
+		rockchip,data-width = <24>;
+		rockchip,output = "rgb";
+		ports {
+			lvds_in: port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				lvds_in_vopb: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vopb_out_lvds>;
+				};
+				lvds_in_vopl: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&vopl_out_lvds>;
+				};
+			};
+		};
+	};
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
