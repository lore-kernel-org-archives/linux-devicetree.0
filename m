From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 1/2] drm: panel: Add Samsung s6e63m0 panel documentation
Date: Fri, 25 Jan 2019 17:46:44 +0100
Message-ID: <20190125164645.19208-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com
Cc: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, m.szyprowski@samsung.com, krzk@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Bakker <xc-racer2@live.ca>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Jonathan Bakker <xc-racer2@live.ca>

This commit adds documentation for Samsung s6e63m0 AMOLED LCD panel
driver.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 .../display/panel/samsung,s6e63m0.txt         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
new file mode 100644
index 000000000000..4979200e2dd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
@@ -0,0 +1,60 @@
+Samsung s6e63m0 AMOLED LCD panel
+
+Required properties:
+  - compatible: "samsung,s6e63m0"
+  - reset-gpio: GPIO spec for reset pin
+  - vdd3-supply: VDD regulator
+  - vci-supply: VCI regulator
+  - display-timings: timings for the connected panel as described by [1]
+
+Optional properties:
+  - reset-delay: Delay in ms after adjusting reset-gpio, default 120ms
+  - power-on-delay: Delay in ms after powering on, default 25ms
+  - power-off-delay: Delay in ms before powering off, default 200ms
+  - panel-width-mm: physical panel width in mm
+  - panel-height-mm: physical panel height in mm
+
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in [2]. This
+node should describe panel's video bus.
+
+[1]: Documentation/devicetree/bindings/display/panel/display-timing.txt
+[2]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+		s6e63m0: display@0 {
+			compatible = "samsung,s6e63m0";
+			reg = <0>;
+			reset-gpio = <&mp05 5 1>;
+			vdd3-supply = <&ldo12_reg>;
+			vci-supply = <&ldo11_reg>;
+			spi-max-frequency = <1000000>;
+
+			power-on-delay = <0>;
+			power-off-delay = <0>;
+			reset-delay = <10>;
+			panel-width-mm = <53>;
+			panel-height-mm = <89>;
+
+			display-timings {
+				timing-0 {
+					/* 480x800@60Hz */
+					clock-frequency = <25628040>;
+					hactive = <480>;
+					vactive = <800>;
+					hfront-porch = <16>;
+					hback-porch = <16>;
+					hsync-len = <2>;
+					vfront-porch = <28>;
+					vback-porch = <1>;
+					vsync-len = <2>;
+				};
+			};
+
+			port {
+				lcd_ep: endpoint {
+					remote-endpoint = <&fimd_ep>;
+				};
+			};
+		};
-- 
2.17.1
