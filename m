From: Yu Chen <chenyu56@huawei.com>
Subject: [PATCH v1 09/12] usb: dwc3: Registering a role switch in the DRD code.
Date: Mon, 3 Dec 2018 11:45:12 +0800
Message-ID: <20181203034515.91412-10-chenyu56@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203034515.91412-1-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

The Type-C drivers use USB role switch API to inform the
system about the negotiated data role, so registering a role
switch in the DRD code in order to support platforms with
USB Type-C connectors.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

--
v0:
The patch is provided by Heikki Krogerus. I modified and test it
on Hikey960 platform.
--
---
 drivers/usb/dwc3/core.h |  2 ++
 drivers/usb/dwc3/drd.c  | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index b3cea95f7720..47e388878e9a 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -25,6 +25,7 @@
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/usb/otg.h>
+#include <linux/usb/role.h>
 #include <linux/ulpi/interface.h>
 
 #include <linux/phy/phy.h>
@@ -1057,6 +1058,7 @@ struct dwc3 {
 	struct extcon_dev	*edev;
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
+	struct usb_role_switch	*role_sw;
 
 	u32			fladj;
 	u32			irq_gadget;
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 218371f985ca..3155121e6d29 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -463,6 +463,48 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 	return edev;
 }
 
+static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
+{
+	u32 mode;
+
+	pr_info("%s:set role %d\n", __func__, role);
+
+	switch (role) {
+	case USB_ROLE_HOST:
+		mode = DWC3_GCTL_PRTCAP_HOST;
+		break;
+	case USB_ROLE_DEVICE:
+		mode = DWC3_GCTL_PRTCAP_DEVICE;
+		break;
+	default:
+		mode = DWC3_GCTL_PRTCAP_HOST;
+		break;
+	};
+
+	dwc3_set_mode(dev_get_drvdata(dev), mode);
+	return 0;
+
+}
+
+static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	unsigned long flags;
+	enum usb_role role;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	role = dwc->current_otg_role;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+
+	return role;
+
+}
+
+static const struct usb_role_switch_desc dwc3_role_switch = {
+	.set = dwc3_usb_role_switch_set,
+	.get = dwc3_usb_role_switch_get,
+};
+
 int dwc3_drd_init(struct dwc3 *dwc)
 {
 	int ret, irq;
@@ -511,6 +553,11 @@ int dwc3_drd_init(struct dwc3 *dwc)
 		dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_OTG);
 	}
 
+	dwc->role_sw = usb_role_switch_register(dwc->dev, &dwc3_role_switch);
+	if (ret) {
+		dwc3_drd_exit(dwc);
+		return PTR_ERR(dwc->role_sw);
+	}
 	return 0;
 }
 
@@ -546,4 +593,6 @@ void dwc3_drd_exit(struct dwc3 *dwc)
 
 	if (!dwc->edev)
 		free_irq(dwc->otg_irq, dwc);
+
+	usb_role_switch_unregister(dwc->role_sw);
 }
-- 
2.15.0-rc2
