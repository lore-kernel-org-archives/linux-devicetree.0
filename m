From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH V3 1/2] pinctrl: Add Pistachio SoC pin control binding document
Date: Tue,  7 Apr 2015 12:44:21 -0700
Message-ID: <1428435862-14354-2-git-send-email-abrestic@chromium.org>
References: <1428435862-14354-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428435862-14354-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a device-tree binding document for the pin controller present
on the IMG Pistachio SoC.

Signed-off-by: Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
No changes from v2.
Changes from v1:
 - Change compatible string to "img,pistachio-system-pinctrl".
 - Specify GPIO sub-node names rather than forcing the nodes to be in order.
---
 .../bindings/pinctrl/img,pistachio-pinctrl.txt     | 217 +++++++++++++++++++++
 1 file changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
new file mode 100644
index 0000000..08a4a32
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
@@ -0,0 +1,217 @@
+Imagination Technologies Pistachio SoC pin controllers
+======================================================
+
+The pin controllers on Pistachio are a combined GPIO controller, (GPIO)
+interrupt controller, and pinmux + pinconf device. The system ("east") pin
+controller on Pistachio has 99 pins, 90 of which are MFIOs which can be
+configured as GPIOs. The 90 GPIOs are divided into 6 banks of up to 16 GPIOs
+each. The GPIO banks are represented as sub-nodes of the pad controller node.
+
+Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
+../interrupt-controller/interrupts.txt for generic information regarding
+pin controller, GPIO, and interrupt bindings.
+
+Required properties for pin controller node:
+--------------------------------------------
+ - compatible: "img,pistachio-system-pinctrl".
+ - reg: Address range of the pinctrl registers.
+
+Required properties for GPIO bank sub-nodes:
+--------------------------------------------
+ - interrupts: Interrupt line for the GPIO bank.
+ - gpio-controller: Indicates the device is a GPIO controller.
+ - #gpio-cells: Must be two. The first cell is the GPIO pin number and the
+   second cell indicates the polarity. See <dt-bindings/gpio/gpio.h> for
+   a list of possible values.
+ - interrupt-controller: Indicates the device is an interrupt controller.
+ - #interrupt-cells: Must be two. The first cell is the GPIO pin number and
+   the second cell encodes the interrupt flags. See
+   <dt-bindings/interrupt-controller/irq.h> for a list of valid flags.
+
+Note that the N GPIO bank sub-nodes *must* be named gpio0, gpio1, ... gpioN-1.
+
+Required properties for pin configuration sub-nodes:
+----------------------------------------------------
+ - pins: List of pins to which the configuration applies. See below for a
+   list of possible pins.
+
+Optional properties for pin configuration sub-nodes:
+----------------------------------------------------
+ - function: Mux function for the specified pins. This is not applicable for
+   non-MFIO pins. See below for a list of valid functions for each pin.
+ - bias-high-impedance: Enable high-impedance mode.
+ - bias-pull-up: Enable weak pull-up.
+ - bias-pull-down: Enable weak pull-down.
+ - bias-bus-hold: Enable bus-keeper mode.
+ - drive-strength: Drive strength in mA. Supported values: 2, 4, 8, 12.
+ - input-schmitt-enable: Enable Schmitt trigger.
+ - input-schmitt-disable: Disable Schmitt trigger.
+ - slew-rate: Slew rate control. 0 for slow, 1 for fast.
+
+Pin		Functions
+---		---------
+mfio0		spim1
+mfio1		spim1, spim0, uart1
+mfio2		spim1, spim0, uart1
+mfio3		spim1
+mfio4		spim1
+mfio5		spim1
+mfio6		spim1
+mfio7		spim1
+mfio8		spim0
+mfio9		spim0
+mfio10		spim0
+mfio11		spis
+mfio12		spis
+mfio13		spis
+mfio14		spis
+mfio15		sdhost, mips_trace_clk, mips_trace_data
+mfio16		sdhost, mips_trace_dint, mips_trace_data
+mfio17		sdhost, mips_trace_trigout, mips_trace_data
+mfio18		sdhost, mips_trace_trigin, mips_trace_data
+mfio19		sdhost, mips_trace_dm, mips_trace_data
+mfio20		sdhost, mips_trace_probe_n, mips_trace_data
+mfio21		sdhost, mips_trace_data
+mfio22		sdhost, mips_trace_data
+mfio23		sdhost
+mfio24		sdhost
+mfio25		sdhost
+mfio26		sdhost
+mfio27		sdhost
+mfio28		i2c0, spim0
+mfio29		i2c0, spim0
+mfio30		i2c1, spim0
+mfio31		i2c1, spim1
+mfio32		i2c2
+mfio33		i2c2
+mfio34		i2c3
+mfio35		i2c3
+mfio36		i2s_out, audio_clk_in
+mfio37		i2s_out, debug_raw_cca_ind
+mfio38		i2s_out, debug_ed_sec20_cca_ind
+mfio39		i2s_out, debug_ed_sec40_cca_ind
+mfio40		i2s_out, debug_agc_done_0
+mfio41		i2s_out, debug_agc_done_1
+mfio42		i2s_out, debug_ed_cca_ind
+mfio43		i2s_out, debug_s2l_done
+mfio44		i2s_out
+mfio45		i2s_dac_clk, audio_sync
+mfio46		audio_trigger
+mfio47		i2s_in
+mfio48		i2s_in
+mfio49		i2s_in
+mfio50		i2s_in
+mfio51		i2s_in
+mfio52		i2s_in
+mfio53		i2s_in
+mfio54		i2s_in, spdif_in
+mfio55		uart0, spim0, spim1
+mfio56		uart0, spim0, spim1
+mfio57		uart0, spim0, spim1
+mfio58		uart0, spim1
+mfio59		uart1
+mfio60		uart1
+mfio61		spdif_out
+mfio62		spdif_in
+mfio63		eth, mips_trace_clk, mips_trace_data
+mfio64		eth, mips_trace_dint, mips_trace_data
+mfio65		eth, mips_trace_trigout, mips_trace_data
+mfio66		eth, mips_trace_trigin, mips_trace_data
+mfio67		eth, mips_trace_dm, mips_trace_data
+mfio68		eth, mips_trace_probe_n, mips_trace_data
+mfio69		eth, mips_trace_data
+mfio70		eth, mips_trace_data
+mfio71		eth
+mfio72		ir
+mfio73		pwmpdm, mips_trace_clk, sram_debug
+mfio74		pwmpdm, mips_trace_dint, sram_debug
+mfio75		pwmpdm, mips_trace_trigout, rom_debug
+mfio76		pwmpdm, mips_trace_trigin, rom_debug
+mfio77		mdc_debug, mips_trace_dm, rpu_debug
+mfio78		mdc_debug, mips_trace_probe_n, rpu_debug
+mfio79		ddr_debug, mips_trace_data, mips_debug
+mfio80		ddr_debug, mips_trace_data, mips_debug
+mfio81		dreq0, mips_trace_data, eth_debug
+mfio82		dreq1, mips_trace_data, eth_debug
+mfio83		mips_pll_lock, mips_trace_data, usb_debug
+mfio84		sys_pll_lock, mips_trace_data, usb_debug
+mfio85		wifi_pll_lock, mips_trace_data, sdhost_debug
+mfio86		bt_pll_lock, mips_trace_data, sdhost_debug
+mfio87		rpu_v_pll_lock, dreq2, socif_debug
+mfio88		rpu_l_pll_lock, dreq3, socif_debug
+mfio89		audio_pll_lock, dreq4, dreq5
+tck
+trstn
+tdi
+tms
+tdo
+jtag_comply
+safe_mode
+por_disable
+resetn
+
+Example:
+--------
+pinctrl@18101C00 {
+	compatible = "img,pistachio-system-pinctrl";
+	reg = <0x18101C00 0x400>;
+
+	gpio0: gpio0 {
+		interrupts = <GIC_SHARED 71 IRQ_TYPE_LEVEL_HIGH>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	...
+
+	gpio5: gpio5 {
+		interrupts = <GIC_SHARED 76 IRQ_TYPE_LEVEL_HIGH>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	...
+
+	uart0_xfer: uart0-xfer {
+		uart0-rxd {
+			pins = "mfio55";
+			function = "uart0";
+		};
+		uart0-txd {
+			pins = "mfio56";
+			function = "uart0";
+		};
+	};
+
+	uart0_rts_cts: uart0-rts-cts {
+		uart0-rts {
+			  pins = "mfio57";
+			  function = "uart0";
+		};
+		uart0-cts {
+			  pins = "mfio58";
+			  function = "uart0";
+		};
+	};
+};
+
+uart@... {
+	...
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_xfer>, <&uart0_rts_cts>;
+	...
+};
+
+usb_vbus: fixed-regulator {
+	...
+	gpio = <&gpio5 6 GPIO_ACTIVE_HIGH>;
+	...
+};
-- 
2.2.0.rc0.207.ga3a616c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
