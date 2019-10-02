From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
Date: Wed,  2 Oct 2019 23:16:16 +0000
Message-ID: <20191002231617.3670-3-john.stultz@linaro.org>
References: <20191002231617.3670-1-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002231617.3670-1-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Yu Chen <chenyu56@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Yu Chen <chenyu56@huawei.com>

This patch adds notifier for drivers want to be informed of the usb role
switch.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/roles/class.c | 35 ++++++++++++++++++++++++++++++++++-
 include/linux/usb/role.h  | 16 ++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 94b4e7db2b94..418e762d5d72 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -20,6 +20,7 @@ struct usb_role_switch {
 	struct device dev;
 	struct mutex lock; /* device lock*/
 	enum usb_role role;
+	struct blocking_notifier_head nh;
 
 	/* From descriptor */
 	struct device *usb2_port;
@@ -49,8 +50,10 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 	mutex_lock(&sw->lock);
 
 	ret = sw->set(sw->dev.parent, role);
-	if (!ret)
+	if (!ret) {
 		sw->role = role;
+		blocking_notifier_call_chain(&sw->nh, role, NULL);
+	}
 
 	mutex_unlock(&sw->lock);
 
@@ -58,6 +61,35 @@ int usb_role_switch_set_role(struct usb_role_switch *sw, enum usb_role role)
 }
 EXPORT_SYMBOL_GPL(usb_role_switch_set_role);
 
+int usb_role_switch_register_notifier(struct usb_role_switch *sw,
+				      struct notifier_block *nb)
+{
+	int ret = blocking_notifier_chain_register(&sw->nh, nb);
+	enum usb_role role;
+
+	if (ret)
+		return ret;
+
+	/* Initialize the notifier that was just registered */
+	mutex_lock(&sw->lock);
+	if (sw->get)
+		role = sw->get(sw->dev.parent);
+	else
+		role = sw->role;
+	blocking_notifier_call_chain(&sw->nh, role, NULL);
+	mutex_unlock(&sw->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(usb_role_switch_register_notifier);
+
+int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
+					struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&sw->nh, nb);
+}
+EXPORT_SYMBOL_GPL(usb_role_switch_unregister_notifier);
+
 /**
  * usb_role_switch_get_role - Get the USB role for a switch
  * @sw: USB role switch
@@ -296,6 +328,7 @@ usb_role_switch_register(struct device *parent,
 		return ERR_PTR(-ENOMEM);
 
 	mutex_init(&sw->lock);
+	BLOCKING_INIT_NOTIFIER_HEAD(&sw->nh);
 
 	sw->allow_userspace_control = desc->allow_userspace_control;
 	sw->usb2_port = desc->usb2_port;
diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index 2d77f97df72d..8dbf7940b7da 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -54,6 +54,10 @@ struct usb_role_switch *
 usb_role_switch_register(struct device *parent,
 			 const struct usb_role_switch_desc *desc);
 void usb_role_switch_unregister(struct usb_role_switch *sw);
+int usb_role_switch_register_notifier(struct usb_role_switch *sw,
+				      struct notifier_block *nb);
+int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
+					struct notifier_block *nb);
 #else
 static inline int usb_role_switch_set_role(struct usb_role_switch *sw,
 		enum usb_role role)
@@ -87,6 +91,18 @@ usb_role_switch_register(struct device *parent,
 }
 
 static inline void usb_role_switch_unregister(struct usb_role_switch *sw) { }
+
+static int usb_role_switch_register_notifier(struct usb_role_switch *sw,
+					     struct notifier_block *nb)
+{
+	return -ENODEV;
+}
+
+static int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
+					       struct notifier_block *nb)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __LINUX_USB_ROLE_H */
-- 
2.17.1
