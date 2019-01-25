From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 03/10] usb: ehci-orion: avoid double PHY initialization
Date: Fri, 25 Jan 2019 11:39:17 +0100
Message-ID: <20190125103925.15753-4-miquel.raynal@bootlin.com>
References: <20190125103925.15753-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125103925.15753-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, linux-usb@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

No need to initialize the PHY from the driver's probe. It is done by
the core automatically and doing it twice would increment the
phy->powercount counter to 2 instead of 1. During later suspend
operation, the counter will be decremented to one, no phy->power_off()
will occur and worse than that, the following phy->power_on() at
resume time will also be skipped, failing the whole S2RAM operation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/host/ehci-orion.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/host/ehci-orion.c b/drivers/usb/host/ehci-orion.c
index 1ad72647a069..3109f082949e 100644
--- a/drivers/usb/host/ehci-orion.c
+++ b/drivers/usb/host/ehci-orion.c
@@ -257,15 +257,7 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->phy)) {
 		err = PTR_ERR(priv->phy);
 		if (err != -ENOSYS)
-			goto err_phy_get;
-	} else {
-		err = phy_init(priv->phy);
-		if (err)
-			goto err_phy_init;
-
-		err = phy_power_on(priv->phy);
-		if (err)
-			goto err_phy_power_on;
+			goto err_dis_clk;
 	}
 
 	/*
@@ -297,19 +289,12 @@ static int ehci_orion_drv_probe(struct platform_device *pdev)
 
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (err)
-		goto err_add_hcd;
+		goto err_dis_clk;
 
 	device_wakeup_enable(hcd->self.controller);
 	return 0;
 
-err_add_hcd:
-	if (!IS_ERR(priv->phy))
-		phy_power_off(priv->phy);
-err_phy_power_on:
-	if (!IS_ERR(priv->phy))
-		phy_exit(priv->phy);
-err_phy_init:
-err_phy_get:
+err_dis_clk:
 	if (!IS_ERR(priv->clk))
 		clk_disable_unprepare(priv->clk);
 	usb_put_hcd(hcd);
@@ -327,11 +312,6 @@ static int ehci_orion_drv_remove(struct platform_device *pdev)
 
 	usb_remove_hcd(hcd);
 
-	if (!IS_ERR(priv->phy)) {
-		phy_power_off(priv->phy);
-		phy_exit(priv->phy);
-	}
-
 	if (!IS_ERR(priv->clk))
 		clk_disable_unprepare(priv->clk);
 
-- 
2.19.1
