From: Dragan Cvetic <dragan.cvetic@xilinx.com>
Subject: [PATCH V4 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Sat, 25 May 2019 12:37:17 +0100
Message-ID: <1558784245-108751-5-git-send-email-dragan.cvetic@xilinx.com>
References: <1558784245-108751-1-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558784245-108751-1-git-send-email-dragan.cvetic@xilinx.com>
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
 drivers/misc/xilinx_sdfec.c      | 57 +++++++++++++++++++++++++++++++++++++---
 include/uapi/misc/xilinx_sdfec.h |  4 +++
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index ff32d29..740b487 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -51,7 +51,6 @@ struct xsdfec_clks {
  * @regs: device physical base address
  * @dev: pointer to device struct
  * @config: Configuration of the SDFEC device
- * @open_count: Count of char device being opened
  * @miscdev: Misc device handle
  * @irq_lock: Driver spinlock
  * @clks: Clocks managed by the SDFEC driver
@@ -62,15 +61,68 @@ struct xsdfec_dev {
 	void __iomem *regs;
 	struct device *dev;
 	struct xsdfec_config config;
-	atomic_t open_count;
 	struct miscdevice miscdev;
 	/* Spinlock to protect state_updated and stats_updated */
 	spinlock_t irq_lock;
 	struct xsdfec_clks clks;
 };
 
+static int xsdfec_dev_open(struct inode *iptr, struct file *fptr)
+{
+	return 0;
+}
+
+static int xsdfec_dev_release(struct inode *iptr, struct file *fptr)
+{
+	return 0;
+}
+
+static long xsdfec_dev_ioctl(struct file *fptr, unsigned int cmd,
+			     unsigned long data)
+{
+	struct xsdfec_dev *xsdfec;
+	void __user *arg = NULL;
+	int rval = -EINVAL;
+
+	xsdfec = container_of(fptr->private_data, struct xsdfec_dev, miscdev);
+	if (!xsdfec)
+		return rval;
+
+	if (_IOC_TYPE(cmd) != XSDFEC_MAGIC)
+		return -ENOTTY;
+
+	/* check if ioctl argument is present and valid */
+	if (_IOC_DIR(cmd) != _IOC_NONE) {
+		arg = (void __user *)data;
+		if (!arg)
+			return rval;
+	}
+
+	switch (cmd) {
+	default:
+		/* Should not get here */
+		dev_warn(xsdfec->dev, "Undefined SDFEC IOCTL");
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
@@ -270,7 +322,6 @@ static int xsdfec_probe(struct platform_device *pdev)
 		goto err_xsdfec_dev;
 	}
 
-	atomic_set(&xsdfec->open_count, 1);
 	dev_info(dev, "XSDFEC%d Probe Successful", xsdfec->config.fec_id);
 	atomic_inc(&xsdfec_ndevs);
 	return 0;
diff --git a/include/uapi/misc/xilinx_sdfec.h b/include/uapi/misc/xilinx_sdfec.h
index 1b8a63f..791d412 100644
--- a/include/uapi/misc/xilinx_sdfec.h
+++ b/include/uapi/misc/xilinx_sdfec.h
@@ -41,4 +41,8 @@ struct xsdfec_config {
 	__s32 fec_id;
 };
 
+/*
+ * XSDFEC IOCTL List
+ */
+#define XSDFEC_MAGIC 'f'
 #endif /* __XILINX_SDFEC_H__ */
-- 
2.7.4
