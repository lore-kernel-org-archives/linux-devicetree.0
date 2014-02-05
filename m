From: Davor Joja <davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
Subject: [RFC] Documentation: devicetree: bindings: drm: Xylon binding
Date: Wed, 5 Feb 2014 16:36:28 +0100
Message-ID: <86ffbf1d-c48f-41f5-ba10-c33c1d0d8e68@mail.xylon.local>
References: <1391614588-2831-1-git-send-email-davorjoja@logicbricks.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1391614588-2831-1-git-send-email-davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Davor Joja <davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Xylon binding of DRM driver and logiCVC IP core.

Signed-off-by: Davor Joja <davorjoja-bBue3UIS71U2IjGS+8YXRQ@public.gmane.org>
---
 .../devicetree/bindings/drm/xylon/logicvc.txt      |   79 ++++++++++++++++++++
 .../devicetree/bindings/drm/xylon/xylon_drm.txt    |   24 ++++++
 2 files changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/drm/xylon/logicvc.txt
 create mode 100644 Documentation/devicetree/bindings/drm/xylon/xylon_drm.txt

diff --git a/Documentation/devicetree/bindings/drm/xylon/logicvc.txt b/Documentation/devicetree/bindings/drm/xylon/logicvc.txt
new file mode 100644
index 0000000..505e655
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/xylon/logicvc.txt
@@ -0,0 +1,79 @@
+Binding for Xylon configurable video controller logiCVC IP core
+
+Required properties:
+ - compatible: value must be "xylon,logicvc-4.00.a"
+ - reg: MMIO base address and size of the logiCVC IP core address space
+ - interrupts-parent: the phandle for interrupt controller
+ - interrupts: the interrupt number
+ - background-layer-bits-per-pixel: background layer bits per pixel (16, 32)
+      if omitted, last available layer is logiCVC standard layer, which has its
+      own video memory of specific size, color format and specified
+      bits per pixel
+      if 16 or 32, last available layer is logiCVC background layer,
+      with only specified bits per pixel value
+ - interface: logiCVC to display physical interface
+      (0=Parallel, 1=ITU656)
+ - color-space: logiCVC to display physical color space
+      (0=RGB, 1=YCbCr 4:2:2, 2=YCbCr 4:4:4)
+ - is-readable-regs: all logiCVC registers are available for reading
+      if omitted, only Interrupt Status, Power Control and IP Version registers
+      are available for reading
+ - is-size-position: logiCVC functionality for controlling on screen layer size
+      and position is available
+      if omitted, functionality is not available
+ - pixel-stride: layer video memory width in pixels
+      common for all available logiCVC standard layers
+ - layer_0: layer has its own configuration described with below properties
+   - bits-per-pixel: layer bits per pixel configuration (16, 32)
+         layer is configured to be used with specific pixel width in bits
+         pixels written to layer video memory must match in size to configured
+         bits per pixel value
+   - format: layer format (0=RGB, 1=YCbCr)
+         layer is configured to be used with specific color format
+         pixels written to layer video memory must match specified color format
+   - transparency: layer transparency (0=Layer, 1=Pixel)
+         logiCVC layer can be configured to have transparency control on
+         layer or pixel level
+         "Layer" mode enables controlling of layer transparency by changing
+         alpha value in single logiCVC register
+         "Pixel" mode enables controlling of pixel transparency by changing
+         dedicated alpha bits of specific pixel in video memory
+
+Example:
+
+	logicvc_0: logicvc@40000000 {
+		compatible = "xylon,logicvc-4.00.a";
+		reg = <0x40000000 0x6000>;
+		interrupt-parent = <&gic_0>;
+		interrupts = <0 59 4>;
+		background-layer-bits-per-pixel = <32>;
+		interface = <0>;
+		color-space = <1>;
+		is-readable-regs;
+		is-size-position;
+		pixel-stride = <2048>;
+		layer_0 {
+			address = <0x30000000>;
+			bits-per-pixel = <16>;
+			format = <0>;
+			transparency = <0>;
+		};
+		layer_1 {
+			address = <0x30500000>;
+			bits-per-pixel = <32>;
+			format = <0>;
+			transparency = <0>;
+		};
+		layer_2 {
+			address = <0x30E00000>;
+			bits-per-pixel = <32>;
+			format = <0>;
+			transparency = <1>;
+		};
+		layer_3 {
+			address = <0x31700000>;
+			bits-per-pixel = <16>;
+			format = <1>;
+			transparency = <0>;
+		};
+	};
diff --git a/Documentation/devicetree/bindings/drm/xylon/xylon_drm.txt b/Documentation/devicetree/bindings/drm/xylon/xylon_drm.txt
new file mode 100644
index 0000000..da4940e
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/xylon/xylon_drm.txt
@@ -0,0 +1,24 @@
+Binding for Xylon DRM driver
+
+Xylon DRM driver supports the Xylon configurable video controller
+logiCVC FPGA IP core device.
+
+On ZC702, ZC706, ZED boards, logiCVC uses SI570 CCF driver for pixel clock
+generation, and ADV7511 DRM encoder driver to set video encoding configuration.
+
+Required properties:
+ - compatible: value should be "xylon,drm-1.00.a".
+ - clocks: the phandle for the pixel clock generator
+ - device: the phandle for logiCVC video controller device
+ - encoder: the phandle for the video encoder
+ - private-plane: logiCVC layer id used for DRM driver private plane
+
+Example:
+
+	xylon_drm {
+		compatible = "xylon,drm-1.00.a";
+		clocks = <&si570>;
+		device = <&logicvc_0>;
+		encoder = <&adv7511>;
+		private-plane = <0>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
