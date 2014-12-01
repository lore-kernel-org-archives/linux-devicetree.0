From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 13/15] tpm/tpm_i2c_stm_st33: Interrupt management improvement
Date: Mon,  1 Dec 2014 01:20:45 +0100
Message-ID: <1417393247-4479-14-git-send-email-christophe-h.ricard@st.com>
References: <1417393247-4479-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417393247-4479-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Improve the irq management by using a new function wait_for_stat.
Instead of using a completion struct, we rely on the waitqueue read_queue
and int_queue from chip->vendor field.

Reviewed-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 197 ++++++++++++++++++++----------------
 1 file changed, 109 insertions(+), 88 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 298bd58..e239317 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -38,6 +38,7 @@
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/wait.h>
+#include <linux/freezer.h>
 #include <linux/string.h>
 #include <linux/interrupt.h>
 #include <linux/sysfs.h>
@@ -102,9 +103,9 @@ enum tis_defaults {
 
 struct tpm_stm_dev {
 	struct i2c_client *client;
-	struct completion irq_detection;
 	struct tpm_chip *chip;
 	u8 buf[TPM_BUFSIZE + 1];
+	u32 intrs;
 	int io_lpcpd;
 };
 
@@ -174,61 +175,18 @@ static int read8_reg(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
  * clear_interruption
  * clear the TPM interrupt register.
  * @param: tpm, the chip description
+ * @return: the TPM_INT_STATUS value
  */
-static void clear_interruption(struct tpm_stm_dev *tpm_dev)
+static u8 clear_interruption(struct tpm_stm_dev *tpm_dev)
 {
 	u8 interrupt;
 
 	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
 	I2C_WRITE_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
-	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
+	return interrupt;
 } /* clear_interruption() */
 
 /*
- * _wait_for_interrupt_serirq_timeout
- * @param: tpm, the chip description
- * @param: timeout, the timeout of the interrupt
- * @return: the status of the interruption.
- */
-static long _wait_for_interrupt_serirq_timeout(struct tpm_chip *chip,
-						unsigned long timeout)
-{
-	long status;
-	struct i2c_client *client;
-	struct tpm_stm_dev *tpm_dev;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-	client = tpm_dev->client;
-
-	status = wait_for_completion_interruptible_timeout(
-					&tpm_dev->irq_detection,
-					timeout);
-	if (status > 0)
-		enable_irq(client->irq);
-
-	return status;
-} /* wait_for_interrupt_serirq_timeout() */
-
-static int wait_for_serirq_timeout(struct tpm_chip *chip, bool condition,
-				 unsigned long timeout)
-{
-	int status = 2;
-	struct tpm_stm_dev *tpm_dev;
-
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
-	status = _wait_for_interrupt_serirq_timeout(chip, timeout);
-	if (!status) {
-		status = -EBUSY;
-	} else {
-		clear_interruption(tpm_dev);
-		if (condition)
-			status = 1;
-	}
-	return status;
-} /* wait_for_serirq_timeout() */
-
-/*
  * tpm_stm_i2c_cancel, cancel is not implemented.
  * @param: chip, the tpm_chip description as specified in driver/char/tpm/tpm.h
  */
@@ -241,8 +199,6 @@ static void tpm_stm_i2c_cancel(struct tpm_chip *chip)
 
 	data = TPM_STS_COMMAND_READY;
 	I2C_WRITE_DATA(tpm_dev, TPM_STS, &data, 1);
-	if (chip->vendor.irq)
-		wait_for_serirq_timeout(chip, 1, chip->vendor.timeout_a);
 } /* tpm_stm_i2c_cancel() */
 
 /*
@@ -297,30 +253,24 @@ static int request_locality(struct tpm_chip *chip)
 	struct tpm_stm_dev *tpm_dev;
 	u8 data;
 
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
 	if (check_locality(chip) == chip->vendor.locality)
 		return chip->vendor.locality;
 
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
+
 	data = TPM_ACCESS_REQUEST_USE;
 	ret = I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
 	if (ret < 0)
 		goto end;
 
-	if (chip->vendor.irq) {
-		ret = wait_for_serirq_timeout(chip, (check_locality
-						       (chip) >= 0),
-						      chip->vendor.timeout_a);
-		if (ret > 0)
+	stop = jiffies + chip->vendor.timeout_a;
+
+	/* Request locality is usually effective after the request */
+	do {
+		if (check_locality(chip) >= 0)
 			return chip->vendor.locality;
-	} else {
-		stop = jiffies + chip->vendor.timeout_a;
-		do {
-			if (check_locality(chip) >= 0)
-				return chip->vendor.locality;
-			msleep(TPM_TIMEOUT);
-		} while (time_before(jiffies, stop));
-	}
+		msleep(TPM_TIMEOUT);
+	} while (time_before(jiffies, stop));
 	ret = -EACCES;
 end:
 	return ret;
