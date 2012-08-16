From: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] dynamic device tree char driver
Date: Thu, 16 Aug 2012 14:43:46 -0500
Message-ID: <1345146226-32675-2-git-send-email-atull@altera.com>
References: <1345146226-32675-1-git-send-email-atull@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1345146226-32675-1-git-send-email-atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 * Add a ioctls for adding/removing nodes using binary blobs.

Signed-off-by: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/Makefile  |    1 +
 drivers/of/dynamic.c |  287 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/of/dynamic.h |   26 +++++
 3 files changed, 314 insertions(+), 0 deletions(-)
 create mode 100644 drivers/of/dynamic.c
 create mode 100644 drivers/of/dynamic.h

diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index e027f44..5c08045 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_OF_PROMTREE) += pdt.o
 obj-$(CONFIG_OF_ADDRESS)  += address.o
 obj-$(CONFIG_OF_IRQ)    += irq.o
 obj-$(CONFIG_OF_DEVICE) += device.o platform.o
+obj-$(CONFIG_OF_DYNAMIC) += dynamic.o
 obj-$(CONFIG_OF_I2C)	+= of_i2c.o
 obj-$(CONFIG_OF_NET)	+= of_net.o
 obj-$(CONFIG_OF_SELFTEST) += selftest.o
diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
new file mode 100644
index 0000000..0dce177
--- /dev/null
+++ b/drivers/of/dynamic.c
@@ -0,0 +1,287 @@
+/*
+ * Dynamic Device Tree support
+ *
+ * Copyright (C) 2012 Altera Corporation
+ * Author: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
+ *
+ * Some code taken from reconfig.c
+ * Copyright (C) 2005 Nathan Lynch
+ * Copyright (C) 2005 IBM Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, write to the Free Software Foundation, Inc.,
+ * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+*/
+
+#include <linux/device.h>
+#include <linux/cdev.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/proc_fs.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <linux/uaccess.h>
+#include <linux/mutex.h>
+#include "dynamic.h"
+
+static int major;
+module_param(major, int, 0);
+MODULE_PARM_DESC(major, "Major device number");
+
+static DEFINE_MUTEX(of_dynamic_ioctl_mutex);
+
+/*
+ * Routines for "runtime" addition and removal of device tree nodes.
+ */
+#ifdef CONFIG_PROC_DEVICETREE
+/*
+ * Add a node to /proc/device-tree.
+ */
+static void add_node_proc_entries(struct device_node *np)
+{
+	struct proc_dir_entry *ent;
+
+	pr_debug("%s parent........... %s\n", __func__, np->parent->name);
+	pr_debug("%s full_name........ %s\n", __func__, np->full_name);
+
+	ent = proc_mkdir(strrchr(np->full_name, '/') + 1, np->parent->pde);
+	if (ent)
+		proc_device_tree_add_node(np, ent);
+}
+
+static void remove_node_proc_entries(struct device_node *np)
+{
+	struct property *pp = np->properties;
+	struct device_node *parent = np->parent;
+
+	while (pp) {
+		remove_proc_entry(pp->name, np->pde);
+		pp = pp->next;
+	}
+	if (np->pde)
+		remove_proc_entry(np->pde->name, parent->pde);
+}
+#else /* !CONFIG_PROC_DEVICETREE */
+static void add_node_proc_entries(struct device_node *np)
+{
+	return;
+}
+
+static void remove_node_proc_entries(struct device_node *np)
+{
+	return;
+}
+#endif /* CONFIG_PROC_DEVICETREE */
+
+/*
+ *	derive_parent - basically like dirname(1)
+ *	@path:  the full_name of a node to be added to the tree
+ *
+ *	Returns the node which should be the parent of the node
+ *	described by path.  E.g., for path = "/foo/bar", returns
+ *	the node with full_name = "/foo".
+ */
+static struct device_node *derive_parent(const char *path)
+{
+	struct device_node *parent = NULL;
+	char *parent_path = "/";
+	size_t parent_path_len = strrchr(path, '/') - path + 1;
+
+	/* reject if path is "/" */
+	if (!strcmp(path, "/"))
+		return ERR_PTR(-EINVAL);
+
+	if (strrchr(path, '/') != path) {
+		parent_path = kmalloc(parent_path_len, GFP_KERNEL);
+		if (!parent_path)
+			return ERR_PTR(-ENOMEM);
+		strlcpy(parent_path, path, parent_path_len);
+	}
+	parent = of_find_node_by_path(parent_path);
+	if (!parent)
+		return ERR_PTR(-EINVAL);
+	if (strcmp(parent_path, "/"))
+		kfree(parent_path);
+	return parent;
+}
+
+static void next_real_node(struct device_node **npp)
+{
+	/* The blob to be added is not a complete device tree. Some nodes'
+	   parents are only there to indicate the path to add the node
+	   in the existing tree. Look for nodes that have real properties
+	   besides name (i.e. compatible) and add those recursively. */
+
+	/* Mark the nodes we don't attach for removal */
+	while ((*npp) && !of_get_property(*npp, "compatible", NULL)) {
+		of_node_set_flag(*npp, OF_DETACHED);
+		*npp = (*npp)->next;
+	}
+}
+
+static int add_nodes_to_tree(struct device_node *np)
+{
+	struct device_node *tree_node;
+
+	while (np) {
+		next_real_node(&np);
+		if (np) {
+			tree_node = of_find_node_by_path(np->full_name);
+			if (tree_node) {
+				pr_err("%s Error: node %s exists in device tree\n",
+					__func__, np->full_name);
+				of_node_put(tree_node);
+				return -EEXIST;
+			}
+
+			np->parent = derive_parent(np->full_name);
+			if (IS_ERR(np->parent))
+				return -EINVAL;
+			of_attach_node(np);
+			add_node_proc_entries(np);
+
+			of_node_put(np->parent);
+			np = np->next;
+		}
+	}
+
+	return 0;
+}
+
+static int remove_nodes_from_tree(struct device_node *np)
+{
+	struct device_node *tree_node;
+
+	while (np) {
+		next_real_node(&np);
+		if (np) {
+			tree_node = of_find_node_by_path(np->full_name);
+			if (!tree_node) {
+				pr_err("%s Error: node %s does not exist in device tree\n",
+					__func__, np->full_name);
+				return -ENOENT;
+			}
+
+			remove_node_proc_entries(tree_node);
+			of_detach_node(tree_node);
+			of_node_put(tree_node);
+
+			of_node_put(np->parent);
+			np = np->next;
+		}
+	}
+
+	return 0;
+}
+
+static long of_dynamic_unlocked_ioctl(struct file *file, unsigned int cmd,
+				      unsigned long arg)
+{
+	int ret = 0;
+	void *blob = NULL;
+	struct device_node *np;
+	void __user *user_arg = (void __user *)arg;
+	struct of_dynamic_blob_info blob_info;
+
+	pr_debug("%s\n", __func__);
+
+	mutex_lock(&of_dynamic_ioctl_mutex);
+
+	if (copy_from_user(&blob_info, user_arg, sizeof(blob_info))) {
+		pr_err("%s copy_from_user error\n", __func__);
+		ret = -EINVAL;
+		goto ioctl_out;
+	}
+
+	blob = kmalloc(blob_info.size, GFP_KERNEL);
+	if (!blob) {
+		ret = -ENOMEM;
+		goto ioctl_out;
+	}
+
+	if (copy_from_user(blob, blob_info.blob, blob_info.size)) {
+		ret = -EFAULT;
+		goto ioctl_out;
+	}
+
+	of_fdt_unflatten_tree(blob, &np);
+
+	switch (cmd) {
+	case OF_DYNAMIC_ADD_NODE:
+		pr_debug("%s : cmd = OF_DYNAMIC_ADD_NODE  size = %d\n",
+			__func__, blob_info.size);
+		ret = add_nodes_to_tree(np);
+		break;
+
+	case OF_DYNAMIC_REMOVE_NODE:
+		pr_debug("%s : cmd = OF_DYNAMIC_REMOVE_NODE\n", __func__);
+		ret = remove_nodes_from_tree(np);
+		break;
+
+	default:
+		pr_debug("%s : unknown ioctl %d  blob size = %d\n",
+			__func__, cmd, blob_info.size);
+		ret = -EINVAL;
+		break;
+	}
+
+ioctl_out:
+	kfree(blob);
+	mutex_unlock(&of_dynamic_ioctl_mutex);
+	return ret;
+}
+
+static const struct file_operations of_dynamic_fops = {
+	.owner = THIS_MODULE,
+	.llseek = no_llseek,
+	.unlocked_ioctl = of_dynamic_unlocked_ioctl,
+};
+
+static struct cdev of_dynamic_dev;
+
+static int __init of_dynamic_init(void)
+{
+	int rc;
+	dev_t dev;
+
+	if (major) {
+		dev = MKDEV(major, 0);
+		rc = register_chrdev_region(dev, 1, "of_dynamic");
+	} else {
+		rc = alloc_chrdev_region(&dev, 0, 1, "of_dynamic");
+		major = MAJOR(dev);
+	}
+	if (rc < 0) {
+		pr_err("of_dynamic chrdev_region err: %d\n", rc);
+		return rc;
+	}
+
+	cdev_init(&of_dynamic_dev, &of_dynamic_fops);
+	rc = cdev_add(&of_dynamic_dev, dev, 1);
+	if (rc < 0)
+		return rc;
+
+	return 0;
+}
+
+static void __exit of_dynamic_exit(void)
+{
+	unregister_chrdev_region(MKDEV(major, 0), 1);
+}
+
+module_init(of_dynamic_init);
+module_exit(of_dynamic_exit);
+
+MODULE_AUTHOR("Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>");
+MODULE_DESCRIPTION("Dynamic device tree");
+MODULE_LICENSE("GPL");
diff --git a/drivers/of/dynamic.h b/drivers/of/dynamic.h
new file mode 100644
index 0000000..4ee4e96
--- /dev/null
+++ b/drivers/of/dynamic.h
@@ -0,0 +1,26 @@
+/*
+ * Dynamic Device Tree support
+ *
+ * Copyrignt (C) 2012 Altera Corporation
+ *
+ */
+
+#ifndef __OF_DYNAMIC_H
+#define __OF_DYNAMIC_H
+
+#include <linux/ioctl.h>
+#include <linux/types.h>
+
+struct of_dynamic_blob_info {
+	__u32 size;
+	__u8 *blob;
+};
+
+/*
+ * TODO pick some unused ioctls (see Documentation/ioctl/ioctl-number-txt)
+ * and ask mec to register them
+ */
+#define OF_DYNAMIC_ADD_NODE	_IOW('W', 0, struct of_dynamic_blob_info *)
+#define OF_DYNAMIC_REMOVE_NODE	_IOW('W', 1, struct of_dynamic_blob_info *)
+
+#endif /* __OF_DYNAMIC_H */
-- 
1.7.1
