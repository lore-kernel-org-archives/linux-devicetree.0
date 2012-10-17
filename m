From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v7 04/16] tegra: fdt: Add LCD definitions for Tegra
Date: Wed, 17 Oct 2012 16:24:48 -0700
Message-ID: <1350516300-27994-5-git-send-email-sjg@chromium.org>
References: <1350516300-27994-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1350516300-27994-1-git-send-email-sjg@chromium.org>
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
Cc: Stephen Warren <swarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

Add LCD definitions and also a proposed binding for LCD displays.

The PWM is as per what will likely be committed to linux-next soon.

The displaymode binding comes from a proposal here:

http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html

The panel binding is new, and fills a need to specify the panel
timings and other tegra-specific information. Should a binding appear
that allows the pwm to handle this automatically, we can revisit
this.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v6:
- Add an additional delay before enabling the panel

Changes in v5:
- Make all Tegra LCD fdt nodes disabled by default

Changes in v4:
- Moved panel information into panel node (was in rgb node)
- Remove LCD frame buffer address property hack

Changes in v3:
- Use displaymode binding for fdt
- Bring in proposed tegra display controller binding
- Add new panel binding to fit with tegra display controller binding

Changes in v2:
- Add nvidia prefix to device tree properties

 arch/arm/dts/tegra20.dtsi                      |   98 ++++++++++++++++++++++++
 doc/device-tree-bindings/video/displaymode.txt |   42 ++++++++++
 doc/device-tree-bindings/video/tegra20-dc.txt  |   85 ++++++++++++++++++++
 3 files changed, 225 insertions(+), 0 deletions(-)
 create mode 100644 doc/device-tree-bindings/video/displaymode.txt
 create mode 100644 doc/device-tree-bindings/video/tegra20-dc.txt

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index 3221bc9..636ec2c 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -218,4 +218,102 @@
 		#pwm-cells = <2>;
 	};
 
+	host1x {
+		compatible = "nvidia,tegra20-host1x", "simple-bus";
+		reg = <0x50000000 0x00024000>;
+		interrupts = <0 65 0x04   /* mpcore syncpt */
+			      0 67 0x04>; /* mpcore general */
+		status = "disabled";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ranges = <0x54000000 0x54000000 0x04000000>;
+
+		/* video-encoding/decoding */
+		mpe {
+			reg = <0x54040000 0x00040000>;
+			interrupts = <0 68 0x04>;
+			status = "disabled";
+		};
+
+		/* video input */
+		vi {
+			reg = <0x54080000 0x00040000>;
+			interrupts = <0 69 0x04>;
+			status = "disabled";
+		};
+
+		/* EPP */
+		epp {
+			reg = <0x540c0000 0x00040000>;
+			interrupts = <0 70 0x04>;
+			status = "disabled";
+		};
+
+		/* ISP */
+		isp {
+			reg = <0x54100000 0x00040000>;
+			interrupts = <0 71 0x04>;
+			status = "disabled";
+		};
+
+		/* 2D engine */
+		gr2d {
+			reg = <0x54140000 0x00040000>;
+			interrupts = <0 72 0x04>;
+			status = "disabled";
+		};
+
+		/* 3D engine */
+		gr3d {
+			reg = <0x54180000 0x00040000>;
+			status = "disabled";
+		};
+
+		/* display controllers */
+		dc@54200000 {
+			compatible = "nvidia,tegra20-dc";
+			reg = <0x54200000 0x00040000>;
+			interrupts = <0 73 0x04>;
+			status = "disabled";
+
+			rgb {
+				status = "disabled";
+			};
+		};
+
+		dc@54240000 {
+			compatible = "nvidia,tegra20-dc";
+			reg = <0x54240000 0x00040000>;
+			interrupts = <0 74 0x04>;
+			status = "disabled";
+
+			rgb {
+				status = "disabled";
+			};
+		};
+
+		/* outputs */
+		hdmi {
+			compatible = "nvidia,tegra20-hdmi";
+			reg = <0x54280000 0x00040000>;
+			interrupts = <0 75 0x04>;
+			status = "disabled";
+		};
+
+		tvo {
+			compatible = "nvidia,tegra20-tvo";
+			reg = <0x542c0000 0x00040000>;
+			interrupts = <0 76 0x04>;
+			status = "disabled";
+		};
+
+		dsi {
+			compatible = "nvidia,tegra20-dsi";
+			reg = <0x54300000 0x00040000>;
+			status = "disabled";
+		};
+	};
+
 };
