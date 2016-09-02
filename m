From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 15/15] Move msleeps to address Guenter's comments.
Date: Fri, 02 Sep 2016 10:56:02 -0500
Message-ID: <20160902155602.8650.82778.stgit@bhelgaas-glaptop2.roam.corp.google.com>
References: <20160902154501.8650.99790.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160902154501.8650.99790.stgit-1RhO1Y9PlrlHTL0Zs8A6p/gx64E7kk8eUsxypvmhUTTZJqsBc5GL+g@public.gmane.org>
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
 drivers/pci/host/pcie-rockchip.c |   35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index e33d2f7..d293a62 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -481,24 +481,12 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 			break;
 		}
 
-		msleep(20);
-
-		if (!time_before(jiffies, timeout)) {
-			err = -ETIMEDOUT;
-			break;
-		}
-	}
-
-	/* Double check gen1 training */
-	if (err) {
-		status = rockchip_pcie_read(rockchip,
-					    PCIE_CLIENT_BASIC_STATUS1);
-		err = ((status & PCIE_CLIENT_LINK_STATUS_MASK) ==
-		       PCIE_CLIENT_LINK_STATUS_UP) ? 0 : -ETIMEDOUT;
-		if (err) {
+		if (time_after(jiffies, timeout)) {
 			dev_err(dev, "PCIe link training gen1 timeout!\n");
-			return err;
+			return -ETIMEDOUT;
 		}
+
+		msleep(20);
 	}
 
 	/*
@@ -518,21 +506,12 @@ static int rockchip_pcie_init_port(struct rockchip_pcie *rockchip)
 			break;
 		}
 
-		msleep(20);
-
-		if (!time_before(jiffies, timeout)) {
-			err = -ETIMEDOUT;
+		if (time_after(jiffies, timeout)) {
+			dev_dbg(dev, "PCIe link training gen2 timeout, fall back to gen1!\n");
 			break;
 		}
-	}
 
-	/* Double check gen2 training */
-	if (err) {
-		status = rockchip_pcie_read(rockchip, PCIE_CORE_CTRL);
-		err = ((status & PCIE_CORE_PL_CONF_SPEED_MASK) ==
-		       PCIE_CORE_PL_CONF_SPEED_5G) ? 0 : -ETIMEDOUT;
-		if (err)
-			dev_dbg(dev, "PCIe link training gen2 timeout, fall back to gen1!\n");
+		msleep(20);
 	}
 
 	/* Check the final link width from negotiated lane counter from MGMT */
