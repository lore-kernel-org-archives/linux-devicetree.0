From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v3 2/9] pinctrl: mvebu: remove the offset property for regmap
Date: Mon, 12 Jun 2017 17:34:53 +0200
Message-ID: <9cbcf3247ef2e18381c95645c73c31dade2c2ccb.1497281623.git-series.gregory.clement@free-electrons.com>
References: <cover.d003a5e862e6d732d901a61d1765a349c9a89eef.1497281623.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.d003a5e862e6d732d901a61d1765a349c9a89eef.1497281623.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.d003a5e862e6d732d901a61d1765a349c9a89eef.1497281623.git-series.gregory.clement@free-electrons.com>
References: <cover.d003a5e862e6d732d901a61d1765a349c9a89eef.1497281623.git-series.gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Shadi Ammouri <shadi@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

The offset property of the pinctrl node, when a regmap is used in the
device tree, was never used nor documented in the binding. Moreover, the
compatible string is enough to let the driver know which offset using.

So this patch removes the property and move the information at the driver
level.

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 6 +-----
 drivers/pinctrl/mvebu/pinctrl-mvebu.h | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index e4dda12d371a..163d4614b0f8 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -810,21 +810,17 @@ int mvebu_regmap_mpp_ctrl_set(struct mvebu_mpp_ctrl_data *data,
 }
 
 int mvebu_pinctrl_simple_regmap_probe(struct platform_device *pdev,
-				      struct device *syscon_dev)
+				      struct device *syscon_dev, u32 offset)
 {
 	struct mvebu_pinctrl_soc_info *soc = dev_get_platdata(&pdev->dev);
 	struct mvebu_mpp_ctrl_data *mpp_data;
 	struct regmap *regmap;
-	u32 offset;
 	int i;
 
 	regmap = syscon_node_to_regmap(syscon_dev->of_node);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	if (of_property_read_u32(pdev->dev.of_node, "offset", &offset))
-		return -EINVAL;
-
 	mpp_data = devm_kcalloc(&pdev->dev, soc->ncontrols, sizeof(*mpp_data),
 				GFP_KERNEL);
 	if (!mpp_data)
diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.h b/drivers/pinctrl/mvebu/pinctrl-mvebu.h
index c90704e74884..75bba436bf59 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.h
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.h
@@ -210,6 +210,6 @@ int mvebu_regmap_mpp_ctrl_set(struct mvebu_mpp_ctrl_data *data, unsigned pid,
 int mvebu_pinctrl_probe(struct platform_device *pdev);
 int mvebu_pinctrl_simple_mmio_probe(struct platform_device *pdev);
 int mvebu_pinctrl_simple_regmap_probe(struct platform_device *pdev,
-				      struct device *syscon_dev);
+				      struct device *syscon_dev, u32 offset);
 
 #endif
-- 
git-series 0.9.1
