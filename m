From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 2/4] phy: rcar-gen3-usb2: use enum phy_mode in the role_store()
Date: Tue, 10 Oct 2017 18:41:28 +0900
Message-ID: <1507628490-7944-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507628490-7944-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507628490-7944-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch modifies the role_store() to use "enum phy_mode" instead
of the local "bool" for host/device mode selection.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index e00e99a..7314b49 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -219,33 +219,40 @@ static bool rcar_gen3_is_host(struct rcar_gen3_chan *ch)
 	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
 }
 
+static enum phy_mode rcar_gen3_get_phy_mode(struct rcar_gen3_chan *ch)
+{
+	if (rcar_gen3_is_host(ch))
+		return PHY_MODE_USB_HOST;
+	else
+		return PHY_MODE_USB_DEVICE;
+}
+
 static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count)
 {
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
-	bool is_b_device, is_host, new_mode_is_host;
+	bool is_b_device;
+	enum phy_mode cur_mode, new_mode;
 
 	if (!ch->has_otg || !ch->phy->init_count)
 		return -EIO;
 
-	/*
-	 * is_b_device: true is B-Device. false is A-Device.
-	 * If {new_mode_}is_host: true is Host mode. false is Peripheral mode.
-	 */
-	is_b_device = rcar_gen3_check_id(ch);
-	is_host = rcar_gen3_is_host(ch);
 	if (!strncmp(buf, "host", strlen("host")))
-		new_mode_is_host = true;
+		new_mode = PHY_MODE_USB_HOST;
 	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
-		new_mode_is_host = false;
+		new_mode = PHY_MODE_USB_DEVICE;
 	else
 		return -EINVAL;
 
+	/* is_b_device: true is B-Device. false is A-Device. */
+	is_b_device = rcar_gen3_check_id(ch);
+	cur_mode = rcar_gen3_get_phy_mode(ch);
+
 	/* If current and new mode is the same, this returns the error */
-	if (is_host == new_mode_is_host)
+	if (cur_mode == new_mode)
 		return -EINVAL;
 
-	if (new_mode_is_host) {		/* And is_host must be false */
+	if (new_mode == PHY_MODE_USB_HOST) { /* And is_host must be false */
 		if (!is_b_device)	/* A-Peripheral */
 			rcar_gen3_init_from_a_peri_to_a_host(ch);
 		else			/* B-Peripheral */
-- 
1.9.1
