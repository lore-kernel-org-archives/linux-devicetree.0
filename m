From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Use pdev's device pointer on dev_vdbg()
Date: Mon,  1 Apr 2019 21:01:22 +0900
Message-ID: <1554120083-29990-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

To implement multiple phy instances in the future, this patch uses
pdev's device pointer on dev_vdbg() instead of the phy's device
pointer.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 0a34782..4bdb2ed 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -80,6 +80,7 @@
 
 struct rcar_gen3_chan {
 	void __iomem *base;
+	struct device *dev;	/* platform_device's device */
 	struct extcon_dev *extcon;
 	struct phy *phy;
 	struct regulator *vbus;
@@ -120,7 +121,7 @@ static void rcar_gen3_set_host_mode(struct rcar_gen3_chan *ch, int host)
 	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_COMMCTRL);
 
-	dev_vdbg(&ch->phy->dev, "%s: %08x, %d\n", __func__, val, host);
+	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, host);
 	if (host)
 		val &= ~USB2_COMMCTRL_OTG_PERI;
 	else
@@ -133,7 +134,7 @@ static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
 	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_LINECTRL1);
 
-	dev_vdbg(&ch->phy->dev, "%s: %08x, %d, %d\n", __func__, val, dp, dm);
+	dev_vdbg(ch->dev, "%s: %08x, %d, %d\n", __func__, val, dp, dm);
 	val &= ~(USB2_LINECTRL1_DP_RPD | USB2_LINECTRL1_DM_RPD);
 	if (dp)
 		val |= USB2_LINECTRL1_DP_RPD;
@@ -147,7 +148,7 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_ADPCTRL);
 
-	dev_vdbg(&ch->phy->dev, "%s: %08x, %d\n", __func__, val, vbus);
+	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
 	if (vbus)
 		val |= USB2_ADPCTRL_DRVVBUS;
 	else
@@ -401,7 +402,7 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 	irqreturn_t ret = IRQ_NONE;
 
 	if (status & USB2_OBINT_BITS) {
-		dev_vdbg(&ch->phy->dev, "%s: %08x\n", __func__, status);
+		dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
 		writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
 		rcar_gen3_device_recognition(ch);
 		ret = IRQ_HANDLED;
@@ -499,6 +500,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, channel);
 	phy_set_drvdata(channel->phy, channel);
+	channel->dev = dev;
 
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(provider)) {
-- 
2.7.4
