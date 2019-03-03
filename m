From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 3/4] dt-bindings: display: Add Novatek NT35596 panel documentation
Date: Mon,  4 Mar 2019 01:36:17 +0530
Message-ID: <20190303200618.17581-4-jagan@amarulasolutions.com>
References: <20190303200618.17581-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190303200618.17581-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, devicetree@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Novatek NT35596 is a single-chip IC solution for small or medium-sized
LTPS TFT LCD panels. NT35596 provides  several system interfaces like
MIPI/SPI/I2C.

Microtech MTF050FHDI-03 is 1080x1920, 4-lane MIPI DSI LCD panel which
has inbuilt NT35596 IC chip.

NT35596 support several regulators on the chip, among those ony 4 regulators
like VCI, VDDI/DVDD, AVDD, AVEE are used during power-on sequence. Since
MTF050FHDI-03 panel do support 3-regulator based power-on sequence, this
patch document only needful regulators and rest can be add while supporting
new panels on the similar chip IC.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../display/panel/novatek,nt35596.txt         | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt35596.txt

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35596.txt b/Documentation/devicetree/bindings/display/panel/novatek,nt35596.txt
new file mode 100644
index 000000000000..d336cd41e177
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35596.txt
@@ -0,0 +1,32 @@
+Novatek NT35596 based LCD panels
+
+Novatek NT35596 is a single-chip IC solution for small or medium-sized
+LTPS TFT LCD panels. NT35596 provides  several system interfaces like
+MIPI/SPI/I2C.
+
+Microtech MTF050FHDI-03 is 1080x1920, 4-lane MIPI DSI LCD panel which
+has inbuilt NT35596 IC chip.
+
+Required properties:
+- compatible: must be "novatek,nt35596" and one of
+  * "microtech,mtf050fhdi-03"
+- reset-gpios: a GPIO phandle for the reset pin
+
+Required properties for microtech,mtf050fhdi-03:
+- reg: DSI virtual channel used by that screen
+- dvdd-supply: I/O system regulator
+- avdd-supply: analog regulator for MIPI circuit
+- avee-supply: analog regulator for MIPI circuit
+
+Optional properties:
+- backlight: phandle for the backlight control.
+
+panel@0 {
+	compatible = "microtech,mtf050fhdi-03", "novatek,nt35596";
+	reg = <0>;
+	dvdd-supply = <&reg_dldo2>;	/* VCC-MIPI */
+	avdd-supply = <&reg_dc1sw>;	/* AVDD_5V0 */
+	avee-supply = <&reg_dc1sw>;	/* AVEE_5V */
+	reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
+	backlight = <&backlight>;
+};
-- 
2.18.0.321.gffc6fa0e3
