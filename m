From: Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv4 32/33] clk: OMAP: DRA7: Change apll_pcie_m2_ck to fixed factor clock
Date: Tue, 23 Jul 2013 10:20:27 +0300
Message-ID: <1374564028-11352-33-git-send-email-t-kristo@ti.com>
References: <1374564028-11352-1-git-send-email-t-kristo@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1374564028-11352-1-git-send-email-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: linux-omap@vger.kernel.org, paul@pwsan.com, khilman@linaro.org, tony@atomide.com, mturquette@linaro.org, nm@ti.com, rnayak@ti.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Keerthy <j-keerthy@ti.com>
List-Id: devicetree@vger.kernel.org

From: Keerthy <j-keerthy@ti.com>

This patch changes apll_pcie_m2_ck to fixed factor
clock as there are no configurable divider associated to m2.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra7xx-clocks.dtsi |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
index e923311..fcc14d4 100644
--- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
@@ -366,13 +366,10 @@ apll_pcie_clkvcoldo_div: apll_pcie_clkvcoldo_div {
 
 apll_pcie_m2_ck: apll_pcie_m2_ck@4a008224 {
 	#clock-cells = <0>;
-	compatible = "divider-clock";
+	compatible = "fixed-factor-clock";
 	clocks = <&apll_pcie_ck>;
-	ti,autoidle-shift = <8>;
-	reg = <0x4a008224 0x4>;
-	bit-mask = <0x7f>;
-	index-starts-at-one;
-	ti,autoidle-low;
+	clock-mult = <1>;
+	clock-div = <1>;
 };
 
 sys_clk1_dclk_div: sys_clk1_dclk_div@4ae061c8 {
-- 
1.7.9.5

