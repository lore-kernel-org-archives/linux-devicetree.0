From: Pawel Laszczak <pawell@cadence.com>
Subject: [RFC PATCH v2 15/15] usb:cdns3: Feature for changing role
Date: Sun, 18 Nov 2018 10:09:11 +0000
Message-ID: <1542535751-16079-16-git-send-email-pawell@cadence.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542535751-16079-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Patch adds feature that allow to change role from user space.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/Makefile  |  2 +-
 drivers/usb/cdns3/core.c    |  2 +
 drivers/usb/cdns3/debugfs.c | 93 +++++++++++++++++++++++++++++++++++++
 drivers/usb/cdns3/drd.h     |  3 ++
 4 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/cdns3/debugfs.c

diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index 34e60d03c4ec..08e6cdbebd46 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -1,7 +1,7 @@
 obj-$(CONFIG_USB_CDNS3)			+= cdns3.o
 obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci.o
 
-cdns3-y					:= core.o drd.o
+cdns3-y					:= core.o drd.o debugfs.o
 cdns3-$(CONFIG_USB_CDNS3_GADGET)	+= gadget.o ep0.o debug.o
 cdns3-$(CONFIG_USB_CDNS3_HOST)		+= host.o
 cdns3-pci-y		 		:= cdns3-pci-wrap.o
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 1fa233415901..304323b643f2 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -323,6 +323,7 @@ static int cdns3_probe(struct platform_device *pdev)
 		goto err2;
 	}
 
+	cdns3_debugfs_init(cdns);
 	device_set_wakeup_capable(dev, true);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -358,6 +359,7 @@ static int cdns3_remove(struct platform_device *pdev)
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
+	cdns3_debugfs_exit(cdns);
 	cdns3_remove_roles(cdns);
 
 	return 0;
diff --git a/drivers/usb/cdns3/debugfs.c b/drivers/usb/cdns3/debugfs.c
new file mode 100644
index 000000000000..189b12d96cbf
--- /dev/null
+++ b/drivers/usb/cdns3/debugfs.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS DRD Controller DebugFS filer.
+ *
+ * Copyright (C) 2018 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+
+#include <linux/types.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/uaccess.h>
+
+#include "core.h"
+#include "gadget.h"
+
+static int cdns3_mode_show(struct seq_file *s, void *unused)
+{
+	struct cdns3		*cdns = s->private;
+
+	switch (cdns->current_dr_mode) {
+	case USB_DR_MODE_HOST:
+		seq_puts(s, "host\n");
+		break;
+	case USB_DR_MODE_PERIPHERAL:
+		seq_puts(s, "device\n");
+		break;
+	case USB_DR_MODE_OTG:
+		seq_puts(s, "otg\n");
+		break;
+	default:
+		seq_puts(s, "UNKNOWN mode\n");
+	}
+
+	return 0;
+}
+
+static int cdns3_mode_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, cdns3_mode_show, inode->i_private);
+}
+
+static ssize_t cdns3_mode_write(struct file *file,
+				const char __user *ubuf,
+				size_t count, loff_t *ppos)
+{
+	struct seq_file		*s = file->private_data;
+	struct cdns3		*cdns = s->private;
+	u32			mode = 0;
+	char			buf[32];
+
+	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	if (!strncmp(buf, "host", 4))
+		mode = USB_DR_MODE_HOST;
+
+	if (!strncmp(buf, "device", 6))
+		mode = USB_DR_MODE_PERIPHERAL;
+
+	if (!strncmp(buf, "otg", 3))
+		mode = USB_DR_MODE_OTG;
+
+	cdns->desired_dr_mode = mode;
+	queue_work(system_freezable_wq, &cdns->role_switch_wq);
+	return count;
+}
+
+static const struct file_operations cdns3_mode_fops = {
+	.open			= cdns3_mode_open,
+	.write			= cdns3_mode_write,
+	.read			= seq_read,
+	.llseek			= seq_lseek,
+	.release		= single_release,
+};
+
+void cdns3_debugfs_init(struct cdns3 *cdns)
+{
+	struct dentry *root;
+
+	root = debugfs_create_dir(dev_name(cdns->dev), NULL);
+	cdns->root = root;
+	if (IS_ENABLED(CONFIG_USB_CDNS3_GADGET) &&
+	    IS_ENABLED(CONFIG_USB_CDNS3_HOST))
+		debugfs_create_file("mode", 0644, root, cdns,
+				    &cdns3_mode_fops);
+}
+
+void cdns3_debugfs_exit(struct cdns3 *cdns)
+{
+	debugfs_remove_recursive(cdns->root);
+}
diff --git a/drivers/usb/cdns3/drd.h b/drivers/usb/cdns3/drd.h
index 0faa7520ecac..8367032e12a3 100644
--- a/drivers/usb/cdns3/drd.h
+++ b/drivers/usb/cdns3/drd.h
@@ -119,4 +119,7 @@ int cdns3_drd_init(struct cdns3 *cdns);
 int cdns3_drd_update_mode(struct cdns3 *cdns);
 irqreturn_t cdns3_drd_irq(struct cdns3 *cdns);
 
+void cdns3_debugfs_init(struct cdns3 *cdns);
+void cdns3_debugfs_exit(struct cdns3 *cdns);
+
 #endif /* __LINUX_CDNS3_DRD */
-- 
2.17.1
