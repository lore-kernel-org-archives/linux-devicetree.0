From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 07/19] tegra: fdt: Add LCD definitions for Tegra
Date: Wed, 13 Jun 2012 09:19:43 -0700
Message-ID: <1339604395-6621-8-git-send-email-sjg@chromium.org>
References: <1339604395-6621-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1339604395-6621-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add LCD definitions and also a proposed binding for LCD displays.

The PWFM is in progress on the device-tree-discuss list, so only a
very basic binding is offered here.

I am not sure if it is better to have the lcd within the display
controller as with i2c/spi, or a separate node. From a hardware point
of view the LCD is certainly connected to the display controller, so
perhaps this version makes most sense. We could have a stand-alone
top-level lcd node with a phandle pointing to the display controller,
but these doesn't seem to be an obvious advantage to that approach.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v2:
- Add nvidia prefix to device tree properties

 arch/arm/dts/tegra20.dtsi                       |   25 +++++++
 doc/device-tree-bindings/video/nvidia-video.txt |   88 +++++++++++++++++++++++
 2 files changed, 113 insertions(+), 0 deletions(-)
 create mode 100644 doc/device-tree-bindings/video/nvidia-video.txt

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index f95be58..4e59e9b 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -204,4 +204,29 @@
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
index 0000000..2e1b999
--- /dev/null
+++ b/doc/device-tree-bindings/video/nvidia-video.txt
@@ -0,0 +1,88 @@
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
+ - nvidia,pwfm: phandle of PWFM to use for backlight
+
+Note: This is just a phande and provides no information, nor a backlight
+node. The PWM is still under discussion I think:
+	http://patchwork.ozlabs.org/patch/132386/
+
+We don't support any parameters as yet - the setting is hard-coded.
+
+ - nvidia,width: width of display in pixels
+ - nvidia,height: height of display in pixels
+ - nvidia,bits-per-pixel: number of bits per pixel (depth)
+ - nvidia,pixel-clock : Pixel clock in Hz
+ - nvidia,horiz-timing; horizontal timing: ref_to_sync, sync_width. back_porch,
+	front_porch
+ - nvidia,vert-timing; vertical timing: ref_to_sync, sync_width. back_porch,
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
+ - nvidia,frame-buffer: address of frame buffer (if omitted it will be
+		calculated)
+	- This may be useful to share an address between U-Boot and Linux and
+		avoid boot-time corruption / flicker
+
+Optional GPIO properies all have (phandle, GPIO number, flags):
+ - nvidia,backlight-enable-gpios: backlight enable GPIO
+ - nvidia,lvds-shutdown-gpios: LVDS power shutdown GPIO
+ - nvidia,backlight-vdd-gpios: backlight power GPIO
+ - nvidia,panel-vdd-gpios: panel power GPIO
+
+(Perhap use polariy bit so that lvds-shutdown becomes lvds-enable?)
+
+I have put these into the display controller since I don't think they are
+generic enough to go in the lcd node.
+
+Example:
+
+display@0x54200000 {
+	nvidia,pwfm = <&pwfm2>;
+	nvidia,frame-buffer = <0x2f680000>;
+	nvidia,backlight-enable-gpios = <&gpio 28 0>;	/* PD4 */
+	nvidia,lvds-shutdown-gpios = <&gpio 10 0>;	/* PB2 */
+	nvidia,backlight-vdd-gpios = <&gpio 176 0>;	/* PW0 */
+	nvidia,panel-vdd-gpios = <&gpio 22 0>;		/* PC6 */
+	nvidia,panel-timings = <4 203 17 15>;
+
+	lcd {
+		compatible = "nvidia,lcd";
+		nvidia,width = <1366>;
+		nvidia,height = <768>;
+		nvidia,bits-per-pixel = <16>;
+		nvidia,pixel-clock = <70600000>;
+
+		nvidia,horiz-timing = <11 58 58 58>;
+		nvidia,vert-timing = <1 4 4 4>;
+	};
+};
-- 
1.7.7.3
