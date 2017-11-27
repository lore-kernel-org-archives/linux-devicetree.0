From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH V6 08/12] dt-bindings: Add Spreadtrum clock binding documentation
Date: Mon, 27 Nov 2017 18:01:11 +0800
Message-ID: <20171127100115.20655-9-chunyan.zhang@spreadtrum.com>
References: <20171127100115.20655-1-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127100115.20655-1-chunyan.zhang@spreadtrum.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>
List-Id: devicetree@vger.kernel.org

Introduce a new binding with its documentation for Spreadtrum clock
sub-framework.

Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/sprd.txt | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sprd.txt

diff --git a/Documentation/devicetree/bindings/clock/sprd.txt b/Documentation/devicetree/bindings/clock/sprd.txt
new file mode 100644
index 0000000..e9d179e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sprd.txt
@@ -0,0 +1,63 @@
+Spreadtrum Clock Binding
+------------------------
+
+Required properties:
+- compatible: should contain the following compatible strings:
+	- "sprd,sc9860-pmu-gate"
+	- "sprd,sc9860-pll"
+	- "sprd,sc9860-ap-clk"
+	- "sprd,sc9860-aon-prediv"
+	- "sprd,sc9860-apahb-gate"
+	- "sprd,sc9860-aon-gate"
+	- "sprd,sc9860-aonsecure-clk"
+	- "sprd,sc9860-agcp-gate"
+	- "sprd,sc9860-gpu-clk"
+	- "sprd,sc9860-vsp-clk"
+	- "sprd,sc9860-vsp-gate"
+	- "sprd,sc9860-cam-clk"
+	- "sprd,sc9860-cam-gate"
+	- "sprd,sc9860-disp-clk"
+	- "sprd,sc9860-disp-gate"
+	- "sprd,sc9860-apapb-gate"
+
+- #clock-cells: must be 1
+
+- clocks : Should be the input parent clock(s) phandle for the clock, this
+	   property here just simply shows which clock group the clocks'
+	   parents are in, since each clk node would represent many clocks
+	   which are defined in the driver.  The detailed dependency
+	   relationship (i.e. how many parents and which are the parents)
+	   are implemented in driver code.
+
+Optional properties:
+
+- reg:	Contain the registers base address and length. It must be configured
+	only if no 'sprd,syscon' under the node.
+
+- sprd,syscon: phandle to the syscon which is in the same address area with
+	       the clock, and so we can get regmap for the clocks from the
+	       syscon device.
+
+Example:
+
+	pmu_gate: pmu-gate {
+		compatible = "sprd,sc9860-pmu-gate";
+		sprd,syscon = <&pmu_regs>;
+		clocks = <&ext_26m>;
+		#clock-cells = <1>;
+	};
+
+	pll: pll {
+		compatible = "sprd,sc9860-pll";
+		sprd,syscon = <&ana_regs>;
+		clocks = <&pmu_gate 0>;
+		#clock-cells = <1>;
+	};
+
+	ap_clk: clock-controller@20000000 {
+		compatible = "sprd,sc9860-ap-clk";
+		reg = <0 0x20000000 0 0x400>;
+		clocks = <&ext_26m>, <&pll 0>,
+			 <&pmu_gate 0>;
+		#clock-cells = <1>;
+	};
-- 
2.7.4
