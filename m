From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/5] phy: renesas: rcar-gen3-usb2: unify OBINTEN handling
Date: Wed, 13 Dec 2017 15:27:37 +0900
Message-ID: <1513146460-20326-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513146460-20326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1513146460-20326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch unifies the OBINTEN handling to clean-up the code.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index c22d65a..beeaa30 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -147,6 +147,18 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 	writel(val, usb2_base + USB2_ADPCTRL);
 }
 
+static void rcar_gen3_enable_otg_irq(struct rcar_gen3_chan *ch, int enable)
+{
+	void __iomem *usb2_base = ch->base;
+	u32 val = readl(usb2_base + USB2_OBINTEN);
+
+	if (enable)
+		val |= USB2_OBINT_BITS;
+	else
+		val &= ~USB2_OBINT_BITS;
+	writel(val, usb2_base + USB2_OBINTEN);
+}
+
 static void rcar_gen3_init_for_host(struct rcar_gen3_chan *ch)
 {
 	rcar_gen3_set_linectrl(ch, 1, 1);
@@ -192,16 +204,12 @@ static void rcar_gen3_init_for_a_peri(struct rcar_gen3_chan *ch)
 
 static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
 {
-	void __iomem *usb2_base = ch->base;
-	u32 val;
-
-	val = readl(usb2_base + USB2_OBINTEN);
-	writel(val & ~USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
+	rcar_gen3_enable_otg_irq(ch, 0);
 
 	rcar_gen3_enable_vbus_ctrl(ch, 0);
 	rcar_gen3_init_for_host(ch);
 
-	writel(val | USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
+	rcar_gen3_enable_otg_irq(ch, 1);
 }
 
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
@@ -291,8 +299,7 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	val = readl(usb2_base + USB2_VBCTRL);
 	writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
 	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
-	val = readl(usb2_base + USB2_OBINTEN);
-	writel(val | USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
+	rcar_gen3_enable_otg_irq(ch, 1);
 	val = readl(usb2_base + USB2_ADPCTRL);
 	writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
 	val = readl(usb2_base + USB2_LINECTRL1);
-- 
1.9.1
