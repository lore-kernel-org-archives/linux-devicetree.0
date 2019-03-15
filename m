From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 4/6] dt-bindings: display: bridge: Add ICN6211 MIPI-DSI to RGB convertor bridge
Date: Fri, 15 Mar 2019 18:38:23 +0530
Message-ID: <20190315130825.9005-5-jagan@amarulasolutions.com>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190315130825.9005-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

ICN6211 is MIPI-DSI/RGB converter bridge from chipone.
It has a flexible configuration of MIPI DSI signal input
and produce RGB565, RGB666, RGB888 output format.

Add dt-bingings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../display/bridge/chipone,icn6211.txt        | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
new file mode 100644
index 000000000000..7f13efd7ee7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
@@ -0,0 +1,36 @@
+Chipone ICN6211 MIPI-DSI to RGB Convertor Bridge
+
+ICN6211 is MIPI-DSI/RGB converter bridge from chipone.
+It has a flexible configuration of MIPI DSI signal input
+and produce RGB565, RGB666, RGB888 output format.
+
+Required properties for RGB:
+- compatible: must be "chipone,icn6211" and one of:
+  * "bananapi,icn6211"
+- reg: the virtual channel number of a DSI peripheral
+- reset-gpios: a GPIO phandle for the reset pin
+
+The device node can contain following 'port' child nodes,
+according to the OF graph bindings defined in [1]:
+  0: DSI Input, not required, if the bridge is DSI controlled
+  1: RGB Output, mandatory
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	bridge@0 {
+		compatible = "bananapi,icn6211", "chipone,icn6211";
+		reg = <0>;
+		reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD6 */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			bridge_out_ep: endpoint {
+				remote-endpoint = <&panel_ep>;
+			};
+		};
+	};
-- 
2.18.0.321.gffc6fa0e3