@@ -378,36 +328,107 @@ end:
 	return -EBUSY;
 } /* get_burstcount() */
 
+static bool wait_for_tpm_stat_cond(struct tpm_chip *chip, u8 mask,
+				bool check_cancel, bool *canceled)
+{
+	u8 status = chip->ops->status(chip);
+
+	*canceled = false;
+	if ((status & mask) == mask)
+		return true;
+	if (check_cancel && chip->ops->req_canceled(chip, status)) {
+		*canceled = true;
+		return true;
+	}
+	return false;
+}
+
+/*
+ * interrupt_to_status
+ * @param: irq_mask, the irq mask value to wait
+ * @return: the corresponding tpm_sts value
+ */
+static u8 interrupt_to_status(u8 irq_mask)
+{
+	u8 status = 0;
+
+	if ((irq_mask & TPM_INTF_STS_VALID_INT) ==  TPM_INTF_STS_VALID_INT)
+		status |= TPM_STS_VALID;
+	if ((irq_mask & TPM_INTF_DATA_AVAIL_INT) == TPM_INTF_DATA_AVAIL_INT)
+		status |= TPM_STS_DATA_AVAIL;
+	if ((irq_mask & TPM_INTF_CMD_READY_INT) == TPM_INTF_CMD_READY_INT)
+		status |= TPM_STS_COMMAND_READY;
+
+	return status;
+} /* status_to_interrupt() */
+
 /*
  * wait_for_stat wait for a TPM_STS value
  * @param: chip, the tpm chip description
  * @param: mask, the value mask to wait
  * @param: timeout, the timeout
  * @param: queue, the wait queue.
+ * @param: check_cancel, does the command can be cancelled ?
  * @return: the tpm status, 0 if success, -ETIME if timeout is reached.
  */
 static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
-			 wait_queue_head_t *queue)
+			wait_queue_head_t *queue, bool check_cancel)
 {
 	unsigned long stop;
-	long ret;
-	u8 status;
+	int r;
+	bool canceled = false;
+	bool condition;
+	u32 cur_intrs;
+	u8 interrupt, status;
+	struct tpm_stm_dev *tpm_dev;
+
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
+
+	/* check current status */
+	status = tpm_stm_i2c_status(chip);
+	if ((status & mask) == mask)
+		return 0;
+
+	stop = jiffies + timeout;
 
 	if (chip->vendor.irq) {
-		ret = wait_for_serirq_timeout(chip, ((tpm_stm_i2c_status
-							(chip) & mask) ==
-						       mask), timeout);
-		if (ret > 0)
+		cur_intrs = tpm_dev->intrs;
+		interrupt = clear_interruption(tpm_dev);
+		enable_irq(chip->vendor.irq);
+
+again:
+		timeout = stop - jiffies;
+		if ((long) timeout <= 0)
+			return -1;
+
+		r = wait_event_interruptible_timeout(*queue,
+					cur_intrs != tpm_dev->intrs, timeout);
+
+		interrupt |= clear_interruption(tpm_dev);
+		status = interrupt_to_status(interrupt);
+		condition = wait_for_tpm_stat_cond(chip, mask,
+						   check_cancel, &canceled);
+
+		if (r >= 0 && condition) {
+			if (canceled)
+				return -ECANCELED;
 			return 0;
+		}
+		if (r == -ERESTARTSYS && freezing(current)) {
+			clear_thread_flag(TIF_SIGPENDING);
+			goto again;
+		}
+		disable_irq_nosync(chip->vendor.irq);
+
 	} else {
-		stop = jiffies + timeout;
 		do {
 			msleep(TPM_TIMEOUT);
-			status = tpm_stm_i2c_status(chip);
+			status = chip->ops->status(chip);
 			if ((status & mask) == mask)
 				return 0;
 		} while (time_before(jiffies, stop));
 	}
+
 	return -ETIME;
 } /* wait_for_stat() */
 
