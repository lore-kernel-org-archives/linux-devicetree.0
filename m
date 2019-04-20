From: Yu Chen <chenyu56@huawei.com>
Subject: [PATCH v6 09/13] usb: roles: Add usb role switch notifier.
Date: Sat, 20 Apr 2019 14:40:15 +0800
Message-ID: <20190420064019.57522-10-chenyu56@huawei.com>
References: <20190420064019.57522-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190420064019.57522-1-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Yu Chen <chenyu56@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds notifier for drivers want to be informed of the usb role
switch.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>
Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
---
v5:
* Split the patch into two patches, the first one introduces stubs for
* the
exiting functions, and this patch adds notifier functions.
v6:
* Fold a fix in form John Stultz <john.stultz@linaro.org>.
---
---
 drivers/usb/roles/class.c | 35 ++++++++++++++++++++++++++++++++++-
 include/linux/usb/role.h  | 16 ++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index f45d8df5cfb8..5bc60f478725 100644
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
@@ -271,6 +303,7 @@ usb_role_switch_register(struct device *parent,
 		return ERR_PTR(-ENOMEM);
 
 	mutex_init(&sw->lock);
+	BLOCKING_INIT_NOTIFIER_HEAD(&sw->nh);
 
 	sw->allow_userspace_control = desc->allow_userspace_control;
 	sw->usb2_port = desc->usb2_port;
diff --git a/include/linux/usb/role.h b/include/linux/usb/role.h
index da2b9641b877..99d8b8e4fe61 100644
--- a/include/linux/usb/role.h
+++ b/include/linux/usb/role.h
@@ -53,6 +53,10 @@ struct usb_role_switch *
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
@@ -80,6 +84,18 @@ usb_role_switch_register(struct device *parent,
 }
 
 static inline void usb_role_switch_unregister(struct usb_role_switch *sw) { }
+
+static int usb_role_switch_register_notifier(struct usb_role_switch *sw,
+				      struct notifier_block *nb)
+{
+	return -ENODEV;
+}
+
+static int usb_role_switch_unregister_notifier(struct usb_role_switch *sw,
+					struct notifier_block *nb)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __LINUX_USB_ROLE_H */
-- 
2.15.0-rc2
