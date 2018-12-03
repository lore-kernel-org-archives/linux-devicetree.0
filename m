From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v2 02/14] dt-bindings: rtc: sun6i-rtc: Add compatible strings for pre-H6 variants
Date: Mon,  3 Dec 2018 22:58:13 +0800
Message-ID: <20181203145825.20511-3-wens@csie.org>
References: <20181203145825.20511-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203145825.20511-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org

While doing Bluetooth enablement for various boards based on various
Allwinner SoCs, minor differences in the RTC modules were found. These
include a lack of an external clock output (A31), different internal
oscillator frequencies (H3/H5/A64/V3/V3s), different regulator voltage
settings (H5/H6), and the presence of miscellaneous registers unrelated
to the RTC (A64/R40/H5/H6). The datasheet also describes different number
of registers for non-volatile storage, though based on actual experiments
the actual number is the same across the board.

This patch adds a list of all pre-H6 variants, grouped by the internal
oscillator's clock rate, regulator settings, and the presence of the
external clock output. Combinations are introduced for the variants that
have miscellaneous registers.

The RTC block in the H6 also handles the 24 MHz DCXO. This will require
more device tree binding changes and will be done later.

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../devicetree/bindings/rtc/sun6i-rtc.txt        | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
index fed0d58cbfec..037ec475f412 100644
--- a/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/sun6i-rtc.txt
@@ -3,7 +3,21 @@
 RTC controller for the Allwinner A31
 
 Required properties:
-- compatible	: Should be "allwinner,sun6i-a31-rtc"
+- compatible	: Should be one of the following combinations:
+		    - "allwinner,sun6i-a31-rtc"
+		    - "allwinner,sun8i-a23-rtc"
+		    - "allwinner,sun8i-h3-rtc"
+		    - "allwinner,sun8i-r40-rtc", "allwinner,sun8i-h3-rtc"
+		    - "allwinner,sun8i-v3-rtc"
+		    - "allwinner,sun50i-a64-rtc", "allwinner,sun8i-h3-rtc"
+		    - "allwinner,sun50i-h5-rtc"
+
+		  Where there are two or more compatible strings, this
+		  denotes the hardware covered by the most specific one
+		  is backward-compatible with the latter ones, and the
+		  implementation for the latter ones can be used, albeit
+		  with reduced functionality.
+
 - reg		: physical base address of the controller and length of
 		  memory mapped region.
 - interrupts	: IRQ lines for the RTC alarm 0 and alarm 1, in that order.
-- 
2.20.0.rc1
