From: Arun Parameswaran <arun.parameswaran@broadcom.com>
Subject: [PATCH v3 4/8] net: phy: Disable external master access in bcm mdio mux driver
Date: Wed,  1 Aug 2018 10:56:22 -0700
Message-ID: <1533146186-8374-5-git-send-email-arun.parameswaran@broadcom.com>
References: <1533146186-8374-1-git-send-email-arun.parameswaran@broadcom.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1533146186-8374-1-git-send-email-arun.parameswaran@broadcom.com>
Sender: netdev-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Arun Parameswaran <arun.parameswaran@broadcom.com>
List-Id: devicetree@vger.kernel.org

Configure the scan control register in the Broadcom iProc
mdio mux driver to disable access to external master.

In some SoC's, the scan control register defaults to an incorrect
value.

Signed-off-by: Arun Parameswaran <arun.parameswaran@broadcom.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/phy/mdio-mux-bcm-iproc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/net/phy/mdio-mux-bcm-iproc.c b/drivers/net/phy/mdio-mux-bcm-iproc.c
index 48bb74a..c36ce4b 100644
--- a/drivers/net/phy/mdio-mux-bcm-iproc.c
+++ b/drivers/net/phy/mdio-mux-bcm-iproc.c
@@ -22,6 +22,9 @@
 #include <linux/mdio-mux.h>
 #include <linux/delay.h>
 
+#define MDIO_SCAN_CTRL_OFFSET		0x008
+#define MDIO_SCAN_CTRL_OVRIDE_EXT_MSTR	28
+
 #define MDIO_PARAM_OFFSET		0x23c
 #define MDIO_PARAM_MIIM_CYCLE		29
 #define MDIO_PARAM_INTERNAL_SEL		25
@@ -53,6 +56,16 @@ struct iproc_mdiomux_desc {
 	struct mii_bus *mii_bus;
 };
 
+static void mdio_mux_iproc_config(struct iproc_mdiomux_desc *md)
+{
+	u32 val;
+
+	/* Disable external mdio master access */
+	val = readl(md->base + MDIO_SCAN_CTRL_OFFSET);
+	val |= BIT(MDIO_SCAN_CTRL_OVRIDE_EXT_MSTR);
+	writel(val, md->base + MDIO_SCAN_CTRL_OFFSET);
+}
+
 static int iproc_mdio_wait_for_idle(void __iomem *base, bool result)
 {
 	unsigned int timeout = 1000; /* loop for 1s */
@@ -216,6 +229,8 @@ static int mdio_mux_iproc_probe(struct platform_device *pdev)
 		goto out_register;
 	}
 
+	mdio_mux_iproc_config(md);
+
 	dev_info(md->dev, "iProc mdiomux registered\n");
 	return 0;
 
-- 
1.9.1
