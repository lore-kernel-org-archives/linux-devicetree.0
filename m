From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: drm: panel: Add Samsung s6e63m0 panel documentation
Date: Fri,  1 Feb 2019 18:28:51 +0100
Message-ID: <20190201172852.4944-1-pawel.mikolaj.chmiel@gmail.com>
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
Changes from v1:
  - Add missing subject prefix
  - Rename reset-gpio to reset-gpios
  - Add link to spi properites documentation. They're required
    for driver to work
  - Removed delay properties, which are now hardcoded in driver
  - Removed display timings, which are now hardcoded in driver
---
 .../display/panel/samsung,s6e63m0.txt         | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
new file mode 100644
index 000000000000..9fb9ebeef8e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e63m0.txt
@@ -0,0 +1,33 @@
+Samsung s6e63m0 AMOLED LCD panel
+
+Required properties:
+  - compatible: "samsung,s6e63m0"
+  - reset-gpios: GPIO spec for reset pin
+  - vdd3-supply: VDD regulator
+  - vci-supply: VCI regulator
+
+The panel must obey rules for SPI slave device specified in document [1].
+
+The device node can contain one 'port' child node with one child
+'endpoint' node, according to the bindings defined in [2]. This
+node should describe panel's video bus.
+
+[1]: Documentation/devicetree/bindings/spi/spi-bus.txt
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
+			spi-max-frequency = <1200000>;
+
+			port {
+				lcd_ep: endpoint {
+					remote-endpoint = <&fimd_ep>;
+				};
+			};
+		};
-- 
2.17.1
