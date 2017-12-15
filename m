From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/6] phy: renesas: rcar-gen3-usb2: unify OBINTEN handling
Date: Fri, 15 Dec 2017 14:45:22 +0900
Message-ID: <1513316726-14387-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch unifies the OBINTEN handling to clean-up the code.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index c22d65a..480f912 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -147,6 +147,18 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 	writel(val, usb2_base + USB2_ADPCTRL);
 }
 
+static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
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
+	rcar_gen3_control_otg_irq(ch, 0);
 
 	rcar_gen3_enable_vbus_ctrl(ch, 0);
 	rcar_gen3_init_for_host(ch);
 
-	writel(val | USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
+	rcar_gen3_control_otg_irq(ch, 1);
 }
 
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
@@ -291,8 +299,7 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	val = readl(usb2_base + USB2_VBCTRL);
 	writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
 	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
-	val = readl(usb2_base + USB2_OBINTEN);
-	writel(val | USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
+	rcar_gen3_control_otg_irq(ch, 1);
 	val = readl(usb2_base + USB2_ADPCTRL);
 	writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
 	val = readl(usb2_base + USB2_LINECTRL1);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
