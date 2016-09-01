From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 7/9] Simplify the confusing HIWORD_UPDATE scheme.
Date: Thu, 01 Sep 2016 11:44:51 -0500
Message-ID: <20160901164451.14195.61057.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160901163758.14195.15725.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160901163758.14195.15725.stgit-1RhO1Y9PlrlHTL0Zs8A6p/gx64E7kk8eUsxypvmhUTTZJqsBc5GL+g@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


---
 drivers/pci/host/pcie-rockchip.c |   69 +++++++++++++-------------------------
 1 file changed, 23 insertions(+), 46 deletions(-)

diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index 33bf2e1..7f6fe7d 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -115,36 +115,25 @@
 	  (PCIE_ECAM_BUS(bus) | PCIE_ECAM_DEV(dev) | \
 	   PCIE_ECAM_FUNC(func) | PCIE_ECAM_REG(reg))
 
-/*
-  * The higher 16-bit of this register is used for write protection
-  * only if BIT(x + 16) set to 1 the BIT(x) can be written.
-  */
-#define HIWORD_UPDATE(val, mask, shift) \
-	((val) << (shift) | (mask) << ((shift) + 16))
-
 #define RC_REGION_0_ADDR_TRANS_H		0x00000000
 #define RC_REGION_0_ADDR_TRANS_L		0x00000000
 #define RC_REGION_0_PASS_BITS			(25 - 1)
 #define MAX_AXI_WRAPPER_REGION_NUM		33
 #define PCIE_CORE_LCSR_RETRAIN_LINK		BIT(5)
-#define PCIE_CLIENT_CONF_ENABLE			BIT(0)
-#define PCIE_CLIENT_CONF_ENABLE_SHIFT		0
-#define PCIE_CLIENT_CONF_ENABLE_MASK		0x1
-#define PCIE_CLIENT_LINK_TRAIN_ENABLE		1
-#define PCIE_CLIENT_LINK_TRAIN_SHIFT		1
-#define PCIE_CLIENT_LINK_TRAIN_MASK		0x1
-#define PCIE_CLIENT_ARI_ENABLE			BIT(0)
-#define PCIE_CLIENT_ARI_ENABLE_SHIFT		3
-#define PCIE_CLIENT_ARI_ENABLE_MASK		0x1
-#define PCIE_CLIENT_CONF_LANE_NUM(x)		(x / 2)
-#define PCIE_CLIENT_CONF_LANE_NUM_SHIFT		4
-#define PCIE_CLIENT_CONF_LANE_NUM_MASK		0x3
-#define PCIE_CLIENT_MODE_RC			BIT(0)
-#define PCIE_CLIENT_MODE_SHIFT			6
-#define PCIE_CLIENT_MODE_MASK			0x1
-#define PCIE_CLIENT_GEN_SEL_2			1
-#define PCIE_CLIENT_GEN_SEL_SHIFT		7
-#define PCIE_CLIENT_GEN_SEL_MASK		0x1
+
+/*
+ * The higher 16-bit of this register is used for write protection
+ * only if BIT(x + 16) set to 1 the BIT(x) can be written.
+ */
+#define PCIE_CLIENT_CONF_ENABLE		(0x00010000 | 0x0001)
+#define PCIE_CLIENT_LINK_TRAIN_ENABLE	(0x00020000 | 0x0002)
+#define PCIE_CLIENT_ARI_ENABLE		(0x00080000 | 0x0008)
+#define PCIE_CLIENT_CONF_LANE_NUM(x)	(0x00300000 | (((x >> 1) & 3) << 4)
+#define PCIE_CLIENT_MODE_RC		(0x00400000 | 0x0040)
+#define PCIE_CLIENT_GEN_SEL(x)		(0x00800000 | ((x & 1) << 7)
+#define  PCIE_CLIENT_GEN_SEL_0			0
+#define  PCIE_CLIENT_GEN_SEL_2			1
+
 #define PCIE_CLIENT_LINK_STATUS_UP		0x3
 #define PCIE_CLIENT_LINK_STATUS_SHIFT		20
 #define PCIE_CLIENT_LINK_STATUS_MASK		0x3
@@ -423,22 +412,13 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 	}
 
 	rockchip_pcie_write(rockchip,
-		   HIWORD_UPDATE(PCIE_CLIENT_CONF_ENABLE,
-				 PCIE_CLIENT_CONF_ENABLE_MASK,
-				 PCIE_CLIENT_CONF_ENABLE_SHIFT) |
-		   HIWORD_UPDATE(PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes),
-				 PCIE_CLIENT_CONF_LANE_NUM_MASK,
-				 PCIE_CLIENT_CONF_LANE_NUM_SHIFT) |
-		   HIWORD_UPDATE(PCIE_CLIENT_MODE_RC,
-				 PCIE_CLIENT_MODE_MASK,
-				 PCIE_CLIENT_MODE_SHIFT) |
-		   HIWORD_UPDATE(PCIE_CLIENT_ARI_ENABLE,
-				 PCIE_CLIENT_ARI_ENABLE_MASK,
-				 PCIE_CLIENT_ARI_ENABLE_SHIFT) |
-		   HIWORD_UPDATE(PCIE_CLIENT_GEN_SEL_2,
-				 PCIE_CLIENT_GEN_SEL_MASK,
-				 PCIE_CLIENT_GEN_SEL_SHIFT),
-		   PCIE_CLIENT_BASE);
+			    PCIE_CLIENT_CONF_ENABLE |
+			    PCIE_CLIENT_LINK_TRAIN_ENABLE |
+			    PCIE_CLIENT_ARI_ENABLE |
+			    PCIE_CLIENT_CONF_LANE_NUM(rockchip->lanes) |
+			    PCIE_CLIENT_MODE_RC |
+			    PCIE_CLIENT_GEN_SEL(PCIE_CLIENT_GEN_SEL_2),
+			    PCIE_CLIENT_BASE);
 
 	err = phy_power_on(rockchip->phy);
 	if (err) {
@@ -482,11 +462,8 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 				 PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2);
 
 	/* Enable Gen1 training */
-	rockchip_pcie_write(rockchip,
-		   HIWORD_UPDATE(PCIE_CLIENT_LINK_TRAIN_ENABLE,
-				 PCIE_CLIENT_LINK_TRAIN_MASK,
-				 PCIE_CLIENT_LINK_TRAIN_SHIFT),
-		   PCIE_CLIENT_BASE);
+	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
+			    PCIE_CLIENT_BASE);
 
 	gpiod_set_value(rockchip->ep_gpio, 1);
