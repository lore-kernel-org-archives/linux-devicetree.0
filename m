From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 4/7] clk: rockchip: protect all remaining rk3328 interconnect clocks
Date: Mon, 22 Jan 2018 15:15:27 +0100
Message-ID: <20180122141530.12398-5-heiko@sntech.de>
References: <20180122141530.12398-1-heiko@sntech.de>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20180122141530.12398-1-heiko@sntech.de>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, yang.zheng@rock-chips.com, zhangqing@rock-chips.com, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

NIU clocks are supplying the interconnect connections to specific
peripherals and are currently not controlled in any way.
So to prevent things falling apart at strange moments, mark all
niu clocks as critical.

Most of them where marked as CLK_IGNORE_UNUSED, but that doesn't
help if a parent clock then gets disabled.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3328.c | 56 ++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index b7a28f2814e2..c5b381ab23b1 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -304,7 +304,7 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	COMPOSITE_NOMUX(0, "aclk_core", "armclk", CLK_IGNORE_UNUSED,
 			RK3328_CLKSEL_CON(1), 4, 3, DFLAGS | CLK_DIVIDER_READ_ONLY,
 			RK3328_CLKGATE_CON(7), 1, GFLAGS),
-	GATE(0, "aclk_core_niu", "aclk_core", CLK_IGNORE_UNUSED,
+	GATE(0, "aclk_core_niu", "aclk_core", 0,
 			RK3328_CLKGATE_CON(13), 0, GFLAGS),
 	GATE(0, "aclk_gic400", "aclk_core", CLK_IGNORE_UNUSED,
 			RK3328_CLKGATE_CON(13), 1, GFLAGS),
@@ -318,7 +318,7 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 			RK3328_CLKGATE_CON(6), 6, GFLAGS),
 	GATE(ACLK_GPU, "aclk_gpu", "aclk_gpu_pre", CLK_SET_RATE_PARENT,
 			RK3328_CLKGATE_CON(14), 0, GFLAGS),
-	GATE(0, "aclk_gpu_niu", "aclk_gpu_pre", CLK_IGNORE_UNUSED,
+	GATE(0, "aclk_gpu_niu", "aclk_gpu_pre", 0,
 			RK3328_CLKGATE_CON(14), 1, GFLAGS),
 
 	/* PD_DDR */
@@ -513,9 +513,9 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 			RK3328_CLKGATE_CON(24), 0, GFLAGS),
 	GATE(HCLK_RKVDEC, "hclk_rkvdec", "hclk_rkvdec_pre", CLK_SET_RATE_PARENT,
 			RK3328_CLKGATE_CON(24), 1, GFLAGS),
