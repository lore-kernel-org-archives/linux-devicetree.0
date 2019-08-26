From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/5] dt-bindings: clk: meson: add sm1 periph clock controller bindings
Date: Mon, 26 Aug 2019 09:25:35 +0200
Message-ID: <20190826072539.27725-2-narmstrong@baylibre.com>
References: <20190826072539.27725-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826072539.27725-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, jbrunet@baylibre.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the documentation to support clock driver for the Amlogic SM1 SoC
and expose the GP1, DSU and the CPU 1, 2 & 3 clocks.

SM1 clock tree is very close, the main differences are :
- each CPU core can achieve a different frequency, albeit a common PLL
- a similar tree as the clock tree has been added for the DynamIQ Shared Unit
- has a new GP1 PLL used for the DynamIQ Shared Unit
- SM1 has additional clocks like for CSI, NanoQ an other components

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt          | 1 +
 include/dt-bindings/clock/g12a-clkc.h                        | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 6eaa52092313..7ccecd5c02c1 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -11,6 +11,7 @@ Required Properties:
 		"amlogic,axg-clkc" for AXG SoC.
 		"amlogic,g12a-clkc" for G12A SoC.
 		"amlogic,g12b-clkc" for G12B SoC.
+		"amlogic,sm1-clkc" for SM1 SoC.
 - clocks : list of clock phandle, one for each entry clock-names.
 - clock-names : should contain the following:
   * "xtal": the platform xtal
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 8ccc29ac7a72..0837c1a7ae49 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -138,5 +138,10 @@
 #define CLKID_VDEC_HEVCF			210
 #define CLKID_TS				212
 #define CLKID_CPUB_CLK				224
+#define CLKID_GP1_PLL				243
+#define CLKID_DSU_CLK				252
+#define CLKID_CPU1_CLK				253
+#define CLKID_CPU2_CLK				254
+#define CLKID_CPU3_CLK				255
 
 #endif /* __G12A_CLKC_H */
-- 
2.22.0
