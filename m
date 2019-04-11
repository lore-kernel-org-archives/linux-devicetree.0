From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 2/3] dt-bindings: clk: add documentation for the SiFive
 PRCI driver
Date: Thu, 11 Apr 2019 01:27:34 -0700
Message-ID: <20190411082733.3736-3-paul.walmsley@sifive.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190411082733.3736-2-paul.walmsley@sifive.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>, Megan Wachs <megan@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for the Linux driver for the SiFive
PRCI clock & reset control IP block, as found on the SiFive
FU540 chip.

This version includes changes requested by Stephen Boyd
<sboyd@kernel.org> and Rob Herring <robh@kernel.org>, and
fixes some errors in the initial version.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Megan Wachs <megan@sifive.com>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../bindings/clock/sifive/fu540-prci.txt      | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt

diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
new file mode 100644
index 000000000000..349808f4fb8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
@@ -0,0 +1,46 @@
+SiFive FU540 PRCI bindings
+
+On the FU540 family of SoCs, most system-wide clock and reset integration
+is via the PRCI IP block.
+
+Required properties:
+- compatible: Should be "sifive,<chip>-prci".  Only one value is
+	supported: "sifive,fu540-c000-prci"
+- reg: Should describe the PRCI's register target physical address region
+- clocks: Should point to the hfclk device tree node and the rtcclk
+          device tree node.  The RTC clock here is not a time-of-day clock,
+	  but is instead a high-stability clock source for system timers
+	  and cycle counters.
+- #clock-cells: Should be <1>
+
+The clock consumer should specify the desired clock via the clock ID
+macros defined in include/dt-bindings/clock/sifive-fu540-prci.h.
+These macros begin with PRCI_CLK_.
+
+The hfclk and rtcclk nodes are required, and represent physical
+crystals or resonators located on the PCB.  These nodes should be present
+underneath /, rather than /soc.
+
+Examples:
+
+/* under /, in PCB-specific DT data */
+hfclk: hfclk {
+	#clock-cells = <0>;
+	compatible = "fixed-clock";
+	clock-frequency = <33333333>;
+	clock-output-names = "hfclk";
+};
+rtcclk: rtcclk {
+	#clock-cells = <0>;
+	compatible = "fixed-clock";
+	clock-frequency = <1000000>;
+	clock-output-names = "rtcclk";
+};
+
+/* under /soc, in SoC-specific DT data */
+prci: clock-controller@10000000 {
+	compatible = "sifive,fu540-c000-prci";
+	reg = <0x0 0x10000000 0x0 0x1000>;
+	clocks = <&hfclk>, <&rtcclk>;
+	#clock-cells = <1>;
+};
-- 
2.20.1
