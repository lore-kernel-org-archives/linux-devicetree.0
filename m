From: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
Subject: [PATCH v2 2/4] dt-bindings: soc: amlogic: add meson-canvas documentation
Date: Wed,  8 Aug 2018 00:00:09 +0200
Message-ID: <20180807220011.24436-3-maxi.jourdan@wanadoo.fr>
References: <20180807220011.24436-1-maxi.jourdan@wanadoo.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807220011.24436-1-maxi.jourdan@wanadoo.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Maxime Jourdan <maxi.jourdan@wanadoo.fr>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

DT bindings doc for amlogic,meson-canvas

Signed-off-by: Maxime Jourdan <maxi.jourdan@wanadoo.fr>
---
 .../soc/amlogic/amlogic,meson-canvas.txt      | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-canvas.txt

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-canvas.txt b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-canvas.txt
new file mode 100644
index 000000000000..5f0351717bee
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-canvas.txt
@@ -0,0 +1,36 @@
+Amlogic Canvas
+================================
+
+A canvas is a collection of metadata that describes a pixel buffer.
+Those metadata include: width, height, phyaddr, wrapping, block mode
+and endianness.
+
+Many IPs within Amlogic SoCs rely on canvas indexes to read/write pixel data
+rather than use the phy addresses directly. For instance, this is the case for
+the video decoders and the display.
+
+Amlogic SoCs have 256 canvas.
+
+Device Tree Bindings:
+---------------------
+
+Canvas Provider
+--------------------------
+
+Required properties:
+- compatible: "amlogic,canvas"
+
+Parent node should have the following properties :
+- compatible: "amlogic,gx-dmc-sysctrl", "syscon", "simple-mfd"
+- reg: base address and size of the DMC system control register space.
+
+Example:
+
+sysctrl_DMC: system-controller@0 {
+	compatible = "amlogic,gx-dmc-sysctrl", "syscon", "simple-mfd";
+	reg = <0x0 0x0 0x0 0x1000>;
+
+	canvas: canvas-provider@0 {
+		compatible = "amlogic,canvas";
+	};
+};
-- 
2.18.0
