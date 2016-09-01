From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 8/9] Simplify testing of link status and speed testing.
Date: Thu, 01 Sep 2016 11:44:59 -0500
Message-ID: <20160901164459.14195.59849.stgit@bhelgaas-glaptop2.roam.corp.google.com>
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
 drivers/pci/host/pcie-rockchip.c |   46 +++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index 7f6fe7d..61b0630 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -131,18 +131,16 @@
 #define PCIE_CLIENT_CONF_LANE_NUM(x)	(0x00300000 | (((x >> 1) & 3) << 4)
 #define PCIE_CLIENT_MODE_RC		(0x00400000 | 0x0040)
 #define PCIE_CLIENT_GEN_SEL(x)		(0x00800000 | ((x & 1) << 7)
-#define  PCIE_CLIENT_GEN_SEL_0			0
-#define  PCIE_CLIENT_GEN_SEL_2			1
-
-#define PCIE_CLIENT_LINK_STATUS_UP		0x3
-#define PCIE_CLIENT_LINK_STATUS_SHIFT		20
-#define PCIE_CLIENT_LINK_STATUS_MASK		0x3
-#define PCIE_CORE_PL_CONF_SPEED_5G		0x1
-#define PCIE_CORE_PL_CONF_SPEED_SHIFT		3
-#define PCIE_CORE_PL_CONF_SPEED_MASK		0x3
-#define PCIE_CORE_PL_CONF_LANE_SHIFT		1
-#define PCIE_CORE_PL_CONF_LANE_MASK		0x3
-#define PCIE_CORE_RC_CONF_SCC_SHIFT		16
+#define  PCIE_CLIENT_GEN_SEL_0		0
+#define  PCIE_CLIENT_GEN_SEL_2		1
+
+#define PCIE_CLIENT_LINK_STATUS_UP	0x00300000
+#define PCIE_CLIENT_LINK_STATUS_MASK	0x00300000
+#define PCIE_CORE_PL_CONF_SPEED_5G	0x00000008
+#define PCIE_CORE_PL_CONF_SPEED_MASK	0x00000018
+#define PCIE_CORE_PL_CONF_LANE_MASK	0x00000006
+#define PCIE_CORE_PL_CONF_LANE_SHIFT	1
+#define PCIE_CORE_RC_CONF_SCC_SHIFT	16
 
 #define ROCKCHIP_PCIE_RPIFR1_INTR_MASK		GENMASK(8, 5)
 #define ROCKCHIP_PCIE_RPIFR1_INTR_SHIFT		5
@@ -472,9 +470,8 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 
 	for (;;) {
 		status = rockchip_pcie_read(rockchip, PCIE_CLIENT_BASIC_STATUS1);
-		if (((status >> PCIE_CLIENT_LINK_STATUS_SHIFT) &
-		      PCIE_CLIENT_LINK_STATUS_MASK) ==
-		      PCIE_CLIENT_LINK_STATUS_UP) {
+		if ((status & PCIE_CLIENT_LINK_STATUS_MASK) ==
+		    PCIE_CLIENT_LINK_STATUS_UP) {
 			dev_dbg(dev, "PCIe link training gen1 pass!\n");
 			break;
 		}
@@ -490,9 +487,8 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 	/* Double check gen1 training */
 	if (err) {
 		status = rockchip_pcie_read(rockchip, PCIE_CLIENT_BASIC_STATUS1);
-		err = (((status >> PCIE_CLIENT_LINK_STATUS_SHIFT) &
-			PCIE_CLIENT_LINK_STATUS_MASK) ==
-			PCIE_CLIENT_LINK_STATUS_UP) ? 0 : -ETIMEDOUT;
+		err = ((status & PCIE_CLIENT_LINK_STATUS_MASK) ==
+		       PCIE_CLIENT_LINK_STATUS_UP) ? 0 : -ETIMEDOUT;
 		if (err) {
 			dev_err(dev, "PCIe link training gen1 timeout!\n");
 			return err;
@@ -512,9 +508,8 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 	timeout = jiffies + msecs_to_jiffies(500);
 	for (;;) {
 		status = rockchip_pcie_read(rockchip, PCIE_CORE_CTRL_MGMT_BASE);
-		if (((status >> PCIE_CORE_PL_CONF_SPEED_SHIFT) &
-		     PCIE_CORE_PL_CONF_SPEED_MASK) ==
-		     PCIE_CORE_PL_CONF_SPEED_5G) {
+		if ((status & PCIE_CORE_PL_CONF_SPEED_MASK) ==
+		    PCIE_CORE_PL_CONF_SPEED_5G) {
 			dev_dbg(dev, "PCIe link training gen2 pass!\n");
 			break;
 		}
@@ -530,17 +525,16 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 	/* Double check gen2 training */
 	if (err) {
 		status = rockchip_pcie_read(rockchip, PCIE_CORE_CTRL_MGMT_BASE);
-		err = (((status >> PCIE_CORE_PL_CONF_SPEED_SHIFT) &
-			PCIE_CORE_PL_CONF_SPEED_MASK) ==
-			PCIE_CORE_PL_CONF_SPEED_5G) ? 0 : -ETIMEDOUT;
+		err = ((status & PCIE_CORE_PL_CONF_SPEED_MASK) ==
+		       PCIE_CORE_PL_CONF_SPEED_5G) ? 0 : -ETIMEDOUT;
 		if (err)
 			dev_dbg(dev, "PCIe link training gen2 timeout, fall back to gen1!\n");
 	}
 
 	/* Check the final link width from negotiated lane counter from MGMT */
 	status = rockchip_pcie_read(rockchip, PCIE_CORE_CTRL_MGMT_BASE);
-	status =  0x1 << ((status >> PCIE_CORE_PL_CONF_LANE_SHIFT) &
-			   PCIE_CORE_PL_CONF_LANE_MASK);
+	status =  0x1 << ((status & PCIE_CORE_PL_CONF_LANE_MASK) >>
+			  PCIE_CORE_PL_CONF_LANE_MASK);
 	dev_dbg(dev, "current link width is x%d\n", status);
 
 	rockchip_pcie_write(rockchip, ROCKCHIP_VENDOR_ID, PCIE_RC_CONFIG_BASE);
