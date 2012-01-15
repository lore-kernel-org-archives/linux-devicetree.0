From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 05/17] tegra: fdt: Add LCD definitions for Tegra
Date: Sat, 14 Jan 2012 16:47:17 -0800
Message-ID: <1326588449-1794-6-git-send-email-sjg@chromium.org>
References: <1326588449-1794-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326588449-1794-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add LCD definitions and also a proposed binding for LCD displays.

The PWFM is in progress on the device-tree-discuss list, so only a
very basic binding is offered here.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/dts/tegra20.dtsi                       |   25 ++++++
 doc/device-tree-bindings/video/nvidia-video.txt |   92 +++++++++++++++++++++++
 2 files changed, 117 insertions(+), 0 deletions(-)
 create mode 100644 doc/device-tree-bindings/video/nvidia-video.txt

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index 3d435aa..85c8bf6 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -221,4 +221,29 @@
 		compatible = "nvidia,tegra20-kbc";
 		reg = <0x7000e200 0x0078>;
 	};
+
+	pwfm0: pwm@7000a000 {
+		compatible = "nvidia,tegra20-pwfm";
+		reg = <0x7000a000 0x4>;
+	};
+
+	pwfm1: pwm@7000a010 {
+		compatible = "nvidia,tegra20-pwfm";
+		reg = <0x7000a010 0x4>;
+	};
+
+	pwfm2: pwm@7000a020 {
+		compatible = "nvidia,tegra20-pwfm";
+		reg = <0x7000a020 0x4>;
+	};
+
+	pwfm3: pwm@7000a030 {
+		compatible = "nvidia,tegra20-pwfm";
+		reg = <0x7000a030 0x4>;
+	};
+
+	display1: display@0x54200000 {
+		compatible = "nvidia,tegra20-display";
+		reg = <0x54200000 0x40000>;
+	};
 };
diff --git a/doc/device-tree-bindings/video/nvidia-video.txt b/doc/device-tree-bindings/video/nvidia-video.txt
new file mode 100644
index 0000000..ede9260
--- /dev/null
+++ b/doc/device-tree-bindings/video/nvidia-video.txt
@@ -0,0 +1,92 @@
+LCD Display
+-----------
+
+(there isn't yet a generic binding in Linux, so this describes what is in
+U-Boot)
+
+The device node for a display device is as described in the document
+"Open Firmware Recommended Practice : Universal Serial Bus" with the
+following modifications and additions :
+
+Required properties :
+ - compatible : Should be "nvidia,tegra20-display"
+ - pwfm: phandle of PWFM to use for backlight
+
+Note: This is just a phande and provides no information, nor a backlight
+node. The PWM is still under discussion I think:
+	http://patchwork.ozlabs.org/patch/132386/
+
+We don't support any parameters as yet - the setting is hard-coded.
+
+ - width: width of display in pixels
+ - height: height of display in pixels
+ - bits-per-pixel: number of bits per pixel (depth)
+ - pixel-clock : Pixel clock in Hz
+ - horiz-timing; horizontal timing: ref_to_sync, sync_width. back_porch,
+	front_porch
+ - vert-timing; vertical timing: ref_to_sync, sync_width. back_porch,
+	front_porch
+
+This node should sit inside its controller.
+
+
+Nvidia Tegra2x Display Controller
+---------------------------------
+
+The device node for a NAND flash controller is as described in the document
+"Open Firmware Recommended Practice : Universal Serial Bus" with the
+following modifications and additions :
+
+Required properties:
+ - compatible: should be "tegra20-display"
+ - panel-timings: 4 cells containing required timings in ms:
+	* delay between panel_vdd-rise and data-rise
+	* delay between data-rise and backlight_vdd-rise
+	* delay between backlight_vdd and pwm-rise
+	* delay between pwm-rise and backlight_en-rise
+
+(should we use us here, or perhaps call it panel-timings-ms?)
+
+Optional properties:
+ - frame-buffer: address of frame buffer (if omitted it will be calculated)
+	- This may be useful to share an address between U-Boot and Linux and
+		avoid boot-time corruption / flicker
+
+Optional GPIO properies all have (phandle, GPIO number, flags):
+ - backlight-enable-gpio: backlight enable GPIO
+ - lvds-shutdown-gpio: LVDS power shutdown GPIO
+ - backlight-vdd-gpio: backlight power GPIO
+ - panel-vdd-gpio: panel power GPIO
+
+(should those have an "nvidia," prefix? Perhap use polariy bit so that
+lvds-shutdown becomes lvds-enable?)
+
+I have put these into the display controller since I don't think they are
+generic enough to go in the lcd node.
+
+Example:
+
+display@0x54200000 {
+	pwfm = <&pwfm2>;
+
+	/* frame-buffer location to share with Linux */
+	frame-buffer = <0x2f680000>;
+
+	/* Parameter 3 bit 0:1=output, 0=input; bit 1:1=high, 0=low */
+	backlight-enable = <&gpio 28 0>;	/* PD4 */
+	lvds-shutdown = <&gpio 10 0>;		/* PB2 */
+	backlight-vdd = <&gpio 176 0>;		/* PW0 */
+	panel-vdd = <&gpio 22 0>;		/* PC6 */
+	panel-timings = <4 203 17 15>;
+
+	lcd {
+		compatible = "generic,lcd";
+		width = <1366>;
+		height = <768>;
+		bits-per-pixel = <16>;
+		pixel-clock = <70600000>;
+
+		horiz-timing = <11 58 58 58>;
+		vert-timing = <1 4 4 4>;
+	};
+};
-- 
1.7.7.3