@@ -429,7 +450,7 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 	       wait_for_stat(chip,
 			     TPM_STS_DATA_AVAIL | TPM_STS_VALID,
 			     chip->vendor.timeout_c,
-			     &chip->vendor.read_queue) == 0) {
+			     &chip->vendor.read_queue, true) == 0) {
 		burstcnt = get_burstcount(chip);
 		if (burstcnt < 0)
 			return burstcnt;
@@ -449,15 +470,14 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
 {
 	struct tpm_chip *chip = dev_id;
-	struct i2c_client *client;
 	struct tpm_stm_dev *tpm_dev;
 
-	disable_irq_nosync(irq);
-
 	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-	client = tpm_dev->client;
 
-	complete(&tpm_dev->irq_detection);
+	tpm_dev->intrs++;
+	wake_up_interruptible(&chip->vendor.read_queue);
+	disable_irq_nosync(chip->vendor.irq);
+
 	return IRQ_HANDLED;
 } /* tpm_ioserirq_handler() */
 
@@ -500,7 +520,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 		tpm_stm_i2c_cancel(chip);
 		if (wait_for_stat
 		    (chip, TPM_STS_COMMAND_READY, chip->vendor.timeout_b,
-		     &chip->vendor.int_queue) < 0) {
+		     &chip->vendor.read_queue, false) < 0) {
 			ret = -ETIME;
 			goto out_err;
 		}
@@ -751,7 +771,10 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	chip->vendor.locality = LOCALITY0;
 
 	if (client->irq) {
-		init_completion(&tpm_dev->irq_detection);
+		/* INTERRUPT Setup */
+		init_waitqueue_head(&chip->vendor.read_queue);
+		tpm_dev->intrs = 0;
+
 		if (request_locality(chip) != LOCALITY0) {
 			ret = -ENODEV;
 			goto _tpm_clean_answer;
@@ -773,9 +796,6 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			goto _tpm_clean_answer;
 
 		intmask |= TPM_INTF_CMD_READY_INT
-			|  TPM_INTF_FIFO_AVALAIBLE_INT
-			|  TPM_INTF_WAKE_UP_READY_INT
-			|  TPM_INTF_LOCALITY_CHANGE_INT
 			|  TPM_INTF_STS_VALID_INT
 			|  TPM_INTF_DATA_AVAIL_INT;
 
@@ -795,6 +815,8 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 		chip->vendor.irq = client->irq;
 
+		disable_irq_nosync(chip->vendor.irq);
+
 		tpm_gen_interrupt(chip);
 	}
 
@@ -860,10 +882,9 @@ static int tpm_stm_i2c_pm_resume(struct device *dev)
 
 	if (gpio_is_valid(pin_infos->io_lpcpd)) {
 		gpio_set_value(pin_infos->io_lpcpd, 1);
-		ret = wait_for_serirq_timeout(chip,
-					  (chip->ops->status(chip) &
-					  TPM_STS_VALID) == TPM_STS_VALID,
-					  chip->vendor.timeout_b);
+		ret = wait_for_stat(chip,
+				TPM_STS_VALID, chip->vendor.timeout_b,
+				&chip->vendor.read_queue, false);
 	} else {
 		ret = tpm_pm_resume(dev);
 		if (!ret)
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
