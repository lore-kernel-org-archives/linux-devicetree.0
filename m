From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] edac: create top-level debugfs directory
Date: Mon, 11 Jun 2012 21:32:12 -0500
Message-ID: <1339468334-9927-2-git-send-email-robherring2@gmail.com>
References: <1339468334-9927-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1339468334-9927-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: mchehab-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Create a single, top-level "edac" directory for debugfs. An "mc[0-N]"
directory is then created for each memory controller. Individual drivers
can create additional entries such as h/w error injection control.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
 drivers/edac/edac_mc_sysfs.c |   23 ++++++++++++++++++++++-
 drivers/edac/edac_module.c   |    3 +++
 drivers/edac/edac_module.h   |   14 ++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/edac_mc_sysfs.c b/drivers/edac/edac_mc_sysfs.c
index 55b2f0a..a2bf7e9 100644
--- a/drivers/edac/edac_mc_sysfs.c
+++ b/drivers/edac/edac_mc_sysfs.c
@@ -899,13 +899,33 @@ static struct device_type mci_attr_type = {
 };
 
 #ifdef CONFIG_EDAC_DEBUG
+static struct dentry *edac_debugfs;
+
+int __init edac_debugfs_init(void)
+{
+	edac_debugfs = debugfs_create_dir("edac", NULL);
+	if (IS_ERR(edac_debugfs)) {
+		edac_debugfs = NULL;
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+void __exit edac_debugfs_exit(void)
+{
+	debugfs_remove(edac_debugfs);
+}
+
 int edac_create_debug_nodes(struct mem_ctl_info *mci)
 {
 	struct dentry *d, *parent;
 	char name[80];
 	int i;
 
-	d = debugfs_create_dir(mci->dev.kobj.name, mci->debugfs);
+	if (!edac_debugfs)
+		return -ENODEV;
+
+	d = debugfs_create_dir(mci->dev.kobj.name, edac_debugfs);
 	if (!d)
 		return -ENOMEM;
 	parent = d;
@@ -930,6 +950,7 @@ int edac_create_debug_nodes(struct mem_ctl_info *mci)
 	if (!d)
 		goto nomem;
 
+	mci->debugfs = parent;
 	return 0;
 nomem:
 	debugfs_remove(mci->debugfs);
diff --git a/drivers/edac/edac_module.c b/drivers/edac/edac_module.c
index 3454798..58a28d8 100644
--- a/drivers/edac/edac_module.c
+++ b/drivers/edac/edac_module.c
@@ -94,6 +94,8 @@ static int __init edac_init(void)
 	if (err)
 		goto error;
 
+	edac_debugfs_init();
+
 	/* Setup/Initialize the workq for this core */
 	err = edac_workqueue_setup();
 	if (err) {
@@ -118,6 +120,7 @@ static void __exit edac_exit(void)
 	/* tear down the various subsystems */
 	edac_workqueue_teardown();
 	edac_mc_sysfs_exit();
+	edac_debugfs_exit();
 }
 
 /*
diff --git a/drivers/edac/edac_module.h b/drivers/edac/edac_module.h
index 62de640..3d139c6 100644
--- a/drivers/edac/edac_module.h
+++ b/drivers/edac/edac_module.h
@@ -57,6 +57,20 @@ extern void edac_mc_reset_delay_period(int value);
 extern void *edac_align_ptr(void **p, unsigned size, int n_elems);
 
 /*
+ * EDAC debugfs functions
+ */
+#ifdef CONFIG_EDAC_DEBUG
+int edac_debugfs_init(void);
+void edac_debugfs_exit(void);
+#else
+static inline int edac_debugfs_init(void)
+{
+	return -ENODEV;
+}
+static inline void edac_debugfs_exit(void) {}
+#endif
+
+/*
  * EDAC PCI functions
  */
 #ifdef	CONFIG_PCI
-- 
1.7.9.5
