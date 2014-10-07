From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 13/16] tpm/tpm_i2c_stm_st33: Add tpm_lock mutex for safe irq management
Date: Tue,  7 Oct 2014 22:03:06 +0200
Message-ID: <1412712189-1234-14-git-send-email-christophe-h.ricard@st.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412712189-1234-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Adding tpm_lock mutex in order to guarantee that a i2c_read_data or a
i2c_write_data will not get interrupted by a threaded interrupt.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 61 ++++++++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 18 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index ab2a675..8d32ade 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -41,7 +41,6 @@
 #include <linux/freezer.h>
 #include <linux/string.h>
 #include <linux/interrupt.h>
-#include <linux/spinlock.h>
 #include <linux/sysfs.h>
 #include <linux/gpio.h>
 #include <linux/sched.h>
@@ -106,7 +105,7 @@ enum tis_defaults {
 
 struct tpm_stm_dev {
 	struct i2c_client *client;
-	struct mutex lock;
+	struct mutex tpm_lock;
 	struct tpm_chip *chip;
 	u8 buf[TPM_BUFSIZE + 1];
 	int io_serirq;
@@ -147,6 +146,7 @@ static int read8_reg(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
 	status = write8_reg(tpm_dev, tpm_register, &data, 1);
 	if (status == 2)
 		status = i2c_master_recv(tpm_dev->client, tpm_data, tpm_size);
+
 	return status;
 } /* read8_reg() */
 
@@ -163,6 +163,18 @@ static int read8_reg(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
 	(write8_reg(tpm_dev, tpm_register | \
 	TPM_WRITE_DIRECTION, tpm_data, tpm_size))
 
+
+static int i2c_write_data(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
+				u8 *tpm_data, u16 tpm_size)
+{
+	u8 status;
+
+	mutex_lock(&tpm_dev->tpm_lock);
+	status = I2C_WRITE_DATA(tpm_dev, tpm_register, tpm_data, tpm_size);
+	mutex_unlock(&tpm_dev->tpm_lock);
+
+	return status;
+} /* i2c_write_data() */
 /*
  * I2C_READ_DATA
  * Recv byte from the TIS register according to the ST33ZP24 I2C protocol.
@@ -175,6 +187,18 @@ static int read8_reg(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
 #define I2C_READ_DATA(tpm_dev, tpm_register, tpm_data, tpm_size) \
 	(read8_reg(tpm_dev, tpm_register, tpm_data, tpm_size))
 
+static int i2c_read_data(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
+				u8 *tpm_data, u16 tpm_size)
+{
+	u8 status;
+
+	mutex_lock(&tpm_dev->tpm_lock);
+	status = I2C_READ_DATA(tpm_dev, tpm_register, tpm_data, tpm_size);
+	mutex_unlock(&tpm_dev->tpm_lock);
+
+	return status;
+} /* i2c_read_data() */
+
 /*
  * clear_interruption
  * clear the TPM interrupt register.
@@ -184,8 +208,8 @@ static u8 clear_interruption(struct tpm_stm_dev *tpm_dev)
 {
 	u8 interrupt;
 
-	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
-	I2C_WRITE_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
+	i2c_read_data(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
+	i2c_write_data(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
 
 	return interrupt;
 } /* clear_interruption() */
@@ -202,7 +226,7 @@ static void tpm_stm_i2c_cancel(struct tpm_chip *chip)
 	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
 	data = TPM_STS_COMMAND_READY;
-	I2C_WRITE_DATA(tpm_dev, TPM_STS, &data, 1);
+	i2c_write_data(tpm_dev, TPM_STS, &data, 1);
 } /* tpm_stm_i2c_cancel() */
 
 /*
@@ -217,7 +241,7 @@ static u8 tpm_stm_i2c_status(struct tpm_chip *chip)
 
 	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
-	I2C_READ_DATA(tpm_dev, TPM_STS, &data, 1);
+	i2c_read_data(tpm_dev, TPM_STS, &data, 1);
 	return data;
 } /* tpm_stm_i2c_status() */
 
@@ -235,7 +259,7 @@ static int check_locality(struct tpm_chip *chip)
 
 	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
-	status = I2C_READ_DATA(tpm_dev, TPM_ACCESS, &data, 1);
+	status = i2c_read_data(tpm_dev, TPM_ACCESS, &data, 1);
 	if (status && (data &
 		(TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID)) ==
 		(TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID))
@@ -263,7 +287,7 @@ static int request_locality(struct tpm_chip *chip)
 	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
 	data = TPM_ACCESS_REQUEST_USE;
-	r = I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
+	r = i2c_write_data(tpm_dev, TPM_ACCESS, &data, 1);
 	if (r < 0)
 		goto end;
 
@@ -308,7 +332,7 @@ static void release_locality(struct tpm_chip *chip)
 	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 	data = TPM_ACCESS_ACTIVE_LOCALITY;
 
-	I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
+	i2c_write_data(tpm_dev, TPM_ACCESS, &data, 1);
 }
 
 /*
@@ -328,13 +352,13 @@ static int get_burstcount(struct tpm_chip *chip)
 	stop = jiffies + chip->vendor.timeout_d;
 	do {
 		tpm_reg = TPM_STS + 1;
-		status = I2C_READ_DATA(tpm_dev, tpm_reg, &temp, 1);
+		status = i2c_read_data(tpm_dev, tpm_reg, &temp, 1);
 		if (status < 0)
 			goto end;
 
 		tpm_reg = tpm_reg + 1;
 		burstcnt = temp;
-		status = I2C_READ_DATA(tpm_dev, tpm_reg, &temp, 1);
+		status = i2c_read_data(tpm_dev, tpm_reg, &temp, 1);
 		if (status < 0)
 			goto end;
 
@@ -366,12 +390,12 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 	       wait_for_tpm_stat(chip,
 			     TPM_STS_DATA_AVAIL | TPM_STS_VALID,
 			     chip->vendor.timeout_c,
-			     &chip->vendor.read_queue, true) == 0) {
+			     &chip->vendor.read_queue, false) == 0) {
 		burstcnt = get_burstcount(chip);
 		if (burstcnt < 0)
 			return burstcnt;
 		len = min_t(int, burstcnt, count - size);
-		I2C_READ_DATA(tpm_dev, TPM_DATA_FIFO, buf + size, len);
+		i2c_read_data(tpm_dev, TPM_DATA_FIFO, buf + size, len);
 		size += len;
 	}
 	return size;
@@ -456,7 +480,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 		if (burstcnt < 0)
 			return burstcnt;
 		size = min_t(int, len - i - 1, burstcnt);
-		r = I2C_WRITE_DATA(tpm_dev, TPM_DATA_FIFO, buf, size);
+		r = i2c_write_data(tpm_dev, TPM_DATA_FIFO, buf, size);
 		if (r < 0)
 			goto out_err;
 
@@ -469,7 +493,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 		goto out_err;
 	}
 
-	r = I2C_WRITE_DATA(tpm_dev, TPM_DATA_FIFO, buf + len - 1, 1);
+	r = i2c_write_data(tpm_dev, TPM_DATA_FIFO, buf + len - 1, 1);
 	if (r < 0)
 		goto out_err;
 
@@ -480,7 +504,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 	}
 
 	data = TPM_STS_GO;
-	I2C_WRITE_DATA(tpm_dev, TPM_STS, &data, 1);
+	i2c_write_data(tpm_dev, TPM_STS, &data, 1);
 
 	return len;
 out_err:
@@ -730,6 +754,7 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	chip->vendor.timeout_d = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
 
 	chip->vendor.locality = LOCALITY0;
+	mutex_init(&tpm_dev->tpm_lock);
 
 	if (interrupts) {
 		/* INTERRUPT Setup */
@@ -758,12 +783,12 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			|  TPM_INTF_STS_VALID_INT
 			|  TPM_INTF_DATA_AVAIL_INT;
 
-		r = I2C_WRITE_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
+		r = i2c_write_data(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
 		if (r < 0)
 			goto _tpm_clean_answer;
 
 		intmask = TPM_GLOBAL_INT_ENABLE;
-		r = I2C_WRITE_DATA(tpm_dev, (TPM_INT_ENABLE + 3), &intmask, 1);
+		r = i2c_write_data(tpm_dev, (TPM_INT_ENABLE + 3), &intmask, 1);
 		if (r < 0)
 			goto _tpm_clean_answer;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
