From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: [PATCH v3 8/8] net: phy: Add pm support to Broadcom iProc mdio mux driver
Date: Wed,  1 Aug 2018 10:56:26 -0700
Message-ID: <1533146186-8374-9-git-send-email-arun.parameswaran@broadcom.com>
References: <1533146186-8374-1-git-send-email-arun.parameswaran@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533146186-8374-1-git-send-email-arun.parameswaran@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Arun Parameswaran <arun.parameswaran@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add support for suspend and resume to the Broadcom iProc mdio
mux driver.

Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
---
 drivers/net/phy/mdio-mux-bcm-iproc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/phy/mdio-mux-bcm-iproc.c b/drivers/net/phy/mdio-mux-bcm-iproc.c
index 5127010..4e2c51b 100644
--- a/drivers/net/phy/mdio-mux-bcm-iproc.c
+++ b/drivers/net/phy/mdio-mux-bcm-iproc.c
@@ -289,6 +289,32 @@ static int mdio_mux_iproc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int mdio_mux_iproc_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct iproc_mdiomux_desc *md = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(md->core_clk);
+
+	return 0;
+}
+
+static int mdio_mux_iproc_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct iproc_mdiomux_desc *md = platform_get_drvdata(pdev);
+
+	clk_prepare_enable(md->core_clk);
+	mdio_mux_iproc_config(md);
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(mdio_mux_iproc_pm_ops,
+			 mdio_mux_iproc_suspend, mdio_mux_iproc_resume);
+
 static const struct of_device_id mdio_mux_iproc_match[] = {
 	{
 		.compatible = "brcm,mdio-mux-iproc",
@@ -301,6 +327,7 @@ static int mdio_mux_iproc_remove(struct platform_device *pdev)
 	.driver = {
 		.name		= "mdio-mux-iproc",
 		.of_match_table = mdio_mux_iproc_match,
+		.pm		= &mdio_mux_iproc_pm_ops,
 	},
 	.probe		= mdio_mux_iproc_probe,
 	.remove		= mdio_mux_iproc_remove,
-- 
1.9.1
