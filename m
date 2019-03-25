From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH] dt-bindings: Add schemas for simple-framebuffer
Date: Mon, 25 Mar 2019 14:54:14 +0100
Message-ID: <20190325135414.9728-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The simple framebuffer is a binding that allows the bootloader to setup a
framebuffer, describe it in the Device Tree for the OS to pick it up and
use it as is.

Replace the current binding by a schema to allow the validation tools to
check those nodes.

Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Maxime Jourdan <mjourdan@baylibre.com>
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Rob,

Even though the node itself is properly described, I still end up with some
validation warnings when the chosen node is validated (basically
complaining that ranges, and the framebuffer nodes shouldn't be here, since
we haven't described them in the chosen schemas).

I've tried to expand it, but I failed, using that patch:
http://code.bulix.org/mimu5z-634661?raw

I'm a bit lost right now about how to make those nodes being validated and
not report any warning anymore. I guess one way would be to expand the
chosen schemas instead. Let me know what you prefer.
---
 .../display/amlogic,simple-framebuffer.txt    |  33 ----
 .../display/simple-framebuffer-sunxi.txt      |  36 ----
 .../bindings/display/simple-framebuffer.txt   |  91 ----------
 .../bindings/display/simple-framebuffer.yaml  | 164 ++++++++++++++++++
 4 files changed, 164 insertions(+), 160 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/amlogic,simple-framebuffer.txt
 delete mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
 delete mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer.txt
 create mode 100644 Documentation/devicetree/bindings/display/simple-framebuffer.yaml

diff --git a/Documentation/devicetree/bindings/display/amlogic,simple-framebuffer.txt b/Documentation/devicetree/bindings/display/amlogic,simple-framebuffer.txt
deleted file mode 100644
index aaa6c24c8e70..000000000000
--- a/Documentation/devicetree/bindings/display/amlogic,simple-framebuffer.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Meson specific Simple Framebuffer bindings
-
-This binding documents meson specific extensions to the simple-framebuffer
-bindings. The meson simplefb u-boot code relies on the devicetree containing
-pre-populated simplefb nodes.
-
-These extensions are intended so that u-boot can select the right node based
-on which pipeline is being used. As such they are solely intended for
-firmware / bootloader use, and the OS should ignore them.
-
-Required properties:
-- compatible: "amlogic,simple-framebuffer", "simple-framebuffer"
-- amlogic,pipeline, one of:
-  "vpu-cvbs"
-  "vpu-hdmi"
-
-Example:
-
-chosen {
-	#address-cells = <2>;
-	#size-cells = <2>;
-	ranges;
-
-	simplefb_hdmi: framebuffer-hdmi {
-		compatible = "amlogic,simple-framebuffer",
-			     "simple-framebuffer";
-		amlogic,pipeline = "vpu-hdmi";
-		clocks = <&clkc CLKID_HDMI_PCLK>,
-			 <&clkc CLKID_CLK81>,
-			 <&clkc CLKID_GCLK_VENCI_INT0>;
-		power-domains = <&pwrc_vpu>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt b/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
deleted file mode 100644
index d693b8dc9a62..000000000000
--- a/Documentation/devicetree/bindings/display/simple-framebuffer-sunxi.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Sunxi specific Simple Framebuffer bindings
-
-This binding documents sunxi specific extensions to the simple-framebuffer
-bindings. The sunxi simplefb u-boot code relies on the devicetree containing
-pre-populated simplefb nodes.
-
-These extensions are intended so that u-boot can select the right node based
-on which pipeline is being used. As such they are solely intended for
-firmware / bootloader use, and the OS should ignore them.
-
-Required properties:
-- compatible: "allwinner,simple-framebuffer"
-- allwinner,pipeline, one of:
-  "de_be0-lcd0"
-  "de_be1-lcd1"
-  "de_be0-lcd0-hdmi"
-  "de_be1-lcd1-hdmi"
-  "mixer0-lcd0"
-  "mixer0-lcd0-hdmi"
-  "mixer1-lcd1-hdmi"
-  "mixer1-lcd1-tve"
-
-Example:
-
-chosen {
-	#address-cells = <1>;
-	#size-cells = <1>;
-	ranges;
-
-	framebuffer@0 {
-		compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
-		allwinner,pipeline = "de_be0-lcd0-hdmi";
-		clocks = <&pll5 1>, <&ahb_gates 36>, <&ahb_gates 43>,
-			 <&ahb_gates 44>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.txt b/Documentation/devicetree/bindings/display/simple-framebuffer.txt
deleted file mode 100644
index 5a9ce511be88..000000000000
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.txt
+++ /dev/null
@@ -1,91 +0,0 @@
-Simple Framebuffer
-
-A simple frame-buffer describes a frame-buffer setup by firmware or
-the bootloader, with the assumption that the display hardware has already
-been set up to scan out from the memory pointed to by the reg property.
-
-Since simplefb nodes represent runtime information they must be sub-nodes of
-the chosen node (*). Simplefb nodes must be named "framebuffer@<address>".
-
-If the devicetree contains nodes for the display hardware used by a simplefb,
-then the simplefb node must contain a property called "display", which
-contains a phandle pointing to the primary display hw node, so that the OS
-knows which simplefb to disable when handing over control to a driver for the
-real hardware. The bindings for the hw nodes must specify which node is
-considered the primary node.
-
-It is advised to add display# aliases to help the OS determine how to number
-things. If display# aliases are used, then if the simplefb node contains a
-"display" property then the /aliases/display# path must point to the display
-hw node the "display" property points to, otherwise it must point directly
-to the simplefb node.
-
-If a simplefb node represents the preferred console for user interaction,
-then the chosen node's stdout-path property should point to it, or to the
-primary display hw node, as with display# aliases. If display aliases are
-used then it should be set to the alias instead.
-
-It is advised that devicetree files contain pre-filled, disabled framebuffer
-nodes, so that the firmware only needs to update the mode information and
-enable them. This way if e.g. later on support for more display clocks get
-added, the simplefb nodes will already contain this info and the firmware
-does not need to be updated.
-
-If pre-filled framebuffer nodes are used, the firmware may need extra
-information to find the right node. In that case an extra platform specific
-compatible and platform specific properties should be used and documented,
-see e.g. simple-framebuffer-sunxi.txt .
-
-Required properties:
-- compatible: "simple-framebuffer"
-- reg: Should contain the location and size of the framebuffer memory.
-- width: The width of the framebuffer in pixels.
-- height: The height of the framebuffer in pixels.
-- stride: The number of bytes in each line of the framebuffer.
-- format: The format of the framebuffer surface. Valid values are:
-  - r5g6b5 (16-bit pixels, d[15:11]=r, d[10:5]=g, d[4:0]=b).
-  - a8b8g8r8 (32-bit pixels, d[31:24]=a, d[23:16]=b, d[15:8]=g, d[7:0]=r).
-
-Optional properties:
-- clocks : List of clocks used by the framebuffer.
-- *-supply : Any number of regulators used by the framebuffer. These should
-	     be named according to the names in the device's design.
-
-  The above resources are expected to already be configured correctly.
-  The OS must ensure they are not modified or disabled while the simple
-  framebuffer remains active.
-
-- display : phandle pointing to the primary display hardware node
-
-Example:
-
-aliases {
-	display0 = &lcdc0;
-}
-
-chosen {
-	framebuffer0: framebuffer@1d385000 {
-		compatible = "simple-framebuffer";
-		reg = <0x1d385000 (1600 * 1200 * 2)>;
-		width = <1600>;
-		height = <1200>;
-		stride = <(1600 * 2)>;
-		format = "r5g6b5";
-		clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
-		lcd-supply = <&reg_dc1sw>;
-		display = <&lcdc0>;
-	};
-	stdout-path = "display0";
-};
-
-soc@1c00000 {
-	lcdc0: lcdc@1c0c000 {
-		compatible = "allwinner,sun4i-a10-lcdc";
-		...
-	};
-};
-
-
-*) Older devicetree files may have a compatible = "simple-framebuffer" node
-in a different place, operating systems must first enumerate any compatible
-nodes found under chosen and then check for other compatible nodes.
diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
new file mode 100644
index 000000000000..9f2245e3f5ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/simple-framebuffer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple Framebuffer Device Tree Bindings
+
+maintainers:
+  - Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
+  - Hans de Goede <hdegoede@redhat.com>
+
+description: |+
+  A simple frame-buffer describes a frame-buffer setup by firmware or
+  the bootloader, with the assumption that the display hardware has
+  already been set up to scan out from the memory pointed to by the
+  reg property.
+
+  Since simplefb nodes represent runtime information they must be
+  sub-nodes of the chosen node (*). Simplefb nodes must be named
+  framebuffer@<address>.
+
+  If the devicetree contains nodes for the display hardware used by a
+  simplefb, then the simplefb node must contain a property called
+  display, which contains a phandle pointing to the primary display
+  hw node, so that the OS knows which simplefb to disable when handing
+  over control to a driver for the real hardware. The bindings for the
+  hw nodes must specify which node is considered the primary node.
+
+  It is advised to add display# aliases to help the OS determine how
+  to number things. If display# aliases are used, then if the simplefb
+  node contains a display property then the /aliases/display# path
+  must point to the display hw node the display property points to,
+  otherwise it must point directly to the simplefb node.
+
+  If a simplefb node represents the preferred console for user
+  interaction, then the chosen node stdout-path property should point
+  to it, or to the primary display hw node, as with display#
+  aliases. If display aliases are used then it should be set to the
+  alias instead.
+
+  It is advised that devicetree files contain pre-filled, disabled
+  framebuffer nodes, so that the firmware only needs to update the
+  mode information and enable them. This way if e.g. later on support
+  for more display clocks get added, the simplefb nodes will already
+  contain this info and the firmware does not need to be updated.
+
+  If pre-filled framebuffer nodes are used, the firmware may need
+  extra information to find the right node. In that case an extra
+  platform specific compatible and platform specific properties should
+  be used and documented.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: allwinner,simple-framebuffer
+          - const: simple-framebuffer
+
+      - items:
+          - const: amlogic,simple-framebuffer
+          - const: simple-framebuffer
+
+      - const: simple-framebuffer
+
+  reg:
+    description: Location and size of the framebuffer memory
+
+  clocks:
+    description: List of clocks used by the framebuffer.
+
+  power-domains:
+    description: List of power domains used by the framebuffer.
+
+  width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Width of the framebuffer in pixels
+
+  height:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Height of the framebuffer in pixels
+
+  stride:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of bytes of a line in the framebuffer
+
+  format:
+    description: Format of the framebuffer
+    oneOf:
+      - const: r5g6b5
+        description: 16-bit pixels, d[15:11]=r, d[10:5]=g, d[4:0]=b
+      - const: a8b8g8r8
+        description: 32-bit pixels, d[31:24]=a, d[23:16]=b, d[15:8]=g, d[7:0]=r
+
+  display:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Primary display hardware node
+
+  allwinner,pipeline:
+    description: Pipeline used by the framebuffer on Allwinner SoCs
+    oneOf:
+      - const: de_be0-lcd0
+      - const: de_be0-lcd0-hdmi
+      - const: de_be0-lcd0-tve0
+      - const: de_be1-lcd0
+      - const: de_be1-lcd1-hdmi
+      - const: de_fe0-de_be0-lcd0
+      - const: de_fe0-de_be0-lcd0-hdmi
+      - const: de_fe0-de_be0-lcd0-tve0
+      - const: mixer0-lcd0
+      - const: mixer0-lcd0-hdmi
+      - const: mixer1-lcd1-hdmi
+      - const: mixer1-lcd1-tve
+
+  amlogic,pipeline:
+    description: Pipeline used by the framebuffer on Amlogic SoCs
+    oneOf:
+      - const: vpu-cvbs
+      - const: vpu-hdmi
+
+patternProperties:
+  "^[a-zA-Z0-9-]+-supply$":
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Regulators used by the framebuffer. These should be named
+      according to the names in the device design.
+
+required:
+  # The binding requires also reg, width, height, stride and format,
+  # but usually they will be filled by the bootloader.
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    aliases {
+      display0 = &lcdc0;
+    };
+
+    chosen {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      stdout-path = "display0";
+      framebuffer0: framebuffer@1d385000 {
+        compatible = "simple-framebuffer";
+        reg = <0x1d385000 3840000>;
+        width = <1600>;
+        height = <1200>;
+        stride = <3200>;
+        format = "r5g6b5";
+        clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
+        lcd-supply = <&reg_dc1sw>;
+        display = <&lcdc0>;
+      };
+    };
+
+    soc@1c00000 {
+      lcdc0: lcdc@1c0c000 {
+        compatible = "allwinner,sun4i-a10-lcdc";
+      };
+    };
+
+...
-- 
2.20.1