-	GATE(0, "aclk_rkvdec_niu", "aclk_rkvdec_pre", CLK_IGNORE_UNUSED,
+	GATE(0, "aclk_rkvdec_niu", "aclk_rkvdec_pre", 0,
 			RK3328_CLKGATE_CON(24), 2, GFLAGS),
-	GATE(0, "hclk_rkvdec_niu", "hclk_rkvdec_pre", CLK_IGNORE_UNUSED,
+	GATE(0, "hclk_rkvdec_niu", "hclk_rkvdec_pre", 0,
 			RK3328_CLKGATE_CON(24), 3, GFLAGS),
 
 	COMPOSITE(SCLK_VDEC_CABAC, "sclk_vdec_cabac", mux_4plls_p, 0,
@@ -535,9 +535,9 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 			RK3328_CLKGATE_CON(23), 0, GFLAGS),
 	GATE(HCLK_VPU, "hclk_vpu", "hclk_vpu_pre", CLK_SET_RATE_PARENT,
 			RK3328_CLKGATE_CON(23), 1, GFLAGS),
-	GATE(0, "aclk_vpu_niu", "aclk_vpu_pre", CLK_IGNORE_UNUSED,
+	GATE(0, "aclk_vpu_niu", "aclk_vpu_pre", 0,
 			RK3328_CLKGATE_CON(23), 2, GFLAGS),
-	GATE(0, "hclk_vpu_niu", "hclk_vpu_pre", CLK_IGNORE_UNUSED,
+	GATE(0, "hclk_vpu_niu", "hclk_vpu_pre", 0,
 			RK3328_CLKGATE_CON(23), 3, GFLAGS),
 
 	COMPOSITE(ACLK_RKVENC, "aclk_rkvenc", mux_4plls_p, 0,
@@ -545,9 +545,9 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 			RK3328_CLKGATE_CON(6), 3, GFLAGS),
 	FACTOR_GATE(HCLK_RKVENC, "hclk_rkvenc", "aclk_rkvenc", 0, 1, 4,
 			RK3328_CLKGATE_CON(11), 4, GFLAGS),
-	GATE(0, "aclk_rkvenc_niu", "aclk_rkvenc", CLK_IGNORE_UNUSED,
+	GATE(0, "aclk_rkvenc_niu", "aclk_rkvenc", 0,
 			RK3328_CLKGATE_CON(25), 0, GFLAGS),
-	GATE(0, "hclk_rkvenc_niu", "hclk_rkvenc", CLK_IGNORE_UNUSED,
+	GATE(0, "hclk_rkvenc_niu", "hclk_rkvenc", 0,
 			RK3328_CLKGATE_CON(25), 1, GFLAGS),
 	GATE(ACLK_H265, "aclk_h265", "aclk_rkvenc", 0,
 			RK3328_CLKGATE_CON(25), 0, GFLAGS),
@@ -709,14 +709,14 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 
 	/* PD_VOP */
 	GATE(ACLK_RGA, "aclk_rga", "aclk_rga_pre", 0, RK3328_CLKGATE_CON(21), 10, GFLAGS),
-	GATE(0, "aclk_rga_niu", "aclk_rga_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(22), 3, GFLAGS),
+	GATE(0, "aclk_rga_niu", "aclk_rga_pre", 0, RK3328_CLKGATE_CON(22), 3, GFLAGS),
 	GATE(ACLK_VOP, "aclk_vop", "aclk_vop_pre", 0, RK3328_CLKGATE_CON(21), 2, GFLAGS),
-	GATE(0, "aclk_vop_niu", "aclk_vop_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(21), 4, GFLAGS),
+	GATE(0, "aclk_vop_niu", "aclk_vop_pre", 0, RK3328_CLKGATE_CON(21), 4, GFLAGS),
 
 	GATE(ACLK_IEP, "aclk_iep", "aclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 6, GFLAGS),
 	GATE(ACLK_CIF, "aclk_cif", "aclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 8, GFLAGS),
 	GATE(ACLK_HDCP, "aclk_hdcp", "aclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 15, GFLAGS),
-	GATE(0, "aclk_vio_niu", "aclk_vio_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(22), 2, GFLAGS),
+	GATE(0, "aclk_vio_niu", "aclk_vio_pre", 0, RK3328_CLKGATE_CON(22), 2, GFLAGS),
 
 	GATE(HCLK_VOP, "hclk_vop", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 3, GFLAGS),
 	GATE(0, "hclk_vop_niu", "hclk_vio_pre", 0, RK3328_CLKGATE_CON(21), 5, GFLAGS),
@@ -743,19 +743,19 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	GATE(HCLK_HOST0_ARB, "hclk_host0_arb", "hclk_peri", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(19), 7, GFLAGS),
 	GATE(HCLK_OTG, "hclk_otg", "hclk_peri", 0, RK3328_CLKGATE_CON(19), 8, GFLAGS),
 	GATE(HCLK_OTG_PMU, "hclk_otg_pmu", "hclk_peri", 0, RK3328_CLKGATE_CON(19), 9, GFLAGS),
-	GATE(0, "hclk_peri_niu", "hclk_peri", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(19), 12, GFLAGS),
-	GATE(0, "pclk_peri_niu", "hclk_peri", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(19), 13, GFLAGS),
+	GATE(0, "hclk_peri_niu", "hclk_peri", 0, RK3328_CLKGATE_CON(19), 12, GFLAGS),
+	GATE(0, "pclk_peri_niu", "hclk_peri", 0, RK3328_CLKGATE_CON(19), 13, GFLAGS),
 
 	/* PD_GMAC */
 	GATE(ACLK_MAC2PHY, "aclk_mac2phy", "aclk_gmac", 0, RK3328_CLKGATE_CON(26), 0, GFLAGS),
 	GATE(ACLK_MAC2IO, "aclk_mac2io", "aclk_gmac", 0, RK3328_CLKGATE_CON(26), 2, GFLAGS),
-	GATE(0, "aclk_gmac_niu", "aclk_gmac", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(26), 4, GFLAGS),
+	GATE(0, "aclk_gmac_niu", "aclk_gmac", 0, RK3328_CLKGATE_CON(26), 4, GFLAGS),
 	GATE(PCLK_MAC2PHY, "pclk_mac2phy", "pclk_gmac", 0, RK3328_CLKGATE_CON(26), 1, GFLAGS),
 	GATE(PCLK_MAC2IO, "pclk_mac2io", "pclk_gmac", 0, RK3328_CLKGATE_CON(26), 3, GFLAGS),
-	GATE(0, "pclk_gmac_niu", "pclk_gmac", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(26), 5, GFLAGS),
+	GATE(0, "pclk_gmac_niu", "pclk_gmac", 0, RK3328_CLKGATE_CON(26), 5, GFLAGS),
 
 	/* PD_BUS */
-	GATE(0, "aclk_bus_niu", "aclk_bus_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(15), 12, GFLAGS),
+	GATE(0, "aclk_bus_niu", "aclk_bus_pre", 0, RK3328_CLKGATE_CON(15), 12, GFLAGS),
 	GATE(ACLK_DCF, "aclk_dcf", "aclk_bus_pre", 0, RK3328_CLKGATE_CON(15), 11, GFLAGS),
 	GATE(ACLK_TSP, "aclk_tsp", "aclk_bus_pre", 0, RK3328_CLKGATE_CON(17), 12, GFLAGS),
 	GATE(0, "aclk_intmem", "aclk_bus_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(15), 0, GFLAGS),
@@ -769,10 +769,10 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	GATE(HCLK_TSP, "hclk_tsp", "hclk_bus_pre", 0, RK3328_CLKGATE_CON(17), 11, GFLAGS),
 	GATE(HCLK_CRYPTO_MST, "hclk_crypto_mst", "hclk_bus_pre", 0, RK3328_CLKGATE_CON(15), 7, GFLAGS),
 	GATE(HCLK_CRYPTO_SLV, "hclk_crypto_slv", "hclk_bus_pre", 0, RK3328_CLKGATE_CON(15), 8, GFLAGS),
-	GATE(0, "hclk_bus_niu", "hclk_bus_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(15), 13, GFLAGS),
+	GATE(0, "hclk_bus_niu", "hclk_bus_pre", 0, RK3328_CLKGATE_CON(15), 13, GFLAGS),
 	GATE(HCLK_PDM, "hclk_pdm", "hclk_bus_pre", 0, RK3328_CLKGATE_CON(28), 0, GFLAGS),
 
-	GATE(0, "pclk_bus_niu", "pclk_bus", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(15), 14, GFLAGS),
+	GATE(0, "pclk_bus_niu", "pclk_bus", 0, RK3328_CLKGATE_CON(15), 14, GFLAGS),
 	GATE(0, "pclk_efuse", "pclk_bus", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(15), 9, GFLAGS),
 	GATE(0, "pclk_otp", "pclk_bus", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(28), 4, GFLAGS),
 	GATE(PCLK_I2C0, "pclk_i2c0", "pclk_bus", 0, RK3328_CLKGATE_CON(15), 10, GFLAGS),
@@ -807,7 +807,7 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 	GATE(0, "pclk_acodecphy", "pclk_phy_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(17), 5, GFLAGS),
 	GATE(PCLK_HDMIPHY, "pclk_hdmiphy", "pclk_phy_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(17), 7, GFLAGS),
 	GATE(0, "pclk_vdacphy", "pclk_phy_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(17), 8, GFLAGS),
-	GATE(0, "pclk_phy_niu", "pclk_phy_pre", CLK_IGNORE_UNUSED, RK3328_CLKGATE_CON(15), 15, GFLAGS),
+	GATE(0, "pclk_phy_niu", "pclk_phy_pre", 0, RK3328_CLKGATE_CON(15), 15, GFLAGS),
 
 	/* PD_MMC */
 	MMC(SCLK_SDMMC_DRV, "sdmmc_drv", "sclk_sdmmc",
@@ -833,11 +833,16 @@ static struct rockchip_clk_branch rk3328_clk_branches[] __initdata = {
 
 static const char *const rk3328_critical_clocks[] __initconst = {
 	"aclk_bus",
+	"aclk_bus_niu",
 	"pclk_bus",
+	"pclk_bus_niu",
 	"hclk_bus",
+	"hclk_bus_niu",
 	"aclk_peri",
 	"hclk_peri",
+	"hclk_peri_niu",
 	"pclk_peri",
+	"pclk_peri_niu",
 	"pclk_dbg",
 	"aclk_core_niu",
 	"aclk_gic400",
@@ -861,7 +866,20 @@ static const char *const rk3328_critical_clocks[] __initconst = {
 	"aclk_rga_niu",
 	"pclk_vio_h2p",
 	"hclk_vio_h2p",
+	"aclk_vio_niu",
 	"hclk_vio_niu",
+	"aclk_vop_niu",
+	"hclk_vop_niu",
+	"aclk_gpu_niu",
+	"aclk_rkvdec_niu",
+	"hclk_rkvdec_niu",
+	"aclk_vpu_niu",
+	"hclk_vpu_niu",
+	"aclk_rkvenc_niu",
+	"hclk_rkvenc_niu",
+	"aclk_gmac_niu",
+	"pclk_gmac_niu",
+	"pclk_phy_niu",
 };
 
 static void __init rk3328_clk_init(struct device_node *np)
-- 
2.14.2

