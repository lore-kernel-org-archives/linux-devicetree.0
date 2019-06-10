From: Dragan Cvetic <dragan.cvetic@xilinx.com>
Subject: [PATCH V6 05/11] misc: xilinx_sdfec: Add ability to configure turbo
Date: Mon, 10 Jun 2019 14:45:08 +0100
Message-ID: <1560174314-124649-6-git-send-email-dragan.cvetic@xilinx.com>
References: <1560174314-124649-1-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560174314-124649-1-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Dragan Cvetic <dragan.cvetic@xilinx.com>, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add the capability to configure and retrieve turbo mode
via the ioctls XSDFEC_SET_TURBO and XSDFEC_GET_TURBO.
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
 drivers/misc/xilinx_sdfec.c      | 110 +++++++++++++++++++++++++++++++++++++++
 include/uapi/misc/xilinx_sdfec.h |  67 ++++++++++++++++++++++++
 2 files changed, 177 insertions(+)

diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index 3b031c6..37107dd 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -19,6 +19,7 @@
 #include <linux/poll.h>
 #include <linux/slab.h>
 #include <linux/clk.h>
+#include <linux/compat.h>
 
 #include <uapi/misc/xilinx_sdfec.h>
 
@@ -106,6 +107,12 @@ static struct mutex dev_idr_lock;
 /* BYPASS Register */
 #define XSDFEC_BYPASS_ADDR (0x3C)
 
