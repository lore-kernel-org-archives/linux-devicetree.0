From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 04/10] phy: rcar-gen3-usb2: add extcon support
Date: Tue, 2 Feb 2016 19:18:52 +0900
Message-ID: <1454408338-4612-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1454408338-4612-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1454408338-4612-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds extcon support for otg related channel.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/Kconfig              |  1 +
 drivers/phy/phy-rcar-gen3-usb2.c | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index e7e117d..6d0e625 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -121,6 +121,7 @@ config PHY_RCAR_GEN2
 config PHY_RCAR_GEN3_USB2
 	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
 	depends on OF && ARCH_SHMOBILE
+	depends on EXTCON
 	select GENERIC_PHY
 	help
 	  Support for USB 2.0 PHY found on Renesas R-Car generation 3 SoCs.
diff --git a/drivers/phy/phy-rcar-gen3-usb2.c b/drivers/phy/phy-rcar-gen3-usb2.c
index 2da2148..5ff5653 100644
--- a/drivers/phy/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/phy-rcar-gen3-usb2.c
@@ -12,6 +12,7 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/extcon.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -76,6 +77,7 @@
 
 struct rcar_gen3_chan {
 	void __iomem *base;
+	struct extcon_dev *extcon;
 	struct phy *phy;
 	bool has_otg;
 };
@@ -125,6 +127,9 @@ static void rcar_gen3_init_for_host(struct rcar_gen3_chan *ch)
 	rcar_gen3_set_linectrl(ch, 1, 1);
 	rcar_gen3_set_host_mode(ch, 1);
 	rcar_gen3_enable_vbus_ctrl(ch, 1);
+
+	extcon_set_cable_state_(ch->extcon, EXTCON_USB_HOST, true);
+	extcon_set_cable_state_(ch->extcon, EXTCON_USB, false);
 }
 
 static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
@@ -132,6 +137,9 @@ static void rcar_gen3_init_for_peri(struct rcar_gen3_chan *ch)
 	rcar_gen3_set_linectrl(ch, 0, 1);
 	rcar_gen3_set_host_mode(ch, 0);
 	rcar_gen3_enable_vbus_ctrl(ch, 0);
+
+	extcon_set_cable_state_(ch->extcon, EXTCON_USB_HOST, false);
+	extcon_set_cable_state_(ch->extcon, EXTCON_USB, true);
 }
 
 static bool rcar_gen3_check_vbus(struct rcar_gen3_chan *ch)
@@ -250,6 +258,12 @@ static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb2_match_table);
 
+static const unsigned int rcar_gen3_phy_cable[] = {
+	EXTCON_USB,
+	EXTCON_USB_HOST,
+	EXTCON_NONE,
+};
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -275,11 +289,23 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	/* call request_irq for OTG */
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0) {
+		int ret;
+
 		irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
 				       IRQF_SHARED, dev_name(dev), channel);
 		if (irq < 0)
 			dev_err(dev, "No irq handler (%d)\n", irq);
 		channel->has_otg = true;
+		channel->extcon = devm_extcon_dev_allocate(dev,
+							rcar_gen3_phy_cable);
+		if (IS_ERR(channel->extcon))
+			return PTR_ERR(channel->extcon);
+
+		ret = devm_extcon_dev_register(dev, channel->extcon);
+		if (ret < 0) {
+			dev_err(dev, "Failed to register extcon\n");
+			return ret;
+		}
 	}
 
 	/* devm_phy_create() will call pm_runtime_enable(dev); */
-- 
1.9.1
