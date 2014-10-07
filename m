From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/16] tpm/tpm_i2c_stm_st33: Replace wait_for_serirq_timeout by wait_for_tpm_stat
Date: Tue,  7 Oct 2014 22:03:03 +0200
Message-ID: <1412712189-1234-11-git-send-email-christophe-h.ricard@st.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412712189-1234-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The tpm layer already provides a function to wait for a TIS event
wait_for_tpm_stat. Exactly like wait_for_serirq_timeout, it can work in
polling or interrupt mode.
Instead of using a completion struct, we rely on the waitqueue read_queue
and int_queue from chip->vendor field.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 152 ++++++++++++------------------------
 1 file changed, 48 insertions(+), 104 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index cb5a0387..e99bb78 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -39,6 +39,7 @@
 #include <linux/kernel.h>
 #include <linux/delay.h>
 #include <linux/wait.h>
+#include <linux/freezer.h>
 #include <linux/string.h>
 #include <linux/interrupt.h>
 #include <linux/spinlock.h>
@@ -106,7 +107,6 @@ enum tis_defaults {
 
 struct tpm_stm_dev {
 	struct i2c_client *client;
-	struct completion irq_detection;
 	struct mutex lock;
 	struct tpm_chip *chip;
 	u8 buf[TPM_BUFSIZE + 1];
@@ -181,58 +181,16 @@ static int read8_reg(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
  * clear the TPM interrupt register.
  * @param: tpm, the chip description
  */
-static void clear_interruption(struct tpm_stm_dev *tpm_dev)
+static u8 clear_interruption(struct tpm_stm_dev *tpm_dev)
 {
 	u8 interrupt;
 
-	I2C_READ_DATA(client, TPM_INT_STATUS, &interrupt, 1);
-	I2C_WRITE_DATA(client, TPM_INT_STATUS, &interrupt, 1);
-	I2C_READ_DATA(client, TPM_INT_STATUS, &interrupt, 1);
-} /* clear_interruption() */
-
-/*
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
+	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
+	I2C_WRITE_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
+	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
 
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
+	return interrupt;
+} /* clear_interruption() */
 
 /*
  * tpm_stm_i2c_cancel, cancel is not implemented.
@@ -247,8 +205,6 @@ static void tpm_stm_i2c_cancel(struct tpm_chip *chip)
 
 	data = TPM_STS_COMMAND_READY;
 	I2C_WRITE_DATA(tpm_dev, TPM_STS, &data, 1);
-	if (chip->vendor.irq)
-		wait_for_serirq_timeout(chip, 1, chip->vendor.timeout_a);
 } /* tpm_stm_i2c_cancel() */
 
 /*
@@ -298,27 +254,37 @@ static int check_locality(struct tpm_chip *chip)
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
+		r = wait_event_interruptible_timeout(chip->vendor.int_queue,
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
@@ -385,39 +351,6 @@ end:
 } /* get_burstcount() */
 
 /*
- * wait_for_stat wait for a TPM_STS value
- * @param: chip, the tpm chip description
- * @param: mask, the value mask to wait
- * @param: timeout, the timeout
- * @param: queue, the wait queue.
- * @return: the tpm status, 0 if success, -ETIME if timeout is reached.
- */
-static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
-			 wait_queue_head_t *queue)
-{
-	unsigned long stop;
-	long r;
-	u8 status;
-
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
-} /* wait_for_stat() */
-
-/*
  * recv_data receive data
  * @param: chip, the tpm chip description
  * @param: buf, the buffer where the data are received
@@ -432,10 +365,10 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
 	while (size < count &&
-	       wait_for_stat(chip,
+	       wait_for_tpm_stat(chip,
 			     TPM_STS_DATA_AVAIL | TPM_STS_VALID,
 			     chip->vendor.timeout_c,
-			     &chip->vendor.read_queue) == 0) {
+			     &chip->vendor.read_queue, true) == 0) {
 		burstcnt = get_burstcount(chip);
 		if (burstcnt < 0)
 			return burstcnt;
@@ -455,15 +388,23 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
 {
 	struct tpm_chip *chip = dev_id;
-	struct i2c_client *client;
 	struct tpm_stm_dev *tpm_dev;
-
-	disable_irq_nosync(irq);
+	u8 interrupt;
 
 	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
-	client = tpm_dev->client;
 
-	complete(&tpm_dev->irq_detection);
+	interrupt = clear_interruption(tpm_dev);
+	if (!interrupt)
+		return IRQ_HANDLED;
+
+	if (interrupt & TPM_INTF_DATA_AVAIL_INT)
+		wake_up_interruptible(&chip->vendor.read_queue);
+
+	if (interrupt &
+	    (TPM_INTF_LOCALITY_CHANGE_INT | TPM_INTF_STS_VALID_INT |
+	     TPM_INTF_CMD_READY_INT))
+		wake_up_interruptible(&chip->vendor.int_queue);
+
 	return IRQ_HANDLED;
 } /* tpm_ioserirq_handler() */
 
@@ -504,9 +445,9 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 	status = tpm_stm_i2c_status(chip);
 	if ((status & TPM_STS_COMMAND_READY) == 0) {
 		tpm_stm_i2c_cancel(chip);
-		if (wait_for_stat
+		if (wait_for_tpm_stat
 		    (chip, TPM_STS_COMMAND_READY, chip->vendor.timeout_b,
-		     &chip->vendor.int_queue) < 0) {
+		     &chip->vendor.int_queue, false) < 0) {
 			r = -ETIME;
 			goto out_err;
 		}
@@ -793,7 +734,10 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	chip->vendor.locality = LOCALITY0;
 
 	if (interrupts) {
-		init_completion(&tpm_dev->irq_detection);
+		/* INTERRUPT Setup */
+		init_waitqueue_head(&chip->vendor.read_queue);
+		init_waitqueue_head(&chip->vendor.int_queue);
+
 		if (request_locality(chip) != LOCALITY0) {
 			r = -ENODEV;
 			goto _tpm_clean_answer;
@@ -900,10 +844,10 @@ static int tpm_stm_i2c_pm_resume(struct device *dev)
 
 	if (power_mgt) {
 		gpio_set_value(pin_infos->io_lpcpd, 1);
-		r = wait_for_serirq_timeout(chip,
-					  (chip->ops->status(chip) &
-					  TPM_STS_VALID) == TPM_STS_VALID,
-					  chip->vendor.timeout_b);
+		r = wait_for_tpm_stat(chip, TPM_STS_VALID,
+				chip->vendor.timeout_b,
+				&chip->vendor.read_queue,
+				false);
 	} else {
 		r = tpm_pm_resume(dev);
 		if (!r)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
