From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH 2/3] dt-bindings: it6251: add bindings for IT6251 LVDS-to-eDP bridge
Date: Mon, 17 Oct 2016 18:33:28 +0200
Message-ID: <20161017163329.11821-2-marex@denx.de>
References: <20161017163329.11821-1-marex@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161017163329.11821-1-marex-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT bindings for ITE IT6251 LVDS-to-eDP bridge.

Signed-off-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/display/bridge/ite,it6251.txt         | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6251.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt b/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt
new file mode 100644
index 0000000..c5db82c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ite,it6251.txt
@@ -0,0 +1,35 @@
+ITE IT6251 LVDS-to-eDP bridge bindings
+
+Required properties:
+- compatible:		Should be "ite,it6251"
+- reg:			i2c address of the bridge, i2c address of the LVDS part
+- reg-names:		Should be "bridge", "lvds"
+- power-supply:		Regulator to provide the supply voltage
+- video interfaces:	Device node can contain video interface port nodes
+			for panel according to [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	it6251@5c {
+		compatible = "ite,it6251";
+		reg = <0x5c>, <0x5e>;
+		reg-names = "bridge", "lvds";
+		power-supply = <&reg_display>;
+
+		ports {
+			port@0 {
+				bridge_out_edp0: endpoint {
+					remote-endpoint = <&panel_in_edp0>;
+				};
+			};
+
+			port@1 {
+				bridge_in_lvds0: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+		};
+	};
+
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
