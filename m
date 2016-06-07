From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 01/15] dt-bindings: sunxi: Add CCU binding documentation
Date: Tue,  7 Jun 2016 22:41:40 +0200
Message-ID: <20160607204154.31967-2-maxime.ripard@free-electrons.com>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Introduce a new binding with its documentation for the brand new clock
sub-framework.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sunxi-ccu.txt

diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
new file mode 100644
index 000000000000..2c66046a1342
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
@@ -0,0 +1,17 @@
+Allwinner Clock Control Unit Binding
+------------------------------------
+
+Required properties :
+- compatible: must contain one of the following compatible:
+		- "allwinner,sun8i-h3-ccu"
+
+- reg: Must contain the registers base address and length
+- clocks: phandle to the oscillators feeding the SPI controller. Two are
+          needed:
+  - "hosc": the high frequency oscillator (usually at 24MHz)
+  - "losc": the low frequency oscillator (usually at 32kHz)
+- clock-names: Must contain the clock names described just above
+- #clock-cells : must contain 1
+- #reset-cells : must contain 1
+
+Example:
-- 
2.8.3

