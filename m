From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 3/5] net: stmmac: dwmac-sun8i: Allow getting
 syscon regmap from device
Date: Wed, 11 Apr 2018 22:16:39 +0800
Message-ID: <20180411141641.14675-4-icenowy@aosc.io>
References: <20180411141641.14675-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBXVTXDLAKGQEYSBGXPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180411141641.14675-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

On the Allwinner R40 SoC, the "GMAC clock" register is in the CCU
address space; on the A64 SoC this register is in the SRAM controller
address space, and with a different offset.

To access the register from another device and hide the internal
difference between the device, let it register a regmap named
"emac-clock". We can then get the device from the phandle, and
retrieve the regmap with dev_get_regmap(); in this situation the
regmap_field will be set up to access the only register in the regmap.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
[Icenowy: change to use regmaps with single register, change commit
 message]
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 48 ++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 1037f6c78bca..b61210c0d415 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -85,6 +85,13 @@ const struct reg_field old_syscon_reg_field = {
 	.msb = 31,
 };
 
+/* Specially exported regmap which contains only EMAC register */
+const struct reg_field single_reg_field = {
+	.reg = 0,
+	.lsb = 0,
+	.msb = 31,
+};
+
 static const struct emac_variant emac_variant_h3 = {
 	.default_syscon_value = 0x58000,
 	.soc_has_internal_phy = true,
@@ -979,6 +986,44 @@ static struct mac_device_info *sun8i_dwmac_setup(void *ppriv)
 	return mac;
 }
 
+static struct regmap *sun8i_dwmac_get_emac_regmap(struct sunxi_priv_data *emac,
+						  struct device_node *node)
+{
+	struct device_node *syscon_node;
+	struct platform_device *syscon_pdev = NULL;
+	struct regmap *regmap = NULL;
+
+	syscon_node = of_parse_phandle(node, "syscon", 0);
+	if (!syscon_node)
+		return ERR_PTR(-ENODEV);
+
+	if (of_device_is_compatible(syscon_node, "syscon")) {
+		regmap = syscon_regmap_lookup_by_phandle(node, "syscon");
+
+		emac->emac_reg_field = &old_syscon_reg_field;
+	} else {
+		syscon_pdev = of_find_device_by_node(syscon_node);
+		if (!syscon_pdev) {
+			/* platform device might not be probed yet */
+			regmap = ERR_PTR(-EPROBE_DEFER);
+			goto out_put_node;
+		}
+
+		/* If no regmap is found then trap into error */
+		regmap = dev_get_regmap(&syscon_pdev->dev, "emac-clock");
+		if (!regmap)
+			regmap = ERR_PTR(-EINVAL);
+
+		emac->emac_reg_field = &single_reg_field;
+	}
+
+	if (syscon_pdev)
+		platform_device_put(syscon_pdev);
+out_put_node:
+	of_node_put(syscon_node);
+	return regmap;
+}
+
 static int sun8i_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -1023,13 +1068,12 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 		gmac->regulator = NULL;
 	}
 
-	regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "syscon");
+	regmap = sun8i_dwmac_get_emac_regmap(gmac, pdev->dev.of_node);
 	if (IS_ERR(regmap)) {
 		ret = PTR_ERR(regmap);
 		dev_err(&pdev->dev, "Unable to map syscon: %d\n", ret);
 		return ret;
 	}
-	gmac->emac_reg_field = old_syscon_reg_field;
 
 	gmac->regmap_field = devm_regmap_field_alloc(dev, regmap,
 						     *gmac->emac_reg_field);
-- 
2.15.1
