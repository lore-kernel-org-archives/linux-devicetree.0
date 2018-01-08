From: David Lechner <david@lechnology.com>
Subject: [PATCH v5 01/44] dt-bindings: clock: Add new bindings for TI Davinci
 PLL clocks
Date: Sun,  7 Jan 2018 20:17:00 -0600
Message-ID: <1515377863-20358-2-git-send-email-david@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1515377863-20358-1-git-send-email-david@lechnology.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds a new binding for the PLL IP blocks in the mach-davinci family
of processors. Currently, only the SYSCLKn and AUXCLK outputs are needed,
but in the future additional child nodes could be added for OBSCLK and
BPDIV.

Note: Although these PLL controllers are very similar to the TI Keystone
SoCs, we are not re-using those bindings. The Keystone bindings use a
legacy one-node-per-clock binding. Furthermore, the mach-davinici SoCs
have a slightly different PLL register layout and a number of quirks that
can't be handled by the existing bindings, so the keystone bindings could
not be used as-is anyway.

Signed-off-by: David Lechner <david@lechnology.com>
---
 .../devicetree/bindings/clock/ti/davinci/pll.txt   | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/ti/davinci/pll.txt

diff --git a/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt b/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt
new file mode 100644
index 0000000..99bf5da
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/davinci/pll.txt
@@ -0,0 +1,47 @@
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
+- clocks: phandle to the PLL input clock source
+
+Optional child nodes:
+
+sysclk
+	Describes the PLLDIVn divider clocks that provide the SYSCLKn clock
+	domains. The node name must be "sysclk". Consumers of this node should
+	use "n" in "SYSCLKn" as the parameter for the clock cell.
+
+	Required properties:
+	- #clock-cells: must be 1
+
+auxclk
+	Describes the AUXCLK output of the PLL. The node name must be "auxclk".
+
+	Required properties:
+	- #clock-cells: must be 0
+
+Examples:
+
+	pll0: clock-controller@11000 {
+		compatible = "ti,da850-pll0";
+		reg = <0x11000 0x1000>;
+		clocks = <&ref_clk>;
+
+		pll0_sysclk: sysclk {
+			#clock-cells = <1>;
+		};
+
+		pll0_aux_clk: auxclk {
+			#clock-cells = <0>;
+		};
+	};
+
+Also see:
+- Documentation/devicetree/bindings/clock/clock-bindings.txt
-- 
2.7.4
