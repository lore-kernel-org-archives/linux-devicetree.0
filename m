From: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: [PATCH 1/2] clk: Add brcm,bcm63xx-gate-clk device tree binding
Date: Mon, 30 Nov 2015 20:52:55 +0000
Message-ID: <565CB727.7030209@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding for the BCM63xx's gated clocks.

The BCM63xx contains clocks gated with a register. Clocks are indexed
by bits in the register and are active high. Clock gate bits are
interleaved with other status bits and configurable clocks in the same
register.

Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
---
 .../bindings/clock/brcm,bcm63xx-gate-clk.txt       | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt
new file mode 100644
index 0000000..3f4ead1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm63xx-gate-clk.txt
@@ -0,0 +1,58 @@
+Broadcom BCM63xx clocks
+
+This binding uses the common clock binding:
+	Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+The BCM63xx contains clocks gated with a register. Clocks are indexed
+by bits in the register and are active high. Clock gate bits are
+interleaved with other status bits and configurable clocks in the same
+register.
+
+Required properties:
+- compatible:	Should be "brcm,bcm<soc>-gate-clk", "brcm,bcm63xx-gate-clk"
+- #clock-cells:	Should be <1>.
+- regmap:	The register map phandle
+- offset:	Offset in the register map for the reboot register (in bytes)
+- clocks:	The external oscillator clock phandle
+
+Example:
+
+periph_clk: periph_clk {
+	compatible = "brcm,bcm63168-gate-clk", "brcm,bcm63xx-gate-clk";
+	regmap = <&periph_cntl>;
+	offset = <0x4>;
+
+	#clock-cells = <1>;
+	clock-indices =
+		<1>,          <2>,        <3>,       <4>,     <5>,
+		<6>,          <7>,        <8>,       <9>,     <10>,
+		<11>,         <12>,       <13>,      <14>,    <15>,
+		<16>,         <17>,       <18>,      <19>,    <20>,
+		<27>,         <31>;
+	clock-output-names =
+		"vdsl_qproc", "vdsl_afe", "vdsl",    "mips",  "wlan_ocp",
+		"dect",       "fap0",     "fap1",    "sar",   "robosw",
+		"pcm",        "usbd",     "usbh",    "ipsec", "spi",
+		"hsspi",      "pcie",     "phymips", "gmac",  "nand",
+		"tbus",       "robosw250";
+};
+
+timer_clk: timer_clk {
+	compatible = "brcm,bcm63168-gate-clk", "brcm,bcm63xx-gate-clk";
+	regmap = <&timer_cntl>;
+	offset = <0x4>;
+
+	#clock-cells = <1>;
+	clock-indices = <17>, <18>;
+	clock-output-names = "uto_extin", "usb_ref";
+};
+
+ehci0: usb@10002500 {
+	compatible = "brcm,bcm63168-ehci", "brcm,bcm63xx-ehci", "generic-ehci";
+	reg = <0x10002500 0x100>;
+	big-endian;
+	interrupt-parent = <&periph_intc>;
+	interrupts = <10>;
+	clocks = <&periph_clk 13>, <&timer_clk 18>;
+	phys = <&usbh>;
+};
-- 
2.1.4

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
