From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 4/6] phy: renesas: rcar-gen3-usb2: use prefix "has_otg_pins_" for dedicated pins handling
Date: Fri, 15 Dec 2017 14:45:24 +0900
Message-ID: <1513316726-14387-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

To support gpio handling in the future, this patch clean-ups the code
to use prefix "has_otg_pins_" functions.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 130 ++++++++++++++++++++-----------
 1 file changed, 85 insertions(+), 45 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index bca6162..b121f07 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -93,21 +93,21 @@ struct rcar_gen3_chan {
 	bool has_otg_pins;
 };
 
-static void rcar_gen3_phy_usb2_work(struct work_struct *work)
+static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
 {
-	struct rcar_gen3_chan *ch = container_of(work, struct rcar_gen3_chan,
-						 work);
+	void __iomem *usb2_base = ch->base;
+	u32 val = readl(usb2_base + USB2_LINECTRL1);
 
-	if (ch->extcon_host) {
-		extcon_set_state_sync(ch->extcon, EXTCON_USB_HOST, true);
-		extcon_set_state_sync(ch->extcon, EXTCON_USB, false);
-	} else {
-		extcon_set_state_sync(ch->extcon, EXTCON_USB_HOST, false);
-		extcon_set_state_sync(ch->extcon, EXTCON_USB, true);
-	}
+	dev_vdbg(&ch->phy->dev, "%s: %08x, %d, %d\n", __func__, val, dp, dm);
+	val &= ~(USB2_LINECTRL1_DP_RPD | USB2_LINECTRL1_DM_RPD);
+	if (dp)
+		val |= USB2_LINECTRL1_DP_RPD;
+	if (dm)
+		val |= USB2_LINECTRL1_DM_RPD;
+	writel(val, usb2_base + USB2_LINECTRL1);
 }
 
-static void rcar_gen3_set_host_mode(struct rcar_gen3_chan *ch, int host)
+static void has_otg_pins_set_host(struct rcar_gen3_chan *ch, int host)
 {
 	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_COMMCTRL);
@@ -120,21 +120,27 @@ static void rcar_gen3_set_host_mode(struct rcar_gen3_chan *ch, int host)
 	writel(val, usb2_base + USB2_COMMCTRL);
 }
 
-static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
+static bool has_otg_pins_is_host(struct rcar_gen3_chan *ch)
+{
+	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
+}
+
+static irqreturn_t has_otg_pins_irq_handler(struct rcar_gen3_chan *ch)
 {
 	void __iomem *usb2_base = ch->base;
-	u32 val = readl(usb2_base + USB2_LINECTRL1);
+	u32 status = readl(usb2_base + USB2_OBINTSTA);
+	irqreturn_t ret = IRQ_NONE;
 
-	dev_vdbg(&ch->phy->dev, "%s: %08x, %d, %d\n", __func__, val, dp, dm);
-	val &= ~(USB2_LINECTRL1_DP_RPD | USB2_LINECTRL1_DM_RPD);
-	if (dp)
-		val |= USB2_LINECTRL1_DP_RPD;
-	if (dm)
-		val |= USB2_LINECTRL1_DM_RPD;
-	writel(val, usb2_base + USB2_LINECTRL1);
+	if (status & USB2_OBINT_BITS) {
+		dev_vdbg(&ch->phy->dev, "%s: %08x\n", __func__, status);
+		writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
 }
 
-static void rcar_gen3_set_vbus_ctrl(struct rcar_gen3_chan *ch, int enable)
+static void has_otg_pins_set_vbus_ctrl(struct rcar_gen3_chan *ch, int enable)
 {
 	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_ADPCTRL);
@@ -147,7 +153,7 @@ static void rcar_gen3_set_vbus_ctrl(struct rcar_gen3_chan *ch, int enable)
 	writel(val, usb2_base + USB2_ADPCTRL);
 }
 
-static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
+static void has_otg_pins_control_irq(struct rcar_gen3_chan *ch, int enable)
 {
 	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_OBINTEN);
@@ -159,6 +165,57 @@ static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
 	writel(val, usb2_base + USB2_OBINTEN);
 }
 
