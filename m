From: Dragan Cvetic <dragan.cvetic@xilinx.com>
Subject: [PATCH V3 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Sat, 27 Apr 2019 23:04:58 +0100
Message-ID: <1556402706-176271-5-git-send-email-dragan.cvetic@xilinx.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Dragan Cvetic <dragan.cvetic@xilinx.com>, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add char device interface per DT node present and support
file operations:
- open(),
- close(),
- unlocked_ioctl(),
- compat_ioctl().

Tested-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
---
 drivers/misc/xilinx_sdfec.c      | 78 ++++++++++++++++++++++++++++++++++++++++
 include/uapi/misc/xilinx_sdfec.h |  4 +++
 2 files changed, 82 insertions(+)

diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index a52a5c6..30879ae 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -25,6 +25,7 @@
 #include <linux/uaccess.h>
 #include <linux/spinlock.h>
 #include <linux/clk.h>
+#include <linux/compat.h>
 
 #include <uapi/misc/xilinx_sdfec.h>
 
@@ -81,8 +82,85 @@ struct xsdfec_dev {
 	struct xsdfec_clks clks;
 };
 
+static int xsdfec_dev_open(struct inode *iptr, struct file *fptr)
+{
+	struct xsdfec_dev *xsdfec;
+
+	xsdfec = container_of(iptr->i_cdev, struct xsdfec_dev, xsdfec_cdev);
+
+	if (!atomic_dec_and_test(&xsdfec->open_count)) {
+		atomic_inc(&xsdfec->open_count);
+		return -EBUSY;
+	}
+
+	fptr->private_data = xsdfec;
+	return 0;
+}
+
+static int xsdfec_dev_release(struct inode *iptr, struct file *fptr)
+{
+	struct xsdfec_dev *xsdfec;
+
+	xsdfec = container_of(iptr->i_cdev, struct xsdfec_dev, xsdfec_cdev);
+
+	atomic_inc(&xsdfec->open_count);
+	return 0;
+}
+
+static long xsdfec_dev_ioctl(struct file *fptr, unsigned int cmd,
+			     unsigned long data)
+{
+	struct xsdfec_dev *xsdfec = fptr->private_data;
+	void __user *arg = NULL;
+	int rval = -EINVAL;
+	int err = 0;
+
+	if (!xsdfec)
+		return rval;
+
+	if (_IOC_TYPE(cmd) != XSDFEC_MAGIC)
+		return -ENOTTY;
+
+	/* check if ioctl argument is present and valid */
+	if (_IOC_DIR(cmd) != _IOC_NONE) {
+		arg = (void __user *)data;
+		if (!arg) {
+			dev_err(xsdfec->dev,
+				"xilinx sdfec ioctl argument is NULL Pointer");
+			return rval;
+		}
+	}
+
+	if (err) {
+		dev_err(xsdfec->dev, "Invalid xilinx sdfec ioctl argument");
+		return -EFAULT;
+	}
+
+	switch (cmd) {
+	default:
+		/* Should not get here */
+		dev_err(xsdfec->dev, "Undefined SDFEC IOCTL");
+		break;
+	}
+	return rval;
+}
+
+#ifdef CONFIG_COMPAT
+static long xsdfec_dev_compat_ioctl(struct file *file, unsigned int cmd,
+				    unsigned long data)
+{
+	return xsdfec_dev_ioctl(file, cmd, (unsigned long)compat_ptr(data));
+}
+#endif
+
 static const struct file_operations xsdfec_fops = {
 	.owner = THIS_MODULE,
+	.open = xsdfec_dev_open,
+	.release = xsdfec_dev_release,
+	.unlocked_ioctl = xsdfec_dev_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl = xsdfec_dev_compat_ioctl,
+#endif
 };
 
 static int xsdfec_clk_init(struct platform_device *pdev,
diff --git a/include/uapi/misc/xilinx_sdfec.h b/include/uapi/misc/xilinx_sdfec.h
index ba577fa..9709759 100644
--- a/include/uapi/misc/xilinx_sdfec.h
+++ b/include/uapi/misc/xilinx_sdfec.h
@@ -39,4 +39,8 @@ struct xsdfec_config {
 	__s32 fec_id;
 };
 
+/*
+ * XSDFEC IOCTL List
+ */
+#define XSDFEC_MAGIC 'f'
 #endif /* __XILINX_SDFEC_H__ */
-- 
2.7.4
