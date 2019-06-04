From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4] usb: create usb_debug_root for gadget only
Date: Tue, 4 Jun 2019 15:34:07 +0800
Message-ID: <1559633647-29040-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

When CONFIG_USB is not set, and CONFIG_USB_GADGET is set,
there is an issue, e.g.:

drivers/usb/mtu3/mtu3_debugfs.o: in function 'ssusb_debugfs_create_root':
mtu3_debugfs.c:(.text+0xba3): undefined reference to 'usb_debug_root'

usb_debug_root is currently only built when host is supported
(CONFIG_USB is set), for convenience, we also want it created when
gadget only is enabled, this patch try to support it.

Reported-by: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
v4:
  move common API into common.c suggested by Felipe

v3:
  1. still create usb_debug_root for gadget only
  2. abandon mtu3's change
  3. drop acked-by Randy

v2(resend): add acked-by Randy

v1: fix mtu3's build error, replace usb_debug_root by NULL;
---
 drivers/usb/common/common.c   | 26 ++++++++++++++++++++++++++
 drivers/usb/core/usb.c        | 16 ++++------------
 drivers/usb/gadget/udc/core.c |  3 +++
 include/linux/usb.h           |  2 ++
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
index 18f5dcf58b0d..c52e9c9f58ec 100644
--- a/drivers/usb/common/common.c
+++ b/drivers/usb/common/common.c
@@ -15,6 +15,7 @@
 #include <linux/usb/of.h>
 #include <linux/usb/otg.h>
 #include <linux/of_platform.h>
+#include <linux/debugfs.h>
 
 static const char *const ep_type_names[] = {
 	[USB_ENDPOINT_XFER_CONTROL] = "ctrl",
@@ -139,6 +140,31 @@ enum usb_dr_mode usb_get_dr_mode(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(usb_get_dr_mode);
 
+struct dentry *usb_debug_root;
+EXPORT_SYMBOL_GPL(usb_debug_root);
+
+static atomic_t usb_debug_root_refcnt = ATOMIC_INIT(0);
+
+struct dentry *usb_debugfs_init(void)
+{
+	if (!usb_debug_root)
+		usb_debug_root = debugfs_create_dir("usb", NULL);
+
+	atomic_inc(&usb_debug_root_refcnt);
+
+	return usb_debug_root;
+}
+EXPORT_SYMBOL_GPL(usb_debugfs_init);
+
+void usb_debugfs_cleanup(void)
+{
+	if (atomic_dec_and_test(&usb_debug_root_refcnt)) {
+		debugfs_remove_recursive(usb_debug_root);
+		usb_debug_root = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(usb_debugfs_cleanup);
+
 #ifdef CONFIG_OF
 /**
  * of_usb_get_dr_mode_by_phy - Get dual role mode for the controller device
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 7fcb9f782931..9d8db7faf75f 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -1185,19 +1185,11 @@ static struct notifier_block usb_bus_nb = {
 	.notifier_call = usb_bus_notify,
 };
 
-struct dentry *usb_debug_root;
-EXPORT_SYMBOL_GPL(usb_debug_root);
-
-static void usb_debugfs_init(void)
+static void usb_core_debugfs_init(void)
 {
-	usb_debug_root = debugfs_create_dir("usb", NULL);
-	debugfs_create_file("devices", 0444, usb_debug_root, NULL,
-			    &usbfs_devices_fops);
-}
+	struct dentry *root = usb_debugfs_init();
 
-static void usb_debugfs_cleanup(void)
-{
-	debugfs_remove_recursive(usb_debug_root);
+	debugfs_create_file("devices", 0444, root, NULL, &usbfs_devices_fops);
 }
 
 /*
@@ -1212,7 +1204,7 @@ static int __init usb_init(void)
 	}
 	usb_init_pool_max();
 
-	usb_debugfs_init();
+	usb_core_debugfs_init();
 
 	usb_acpi_register();
 	retval = bus_register(&usb_bus_type);
diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 7cf34beb50df..8ef000b9baa4 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1597,12 +1597,15 @@ static int __init usb_udc_init(void)
 	}
 
 	udc_class->dev_uevent = usb_udc_uevent;
+	usb_debugfs_init();
+
 	return 0;
 }
 subsys_initcall(usb_udc_init);
 
 static void __exit usb_udc_exit(void)
 {
+	usb_debugfs_cleanup();
 	class_destroy(udc_class);
 }
 module_exit(usb_udc_exit);
diff --git a/include/linux/usb.h b/include/linux/usb.h
index ae82d9d1112b..175e4a0b1847 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1995,6 +1995,8 @@ extern void usb_unregister_notify(struct notifier_block *nb);
 
 /* debugfs stuff */
 extern struct dentry *usb_debug_root;
+extern struct dentry *usb_debugfs_init(void);
+extern void usb_debugfs_cleanup(void);
 
 /* LED triggers */
 enum usb_led_event {
-- 
2.21.0
