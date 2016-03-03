From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/3] phy: rcar-gen3-usb2: remove unnecesary struct rcar_gen3_data
Date: Thu, 3 Mar 2016 19:09:04 +0900
Message-ID: <1456999746-2800-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1456999746-2800-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1456999746-2800-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Since this driver uses the struct rcar_gen3_data in struct rcar_gen3_chan
only, we can remove the rcar_gen3_data.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/phy-rcar-gen3-usb2.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
index 257be74..3c647cd 100644
--- a/drivers/phy/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/phy-rcar-gen3-usb2.c
@@ -74,20 +74,15 @@
 #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
-struct rcar_gen3_data {
-	void __iomem *base;
-	struct clk *clk;
-};
-
 struct rcar_gen3_chan {
-	struct rcar_gen3_data usb2;
+	void __iomem *base;
 	struct phy *phy;
 	bool has_otg;
 };
 
 static void rcar_gen3_set_host_mode(struct rcar_gen3_chan *ch, int host)
 {
-	void __iomem *usb2_base = ch->usb2.base;
+	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_COMMCTRL);
 
 	dev_vdbg(&ch->phy->dev, "%s: %08x, %d\n", __func__, val, host);
@@ -100,7 +95,7 @@ static void rcar_gen3_set_host_mode(struct rcar_gen3_chan *ch, int host)
 
 static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
 {
-	void __iomem *usb2_base = ch->usb2.base;
+	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_LINECTRL1);
 
 	dev_vdbg(&ch->phy->dev, "%s: %08x, %d, %d\n", __func__, val, dp, dm);
@@ -114,7 +109,7 @@ static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
 
 static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 {
-	void __iomem *usb2_base = ch->usb2.base;
+	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_ADPCTRL);
 
 	dev_vdbg(&ch->phy->dev, "%s: %08x, %d\n", __func__, val, vbus);
@@ -141,13 +136,13 @@ static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
 
 static bool rcar_gen3_check_vbus(struct rcar_gen3_chan *ch)
 {
-	return !!(readl(ch->usb2.base + USB2_ADPCTRL) &
+	return !!(readl(ch->base + USB2_ADPCTRL) &
 		  USB2_ADPCTRL_OTGSESSVLD);
 }
 
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 {
-	return !!(readl(ch->usb2.base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
+	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
 }
 
 static void rcar_gen3_device_recognition(struct rcar_gen3_chan *ch)
@@ -166,7 +161,7 @@ static void rcar_gen3_device_recognition(struct rcar_gen3_chan *ch)
 
 static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 {
-	void __iomem *usb2_base = ch->usb2.base;
+	void __iomem *usb2_base = ch->base;
 	u32 val;
 
 	val = readl(usb2_base + USB2_VBCTRL);
@@ -187,7 +182,7 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 static int rcar_gen3_phy_usb2_init(struct phy *p)
 {
 	struct rcar_gen3_chan *channel = phy_get_drvdata(p);
-	void __iomem *usb2_base = channel->usb2.base;
+	void __iomem *usb2_base = channel->base;
 
 	/* Initialize USB2 part */
 	writel(USB2_INT_ENABLE_INIT, usb2_base + USB2_INT_ENABLE);
@@ -205,7 +200,7 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
 {
 	struct rcar_gen3_chan *channel = phy_get_drvdata(p);
 
-	writel(0, channel->usb2.base + USB2_INT_ENABLE);
+	writel(0, channel->base + USB2_INT_ENABLE);
 
 	return 0;
 }
@@ -213,7 +208,7 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
 static int rcar_gen3_phy_usb2_power_on(struct phy *p)
 {
 	struct rcar_gen3_chan *channel = phy_get_drvdata(p);
-	void __iomem *usb2_base = channel->usb2.base;
+	void __iomem *usb2_base = channel->base;
 	u32 val;
 
 	val = readl(usb2_base + USB2_USBCTR);
@@ -235,7 +230,7 @@ static struct phy_ops rcar_gen3_phy_usb2_ops = {
 static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 {
 	struct rcar_gen3_chan *ch = _ch;
-	void __iomem *usb2_base = ch->usb2.base;
+	void __iomem *usb2_base = ch->base;
 	u32 status = readl(usb2_base + USB2_OBINTSTA);
 	irqreturn_t ret = IRQ_NONE;
 
@@ -274,9 +269,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	channel->usb2.base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(channel->usb2.base))
-		return PTR_ERR(channel->usb2.base);
+	channel->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(channel->base))
+		return PTR_ERR(channel->base);
 
 	/* call request_irq for OTG */
 	irq = platform_get_irq(pdev, 0);
-- 
1.9.1
