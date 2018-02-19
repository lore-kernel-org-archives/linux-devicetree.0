From: David Lechner <david@lechnology.com>
Subject: [PATCH v7 09/42] dt-bindings: clock: New bindings for TI Davinci PSC
Date: Mon, 19 Feb 2018 14:21:30 -0600
Message-ID: <1519071723-31790-10-git-send-email-david@lechnology.com>
References: <1519071723-31790-1-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1519071723-31790-1-git-send-email-david@lechnology.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds a new binding for the Power Sleep Controller (PSC) for the
mach-davinci family of processors.

Note: Although TI Keystone has a very similar PSC, we are not using the
existing bindings. Keystone is using a legacy one-node-per-clock binding
(actually two nodes if you count the separate reset binding for the same
IP block). Also, some davinci LPSCs have quirks that aren't handled by
the keystone bindings, so we would be adding one compatible string per
clock with quirks instead of just a new compatible string for each
controller.

Signed-off-by: David Lechner <david@lechnology.com>
---

v7 changes:
- Fixed clock-names property typo
- Added #power-domain-cells property

v6 changes:
- added clocks and clock-names properties
- expanded examples


 .../devicetree/bindings/clock/ti/davinci/psc.txt   | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/ti/davinci/psc.txt

diff --git a/Documentation/devicetree/bindings/clock/ti/davinci/psc.txt b/Documentation/devicetree/bindings/clock/ti/davinci/psc.txt
new file mode 100644
index 0000000..dae4ad8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/davinci/psc.txt
@@ -0,0 +1,71 @@
+Binding for TI DaVinci Power Sleep Controller (PSC)
+
+The PSC provides power management, clock gating and reset functionality. It is
+primarily used for clocking.
+
+Required properties:
+- compatible: shall be one of:
+	- "ti,da850-psc0" for PSC0 on DA850/OMAP-L138/AM18XX
+	- "ti,da850-psc1" for PSC1 on DA850/OMAP-L138/AM18XX
+- reg: physical base address and size of the controller's register area
+- #clock-cells: from common clock binding; shall be set to 1
+- #power-domain-cells: from generic power domain binding; shall be set to 1.
+- clocks: phandles to clocks corresponding to the clock-names property
+- clock-names: list of parent clock names - depends on compatible value
+	- for "ti,da850-psc0", shall be "pll0_sysclk1", "pll0_sysclk2",
+	  "pll0_sysclk4", "pll0_sysclk6", "async1"
+	- for "ti,da850-psc1", shall be "pll0_sysclk2", "pll0_sysclk4", "async3"
+
+Optional properties:
+- #reset-cells: from reset binding; shall be set to 1 - only applicable when
+  at least one local domain provides a local reset.
+
+Consumers:
+
+	Clock, power domain and reset consumers shall use the local power domain
+	module ID (LPSC) as the index corresponding to the clock cell. Refer to
+	the device-specific datasheet to find these numbers. NB: Most local
+	domains	only provide a clock/power domain and not a reset.
+
+Examples:
+
+	psc0: clock-controller@10000 {
+		compatible = "ti,da850-psc0";
+		reg = <0x10000 0x1000>;
+		#clock-cells = <1>;
+		#power-domain-cells = <1>;
+		#reset-cells = <1>;
+		clocks = <&pll0_sysclk 1>, <&pll0_sysclk 2>,
+			 <&pll0_sysclk 4>, <&pll0_sysclk 6>, <&async1_clk>;
+		clock_names = "pll0_sysclk1", "pll0_sysclk2",
+			      "pll0_sysclk4", "pll0_sysclk6", "async1";
+	};
+	psc1: clock-controller@227000 {
+		compatible = "ti,da850-psc1";
+		reg = <0x227000 0x1000>;
+		#clock-cells = <1>;
+		#power-domain-cells = <1>;
+		clocks = <&pll0_sysclk 2>, <&pll0_sysclk 4>, <&async3_clk>;
+		clock_names = "pll0_sysclk2", "pll0_sysclk4", "async3";
+	};
+
+	/* consumer */
+	dsp: dsp@11800000 {
+		compatible = "ti,da850-dsp";
+		reg = <0x11800000 0x40000>,
+		      <0x11e00000 0x8000>,
+		      <0x11f00000 0x8000>,
+		      <0x01c14044 0x4>,
+		      <0x01c14174 0x8>;
+		reg-names = "l2sram", "l1pram", "l1dram", "host1cfg", "chipsig";
+		interrupt-parent = <&intc>;
+		interrupts = <28>;
+		clocks = <&psc0 15>;
+		power-domains = <&psc0 15>;
+		resets = <&psc0 15>;
+	};
+
+Also see:
+- Documentation/devicetree/bindings/clock/clock-bindings.txt
+- Documentation/devicetree/bindings/power/power_domain.txt
+- Documentation/devicetree/bindings/reset/reset.txt
-- 
2.7.4
