From: Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v4 2/7] DT: clk: sunxi: add binding doc for the multi-bus-gates clock
Date: Mon,  8 Aug 2016 18:21:44 +0100
Message-ID: <20160808172149.30861-3-andre.przywara@arm.com>
References: <20160808172149.30861-1-andre.przywara@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160808172149.30861-1-andre.przywara@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Recent Allwinner SoCs introduced a bus gates clock which can have
different parents for individual gates, even within a single register.
For the time being we encoded this relation in the driver.
This commit specifies a new binding which allows to encode this in
the DT by using a child node for each parent clock used. This allows
to specify any kind of relation efficiently and also keeps the very
same kernel driver for all SoCs at the same time.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 8f7619d..7d4197e 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -87,6 +87,8 @@ Required properties:
 	"allwinner,sun9i-a80-usb-phy-clk" - for usb phy gates + resets on A80
 	"allwinner,sun4i-a10-ve-clk" - for the Video Engine clock
 	"allwinner,sun6i-a31-display-clk" - for the display clocks
+	"allwinner,sunxi-multi-bus-gates-clk" - for the multi-parent bus gates
+	"allwinner,sun50i-a64-bus-gates-clk" - for the bus gates on A64
 
 Required properties for all clocks:
 - reg : shall be the control register address for the clock.
@@ -127,6 +129,11 @@ For "allwinner,sun6i-a31-pll6-clk", there are 2 outputs. The first output
 is the normal PLL6 output, or "pll6". The second output is rate doubled
 PLL6, or "pll6x2".
 
+The "allwinner,sunxi-multi-bus-gates-clk" holds the actual clocks in
+child nodes, where each one specifies the parent clock that the particular
+gates are depending from. The child nodes each follow the common clock
+binding as described in this document.
+
 The "allwinner,*-mmc-clk" clocks have three different outputs: the
 main clock, with the ID 0, and the output and sample clocks, with the
 IDs 1 and 2, respectively.
-- 
2.9.0
