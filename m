From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/3] dt-bindings: Add doc for the ingenic-drm driver
Date: Thu, 28 Feb 2019 19:07:54 -0300
Message-ID: <20190228220756.20262-2-paul@crapouillou.net>
References: <20190228220756.20262-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228220756.20262-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add documentation for the devicetree bindings of the DRM driver for the
JZ47xx family of SoCs from Ingenic.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---
 .../devicetree/bindings/display/ingenic,drm.txt    | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,drm.txt

diff --git a/Documentation/devicetree/bindings/display/ingenic,drm.txt b/Documentation/devicetree/bindings/display/ingenic,drm.txt
new file mode 100644
index 000000000000..52a368ec35cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,drm.txt
@@ -0,0 +1,30 @@
+Ingenic JZ47xx DRM driver
+
+Required properties:
+- compatible: one of:
+  * ingenic,jz4740-drm
+  * ingenic,jz4725b-drm
+- reg: LCD registers location and length
+- clocks: LCD pixclock and device clock specifiers.
+	   The device clock is only required on the JZ4740.
+- clock-names: "lcd_pclk" and "lcd"
+- interrupts: Specifies the interrupt line the LCD controller is connected to.
+
+Optional properties:
+- ingenic,panel: phandle to a display panel, if one is present
+- ingenic,lcd-mode: LCD mode to use with the display panel.
+		    See <dt-bindings/display/ingenic,drm.h> for all the
+		    possible values.
+
+Example:
+
+lcd: lcd-controller@13050000 {
+	compatible = "ingenic,jz4725b-drm";
+	reg = <0x13050000 0x1000>;
+
+	interrupt-parent = <&intc>;
+	interrupts = <31>;
+
+	clocks = <&cgu JZ4725B_CLK_LCD>;
+	clock-names = "lcd";
+};
-- 
2.11.0
