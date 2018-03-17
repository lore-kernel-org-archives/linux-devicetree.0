From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next 08/12] net: stmmac: dwmac-sun8i: Support different
 ranges for TX/RX delay chains
Date: Sat, 17 Mar 2018 17:28:53 +0800
Message-ID: <20180317092857.4396-9-wens@csie.org>
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

On the R40 SoC, the RX delay chain only has a range of 0~7 (hundred
picoseconds), instead of 0~31. Also the TX delay chain is completely
absent.

This patch adds support for different ranges by adding per-compatible
maximum values in the variant data. A maximum of 0 indicates that the
delay chain is not supported or absent.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 32 ++++++++++++++++-------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index a51175bcfd11..08d263567a52 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -50,6 +50,12 @@
  * @support_mii:		Does the MAC handle MII
  * @support_rmii:		Does the MAC handle RMII
  * @support_rgmii:		Does the MAC handle RGMII
+ *
+ * @rx_delay_max:		Maximum raw value for RX delay chain
+ * @tx_delay_max:		Maximum raw value for TX delay chain
+ *				These two also indicate the bitmask for
+ *				the RX and TX delay chain registers. A
+ *				value of zero indicates this is not supported.
  */
 struct emac_variant {
 	u32 default_syscon_value;
@@ -59,6 +65,8 @@ struct emac_variant {
 	bool support_mii;
 	bool support_rmii;
 	bool support_rgmii;
+	u8 rx_delay_max;
+	u8 tx_delay_max;
 };
 
 /* struct sunxi_priv_data - hold all sunxi private data
@@ -95,7 +103,9 @@ static const struct emac_variant emac_variant_h3 = {
 	.soc_has_internal_phy = true,
 	.support_mii = true,
 	.support_rmii = true,
-	.support_rgmii = true
+	.support_rgmii = true,
+	.rx_delay_max = 31,
+	.tx_delay_max = 7,
 };
 
 static const struct emac_variant emac_variant_v3s = {
@@ -110,7 +120,9 @@ static const struct emac_variant emac_variant_a83t = {
 	.syscon_field = &sun8i_syscon_reg_field,
 	.soc_has_internal_phy = false,
 	.support_mii = true,
-	.support_rgmii = true
+	.support_rgmii = true,
+	.rx_delay_max = 31,
+	.tx_delay_max = 7,
 };
 
 static const struct emac_variant emac_variant_a64 = {
@@ -119,7 +131,9 @@ static const struct emac_variant emac_variant_a64 = {
 	.soc_has_internal_phy = false,
 	.support_mii = true,
 	.support_rmii = true,
-	.support_rgmii = true
+	.support_rgmii = true,
+	.rx_delay_max = 31,
+	.tx_delay_max = 7,
 };
 
 #define EMAC_BASIC_CTL0 0x00
@@ -223,9 +237,7 @@ static const struct emac_variant emac_variant_a64 = {
 #define SYSCON_RMII_EN		BIT(13) /* 1: enable RMII (overrides EPIT) */
 
 /* Generic system control EMAC_CLK bits */
-#define SYSCON_ETXDC_MASK		GENMASK(2, 0)
 #define SYSCON_ETXDC_SHIFT		10
-#define SYSCON_ERXDC_MASK		GENMASK(4, 0)
 #define SYSCON_ERXDC_SHIFT		5
 /* EMAC PHY Interface Type */
 #define SYSCON_EPIT			BIT(2) /* 1: RGMII, 0: MII */
@@ -851,8 +863,9 @@ static int sun8i_dwmac_set_syscon(struct stmmac_priv *priv)
 		}
 		val /= 100;
 		dev_dbg(priv->device, "set tx-delay to %x\n", val);
-		if (val <= SYSCON_ETXDC_MASK) {
-			reg &= ~(SYSCON_ETXDC_MASK << SYSCON_ETXDC_SHIFT);
+		if (val <= gmac->variant->tx_delay_max) {
+			reg &= ~(gmac->variant->tx_delay_max <<
+				 SYSCON_ETXDC_SHIFT);
 			reg |= (val << SYSCON_ETXDC_SHIFT);
 		} else {
 			dev_err(priv->device, "Invalid TX clock delay: %d\n",
@@ -868,8 +881,9 @@ static int sun8i_dwmac_set_syscon(struct stmmac_priv *priv)
 		}
 		val /= 100;
 		dev_dbg(priv->device, "set rx-delay to %x\n", val);
-		if (val <= SYSCON_ERXDC_MASK) {
-			reg &= ~(SYSCON_ERXDC_MASK << SYSCON_ERXDC_SHIFT);
+		if (val <= gmac->variant->rx_delay_max) {
+			reg &= ~(gmac->variant->rx_delay_max <<
+				 SYSCON_ERXDC_SHIFT);
 			reg |= (val << SYSCON_ERXDC_SHIFT);
 		} else {
 			dev_err(priv->device, "Invalid RX clock delay: %d\n",
-- 
2.16.2
