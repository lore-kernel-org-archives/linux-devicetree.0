From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 7/8] phy: renesas: rcar-gen3-usb2: add conditions for uses_otg_pins == false
Date: Fri, 21 Sep 2018 20:53:23 +0900
Message-ID: <1537530804-19399-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

If uses_otg_pins is set to false, this driver 1) should disable otg
related interruptions, and 2) should not get ID pin signal, to avoid
unexpected behaviors. So, this patch adds conditions for it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 93ab860..3f2efe5 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -148,7 +148,7 @@ static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
 	void __iomem *usb2_base = ch->base;
 	u32 val = readl(usb2_base + USB2_OBINTEN);
 
-	if (enable)
+	if (ch->uses_otg_pins && enable)
 		val |= USB2_OBINT_BITS;
 	else
 		val &= ~USB2_OBINT_BITS;
@@ -210,6 +210,9 @@ static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
 
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 {
+	if (!ch->uses_otg_pins)
+		return (ch->dr_mode == USB_DR_MODE_HOST) ? false : true;
+
 	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
 }
 
-- 
1.9.1
