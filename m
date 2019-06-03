From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v5 1/2] dt-bindings: Add doc for the Ingenic JZ47xx LCD controller driver
Date: Mon,  3 Jun 2019 17:23:30 +0200
Message-ID: <20190603152331.23160-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Cc: od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

Add documentation for the devicetree bindings of the LCD controller present in
the JZ47xx family of SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v2: Remove ingenic,panel property.
    
    v3: - Rename compatible strings from ingenic,jz47XX-drm to ingenic,jz47XX-lcd
        - The ingenic,lcd-mode property is now read from the panel node instead
    	  of from the driver node
    
    v4: Remove ingenic,lcd-mode property completely.
    
    v5: No change

 .../bindings/display/ingenic,lcd.txt          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt

diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
new file mode 100644
index 000000000000..7b536c8c6dde
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
@@ -0,0 +1,44 @@
+Ingenic JZ47xx LCD driver
+
+Required properties:
+- compatible: one of:
+  * ingenic,jz4740-lcd
+  * ingenic,jz4725b-lcd
+- reg: LCD registers location and length
+- clocks: LCD pixclock and device clock specifiers.
+	   The device clock is only required on the JZ4740.
+- clock-names: "lcd_pclk" and "lcd"
+- interrupts: Specifies the interrupt line the LCD controller is connected to.
+
+Example:
+
+panel {
+	compatible = "sharp,ls020b1dd01d";
+
+	backlight = <&backlight>;
+	power-supply = <&vcc>;
+
+	port {
+		panel_input: endpoint {
+			remote-endpoint = <&panel_output>;
+		};
+	};
+};
+
+
+lcd: lcd-controller@13050000 {
+	compatible = "ingenic,jz4725b-lcd";
+	reg = <0x13050000 0x1000>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <31>;
+
+	clocks = <&cgu JZ4725B_CLK_LCD>;
+	clock-names = "lcd";
+
+	port {
+		panel_output: endpoint {
+			remote-endpoint = <&panel_input>;
+		};
+	};
+};
-- 
2.21.0.593.g511ec345e18
