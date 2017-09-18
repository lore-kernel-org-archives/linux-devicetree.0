From: Nickey Yang <nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 3/3] dt-bindings: Add KINGDISPLAY KD097D04 panel bindings
Date: Mon, 18 Sep 2017 16:43:50 +0800
Message-ID: <1505724230-13841-1-git-send-email-nickey.yang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The KINGDISPLAY KD097D04 is a 9.7" panel with a 1536x2048
resolution and connected to DSI using 8 lanes.

Signed-off-by: Nickey Yang <nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 .../display/panel/kingdisplay,kd097d04.txt         | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
new file mode 100644
index 0000000..164a5fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
@@ -0,0 +1,22 @@
+Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
+
+Required properties:
+- compatible: should be "kingdisplay,kd097d04"
+- reg: DSI virtual channel of the peripheral
+- power-supply: phandle of the regulator that provides the supply voltage
+- enable-gpios: panel enable gpio
+
+Optional properties:
+- backlight: phandle of the backlight device attached to the panel
+
+Example:
+
+	&mipi_dsi {
+		panel {
+			compatible = "kingdisplay,kd097d04";
+			reg = <0>;
+			power-supply = <...>;
+			backlight = <&backlight>;
+			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+		};
+	};
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
