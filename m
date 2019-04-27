From: Dragan Cvetic <dragan.cvetic@xilinx.com>
Subject: [PATCH V3 09/12] misc: xilinx_sdfec: Support poll file operation
Date: Sat, 27 Apr 2019 23:05:03 +0100
Message-ID: <1556402706-176271-10-git-send-email-dragan.cvetic@xilinx.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Dragan Cvetic <dragan.cvetic@xilinx.com>, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

Support monitoring and detecting the SD-FEC error events
through IRQ and poll file operation.

The SD-FEC device can detect one-error or multi-error events.
An error triggers an interrupt which creates and run the ONE_SHOT
IRQ thread.
The ONE_SHOT IRQ thread detects type of error and pass that
information to the poll function.
The file_operation callback poll(), collects the events and
updates the statistics accordingly.
The function poll blocks() on waiting queue which can be
unblocked by ONE_SHOT IRQ handling thread.

Support SD-FEC interrupt set ioctl callback.
The SD-FEC can detect two type of errors: coding errors (ECC) and
a data interface errors (TLAST).
The errors are  events which can trigger an IRQ if enabled.
The driver can monitor and detect these errors through IRQ.
Also the driver updates the statistical data.

Tested-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
---
 drivers/misc/xilinx_sdfec.c      | 283 +++++++++++++++++++++++++++++++++++++++
 include/uapi/misc/xilinx_sdfec.h |  13 ++
 2 files changed, 296 insertions(+)

diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
index 560a2ed..32b2e2d 100644
--- a/drivers/misc/xilinx_sdfec.c
+++ b/drivers/misc/xilinx_sdfec.c
@@ -203,8 +203,15 @@ struct xsdfec_clks {
  * @dev: pointer to device struct
  * @state: State of the SDFEC device
  * @config: Configuration of the SDFEC device
+ * @state_updated: indicates State updated by interrupt handler
+ * @stats_updated: indicates Stats updated by interrupt handler
+ * @isr_err_count: Count of ISR errors
+ * @cecc_count: Count of Correctable ECC errors (SBE)
+ * @uecc_count: Count of Uncorrectable ECC errors (MBE)
  * @open_count: Count of char device being opened
+ * @irq: IRQ number
  * @xsdfec_cdev: Character device handle
+ * @waitq: Driver wait queue
  * @irq_lock: Driver spinlock
  * @clks: Clocks managed by the SDFEC driver
  *
@@ -215,8 +222,15 @@ struct xsdfec_dev {
 	struct device *dev;
 	enum xsdfec_state state;
 	struct xsdfec_config config;
+	bool state_updated;
+	bool stats_updated;
+	atomic_t isr_err_count;
+	atomic_t cecc_count;
+	atomic_t uecc_count;
 	atomic_t open_count;
+	int irq;
 	struct cdev xsdfec_cdev;
+	wait_queue_head_t waitq;
 	/* Spinlock to protect state_updated and stats_updated */
 	spinlock_t irq_lock;
 	struct xsdfec_clks clks;
@@ -317,6 +331,90 @@ static int xsdfec_get_config(struct xsdfec_dev *xsdfec, void __user *arg)
 	return err;
 }
 
+static int xsdfec_isr_enable(struct xsdfec_dev *xsdfec, bool enable)
+{
+	u32 mask_read;
+
+	if (enable) {
+		/* Enable */
+		xsdfec_regwrite(xsdfec, XSDFEC_IER_ADDR, XSDFEC_ISR_MASK);
+		mask_read = xsdfec_regread(xsdfec, XSDFEC_IMR_ADDR);
+		if (mask_read & XSDFEC_ISR_MASK) {
+			dev_err(xsdfec->dev,
+				"SDFEC enabling irq with IER failed");
+			return -EIO;
+		}
+	} else {
+		/* Disable */
+		xsdfec_regwrite(xsdfec, XSDFEC_IDR_ADDR, XSDFEC_ISR_MASK);
+		mask_read = xsdfec_regread(xsdfec, XSDFEC_IMR_ADDR);
+		if ((mask_read & XSDFEC_ISR_MASK) != XSDFEC_ISR_MASK) {
+			dev_err(xsdfec->dev,
+				"SDFEC disabling irq with IDR failed");
+			return -EIO;
+		}
+	}
+	return 0;
+}
+
+static int xsdfec_ecc_isr_enable(struct xsdfec_dev *xsdfec, bool enable)
+{
+	u32 mask_read;
+
+	if (enable) {
+		/* Enable */
+		xsdfec_regwrite(xsdfec, XSDFEC_ECC_IER_ADDR,
+				XSDFEC_ALL_ECC_ISR_MASK);
+		mask_read = xsdfec_regread(xsdfec, XSDFEC_ECC_IMR_ADDR);
+		if (mask_read & XSDFEC_ALL_ECC_ISR_MASK) {
+			dev_err(xsdfec->dev,
+				"SDFEC enabling ECC irq with ECC IER failed");
+			return -EIO;
+		}
+	} else {
+		/* Disable */
+		xsdfec_regwrite(xsdfec, XSDFEC_ECC_IDR_ADDR,
+				XSDFEC_ALL_ECC_ISR_MASK);
+		mask_read = xsdfec_regread(xsdfec, XSDFEC_ECC_IMR_ADDR);
+		if (!(((mask_read & XSDFEC_ALL_ECC_ISR_MASK) ==
+		       XSDFEC_ECC_ISR_MASK) ||
+		      ((mask_read & XSDFEC_ALL_ECC_ISR_MASK) ==
+		       XSDFEC_PL_INIT_ECC_ISR_MASK))) {
+			dev_err(xsdfec->dev,
+				"SDFEC disable ECC irq with ECC IDR failed");
+			return -EIO;
+		}
+	}
+	return 0;
+}
+
+static int xsdfec_set_irq(struct xsdfec_dev *xsdfec, void __user *arg)
+{
+	struct xsdfec_irq irq;
+	int err;
+	int isr_err;
+	int ecc_err;
+
+	err = copy_from_user(&irq, arg, sizeof(irq));
+	if (err)
+		return -EFAULT;
+
+	/* Setup tlast related IRQ */
+	isr_err = xsdfec_isr_enable(xsdfec, irq.enable_isr);
+	if (!isr_err)
+		xsdfec->config.irq.enable_isr = irq.enable_isr;
+
+	/* Setup ECC related IRQ */
+	ecc_err = xsdfec_ecc_isr_enable(xsdfec, irq.enable_ecc_isr);
+	if (!ecc_err)
+		xsdfec->config.irq.enable_ecc_isr = irq.enable_ecc_isr;
+
+	if (isr_err < 0 || ecc_err < 0)
+		err = -EIO;
+
+	return err;
+}
+
 static int xsdfec_set_turbo(struct xsdfec_dev *xsdfec, void __user *arg)
 {
 	struct xsdfec_turbo turbo;
@@ -831,6 +929,9 @@ static long xsdfec_dev_ioctl(struct file *fptr, unsigned int cmd,
 	case XSDFEC_GET_CONFIG:
 		rval = xsdfec_get_config(xsdfec, arg);
 		break;
+	case XSDFEC_SET_IRQ:
+		rval = xsdfec_set_irq(xsdfec, arg);
+		break;
 	case XSDFEC_SET_TURBO:
 		rval = xsdfec_set_turbo(xsdfec, arg);
 		break;
@@ -865,11 +966,34 @@ static long xsdfec_dev_compat_ioctl(struct file *file, unsigned int cmd,
 }
 #endif
 
+static unsigned int xsdfec_poll(struct file *file, poll_table *wait)
+{
+	unsigned int mask = 0;
+	struct xsdfec_dev *xsdfec = file->private_data;
+
+	if (!xsdfec)
+		return POLLNVAL | POLLHUP;
+
+	poll_wait(file, &xsdfec->waitq, wait);
+
+	/* XSDFEC ISR detected an error */
+	spin_lock_irq(&xsdfec->irq_lock);
+	if (xsdfec->state_updated)
+		mask |= POLLIN | POLLPRI;
+
+	if (xsdfec->stats_updated)
+		mask |= POLLIN | POLLRDNORM;
+	spin_unlock_irq(&xsdfec->irq_lock);
+
+	return mask;
+}
+
 static const struct file_operations xsdfec_fops = {
 	.owner = THIS_MODULE,
 	.open = xsdfec_dev_open,
 	.release = xsdfec_dev_release,
 	.unlocked_ioctl = xsdfec_dev_ioctl,
+	.poll = xsdfec_poll,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl = xsdfec_dev_compat_ioctl,
 #endif
@@ -973,6 +1097,146 @@ static int xsdfec_parse_of(struct xsdfec_dev *xsdfec)
 	return 0;
 }
 
+static void xsdfec_count_and_clear_ecc_multi_errors(struct xsdfec_dev *xsdfec,
+						    u32 uecc)
+{
+	u32 uecc_event;
+
+	/* Update ECC ISR error counts */
+	atomic_add(hweight32(uecc), &xsdfec->uecc_count);
+	xsdfec->stats_updated = true;
+
+	/* Clear ECC errors */
+	xsdfec_regwrite(xsdfec, XSDFEC_ECC_ISR_ADDR,
+			XSDFEC_ALL_ECC_ISR_MBE_MASK);
+	/* Clear ECC events */
+	if (uecc & XSDFEC_ECC_ISR_MBE_MASK) {
+		uecc_event = uecc >> XSDFEC_ECC_ISR_MBE_TO_EVENT_SHIFT;
+		xsdfec_regwrite(xsdfec, XSDFEC_ECC_ISR_ADDR, uecc_event);
+	} else if (uecc & XSDFEC_PL_INIT_ECC_ISR_MBE_MASK) {
+		uecc_event = uecc >> XSDFEC_PL_INIT_ECC_ISR_MBE_TO_EVENT_SHIFT;
+		xsdfec_regwrite(xsdfec, XSDFEC_ECC_ISR_ADDR, uecc_event);
+	}
+}
+
+static void xsdfec_count_and_clear_ecc_single_errors(struct xsdfec_dev *xsdfec,
+						     u32 cecc, u32 sbe_mask)
+{
+	/* Update ECC ISR error counts */
+	atomic_add(hweight32(cecc), &xsdfec->cecc_count);
+	xsdfec->stats_updated = true;
+
+	/* Clear ECC errors */
+	xsdfec_regwrite(xsdfec, XSDFEC_ECC_ISR_ADDR, sbe_mask);
+}
+
+static void xsdfec_count_and_clear_isr_errors(struct xsdfec_dev *xsdfec,
+					      u32 isr_err)
+{
+	/* Update ISR error counts */
+	atomic_add(hweight32(isr_err), &xsdfec->isr_err_count);
+	xsdfec->stats_updated = true;
+
+	/* Clear ISR error status */
+	xsdfec_regwrite(xsdfec, XSDFEC_ISR_ADDR, XSDFEC_ISR_MASK);
+}
+
+static void xsdfec_update_state_for_isr_err(struct xsdfec_dev *xsdfec)
+{
+	xsdfec->state = XSDFEC_NEEDS_RESET;
+	xsdfec->state_updated = true;
+}
+
+static void xsdfec_update_state_for_ecc_err(struct xsdfec_dev *xsdfec,
+					    u32 ecc_err)
+{
+	if (ecc_err & XSDFEC_ECC_ISR_MBE_MASK)
+		xsdfec->state = XSDFEC_NEEDS_RESET;
+	else if (ecc_err & XSDFEC_PL_INIT_ECC_ISR_MBE_MASK)
+		xsdfec->state = XSDFEC_PL_RECONFIGURE;
+
+	xsdfec->state_updated = true;
+}
+
+static int xsdfec_get_sbe_mask(u32 ecc_err)
+{
+	u32 sbe_mask = XSDFEC_ALL_ECC_ISR_SBE_MASK;
+
+	if (ecc_err & XSDFEC_ECC_ISR_MBE_MASK) {
+		sbe_mask = (XSDFEC_ECC_ISR_MBE_MASK - ecc_err) >>
+			   XSDFEC_ECC_ISR_MBE_TO_EVENT_SHIFT;
+	} else if (ecc_err & XSDFEC_PL_INIT_ECC_ISR_MBE_MASK)
+		sbe_mask = (XSDFEC_PL_INIT_ECC_ISR_MBE_MASK - ecc_err) >>
+			   XSDFEC_PL_INIT_ECC_ISR_MBE_TO_EVENT_SHIFT;
+
+	return sbe_mask;
+}
+
+static irqreturn_t xsdfec_irq_thread(int irq, void *dev_id)
+{
+	struct xsdfec_dev *xsdfec = dev_id;
+	irqreturn_t ret = IRQ_HANDLED;
+	u32 ecc_err;
+	u32 isr_err;
+	u32 err_value;
+	u32 sbe_mask;
+
+	WARN_ON(xsdfec->irq != irq);
+
+	/* Mask Interrupts */
+	xsdfec_isr_enable(xsdfec, false);
+	xsdfec_ecc_isr_enable(xsdfec, false);
+
+	/* Read Interrupt Status Registers */
+	ecc_err = xsdfec_regread(xsdfec, XSDFEC_ECC_ISR_ADDR);
+	isr_err = xsdfec_regread(xsdfec, XSDFEC_ISR_ADDR);
+
+	spin_lock(&xsdfec->irq_lock);
+
+	err_value = ecc_err & XSDFEC_ALL_ECC_ISR_MBE_MASK;
+	if (err_value) {
+		dev_err(xsdfec->dev, "Multi-bit error on xsdfec%d",
+			xsdfec->config.fec_id);
+		/* Count and clear multi-bit errors and associated events */
+		xsdfec_count_and_clear_ecc_multi_errors(xsdfec, err_value);
+		xsdfec_update_state_for_ecc_err(xsdfec, ecc_err);
+	}
+
+	/*
+	 * Update SBE mask to remove events associated with MBE if present.
+	 * If no MBEs are present will return mask for all SBE bits
+	 */
+	sbe_mask = xsdfec_get_sbe_mask(err_value);
+	err_value = ecc_err & sbe_mask;
+	if (err_value) {
+		dev_info(xsdfec->dev, "Correctable error on xsdfec%d",
+			 xsdfec->config.fec_id);
+		xsdfec_count_and_clear_ecc_single_errors(xsdfec, err_value,
+							 sbe_mask);
+	}
+
+	err_value = isr_err & XSDFEC_ISR_MASK;
+	if (err_value) {
+		dev_err(xsdfec->dev,
+			"Tlast,or DIN_WORDS or DOUT_WORDS not correct");
+		xsdfec_count_and_clear_isr_errors(xsdfec, err_value);
+		xsdfec_update_state_for_isr_err(xsdfec);
+	}
+
+	if (xsdfec->state_updated || xsdfec->stats_updated)
+		wake_up_interruptible(&xsdfec->waitq);
+	else
+		ret = IRQ_NONE;
+
+	/* Unmaks Interrupts */
+	xsdfec_isr_enable(xsdfec, true);
+	xsdfec_ecc_isr_enable(xsdfec, true);
+
+	spin_unlock(&xsdfec->irq_lock);
+
+	return ret;
+}
+
 static int xsdfec_clk_init(struct platform_device *pdev,
 			   struct xsdfec_clks *clks)
 {
@@ -1103,6 +1367,7 @@ static int xsdfec_probe(struct platform_device *pdev)
 	struct device *dev_create;
 	struct resource *res;
 	int err;
+	bool irq_enabled = true;
 
 	xsdfec = devm_kzalloc(&pdev->dev, sizeof(*xsdfec), GFP_KERNEL);
 	if (!xsdfec)
@@ -1125,6 +1390,12 @@ static int xsdfec_probe(struct platform_device *pdev)
 		goto err_xsdfec_dev;
 	}
 
+	xsdfec->irq = platform_get_irq(pdev, 0);
+	if (xsdfec->irq < 0) {
+		dev_dbg(dev, "platform_get_irq failed");
+		irq_enabled = false;
+	}
+
 	err = xsdfec_parse_of(xsdfec);
 	if (err < 0)
 		goto err_xsdfec_dev;
@@ -1134,6 +1405,18 @@ static int xsdfec_probe(struct platform_device *pdev)
 	/* Save driver private data */
 	platform_set_drvdata(pdev, xsdfec);
 
+	if (irq_enabled) {
+		init_waitqueue_head(&xsdfec->waitq);
+		/* Register IRQ thread */
+		err = devm_request_threaded_irq(dev, xsdfec->irq, NULL,
+						xsdfec_irq_thread, IRQF_ONESHOT,
+						"xilinx-sdfec16", xsdfec);
+		if (err < 0) {
+			dev_err(dev, "unable to request IRQ%d", xsdfec->irq);
+			goto err_xsdfec_dev;
+		}
+	}
+
 	cdev_init(&xsdfec->xsdfec_cdev, &xsdfec_fops);
 	xsdfec->xsdfec_cdev.owner = THIS_MODULE;
 	err = cdev_add(&xsdfec->xsdfec_cdev,
diff --git a/include/uapi/misc/xilinx_sdfec.h b/include/uapi/misc/xilinx_sdfec.h
index 5532572..120f7a3 100644
--- a/include/uapi/misc/xilinx_sdfec.h
+++ b/include/uapi/misc/xilinx_sdfec.h
@@ -279,6 +279,19 @@ xsdfec_calculate_shared_ldpc_table_entry_size(struct xsdfec_ldpc_params *ldpc,
  */
 #define XSDFEC_MAGIC 'f'
 /**
+ * DOC: XSDFEC_SET_IRQ
+ * @Parameters
+ *
+ * @struct xsdfec_irq *
+ *	Pointer to the &struct xsdfec_irq that contains the interrupt settings
+ *	for the SD-FEC core
+ *
+ * @Description
+ *
+ * ioctl to enable or disable irq
+ */
+#define XSDFEC_SET_IRQ _IOW(XSDFEC_MAGIC, 3, struct xsdfec_irq)
+/**
  * DOC: XSDFEC_SET_TURBO
  * @Parameters
  *
-- 
2.7.4
