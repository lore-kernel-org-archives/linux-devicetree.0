From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: [PATCH v6 01/41] dt-bindings: clock: Add new bindings for TI Davinci PLL clocks
Date: Sat, 20 Jan 2018 11:13:40 -0600
Message-ID: <1516468460-4908-2-git-send-email-david@lechnology.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516468460-4908-1-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a new binding for the PLL IP blocks in the mach-davinci
family of processors. Currently, only da850 has device tree support
but these bindings can also work for other SoCs in this family just
by adding new compatible strings.

Note: Although these PLL controllers are very similar to the TI Keystone
SoCs, we are not re-using those bindings. The Keystone bindings use a
legacy one-node-per-clock binding. Furthermore, the mach-davinici SoCs
have a slightly different PLL register layout and a number of quirks
that can't be handled by the existing bindings, so the keystone bindings
could not be used as-is anyway.

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
---

v6 changes:
- Added clock-names property
- Added ti,clkmode-square-wave property
- Added pllout child node
- Added obsclk child node
- Expanded examples

 .../devicetree/bindings/clock/ti/davinci/pll.txt   | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/ti/davinci/pll.txt

diff --git a/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt b/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt
new file mode 100644
index 0000000..36998e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt
@@ -0,0 +1,96 @@
+Binding for TI DaVinci PLL Controllers
+
+The PLL provides clocks to most of the components on the SoC. In addition
+to the PLL itself, this controller also contains bypasses, gates, dividers,
+an multiplexers for various clock signals.
+
+Required properties:
+- compatible: shall be one of:
+	- "ti,da850-pll0" for PLL0 on DA850/OMAP-L138/AM18XX
+	- "ti,da850-pll1" for PLL1 on DA850/OMAP-L138/AM18XX
+- reg: physical base address and size of the controller's register area.
+- clocks: phandles corresponding to the clock names
+- clock-names: names of the clock sources - depends on compatible string
+	- for "ti,da850-pll0", shall be "clksrc", "extclksrc"
+	- for "ti,da850-pll1", shall be "clksrc"
+
+Optional properties:
+- ti,clkmode-square-wave: Indicates that the the board is supplying a square
+	wave input on the OSCIN pin instead of using a crystal oscillator.
+	This property is only valid when compatible = "ti,da850-pll0".
+
+
+Optional child nodes:
+
+pllout
+	Describes the main PLL clock output (before POSTDIV). The node name must
+	be "pllout".
+
+	Required properties:
+	- #clock-cells: shall be 0
+
+sysclk
+	Describes the PLLDIVn divider clocks that provide the SYSCLKn clock
+	domains. The node name must be "sysclk". Consumers of this node should
+	use "n" in "SYSCLKn" as the index parameter for the clock cell.
+
+	Required properties:
+	- #clock-cells: shall be 1
+
+auxclk
+	Describes the AUXCLK output of the PLL. The node name must be "auxclk".
+	This child node is only valid when compatible = "ti,da850-pll0".
+
+	Required properties:
+	- #clock-cells: shall be 0
+
+obsclk
+	Describes the OBSCLK output of the PLL. The node name must be "obsclk".
+
+	Required properties:
+	- #clock-cells: shall be 0
+
+
+Examples:
+
+	pll0: clock-controller@11000 {
+		compatible = "ti,da850-pll0";
+		reg = <0x11000 0x1000>;
+		clocks = <&ref_clk>, <&pll1_sysclk 3>;
+		clock-names = "clksrc", "extclksrc";
+		ti,clkmode-square-wave;
+
+		pll0_pllout: pllout {
+			#clock-cells = <0>;
+		};
+
+		pll0_sysclk: sysclk {
+			#clock-cells = <1>;
+		};
+
+		pll0_auxclk: auxclk {
+			#clock-cells = <0>;
+		};
+
+		pll0_obsclk: obsclk {
+			#clock-cells = <0>;
+		};
+	};
+
+	pll1: clock-controller@21a000 {
+		compatible = "ti,da850-pll1";
+		reg = <0x21a000 0x1000>;
+		clocks = <&ref_clk>;
+		clock-names = "clksrc";
+
+		pll0_sysclk: sysclk {
+			#clock-cells = <1>;
+		};
+
+		pll0_obsclk: obsclk {
+			#clock-cells = <0>;
+		};
+	};
+
+Also see:
+- Documentation/devicetree/bindings/clock/clock-bindings.txt
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
