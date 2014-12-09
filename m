From: <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH v3 3/3] fpga manager: device tree overlay support
Date: Tue, 9 Dec 2014 10:28:01 -0600
Message-ID: <1418142481-6167-4-git-send-email-atull@opensource.altera.com>
References: <1418142481-6167-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418142481-6167-1-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-ynQEQJNshbs@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Support programming the fpga from device tree overlays.

This patch adds two exported functions to the core
(fpga-mgr.c):
  of_fpga_mgr_dev_lookup
    Get pointer to fpga manager struct given a phandle.

  of_find_fpga_mgr_by_node
    Get pointer to fpga manager given device node

This code is dependent on Pantelis Antoniou's current work
on Device Tree overlays, a method of dynamically altering
the kernel's live Device Tree.  The rest of the patchset was
tested with recent for-next, but this 'bus driver' patch was
tested with Pantelis's and Grant Likely's stuff that is in git
(his git repo https://github.com/pantoniou/linux-beagle-track-mainline
 v3.17-rc2-115-gbc778b8 == dt-ng/bbb) plus some dtc fixups
for compiling overlays.

TODO: Integrate bridge support

General flow is:
1. Load a DT overlay
2. This causes the FPGA to get programmed
3. TODO - enable FPGA bridges
4. Drivers get probed

The reverse flow is also supported:
1. Remove the DT overlay
2. Drivers get removed
3. TODO - disable FPGA bridges
4. FPGA gets reset

Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 drivers/fpga/Kconfig     |    7 ++++
 drivers/fpga/fpga-mgr.c  |  104 +++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/fpga-mgr.h |    3 ++
 3 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index e775b17..2bd6c83 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -18,4 +18,11 @@ config FPGA_MGR_SYSFS
 	help
 	  FPGA Manager SysFS interface.
 
+config FPGA_MGR_BUS
+	bool "FPGA Manager Bus"
+	depends on FPGA
+	help
+	  FPGA Manager Bus interface.  Allows loading FPGA images
+	  from Device Tree or from other drivers.
+
 endmenu
diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
index d08cb82..6f9c196 100644
--- a/drivers/fpga/fpga-mgr.c
+++ b/drivers/fpga/fpga-mgr.c
@@ -36,6 +36,7 @@ static DEFINE_IDA(fpga_mgr_ida);
 static struct class *fpga_mgr_class;
 
 static LIST_HEAD(fpga_manager_list);
