From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 01/10] usb: core: comply to PHY framework
Date: Mon, 21 Jan 2019 12:23:27 +0100
Message-ID: <20190121112336.23489-2-miquel.raynal@bootlin.com>
References: <20190121112336.23489-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190121112336.23489-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, linux-usb@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Current implementation of the USB core does not take into account the
new PHY framework. Correct the situation by adding a call to
phy_set_mode() before phy_power_on().

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/usb/core/hcd.c |  5 +++++
 drivers/usb/core/phy.c | 28 ++++++++++++++++++++++++++++
 drivers/usb/core/phy.h |  2 ++
 3 files changed, 35 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 015b126ce455..86f39e44f98a 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2736,6 +2736,11 @@ int usb_add_hcd(struct usb_hcd *hcd,
 		if (retval)
 			return retval;
 
+		retval = usb_phy_roothub_set_mode(hcd->phy_roothub,
+						  PHY_MODE_USB_HOST_SS);
+		if (retval)
+			goto err_usb_phy_roothub_power_on;
+
 		retval = usb_phy_roothub_power_on(hcd->phy_roothub);
 		if (retval)
 			goto err_usb_phy_roothub_power_on;
diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
index 38b2c776c4b4..7580493b867a 100644
--- a/drivers/usb/core/phy.c
+++ b/drivers/usb/core/phy.c
@@ -123,6 +123,34 @@ int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub)
 }
 EXPORT_SYMBOL_GPL(usb_phy_roothub_exit);
 
+int usb_phy_roothub_set_mode(struct usb_phy_roothub *phy_roothub,
+			     enum phy_mode mode)
+{
+	struct usb_phy_roothub *roothub_entry;
+	struct list_head *head;
+	int err;
+
+	if (!phy_roothub)
+		return 0;
+
+	head = &phy_roothub->list;
+
+	list_for_each_entry(roothub_entry, head, list) {
+		err = phy_set_mode(roothub_entry->phy, mode);
+		if (err)
+			goto err_out;
+	}
+
+	return 0;
+
+err_out:
+	list_for_each_entry_continue_reverse(roothub_entry, head, list)
+		phy_power_off(roothub_entry->phy);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(usb_phy_roothub_set_mode);
+
 int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub)
 {
 	struct usb_phy_roothub *roothub_entry;
diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
index 88a3c037e9df..dad564e2d2d4 100644
--- a/drivers/usb/core/phy.h
+++ b/drivers/usb/core/phy.h
@@ -16,6 +16,8 @@ struct usb_phy_roothub *usb_phy_roothub_alloc(struct device *dev);
 int usb_phy_roothub_init(struct usb_phy_roothub *phy_roothub);
 int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
 
+int usb_phy_roothub_set_mode(struct usb_phy_roothub *phy_roothub,
+			     enum phy_mode mode);
 int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
 void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
 
-- 
2.19.1
