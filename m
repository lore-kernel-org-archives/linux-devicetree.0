From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 1/2] dt-bindings: clock: Add binding documentation for TI syscon gate clock
Date: Tue, 12 Mar 2019 14:35:17 +0530
Message-ID: <20190312090518.28666-2-vigneshr@ti.com>
References: <20190312090518.28666-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190312090518.28666-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vigneshr@ti.com, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Add dt bindings for TI syscon gate clock.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../bindings/clock/ti,syscon-gate-clock.txt   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/ti,syscon-gate-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/ti,syscon-gate-clock.txt b/Documentation/devicetree/bindings/clock/ti,syscon-gate-clock.txt
new file mode 100644
index 000000000000..f2bc4281ddba
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,syscon-gate-clock.txt
@@ -0,0 +1,35 @@
+TI syscon gate clock
+
+The gate clock node must be provided inside a system controller node.
+
+Required:
+- comaptible: Must be "ti,syscon-gate-clock"
+- reg: Offset of register that controls the clock within syscon regmap
+- ti,clock-bit-idx: bit index that control gate/ungating of clock
+- clocks: phandle to the clock parent
+- #clock-cells: must be <0>
+
+Example:
+	ctrlmmr_epwm_ctrl: syscon@104140{
+		compatible = "syscon", "simple-bus";
+		reg = <0x0 0x104140 0x0 0x18>;
+		ranges = <0x0 0x0 0x104140>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ehrpwm0_tbclk: clk@0 {
+			compatible = "ti,syscon-gate-clock";
+			reg = <0x0>;
+			#clock-cells = <0>;
+			clocks = <&k3_clks 40 0>;
+			ti,clock-bit-idx = <0>;
+		};
+
+		ehrpwm1_tbclk: clk@4 {
+			compatible = "ti,syscon-gate-clock";
+			reg = <0x4>;
+			#clock-cells = <0>;
+			clocks = <&k3_clks 41 0>;
+			ti,clock-bit-idx = <0>;
+		};
+	};
-- 
2.21.0
