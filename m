From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 01/14] dt-bindings: sunxi: Add CCU binding documentation
Date: Wed, 29 Jun 2016 21:05:22 +0200
Message-ID: <20160629190535.11855-2-maxime.ripard@free-electrons.com>
References: <20160629190535.11855-1-maxime.ripard@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160629190535.11855-1-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jean-Francois Moine <moinejf@free.fr>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Introduce a new binding with its documentation for the brand new clock
sub-framework.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 .../devicetree/bindings/clock/sunxi-ccu.txt        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sunxi-ccu.txt

diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
new file mode 100644
index 000000000000..cb91507ffb1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
@@ -0,0 +1,24 @@
+Allwinner Clock Control Unit Binding
+------------------------------------
+
+Required properties :
+- compatible: must contain one of the following compatible:
+		- "allwinner,sun8i-h3-ccu"
+
+- reg: Must contain the registers base address and length
+- clocks: phandle to the oscillators feeding the CCU. Two are needed:
+  - "hosc": the high frequency oscillator (usually at 24MHz)
+  - "losc": the low frequency oscillator (usually at 32kHz)
+- clock-names: Must contain the clock names described just above
+- #clock-cells : must contain 1
+- #reset-cells : must contain 1
+
+Example:
+ccu: clock@01c20000 {
+	compatible = "allwinner,sun8i-h3-ccu";
+	reg = <0x01c20000 0x400>;
+	clocks = <&osc24M>, <&osc32k>;
+	clock-names = "hosc", "losc";
+	#clock-cells = <1>;
+	#reset-cells = <1>;
+};
-- 
2.9.0
