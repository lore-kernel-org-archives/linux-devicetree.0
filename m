From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 6/8] phy: renesas: rcar-gen3-usb2: change a condition "dr_mode"
Date: Fri, 21 Sep 2018 20:53:22 +0900
Message-ID: <1537530804-19399-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch changes a condition about dr_mode. If a device node has
any dr_mode ("host", "peripheral" or "otg"), this driver allows to
set "is_otg_channel" to true. Also, this patch keeps the dr_mode
value for future use.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index e7eaed9..93ab860 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -84,6 +84,7 @@ struct rcar_gen3_chan {
 	struct phy *phy;
 	struct regulator *vbus;
 	struct work_struct work;
+	enum usb_dr_mode dr_mode;
 	bool extcon_host;
 	bool uses_otg_pins;
 };
@@ -436,7 +437,8 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 			dev_err(dev, "No irq handler (%d)\n", irq);
 	}
 
-	if (of_usb_get_dr_mode_by_phy(dev->of_node, 0) == USB_DR_MODE_OTG) {
+	channel->dr_mode = of_usb_get_dr_mode_by_phy(dev->of_node, 0);
+	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
 		int ret;
 
 		channel->uses_otg_pins = !of_property_read_bool(dev->of_node,
-- 
1.9.1