+static bool has_otg_pins_check_id(struct rcar_gen3_chan *ch)
+{
+	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
+}
+
+static void has_otg_pins_init(struct rcar_gen3_chan *ch)
+{
+	void __iomem *usb2_base = ch->base;
+	u32 val;
+
+	val = readl(usb2_base + USB2_VBCTRL);
+	writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
+	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
+	has_otg_pins_control_irq(ch, 1);
+	val = readl(usb2_base + USB2_ADPCTRL);
+	writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
+	val = readl(usb2_base + USB2_LINECTRL1);
+	rcar_gen3_set_linectrl(ch, 0, 0);
+	writel(val | USB2_LINECTRL1_DPRPD_EN | USB2_LINECTRL1_DMRPD_EN,
+	       usb2_base + USB2_LINECTRL1);
+}
+
+static void rcar_gen3_phy_usb2_work(struct work_struct *work)
+{
+	struct rcar_gen3_chan *ch = container_of(work, struct rcar_gen3_chan,
+						 work);
+
+	if (ch->extcon_host) {
+		extcon_set_state_sync(ch->extcon, EXTCON_USB_HOST, true);
+		extcon_set_state_sync(ch->extcon, EXTCON_USB, false);
+	} else {
+		extcon_set_state_sync(ch->extcon, EXTCON_USB_HOST, false);
+		extcon_set_state_sync(ch->extcon, EXTCON_USB, true);
+	}
+}
+
+static void rcar_gen3_set_host_mode(struct rcar_gen3_chan *ch, int host)
+{
+	has_otg_pins_set_host(ch, host);
+}
+
+static void rcar_gen3_set_vbus_ctrl(struct rcar_gen3_chan *ch, int enable)
+{
+	has_otg_pins_set_vbus_ctrl(ch, enable);
+}
+
+static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
+{
+	has_otg_pins_control_irq(ch, enable);
+}
+
 static void rcar_gen3_init_for_host(struct rcar_gen3_chan *ch)
 {
 	rcar_gen3_set_linectrl(ch, 1, 1);
@@ -214,7 +271,7 @@ static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
 
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 {
-	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
+	return has_otg_pins_check_id(ch);
 }
 
 static void rcar_gen3_device_recognition(struct rcar_gen3_chan *ch)
@@ -227,7 +284,7 @@ static void rcar_gen3_device_recognition(struct rcar_gen3_chan *ch)
 
 static bool rcar_gen3_is_host(struct rcar_gen3_chan *ch)
 {
-	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
+	return has_otg_pins_is_host(ch);
 }
 
 static enum phy_mode rcar_gen3_get_phy_mode(struct rcar_gen3_chan *ch)
@@ -293,19 +350,7 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 
 static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 {
-	void __iomem *usb2_base = ch->base;
-	u32 val;
-
-	val = readl(usb2_base + USB2_VBCTRL);
-	writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
-	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
-	rcar_gen3_control_otg_irq(ch, 1);
-	val = readl(usb2_base + USB2_ADPCTRL);
-	writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
-	val = readl(usb2_base + USB2_LINECTRL1);
-	rcar_gen3_set_linectrl(ch, 0, 0);
-	writel(val | USB2_LINECTRL1_DPRPD_EN | USB2_LINECTRL1_DMRPD_EN,
-	       usb2_base + USB2_LINECTRL1);
+	has_otg_pins_init(ch);
 
 	rcar_gen3_device_recognition(ch);
 }
@@ -380,16 +425,11 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 {
 	struct rcar_gen3_chan *ch = _ch;
-	void __iomem *usb2_base = ch->base;
-	u32 status = readl(usb2_base + USB2_OBINTSTA);
-	irqreturn_t ret = IRQ_NONE;
+	irqreturn_t ret;
 
-	if (status & USB2_OBINT_BITS) {
-		dev_vdbg(&ch->phy->dev, "%s: %08x\n", __func__, status);
-		writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
+	ret = has_otg_pins_irq_handler(ch);
+	if (ret == IRQ_HANDLED)
 		rcar_gen3_device_recognition(ch);
-		ret = IRQ_HANDLED;
-	}
 
 	return ret;
 }
-- 
1.9.1
