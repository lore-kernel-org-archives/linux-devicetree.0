From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH linux-next 1/2] clk: Add brcm,bcm6345-gate-clk device tree
 binding
Date: Thu, 3 Dec 2015 19:24:04 +0000
Message-ID: <566096D4.3050102@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, linux-mips@linux-mips.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding for the BCM6345's gated clocks.

The BCM6345 contains clocks gated with a register. Clocks are indexed
by bits in the register and are active high. Clock gate bits are
interleaved with other status bits and configurable clocks in the same
register.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
Renamed to BCM6345.

 .../bindings/clock/brcm,bcm6345-gate-clk.txt       | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm6345-gate-clk.txt

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm6345-gate-clk.txt b/Documentation/devicetree/bindings/clock/brcm,bcm6345-gate-clk.txt
new file mode 100644
index 0000000..5801264
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm6345-gate-clk.txt
@@ -0,0 +1,58 @@
+Broadcom BCM6345 clocks
+
+This binding uses the common clock binding:
+	Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+The BCM6345 contains clocks gated with a register. Clocks are indexed
+by bits in the register and are active high. Clock gate bits are
+interleaved with other status bits and configurable clocks in the same
+register.
+
+Required properties:
+- compatible:	Should be "brcm,bcm<soc>-gate-clk", "brcm,bcm6345-gate-clk"
+- #clock-cells:	Should be <1>.
+- regmap:	The register map phandle
+- offset:	Offset in the register map for the clock register (in bytes)
+- clocks:	The external oscillator clock phandle
+
+Example:
+
+periph_clk: periph_clk {
+	compatible = "brcm,bcm63168-gate-clk", "brcm,bcm6345-gate-clk";
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
+	compatible = "brcm,bcm63168-gate-clk", "brcm,bcm6345-gate-clk";
+	regmap = <&timer_cntl>;
+	offset = <0x4>;
+
+	#clock-cells = <1>;
+	clock-indices = <17>, <18>;
+	clock-output-names = "uto_extin", "usb_ref";
+};
+
+ehci0: usb@10002500 {
+	compatible = "brcm,bcm63168-ehci", "brcm,bcm6345-ehci", "generic-ehci";
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
