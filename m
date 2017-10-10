From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 2/4] phy: rcar-gen3-usb2: cleanup the role_{store,show}()
Date: Tue, 10 Oct 2017 14:58:28 +0900
Message-ID: <1507615110-26206-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507615110-26206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507615110-26206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch cleanups the role_{store,show}() and replaces the local
"bool" for host/device mode selection with the "enum phy_mode" in
the role_store().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 58 ++++++++++++++++++++++----------
 1 file changed, 40 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index e00e99a..7619468 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -219,14 +219,10 @@ static bool rcar_gen3_is_host(struct rcar_gen3_chan *ch)
 	return !(readl(ch->base + USB2_COMMCTRL) & USB2_COMMCTRL_OTG_PERI);
 }
 
-static ssize_t role_store(struct device *dev, struct device_attribute *attr,
-			  const char *buf, size_t count)
+static ssize_t rcar_gen3_otg_change_role(struct rcar_gen3_chan *ch,
+					 enum phy_mode mode)
 {
-	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
-	bool is_b_device, is_host, new_mode_is_host;
-
-	if (!ch->has_otg || !ch->phy->init_count)
-		return -EIO;
+	bool is_b_device, is_host;
 
 	/*
 	 * is_b_device: true is B-Device. false is A-Device.
@@ -234,18 +230,13 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 	 */
 	is_b_device = rcar_gen3_check_id(ch);
 	is_host = rcar_gen3_is_host(ch);
-	if (!strncmp(buf, "host", strlen("host")))
-		new_mode_is_host = true;
-	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
-		new_mode_is_host = false;
-	else
-		return -EINVAL;
 
 	/* If current and new mode is the same, this returns the error */
-	if (is_host == new_mode_is_host)
+	if ((is_host && mode == PHY_MODE_USB_HOST) ||
+	    (!is_host && mode == PHY_MODE_USB_DEVICE))
 		return -EINVAL;
 
-	if (new_mode_is_host) {		/* And is_host must be false */
+	if (mode == PHY_MODE_USB_HOST) { /* And is_host must be false */
 		if (!is_b_device)	/* A-Peripheral */
 			rcar_gen3_init_from_a_peri_to_a_host(ch);
 		else			/* B-Peripheral */
@@ -257,6 +248,32 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 			rcar_gen3_init_for_peri(ch);
 	}
 
+	return 0;
+}
+
+static ssize_t role_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
+	enum phy_mode mode;
+	ssize_t ret = -EIO;
+
+	if (!ch->phy->init_count)
+		return -EIO;
+
+	if (!strncmp(buf, "host", strlen("host")))
+		mode = PHY_MODE_USB_HOST;
+	else if (!strncmp(buf, "peripheral", strlen("peripheral")))
+		mode = PHY_MODE_USB_DEVICE;
+	else
+		return -EINVAL;
+
+	if (ch->has_otg)
+		ret = rcar_gen3_otg_change_role(ch, mode);
+
+	if (ret < 0)
+		return ret;
+
 	return count;
 }
 
@@ -264,12 +281,17 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
+	bool is_host;
 
-	if (!ch->has_otg || !ch->phy->init_count)
+	if (!ch->phy->init_count)
+		return -EIO;
+
+	if (ch->has_otg)
+		is_host = rcar_gen3_is_host(ch);
+	else
 		return -EIO;
 
-	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
-							    "peripheral");
+	return sprintf(buf, "%s\n", is_host ? "host" : "peripheral");
 }
 static DEVICE_ATTR_RW(role);
 
-- 
1.9.1
