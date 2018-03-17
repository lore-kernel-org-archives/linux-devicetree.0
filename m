From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next 09/12] net: stmmac: dwmac-sun8i: Add support for GMAC
 on Allwinner R40 SoC
Date: Sat, 17 Mar 2018 17:28:54 +0800
Message-ID: <20180317092857.4396-10-wens@csie.org>
References: <20180317092857.4396-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180317092857.4396-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The Allwinner R40 SoC has the EMAC controller supported by dwmac-sun8i.
It is named "GMAC", while EMAC refers to the 10/100 Mbps Ethernet
controller supported by sun4i-emac. The controller is the same, but
the R40 has the glue layer controls in the clock control unit (CCU),
with a reduced RX delay chain, and no TX delay chain.

This patch adds support for it using the framework laid out by previous
patches to map the differences.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 08d263567a52..be6705e89e95 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -97,6 +97,13 @@ const struct reg_field sun8i_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* EMAC clock register @ 0x164 in the CCU address range */
+const struct reg_field sun8i_ccu_reg_field = {
+	.reg = 0x164,
+	.lsb = 0,
+	.msb = 31,
+};
+
 static const struct emac_variant emac_variant_h3 = {
 	.default_syscon_value = 0x58000,
 	.syscon_field = &sun8i_syscon_reg_field,
@@ -125,6 +132,15 @@ static const struct emac_variant emac_variant_a83t = {
 	.tx_delay_max = 7,
 };
 
+static const struct emac_variant emac_variant_r40 = {
+	.default_syscon_value = 0,
+	.syscon_field = &sun8i_ccu_reg_field,
+	.syscon_from_dev = true,
+	.support_mii = true,
+	.support_rgmii = true,
+	.rx_delay_max = 7,
+};
+
 static const struct emac_variant emac_variant_a64 = {
 	.default_syscon_value = 0,
 	.syscon_field = &sun8i_syscon_reg_field,
@@ -1148,6 +1164,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
 		.data = &emac_variant_v3s },
 	{ .compatible = "allwinner,sun8i-a83t-emac",
 		.data = &emac_variant_a83t },
+	{ .compatible = "allwinner,sun8i-r40-gmac",
+		.data = &emac_variant_r40 },
 	{ .compatible = "allwinner,sun50i-a64-emac",
 		.data = &emac_variant_a64 },
 	{ }
-- 
2.16.2