+/* Turbo Code Register */
+#define XSDFEC_TURBO_ADDR (0x100)
+#define XSDFEC_TURBO_SCALE_MASK (0xFFF)
+#define XSDFEC_TURBO_SCALE_BIT_POS (8)
+#define XSDFEC_TURBO_SCALE_MAX (15)
+
 /**
  * struct xsdfec_clks - For managing SD-FEC clocks
  * @core_clk: Main processing clock for core
@@ -214,6 +221,55 @@ static void update_config_from_hw(struct xsdfec_dev *xsdfec)
 		xsdfec->state = XSDFEC_STOPPED;
 }
 
+static int xsdfec_set_turbo(struct xsdfec_dev *xsdfec, void __user *arg)
+{
+	struct xsdfec_turbo turbo;
+	int err;
+	u32 turbo_write;
+
+	err = copy_from_user(&turbo, arg, sizeof(turbo));
+	if (err)
+		return -EFAULT;
+
+	if (turbo.alg >= XSDFEC_TURBO_ALG_MAX)
+		return -EINVAL;
+
+	if (turbo.scale > XSDFEC_TURBO_SCALE_MAX)
+		return -EINVAL;
+
+	/* Check to see what device tree says about the FEC codes */
+	if (xsdfec->config.code == XSDFEC_LDPC_CODE)
+		return -EIO;
+
+	turbo_write = ((turbo.scale & XSDFEC_TURBO_SCALE_MASK)
+		       << XSDFEC_TURBO_SCALE_BIT_POS) |
+		      turbo.alg;
+	xsdfec_regwrite(xsdfec, XSDFEC_TURBO_ADDR, turbo_write);
+	return err;
+}
+
+static int xsdfec_get_turbo(struct xsdfec_dev *xsdfec, void __user *arg)
+{
+	u32 reg_value;
+	struct xsdfec_turbo turbo_params;
+	int err;
+
+	if (xsdfec->config.code == XSDFEC_LDPC_CODE)
+		return -EIO;
+
+	reg_value = xsdfec_regread(xsdfec, XSDFEC_TURBO_ADDR);
+
+	turbo_params.scale = (reg_value & XSDFEC_TURBO_SCALE_MASK) >>
+			     XSDFEC_TURBO_SCALE_BIT_POS;
+	turbo_params.alg = reg_value & 0x1;
+
+	err = copy_to_user(arg, &turbo_params, sizeof(turbo_params));
+	if (err)
+		err = -EFAULT;
+
+	return err;
+}
+
 static u32
 xsdfec_translate_axis_width_cfg_val(enum xsdfec_axis_width axis_width_cfg)
 {
@@ -277,8 +333,62 @@ static int xsdfec_cfg_axi_streams(struct xsdfec_dev *xsdfec)
 	return 0;
 }
 
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
+
+	/* check if ioctl argument is present and valid */
+	if (_IOC_DIR(cmd) != _IOC_NONE) {
+		arg = (void __user *)data;
+		if (!arg)
+			return rval;
+	}
+
+	switch (cmd) {
+	case XSDFEC_SET_TURBO:
+		rval = xsdfec_set_turbo(xsdfec, arg);
+		break;
+	case XSDFEC_GET_TURBO:
+		rval = xsdfec_get_turbo(xsdfec, arg);
+		break;
+	default:
+		/* Should not get here */
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
 
 static int xsdfec_parse_of(struct xsdfec_dev *xsdfec)
diff --git a/include/uapi/misc/xilinx_sdfec.h b/include/uapi/misc/xilinx_sdfec.h
index aec26b3..8be14cf 100644
--- a/include/uapi/misc/xilinx_sdfec.h
+++ b/include/uapi/misc/xilinx_sdfec.h
@@ -41,6 +41,22 @@ enum xsdfec_order {
 };
 
 /**
+ * enum xsdfec_turbo_alg - Turbo Algorithm Type.
+ * @XSDFEC_MAX_SCALE: Max Log-Map algorithm with extrinsic scaling. When
+ *		      scaling is set to this is equivalent to the Max Log-Map
+ *		      algorithm.
+ * @XSDFEC_MAX_STAR: Log-Map algorithm.
+ * @XSDFEC_TURBO_ALG_MAX: Used to indicate out of bound Turbo algorithms.
+ *
+ * This enum specifies which Turbo Decode algorithm is in use.
+ */
+enum xsdfec_turbo_alg {
+	XSDFEC_MAX_SCALE = 0,
+	XSDFEC_MAX_STAR,
+	XSDFEC_TURBO_ALG_MAX,
+};
+
+/**
  * enum xsdfec_state - State.
  * @XSDFEC_INIT: Driver is initialized.
  * @XSDFEC_STARTED: Driver is started.
@@ -98,6 +114,29 @@ enum xsdfec_axis_word_include {
 };
 
 /**
+ * struct xsdfec_turbo - User data for Turbo codes.
+ * @alg: Specifies which Turbo decode algorithm to use
+ * @scale: Specifies the extrinsic scaling to apply when the Max Scale algorithm
+ *	   has been selected
+ *
+ * Turbo code structure to communicate parameters to XSDFEC driver.
+ */
+struct xsdfec_turbo {
+	__u32 alg;
+	__u8 scale;
+};
+
+/**
+ * struct xsdfec_status - Status of SD-FEC core.
+ * @state: State of the SD-FEC core
+ * @activity: Describes if the SD-FEC instance is Active
+ */
+struct xsdfec_status {
+	__u32 state;
+	__s8 activity;
+};
+
+/**
  * struct xsdfec_irq - Enabling or Disabling Interrupts.
  * @enable_isr: If true enables the ISR
  * @enable_ecc_isr: If true enables the ECC ISR
@@ -135,4 +174,32 @@ struct xsdfec_config {
  * XSDFEC IOCTL List
  */
 #define XSDFEC_MAGIC 'f'
+/**
+ * DOC: XSDFEC_SET_TURBO
+ * @Parameters
+ *
+ * @struct xsdfec_turbo *
+ *	Pointer to the &struct xsdfec_turbo that contains the Turbo decode
+ *	settings for the SD-FEC core
+ *
+ * @Description
+ *
+ * ioctl that sets the SD-FEC Turbo parameter values
+ *
+ * This can only be used when the driver is in the XSDFEC_STOPPED state
+ */
+#define XSDFEC_SET_TURBO _IOW(XSDFEC_MAGIC, 4, struct xsdfec_turbo)
+/**
+ * DOC: XSDFEC_GET_TURBO
+ * @Parameters
+ *
+ * @struct xsdfec_turbo *
+ *	Pointer to the &struct xsdfec_turbo that contains the current Turbo
+ *	decode settings of the SD-FEC Block
+ *
+ * @Description
+ *
+ * ioctl that returns SD-FEC turbo param values
+ */
+#define XSDFEC_GET_TURBO _IOR(XSDFEC_MAGIC, 7, struct xsdfec_turbo)
 #endif /* __XILINX_SDFEC_H__ */
-- 
2.7.4
