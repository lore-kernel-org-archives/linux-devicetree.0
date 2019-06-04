From: Torsten Duwe <duwe@lst.de>
Subject: [PATCH v2 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Date: Tue,  4 Jun 2019 14:23:04 +0200 (CEST)
Message-ID: <20190604122305.07B9068B05@newverein.lst.de>
References: <20190604122150.29D6468B05@newverein.lst.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The anx6345 is an ultra-low power DisplayPort/eDP transmitter designed
for portable devices.

Add a binding document for it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Torsten Duwe <duwe@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/display/bridge/anx6345.txt | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx6345.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/anx6345.txt b/Documentation/devicetree/bindings/display/bridge/anx6345.txt
new file mode 100644
index 000000000000..bd63f6ac107e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/anx6345.txt
@@ -0,0 +1,57 @@
+Analogix ANX6345 eDP Transmitter
+--------------------------------
+
+The ANX6345 is an ultra-low power Full-HD eDP transmitter designed for
+portable devices.
+
+Required properties:
+
+ - compatible		: "analogix,anx6345"
+ - reg			: I2C address of the device
+ - reset-gpios		: Which GPIO to use for reset
+ - dvdd12-supply	: Regulator for 1.2V digital core power.
+ - dvdd25-supply	: Regulator for 2.5V digital core power.
+ - Video port for LVTTL input, using the DT bindings defined in [1].
+
+Optional properties:
+
+ - Video port for eDP output (panel or connector) using the DT bindings
+   defined in [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+anx6345: anx6345@38 {
+	compatible = "analogix,anx6345";
+	reg = <0x38>;
+	reset-gpios = <&pio 3 24 GPIO_ACTIVE_LOW>; /* PD24 */
+	dvdd25-supply = <&reg_dldo2>;
+	dvdd12-supply = <&reg_fldo1>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		anx6345_in: port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			anx6345_in_tcon0: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon0_out_anx6345>;
+			};
+		};
+
+		anx6345_out: port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			anx6345_out_panel: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&panel_in_edp>;
+			};
+		};
+	};
+};
-- 
2.16.4
