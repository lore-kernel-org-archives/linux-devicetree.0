From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 11/15] tpm/tpm_i2c_stm_st33: Replace wait_for_serirq_timeout by wait_for_tpm_stat
Date: Mon, 13 Oct 2014 22:23:33 +0200
Message-ID: <1413231817-5174-12-git-send-email-christophe-h.ricard@st.com>
References: <1413231817-5174-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413231817-5174-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

The tpm layer already provides a function to wait for a TIS event
wait_for_tpm_stat. Exactly like wait_for_serirq_timeout, it can work in
polling or interrupt mode.
Instead of using a completion struct, we rely on the waitqueue read_queue
and int_queue from chip->vendor field.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 138 +++++++++++++-----------------------
 1 file changed, 48 insertions(+), 90 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index cc5aef3..388bb64 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -39,6 +39,7 @@
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/wait.h>
+#include <linux/freezer.h>
 #include <linux/string.h>
 #include <linux/interrupt.h>
 #include <linux/sysfs.h>
@@ -105,7 +106,6 @@ enum tis_defaults {
 
 struct tpm_stm_dev {
 	struct i2c_client *client;
-	struct completion irq_detection;
 	struct tpm_chip *chip;
 	u8 buf[TPM_BUFSIZE + 1];
 	int io_lpcpd;
@@ -182,56 +182,12 @@ static void clear_interruption(struct tpm_stm_dev *tpm_dev)
 {
 	u8 interrupt;
 
-	I2C_READ_DATA(client, TPM_INT_STATUS, &interrupt, 1);
-	I2C_WRITE_DATA(client, TPM_INT_STATUS, &interrupt, 1);
-	I2C_READ_DATA(client, TPM_INT_STATUS, &interrupt, 1);
+	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
+	I2C_WRITE_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
+	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
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
@@ -244,8 +200,6 @@ static void tpm_stm_i2c_cancel(struct tpm_chip *chip)
 
 	data = TPM_STS_COMMAND_READY;
 	I2C_WRITE_DATA(tpm_dev, TPM_STS, &data, 1);
-	if (chip->vendor.irq)
-		wait_for_serirq_timeout(chip, 1, chip->vendor.timeout_a);
 } /* tpm_stm_i2c_cancel() */
 
 /*
@@ -295,27 +249,37 @@ static int check_locality(struct tpm_chip *chip)
  */
 static int request_locality(struct tpm_chip *chip)
 {
-	unsigned long stop;
+	unsigned long stop, timeout;
 	long r;
 	struct tpm_stm_dev *tpm_dev;
 	u8 data;
 
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-
 	if (check_locality(chip) == chip->vendor.locality)
 		return chip->vendor.locality;
 
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
+
 	data = TPM_ACCESS_REQUEST_USE;
 	r = I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
 	if (r < 0)
 		goto end;
 
+	stop = jiffies + chip->vendor.timeout_a;
+
 	if (chip->vendor.irq) {
-		r = wait_for_serirq_timeout(chip, (check_locality
-						       (chip) >= 0),
-						      chip->vendor.timeout_a);
+again:
+		timeout = stop - jiffies;
+		if ((long) timeout <= 0)
+			return -1;
+		r = wait_event_interruptible_timeout(chip->vendor.read_queue,
+					check_locality(chip) >= 0,
+					timeout);
 		if (r > 0)
 			return chip->vendor.locality;
+		if (r == -ERESTARTSYS && freezing(current)) {
+			clear_thread_flag(TIF_SIGPENDING);
+			goto again;
+		}
 	} else {
 		stop = jiffies + chip->vendor.timeout_a;
 		do {
@@ -387,31 +351,26 @@ end:
  * @param: mask, the value mask to wait
  * @param: timeout, the timeout
  * @param: queue, the wait queue.
+ * @param: check_cancel, does the command can be cancelled ?
  * @return: the tpm status, 0 if success, -ETIME if timeout is reached.
  */
 static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
-			 wait_queue_head_t *queue)
+			 wait_queue_head_t *queue, bool check_cancel)
 {
-	unsigned long stop;
-	long r;
-	u8 status;
+	int r;
+	struct tpm_stm_dev *tpm_dev;
 
-	if (chip->vendor.irq) {
-		r = wait_for_serirq_timeout(chip, ((tpm_stm_i2c_status
-							(chip) & mask) ==
-						       mask), timeout);
-		if (r > 0)
-			return 0;
-	} else {
-		stop = jiffies + timeout;
-		do {
-			msleep(TPM_TIMEOUT);
-			status = tpm_stm_i2c_status(chip);
-			if ((status & mask) == mask)
-				return 0;
-		} while (time_before(jiffies, stop));
-	}
-	return -ETIME;
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
+
+	if (chip->vendor.irq)
+		enable_irq(chip->vendor.irq);
+
+	r = wait_for_tpm_stat(chip, mask, timeout, queue, check_cancel);
+
+	if (chip->vendor.irq)
+		clear_interruption(tpm_dev);
+
+	return r;
 } /* wait_for_stat() */
 
 /*
@@ -432,7 +391,7 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 	       wait_for_stat(chip,
 			     TPM_STS_DATA_AVAIL | TPM_STS_VALID,
 			     chip->vendor.timeout_c,
-			     &chip->vendor.read_queue) == 0) {
+			     &chip->vendor.read_queue, true) == 0) {
 		burstcnt = get_burstcount(chip);
 		if (burstcnt < 0)
 			return burstcnt;
@@ -452,15 +411,10 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
 {
 	struct tpm_chip *chip = dev_id;
-	struct i2c_client *client;
-	struct tpm_stm_dev *tpm_dev;
 
-	disable_irq_nosync(irq);
+	wake_up_interruptible(&chip->vendor.read_queue);
+	disable_irq_nosync(chip->vendor.irq);
 
-	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-	client = tpm_dev->client;
-
-	complete(&tpm_dev->irq_detection);
 	return IRQ_HANDLED;
 } /* tpm_ioserirq_handler() */
 
@@ -503,7 +457,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 		tpm_stm_i2c_cancel(chip);
 		if (wait_for_stat
 		    (chip, TPM_STS_COMMAND_READY, chip->vendor.timeout_b,
-		     &chip->vendor.int_queue) < 0) {
+		     &chip->vendor.read_queue, false) < 0) {
 			r = -ETIME;
 			goto out_err;
 		}
@@ -753,7 +707,9 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	chip->vendor.locality = LOCALITY0;
 
 	if (client->irq) {
-		init_completion(&tpm_dev->irq_detection);
+		/* INTERRUPT Setup */
+		init_waitqueue_head(&chip->vendor.read_queue);
+
 		if (request_locality(chip) != LOCALITY0) {
 			r = -ENODEV;
 			goto _tpm_clean_answer;
@@ -792,6 +748,8 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 		chip->vendor.irq = client->irq;
 
+		disable_irq_nosync(chip->vendor.irq);
+
 		tpm_gen_interrupt(chip);
 	}
 
@@ -857,10 +815,10 @@ static int tpm_stm_i2c_pm_resume(struct device *dev)
 
 	if (gpio_is_valid(pin_infos->io_lpcpd)) {
 		gpio_set_value(pin_infos->io_lpcpd, 1);
-		r = wait_for_serirq_timeout(chip,
-					  (chip->ops->status(chip) &
-					  TPM_STS_VALID) == TPM_STS_VALID,
-					  chip->vendor.timeout_b);
+		r = wait_for_stat(chip,
+				(chip->ops->status(chip) &
+				TPM_STS_VALID) == TPM_STS_VALID, chip->vendor.timeout_b,
+				&chip->vendor.read_queue, false);
 	} else {
 		r = tpm_pm_resume(dev);
 		if (!r)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
