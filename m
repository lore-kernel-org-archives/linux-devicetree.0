From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 1/2] dt-bindings: Add INNOLUX P079ZCA panel bindings
Date: Wed, 22 Mar 2017 09:53:06 +0800
Message-ID: <1490147587-4382-1-git-send-email-zyw@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Innolux P079ZCA is a 7.85" panel with a 768X1024 resolution and
connected to DSI using four lanes.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

Changes in v3: None
Changes in v2: None

 .../bindings/display/panel/innolux,p079zca.txt     | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
new file mode 100644
index 0000000..5c70a83
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
@@ -0,0 +1,23 @@
+Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
+
+Required properties:
+- compatible: should be "innolux,p079zca"
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
+			compatible = "innolux,p079zca";
+			reg = <0>;
+			power-supply = <...>;
+			backlight = <&backlight>;
+			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+			status = "okay";
+		};
+	};
-- 
2.6.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