+static struct notifier_block fpga_mgr_of_notifier_block;
 
 /*
  * Get FPGA state from low level driver
@@ -186,12 +187,17 @@ int fpga_mgr_firmware_write(struct fpga_manager *mgr, const char *image_name)
 	ret = request_firmware(&fw, image_name, &mgr->dev);
 	if (ret) {
 		mgr->state = FPGA_MGR_STATE_FIRMWARE_REQ_ERR;
+		dev_dbg(&mgr->dev, "Error requesting firmware %s\n",
+			image_name);
 		goto fw_wr_exit;
 	}
 
 	ret = __fpga_mgr_write(mgr, fw->data, fw->size);
-	if (ret)
+	if (ret) {
+		dev_dbg(&mgr->dev, "Error writing %s to %s\n",
+			image_name, mgr->name);
 		goto fw_wr_exit;
+	}
 
 	strcpy(mgr->image_name, image_name);
 
@@ -367,6 +373,87 @@ const struct dev_pm_ops fpga_mgr_dev_pm_ops = {
 	.resume		= fpga_mgr_resume,
 };
 
+#if IS_ENABLED(CONFIG_OF)
+/* Find the fpga manager that is pointed to by a phandle */
+struct fpga_manager *of_fpga_mgr_dev_lookup(struct device_node *node,
+					    const char *mgr_property)
+{
+	struct fpga_manager *mgr;
+	struct device_node *mgr_node;
+
+	if (node == NULL)
+		return NULL;
+
+	mgr_node = of_parse_phandle(node, mgr_property, 0);
+	if (!mgr_node)
+		return NULL;
+
+	list_for_each_entry(mgr, &fpga_manager_list, list)
+		if (mgr_node == mgr->dev.of_node) {
+			of_node_put(mgr_node);
+			return mgr;
+		}
+
+	of_node_put(mgr_node);
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(of_fpga_mgr_dev_lookup);
+
+struct fpga_manager *of_find_fpga_mgr_by_node(struct device_node *node)
+{
+	struct fpga_manager *mgr;
+
+	if (node == NULL)
+		return NULL;
+
+	list_for_each_entry(mgr, &fpga_manager_list, list)
+		if (node == mgr->dev.of_node)
+			return mgr;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(of_find_fpga_mgr_by_node);
+#endif	/* CONFIG_OF */
+
+static int of_fpga_mgr_notify(struct notifier_block *nb, unsigned long action,
+			      void *arg)
+{
+	struct device_node *dn;
+	const char *path;
+	struct fpga_manager *mgr;
+	int state;
+
+	state = of_reconfig_get_state_change(action, arg);
+	if (state == -1)
+		return NOTIFY_OK;
+
+	switch (action) {
+	case OF_RECONFIG_ATTACH_NODE:
+	case OF_RECONFIG_DETACH_NODE:
+		dn = arg;
+		break;
+	case OF_RECONFIG_ADD_PROPERTY:
+	case OF_RECONFIG_REMOVE_PROPERTY:
+	case OF_RECONFIG_UPDATE_PROPERTY:
+	default:
+		return NOTIFY_OK;
+	}
+
+	mgr = of_find_fpga_mgr_by_node(dn->parent);
+	if (!mgr)
+		return NOTIFY_OK;	/* not for us */
+
+	if (state) {
+		if (!of_property_read_string(dn, "fpga-firmware", &path))
+			fpga_mgr_firmware_write(mgr, path);
+	} else {
+		fpga_mgr_reset(mgr);
+	}
+
+	return NOTIFY_OK;
+}
+
 static void fpga_mgr_dev_release(struct device *dev)
 {
 	struct fpga_manager *mgr = to_fpga_manager(dev);
@@ -459,6 +546,8 @@ EXPORT_SYMBOL_GPL(fpga_mgr_remove);
 
 static int __init fpga_mgr_dev_init(void)
 {
+	int ret;
+
 	pr_info("FPGA Manager framework driver\n");
 
 	fpga_mgr_class = class_create(THIS_MODULE, "fpga_manager");
@@ -468,11 +557,24 @@ static int __init fpga_mgr_dev_init(void)
 	fpga_mgr_class->dev_groups = fpga_mgr_groups;
 	fpga_mgr_class->pm = &fpga_mgr_dev_pm_ops;
 
+#if IS_ENABLED(CONFIG_OF)
+	fpga_mgr_of_notifier_block.notifier_call = of_fpga_mgr_notify;
+	ret = of_reconfig_notifier_register(&fpga_mgr_of_notifier_block);
+	if (ret) {
+		class_destroy(fpga_mgr_class);
+		ida_destroy(&fpga_mgr_ida);
+		return ret;
+	}
+#endif
+
 	return 0;
 }
 
 static void __exit fpga_mgr_dev_exit(void)
 {
+#if IS_ENABLED(CONFIG_OF)
+	of_reconfig_notifier_unregister(&fpga_mgr_of_notifier_block);
+#endif
 	class_destroy(fpga_mgr_class);
 	ida_destroy(&fpga_mgr_ida);
 }
diff --git a/include/linux/fpga-mgr.h b/include/linux/fpga-mgr.h
index 7ac762c..414d949 100644
--- a/include/linux/fpga-mgr.h
+++ b/include/linux/fpga-mgr.h
@@ -99,6 +99,9 @@ int fpga_mgr_reset(struct fpga_manager *mgr);
 int fpga_mgr_register(struct device *pdev, const char *name,
 		      struct fpga_manager_ops *mops, void *priv);
 void fpga_mgr_remove(struct device *dev);
+struct fpga_manager *of_fpga_mgr_dev_lookup(struct device_node *node,
+					    const char *mgr_property);
+struct fpga_manager *of_find_fpga_mgr_by_node(struct device_node *node);
 
 #endif /* CONFIG_FPGA */
 #endif /*_LINUX_FPGA_MGR_H */
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