diff --git a/doc/device-tree-bindings/video/displaymode.txt b/doc/device-tree-bindings/video/displaymode.txt
new file mode 100644
index 0000000..45ca42d
--- /dev/null
+++ b/doc/device-tree-bindings/video/displaymode.txt
@@ -0,0 +1,42 @@
+videomode bindings
+==================
+
+(from http://lists.freedesktop.org/archives/dri-devel/2012-July/024875.html)
+
+Required properties:
+ - xres, yres: Display resolution
+ - left-margin, right-margin, hsync-len: Horizontal Display timing
+   parameters in pixels
+ - upper-margin, lower-margin, vsync-len: Vertical display timing
+   parameters in lines
+ - clock: display clock in Hz
+
+Optional properties:
+ - width-mm, height-mm: Display dimensions in mm
+ - hsync-active-high (bool): Hsync pulse is active high
+ - vsync-active-high (bool): Vsync pulse is active high
+ - interlaced (bool): This is an interlaced mode
+ - doublescan (bool): This is a doublescan mode
+
+There are different ways of describing a display mode. The devicetree
+representation corresponds to the one used by the Linux Framebuffer
+framework described here in Documentation/fb/framebuffer.txt. This
+representation has been chosen because it's the only format which does
+not allow for inconsistent parameters. Unlike the Framebuffer framework
+the devicetree has the clock in Hz instead of ps.
+
+Example:
+
+	display@0 {
+		/* 1920x1080p24 */
+		clock = <52000000>;
+		xres = <1920>;
+		yres = <1080>;
+		left-margin = <25>;
+		right-margin = <25>;
+		hsync-len = <25>;
+		lower-margin = <2>;
+		upper-margin = <2>;
+		vsync-len = <2>;
+		hsync-active-high;
+	};
diff --git a/doc/device-tree-bindings/video/tegra20-dc.txt b/doc/device-tree-bindings/video/tegra20-dc.txt
new file mode 100644
index 0000000..4731c3f
--- /dev/null
+++ b/doc/device-tree-bindings/video/tegra20-dc.txt
@@ -0,0 +1,85 @@
+Display Controller
+------------------
+
+(there isn't yet a generic binding in Linux, so this describes what is in
+U-Boot, and may change based on Linux activity)
+
+The device node for a display device is as described in the document
+"Open Firmware Recommended Practice : Universal Serial Bus" with the
+following modifications and additions :
+
+Required properties :
+ - compatible : Should be "nvidia,tegra20-dc"
+
+Required subnode 'rgb' is as follows:
+
+Required properties (rgb) :
+ - nvidia,panel : phandle of LCD panel information
+
+
+The panel node describes the panel itself. This has the properties listed in
+displaymode.txt as well as:
+
+Required properties (panel) :
+ - nvidia,bits-per-pixel: number of bits per pixel (depth)
+ - nvidia,pwm : pwm to use to set display contrast (see tegra20-pwm.txt)
+ - nvidia,panel-timings: 4 cells containing required timings in ms:
+	* delay before asserting panel_vdd
+	* delay between panel_vdd-rise and data-rise
+	* delay between data-rise and backlight_vdd-rise
+	* delay between backlight_vdd and pwm-rise
+	* delay between pwm-rise and backlight_en-rise
+
+Optional GPIO properies all have (phandle, GPIO number, flags):
+ - nvidia,backlight-enable-gpios: backlight enable GPIO
+ - nvidia,lvds-shutdown-gpios: LVDS power shutdown GPIO
+ - nvidia,backlight-vdd-gpios: backlight power GPIO
+ - nvidia,panel-vdd-gpios: panel power GPIO
+
+Example:
+
+host1x {
+	compatible = "nvidia,tegra20-host1x", "simple-bus";
+	reg = <0x50000000 0x00024000>;
+	interrupts = <0 65 0x04   /* mpcore syncpt */
+			0 67 0x04>; /* mpcore general */
+
+	#address-cells = <1>;
+	#size-cells = <1>;
+	status = "okay";
+
+	ranges = <0x54000000 0x54000000 0x04000000>;
+
+	dc@54200000 {
+		compatible = "nvidia,tegra20-dc";
+		reg = <0x54200000 0x00040000>;
+		interrupts = <0 73 0x04>;
+		status = "okay";
+
+		rgb {
+			status = "okay";
+			nvidia,panel = <&lcd_panel>;
+		};
+	};
+};
+
+lcd_panel: panel {
+	/* Seaboard has 1366x768 */
+	clock = <70600000>;
+	xres = <1366>;
+	yres = <768>;
+	left-margin = <58>;
+	right-margin = <58>;
+	hsync-len = <58>;
+	lower-margin = <4>;
+	upper-margin = <4>;
+	vsync-len = <4>;
+	hsync-active-high;
+	nvidia,bits-per-pixel = <16>;
+	nvidia,pwm = <&pwm 2 0>;
+	nvidia,backlight-enable-gpios = <&gpio 28 0>;	/* PD4 */
+	nvidia,lvds-shutdown-gpios = <&gpio 10 0>;	/* PB2 */
+	nvidia,backlight-vdd-gpios = <&gpio 176 0>;	/* PW0 */
+	nvidia,panel-vdd-gpios = <&gpio 22 0>;		/* PC6 */
+	nvidia,panel-timings = <400 4 203 17 15>;
+};
-- 
1.7.7.3
