From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH net-next 07/12] net: stmmac: dwmac-sun8i: Allow getting syscon
 regmap from CCU device
Date: Sat, 17 Mar 2018 17:28:52 +0800
Message-ID: <20180317092857.4396-8-wens@csie.org>
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

On the Allwinner R40 SoC, the "GMAC clock" register is in the CCU
address space. Using a standard syscon to access it provides no
coordination with the CCU driver for register access. Neither does
it prevent this and other drivers from accessing other, maybe critical,
clock control registers.

Instead, for these types of setups, we let the CCU register a proper
device and a regmap tied to it. We can then get the device from the
phandle, and retrieve the regmap with dev_get_regmap().

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 38 ++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index de93f0faf58d..a51175bcfd11 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -43,6 +43,9 @@
  *				and used as a good starting value in case of the
  *				boot process(uboot) leave some stuff.
  * @syscon_field		reg_field for the syscon's gmac register
+ * @syscon_from_dev		syscon regmap is in ccu address space and
+ *				needs to be retrieved using dev_get_regmap()
+ *				instead of syscon_regmap_lookup_by_phandle()
  * @soc_has_internal_phy:	Does the MAC embed an internal PHY
  * @support_mii:		Does the MAC handle MII
  * @support_rmii:		Does the MAC handle RMII
@@ -51,6 +54,7 @@
 struct emac_variant {
 	u32 default_syscon_value;
 	const struct reg_field *syscon_field;
+	bool syscon_from_dev;
 	bool soc_has_internal_phy;
 	bool support_mii;
 	bool support_rmii;
@@ -983,6 +987,34 @@ static struct mac_device_info *sun8i_dwmac_setup(void *ppriv)
 	return mac;
 }
 
+static struct regmap *sun8i_dwmac_get_syscon_from_dev(struct device_node *node)
+{
+	struct device_node *syscon_node;
+	struct platform_device *syscon_pdev;
+	struct regmap *regmap = NULL;
+
+	syscon_node = of_parse_phandle(node, "syscon", 0);
+	if (!syscon_node)
+		return ERR_PTR(-ENODEV);
+
+	syscon_pdev = of_find_device_by_node(syscon_node);
+	if (!syscon_pdev) {
+		/* platform device might not be probed yet */
+		regmap = ERR_PTR(-EPROBE_DEFER);
+		goto out_put_node;
+	}
+
+	/* If no regmap is found then the other device driver is at fault */
+	regmap = dev_get_regmap(&syscon_pdev->dev, NULL);
+	if (!regmap)
+		regmap = ERR_PTR(-EINVAL);
+
+	platform_device_put(syscon_pdev);
+out_put_node:
+	of_node_put(syscon_node);
+	return regmap;
+}
+
 static int sun8i_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -1027,7 +1059,11 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 		gmac->regulator = NULL;
 	}
 
-	regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "syscon");
+	if (gmac->variant->syscon_from_dev)
+		regmap = sun8i_dwmac_get_syscon_from_dev(pdev->dev.of_node);
+	else
+		regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+							 "syscon");
 	if (IS_ERR(regmap)) {
 		ret = PTR_ERR(regmap);
 		dev_err(&pdev->dev, "Unable to map syscon: %d\n", ret);
-- 
2.16.2
