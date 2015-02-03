From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 2/4] pinctrl: Broadcom Cygnus pinctrl device tree binding
Date: Mon, 2 Feb 2015 18:01:32 -0800
Message-ID: <1422928894-20716-3-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
 <1422928894-20716-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422928894-20716-1-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Device tree binding documentation for Broadcom Cygnus IOMUX driver

Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../bindings/pinctrl/brcm,cygnus-pinmux.txt        |  159 ++++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,cygnus-pinmux.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-pinmux.txt
new file mode 100644
index 0000000..1082b8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,cygnus-pinmux.txt
@@ -0,0 +1,159 @@
+Broadcom Cygnus IOMUX Controller
+
+The Cygnus IOMUX controller supports group based mux configuration. In
+addition, certain pins can be muxed to GPIO function individually.
+
+Required properties:
+
+- compatible:
+    Must be "brcm,cygnus-pinmux"
+
+- reg:
+    Define the base and range of the I/O address space that contains the Cygnus
+IOMUX registers
+
+Required properties in child nodes:
+
+- function:
+    The mux function to select
+
+- groups:
+    The list of groups to select with a given function
+
+Each child node represents a configuration. Client devices reference the child
+node to enable a mux configuration
+
+For more details, refer to
+Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+
+For example:
+
+	pinmux: pinmux@0x0301d0c8 {
+		compatible = "brcm,cygnus-pinmux";
+		reg = <0x0301d0c8 0x1b0>;
+
+		i2s_0: i2s_0 {
+			function = "i2s0";
+			groups = "i2s0_0_grp", "i2s0_1_grp";
+		};
+
+		i2s_1: i2s_1 {
+			function = "i2s1";
+			groups = "i2s1_0_grp", "i2s1_1_grp";
+		};
+
+		i2s_2: i2s_2 {
+			function = "i2s2";
+			groups = "i2s2_0_grp", "i2s2_1_grp", "i2s2_2_grp",
+				 "i2s2_3_grp", "i2s2_4_grp";
+		};
+
+		spi_0: spi_0 {
+			function = "spi0";
+			groups = "spi0_grp";
+		};
+	}
+
+	spi0@18028000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x18028000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&spi_0>;
+			clocks = <&axi81_clk>;
+			clock-names = "apb_pclk";
+	};
+
+List of supported functions and groups in Cygnus:
+
+"gpio": N/A (to be removed for A0)
+
+"i2s0": "i2s0_0_grp", "i2s0_1_grp"
+
+"i2s1": "i2s1_0_grp", "i2s1_1_grp"
+
+"i2s2": "i2s2_0_grp", "i2s2_1_grp", "i2s2_2_grp", "i2s2_3_grp", "i2s2_4_grp"
+
+"spdif": "spdif_grp"
+
+"pwm0": "pwm0_grp"
+
+"pwm1": "pwm1_grp"
+
+"pwm2": "pwm2_grp"
+
+"pwm3": "pwm3_grp"
+
+"pwm4": "pwm4_grp"
+
+"pwm5": "pwm5_grp"
+
+"key": "key0_grp", "key1_grp", "key2_grp", "key3_grp", "key4_grp", "key5_grp",
+"key6_grp", "key7_grp", "key8_grp", "key9_grp", "key10_grp", "key11_grp",
+"key12_grp", "key13_grp", "key14_grp", "key15_grp"
+
+"audio_dte": "audio_dte0_grp", "audio_dte1_grp", "audio_dte2_grp", "audio_dte3_grp"
+
+"smart_card0": "smart_card0_grp", "smart_card0_fcb_grp"
+
+"smart_card1": "smart_card1_grp", "smart_card1_fcb_grp"
+
+"spi0": "spi0_grp"
+
+"spi1": "spi1_grp"
+
+"spi2": "spi2_grp"
+
+"spi3": "spi3_grp"
+
+"spi4": "spi4_0_grp", "spi4_1_grp"
+
+"spi5": "spi5_grp"
+
+"sw_led0": "sw_led0_0_grp", "sw_led0_1_grp"
+
+"sw_led1": "sw_led1_grp"
+
+"sw_led2": "sw_led2_0_grp", "sw_led2_1_grp"
+
+"d1w": "d1w_grp"
+
+"lcd": "lcd_grp"
+
+"sram": "sram_0_grp", "sram_1_grp"
+
+"uart0": "uart0_grp"
+
+"uart1": "uart1_grp", "uart1_dte_grp"
+
+"uart2": "uart2_grp"
+
+"uart3": "uart3_grp"
+
+"uart4": "uart4_grp"
+
+"qspi": "qspi_0_grp", "qspi_1_grp"
+
+"nand": "nand_grp"
+
+"sdio0": "sdio0_grp", "sdio0_cd_grp", "sdio0_mmc_grp"
+
+"sdio1": "sdio1_data_0_grp", "sdio1_data_1_grp", "sdio1_cd_grp",
+"sdio1_led_grp", "sdio1_mmc_grp"
+
+"can0": "can0_grp"
+
+"can1": "can1_grp"
+
+"cam": "cam_led_grp", "cam_0_grp", "cam_1_grp"
+
+"bsc1": "bsc1_grp"
+
+"pcie_clkreq": "pcie_clkreq_grp"
+
+"usb0_oc": "usb0_oc_grp"
+
+"usb1_oc": "usb1_oc_grp"
+
+"usb2_oc": "usb2_oc_grp"
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
