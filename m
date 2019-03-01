From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [PATCH 1/3] phy: rockchip-emmc: Allow to set drive impedance via DTS.
Date: Fri,  1 Mar 2019 16:33:43 +0100
Message-ID: <20190301153348.29870-1-christoph.muellner@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, shawn.lin@rock-chips.com
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, Viresh Kumar <viresh.kumar@linaro.org>, Randy Li <ayaka@soulik.info>, Douglas Anderson <dianders@chromium.org>, Vicente Bergas <vicencb@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, linux-rockchip@lists.infradead.org, Tony Xie <tony.xie@rock-chips.com>, Klaus Goger <klaus.goger@theobroma-systems.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Ezequiel Garcia <ezequiel@collabora.com>, linux-arm-kernel@lists.infradead.org, Christoph Muellner <christoph.muellner@theobroma-systems.com>
List-Id: devicetree@vger.kernel.org

The rockchip-emmc PHY can be configured with different
drive impedance values. Currenlty a value of 50 Ohm is
hard coded into the driver.

This patch introduces the DTS property 'drive-impedance-ohm'
for the rockchip-emmc phy node, which uses the value from the DTS
to setup the drive impedance accordingly.

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
---
 drivers/phy/rockchip/phy-rockchip-emmc.c | 38 ++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-emmc.c b/drivers/phy/rockchip/phy-rockchip-emmc.c
index 19bf84f0bc67..5413fa73dd45 100644
--- a/drivers/phy/rockchip/phy-rockchip-emmc.c
+++ b/drivers/phy/rockchip/phy-rockchip-emmc.c
@@ -87,6 +87,7 @@ struct rockchip_emmc_phy {
 	unsigned int	reg_offset;
 	struct regmap	*reg_base;
 	struct clk	*emmcclk;
+	unsigned int drive_impedance;
 };
 
 static int rockchip_emmc_phy_power(struct phy *phy, bool on_off)
@@ -281,10 +282,10 @@ static int rockchip_emmc_phy_power_on(struct phy *phy)
 {
 	struct rockchip_emmc_phy *rk_phy = phy_get_drvdata(phy);
 
-	/* Drive impedance: 50 Ohm */
+	/* Drive impedance: from DTS */
 	regmap_write(rk_phy->reg_base,
 		     rk_phy->reg_offset + GRF_EMMCPHY_CON6,
-		     HIWORD_UPDATE(PHYCTRL_DR_50OHM,
+		     HIWORD_UPDATE(rk_phy->drive_impedance,
 				   PHYCTRL_DR_MASK,
 				   PHYCTRL_DR_SHIFT));
 
@@ -314,6 +315,28 @@ static const struct phy_ops ops = {
 	.owner		= THIS_MODULE,
 };
 
+static u32 convert_drive_impedance_ohm(struct platform_device *pdev, u32 dr_ohm)
+{
+	switch (dr_ohm) {
+	case 100:
+		return PHYCTRL_DR_100OHM;
+	case 66:
+		return PHYCTRL_DR_66OHM;
+	case 50:
+		return PHYCTRL_DR_50OHM;
+	case 40:
+		return PHYCTRL_DR_40OHM;
+	case 33:
+		return PHYCTRL_DR_33OHM;
+	}
+
+	dev_warn(&pdev->dev,
+		"Invalid value %u for drive-impedance-ohm. "
+		"Falling back to 50 Ohm.\n",
+		dr_ohm);
+	return PHYCTRL_DR_50OHM;
+}
+
 static int rockchip_emmc_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -322,6 +345,7 @@ static int rockchip_emmc_phy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct regmap *grf;
 	unsigned int reg_offset;
+	u32 val;
 
 	if (!dev->parent || !dev->parent->of_node)
 		return -ENODEV;
@@ -345,6 +369,16 @@ static int rockchip_emmc_phy_probe(struct platform_device *pdev)
 	rk_phy->reg_offset = reg_offset;
 	rk_phy->reg_base = grf;
 
+	if (of_property_read_u32(dev->of_node, "drive-impedance-ohm", &val)) {
+		dev_info(dev,
+			"Missing drive-impedance-ohm property in node %s "
+			"Falling back to 50 Ohm.\n",
+			dev->of_node->name);
+		rk_phy->drive_impedance = PHYCTRL_DR_50OHM;
+	} else {
+		rk_phy->drive_impedance = convert_drive_impedance_ohm(pdev, val);
+	}
+
 	generic_phy = devm_phy_create(dev, dev->of_node, &ops);
 	if (IS_ERR(generic_phy)) {
 		dev_err(dev, "failed to create PHY\n");
-- 
2.11.0
