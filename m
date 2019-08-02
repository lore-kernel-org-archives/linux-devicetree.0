From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH/RFC 04/12] dt-bindings: display: Add bindings for Advantech IDK-2121WR
Date: Fri,  2 Aug 2019 08:34:01 +0100
Message-ID: <1564731249-22671-5-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This panel is handled through the generic lvds-panel bindings,
so only needs its additional compatible specified.

Some panel specific documentation can be found here:
https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 .../display/panel/advantech,idk-2121wr.txt         | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.txt

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.txt b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.txt
new file mode 100644
index 0000000..70b15b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.txt
@@ -0,0 +1,62 @@
+Advantech Co., Ltd. IDK-2121WR 21.5" LVDS panel
+===============================================
+
+Required properties:
+- compatible: should be "advantech,idk-2121wr" followed by "panel-lvds"
+
+This binding is compatible with the lvds-panel binding, which is specified
+in panel-lvds.txt in this directory.
+
+Example
+-------
+
+	panel {
+		compatible = "advantech,idk-2121wr", "panel-lvds";
+
+		width-mm = <476>;
+		height-mm = <268>;
+
+		data-mapping = "vesa-24";
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hsync-len = <44>;
+			hfront-porch = <88>;
+			hback-porch = <148>;
+			vfront-porch = <4>;
+			vback-porch = <36>;
+			vsync-len = <5>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lvds0_panel_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				lvds1_panel_in: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
+		};
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm5 0 50000>;
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+
+		power-supply = <&reg_12p0v>;
+		enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+	};
-- 
2.7.4
