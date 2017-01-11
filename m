From: Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH 1/2] clk: vc5: Add bindings for IDT VersaClock 5P49V5923 and 5P49V5933
Date: Wed, 11 Jan 2017 17:16:02 +0100
Message-ID: <20170111161603.18905-1-marek.vasut@gmail.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add bindings for IDT VersaClock 5 5P49V5923 and 5P49V5933 chips.
These are I2C clock generators with optional clock source from
either XTal or dedicated clock generator and, depending on the
model, two or more clock outputs.

Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/clock/idt,versaclock5.txt  | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/idt,versaclock5.txt

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.txt b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
new file mode 100644
index 000000000000..82ebed9a8a15
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.txt
@@ -0,0 +1,43 @@
+Binding for IDT VersaClock5 programmable i2c clock generator.
+
+The IDT VersaClock5 are programmable i2c clock generators providing
+from 3 to 12 output clocks.
+
+==I2C device node==
+
+Required properties:
+- compatible:	shall be one of "idt,5p49v5923" , "idt,5p49v5933".
+- reg:		i2c device address, shall be 0x68 or 0x6a.
+- #clock-cells:	from common clock binding; shall be set to 1.
+- clocks:	from common clock binding; list of parent clock handles,
+		- 5p49v5923: (required) either or both of XTAL or CLKIN
+					reference clock.
+		- 5p49v5933: (optional) property not present (internal
+					Xtal used) or CLKIN reference
+					clock.
+- clock-names:	from common clock binding; clock input names, can be
+		- 5p49v5923: (required) either or both of "xin", "clkin".
+		- 5p49v5933: (optional) property not present or "clkin".
+
+==Example==
+
+/* 25MHz reference crystal */
+ref25: ref25m {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <25000000>;
+};
+
+i2c-master-node {
+
+	/* IDT 5P49V5923 i2c clock generator */
+	vc5: clock-generator@6a {
+		compatible = "idt,5p49v5923";
+		reg = <0x6a>;
+		#clock-cells = <1>;
+
+		/* Connect XIN input to 25MHz reference */
+		clocks = <&ref25m>;
+		clock-names = "xin";
+	};
+};
-- 
2.11.0
