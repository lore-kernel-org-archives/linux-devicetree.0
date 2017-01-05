From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 2/2] phy: rockchip-emmc: try to get drive impedance from DT
Date: Thu,  5 Jan 2017 17:31:22 +0800
Message-ID: <1483608682-226716-2-git-send-email-shawn.lin@rock-chips.com>
References: <1483608682-226716-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1483608682-226716-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Try to get drive impedance from DT and use it, otherwise
use 50ohm by default in order not to break the existing boards
as 50ohm works fine for them already.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 drivers/phy/phy-rockchip-emmc.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/phy-rockchip-emmc.c b/drivers/phy/phy-rockchip-emmc.c
index f1b24f1..7fd4a3e 100644
--- a/drivers/phy/phy-rockchip-emmc.c
+++ b/drivers/phy/phy-rockchip-emmc.c
@@ -78,6 +78,7 @@
 
 struct rockchip_emmc_phy {
 	unsigned int	reg_offset;
+	unsigned int	drive_impedance;
 	struct regmap	*reg_base;
 	struct clk	*emmcclk;
 };
@@ -288,7 +289,7 @@ static int rockchip_emmc_phy_power_on(struct phy *phy)
 	/* Drive impedance: 50 Ohm */
 	regmap_write(rk_phy->reg_base,
 		     rk_phy->reg_offset + GRF_EMMCPHY_CON6,
-		     HIWORD_UPDATE(PHYCTRL_DR_50OHM,
+		     HIWORD_UPDATE(rk_phy->drive_impedance,
 				   PHYCTRL_DR_MASK,
 				   PHYCTRL_DR_SHIFT));
 
@@ -346,6 +347,32 @@ static int rockchip_emmc_phy_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	rk_phy->drive_impedance = PHYCTRL_DR_50OHM;
+	if (!of_property_read_u32(dev->of_node, "drive_impedance",
+				  &rk_phy->drive_impedance)) {
+		switch (rk_phy->drive_impedance) {
+		case 33:
+			rk_phy->drive_impedance = PHYCTRL_DR_33OHM;
+			break;
+		case 40:
+			rk_phy->drive_impedance = PHYCTRL_DR_40OHM;
+			break;
+		case 50:
+			rk_phy->drive_impedance = PHYCTRL_DR_50OHM;
+			break;
+		case 66:
+			rk_phy->drive_impedance = PHYCTRL_DR_66OHM;
+			break;
+		case 100:
+			rk_phy->drive_impedance = PHYCTRL_DR_100OHM;
+			break;
+		default:
+			dev_info(dev, "invalid drive impedance.\n");
+			rk_phy->drive_impedance = PHYCTRL_DR_50OHM;
+			break;
+		}
+	}
+
 	rk_phy->reg_offset = reg_offset;
 	rk_phy->reg_base = grf;
 
-- 
1.9.1
