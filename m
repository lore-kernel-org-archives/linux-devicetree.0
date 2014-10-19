From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 04/15] tpm/tpm_i2c_stm_st33: Add new tpm_stm_dev structure and remove tpm_i2c_buffer[0], [1] buffer.
Date: Sun, 19 Oct 2014 23:11:14 +0200
Message-ID: <1413753085-9958-5-git-send-email-christophe-h.ricard@st.com>
References: <1413753085-9958-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413753085-9958-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to clean big buffers in st33zp24_platform_data structure,
replace with tpm_stm_dev for driver internal usage.
As only one buffer is really necessary replace with buf field.

In the mean time move tpm_i2c_stm_st33.h to include/linux/platform_data.

Reviewed-By: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c            | 198 +++++++++++--------------
 drivers/char/tpm/tpm_i2c_stm_st33.h            |  44 ------
 include/linux/platform_data/tpm_i2c_stm_st33.h |  41 +++++
 3 files changed, 130 insertions(+), 153 deletions(-)
 delete mode 100644 drivers/char/tpm/tpm_i2c_stm_st33.h
 create mode 100644 include/linux/platform_data/tpm_i2c_stm_st33.h

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 8a8fc10..07ce463 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -41,7 +41,6 @@
 #include <linux/wait.h>
 #include <linux/string.h>
 #include <linux/interrupt.h>
-#include <linux/spinlock.h>
 #include <linux/sysfs.h>
 #include <linux/gpio.h>
 #include <linux/sched.h>
@@ -49,6 +48,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 
+#include <linux/platform_data/tpm_i2c_stm_st33.h>
 #include "tpm.h"
 
 #define TPM_ACCESS			0x0
@@ -67,7 +67,7 @@
 #define TPM_BUFSIZE			2048
 
 #define LOCALITY0		0
-#include "tpm_i2c_stm_st33.h"
+
 
 enum stm33zp24_access {
 	TPM_ACCESS_VALID = 0x80,
@@ -99,6 +99,15 @@ enum tis_defaults {
 	TIS_LONG_TIMEOUT = 2000,
 };
 
+struct tpm_stm_dev {
+	struct i2c_client *client;
+	struct completion irq_detection;
+	struct tpm_chip *chip;
+	u8 buf[TPM_BUFSIZE + 1];
+	int io_serirq;
+	int io_lpcpd;
+};
+
 /*
  * write8_reg
  * Send byte to the TIS register according to the ST33ZP24 I2C protocol.
@@ -107,17 +116,12 @@ enum tis_defaults {
  * @param: tpm_size, The length of the data
  * @return: Returns negative errno, or else the number of bytes written.
  */
-static int write8_reg(struct i2c_client *client, u8 tpm_register,
+static int write8_reg(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
 		      u8 *tpm_data, u16 tpm_size)
 {
-	struct st33zp24_platform_data *pin_infos;
-
-	pin_infos = client->dev.platform_data;
-
-	pin_infos->tpm_i2c_buffer[0][0] = tpm_register;
-	memcpy(&pin_infos->tpm_i2c_buffer[0][1], tpm_data, tpm_size);
-	return i2c_master_send(client, pin_infos->tpm_i2c_buffer[0],
-				tpm_size + 1);
+	tpm_dev->buf[0] = tpm_register;
+	memcpy(tpm_dev->buf + 1, tpm_data, tpm_size);
+	return i2c_master_send(tpm_dev->client, tpm_dev->buf, tpm_size + 1);
 } /* write8_reg() */
 
 /*
@@ -128,50 +132,50 @@ static int write8_reg(struct i2c_client *client, u8 tpm_register,
  * @param: tpm_size, tpm TPM response size to read.
  * @return: number of byte read successfully: should be one if success.
  */
-static int read8_reg(struct i2c_client *client, u8 tpm_register,
+static int read8_reg(struct tpm_stm_dev *tpm_dev, u8 tpm_register,
 		    u8 *tpm_data, int tpm_size)
 {
 	u8 status = 0;
 	u8 data;
 
 	data = TPM_DUMMY_BYTE;
-	status = write8_reg(client, tpm_register, &data, 1);
+	status = write8_reg(tpm_dev, tpm_register, &data, 1);
 	if (status == 2)
-		status = i2c_master_recv(client, tpm_data, tpm_size);
+		status = i2c_master_recv(tpm_dev->client, tpm_data, tpm_size);
 	return status;
 } /* read8_reg() */
 
 /*
  * I2C_WRITE_DATA
  * Send byte to the TIS register according to the ST33ZP24 I2C protocol.
- * @param: client, the chip description
+ * @param: tpm_dev, the chip description
  * @param: tpm_register, the tpm tis register where the data should be written
  * @param: tpm_data, the tpm_data to write inside the tpm_register
  * @param: tpm_size, The length of the data
  * @return: number of byte written successfully: should be one if success.
  */
-#define I2C_WRITE_DATA(client, tpm_register, tpm_data, tpm_size) \
-	(write8_reg(client, tpm_register | \
+#define I2C_WRITE_DATA(tpm_dev, tpm_register, tpm_data, tpm_size) \
+	(write8_reg(tpm_dev, tpm_register | \
 	TPM_WRITE_DIRECTION, tpm_data, tpm_size))
 
 /*
  * I2C_READ_DATA
  * Recv byte from the TIS register according to the ST33ZP24 I2C protocol.
- * @param: tpm, the chip description
+ * @param: tpm_dev, the chip description
  * @param: tpm_register, the tpm tis register where the data should be read
  * @param: tpm_data, the TPM response
  * @param: tpm_size, tpm TPM response size to read.
  * @return: number of byte read successfully: should be one if success.
  */
-#define I2C_READ_DATA(client, tpm_register, tpm_data, tpm_size) \
-	(read8_reg(client, tpm_register, tpm_data, tpm_size))
+#define I2C_READ_DATA(tpm_dev, tpm_register, tpm_data, tpm_size) \
+	(read8_reg(tpm_dev, tpm_register, tpm_data, tpm_size))
 
 /*
  * clear_interruption
  * clear the TPM interrupt register.
  * @param: tpm, the chip description
  */
-static void clear_interruption(struct i2c_client *client)
+static void clear_interruption(struct tpm_stm_dev *tpm_dev)
 {
 	u8 interrupt;
 
@@ -191,17 +195,16 @@ static long _wait_for_interrupt_serirq_timeout(struct tpm_chip *chip,
 {
 	long status;
 	struct i2c_client *client;
-	struct st33zp24_platform_data *pin_infos;
+	struct tpm_stm_dev *tpm_dev;
 
-	client = (struct i2c_client *)TPM_VPRIV(chip);
-	pin_infos = client->dev.platform_data;
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
+	client = tpm_dev->client;
 
 	status = wait_for_completion_interruptible_timeout(
-					&pin_infos->irq_detection,
-						timeout);
+					&tpm_dev->irq_detection,
+					timeout);
 	if (status > 0)
-		enable_irq(gpio_to_irq(pin_infos->io_serirq));
-	gpio_direction_input(pin_infos->io_serirq);
+		enable_irq(client->irq);
 
 	return status;
 } /* wait_for_interrupt_serirq_timeout() */
@@ -210,15 +213,15 @@ static int wait_for_serirq_timeout(struct tpm_chip *chip, bool condition,
 				 unsigned long timeout)
 {
 	int status = 2;
-	struct i2c_client *client;
+	struct tpm_stm_dev *tpm_dev;
 
-	client = (struct i2c_client *)TPM_VPRIV(chip);
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
 	status = _wait_for_interrupt_serirq_timeout(chip, timeout);
 	if (!status) {
 		status = -EBUSY;
 	} else {
-		clear_interruption(client);
+		clear_interruption(tpm_dev);
 		if (condition)
 			status = 1;
 	}
@@ -231,13 +234,13 @@ static int wait_for_serirq_timeout(struct tpm_chip *chip, bool condition,
  */
 static void tpm_stm_i2c_cancel(struct tpm_chip *chip)
 {
-	struct i2c_client *client;
+	struct tpm_stm_dev *tpm_dev;
 	u8 data;
 
-	client = (struct i2c_client *)TPM_VPRIV(chip);
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
 	data = TPM_STS_COMMAND_READY;
-	I2C_WRITE_DATA(client, TPM_STS, &data, 1);
+	I2C_WRITE_DATA(tpm_dev, TPM_STS, &data, 1);
 	if (chip->vendor.irq)
 		wait_for_serirq_timeout(chip, 1, chip->vendor.timeout_a);
 }	/* tpm_stm_i2c_cancel() */
@@ -249,12 +252,12 @@ static void tpm_stm_i2c_cancel(struct tpm_chip *chip)
  */
 static u8 tpm_stm_i2c_status(struct tpm_chip *chip)
 {
-	struct i2c_client *client;
+	struct tpm_stm_dev *tpm_dev;
 	u8 data;
 
-	client = (struct i2c_client *)TPM_VPRIV(chip);
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
-	I2C_READ_DATA(client, TPM_STS, &data, 1);
+	I2C_READ_DATA(tpm_dev, TPM_STS, &data, 1);
 	return data;
 }				/* tpm_stm_i2c_status() */
 
@@ -266,13 +269,13 @@ static u8 tpm_stm_i2c_status(struct tpm_chip *chip)
  */
 static int check_locality(struct tpm_chip *chip)
 {
-	struct i2c_client *client;
+	struct tpm_stm_dev *tpm_dev;
 	u8 data;
 	u8 status;
 
-	client = (struct i2c_client *)TPM_VPRIV(chip);
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
-	status = I2C_READ_DATA(client, TPM_ACCESS, &data, 1);
+	status = I2C_READ_DATA(tpm_dev, TPM_ACCESS, &data, 1);
 	if (status && (data &
 		(TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID)) ==
 		(TPM_ACCESS_ACTIVE_LOCALITY | TPM_ACCESS_VALID))
@@ -291,16 +294,16 @@ static int request_locality(struct tpm_chip *chip)
 {
 	unsigned long stop;
 	long rc;
-	struct i2c_client *client;
+	struct tpm_stm_dev *tpm_dev;
 	u8 data;
 
-	client = (struct i2c_client *)TPM_VPRIV(chip);
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
 	if (check_locality(chip) == chip->vendor.locality)
 		return chip->vendor.locality;
 
 	data = TPM_ACCESS_REQUEST_USE;
-	rc = I2C_WRITE_DATA(client, TPM_ACCESS, &data, 1);
+	rc = I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
 	if (rc < 0)
 		goto end;
 
@@ -329,13 +332,13 @@ end:
  */
 static void release_locality(struct tpm_chip *chip)
 {
-	struct i2c_client *client;
+	struct tpm_stm_dev *tpm_dev;
 	u8 data;
 
-	client = (struct i2c_client *)TPM_VPRIV(chip);
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 	data = TPM_ACCESS_ACTIVE_LOCALITY;
 
-	I2C_WRITE_DATA(client, TPM_ACCESS, &data, 1);
+	I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
 }
 
 /*
@@ -348,19 +351,20 @@ static int get_burstcount(struct tpm_chip *chip)
 	unsigned long stop;
 	int burstcnt, status;
 	u8 tpm_reg, temp;
+	struct tpm_stm_dev *tpm_dev;
 
-	struct i2c_client *client = (struct i2c_client *)TPM_VPRIV(chip);
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
 	stop = jiffies + chip->vendor.timeout_d;
 	do {
 		tpm_reg = TPM_STS + 1;
-		status = I2C_READ_DATA(client, tpm_reg, &temp, 1);
+		status = I2C_READ_DATA(tpm_dev, tpm_reg, &temp, 1);
 		if (status < 0)
 			goto end;
 
 		tpm_reg = tpm_reg + 1;
 		burstcnt = temp;
-		status = I2C_READ_DATA(client, tpm_reg, &temp, 1);
+		status = I2C_READ_DATA(tpm_dev, tpm_reg, &temp, 1);
 		if (status < 0)
 			goto end;
 
@@ -417,9 +421,9 @@ static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
 static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 {
 	int size = 0, burstcnt, len;
-	struct i2c_client *client;
+	struct tpm_stm_dev *tpm_dev;
 
-	client = (struct i2c_client *)TPM_VPRIV(chip);
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 
 	while (size < count &&
 	       wait_for_stat(chip,
@@ -431,7 +435,7 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 		if (burstcnt < 0)
 			return burstcnt;
 		len = min_t(int, burstcnt, count - size);
-		I2C_READ_DATA(client, TPM_DATA_FIFO, buf + size, len);
+		I2C_READ_DATA(tpm_dev, TPM_DATA_FIFO, buf + size, len);
 		size += len;
 	}
 	return size;
@@ -447,14 +451,14 @@ static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
 {
 	struct tpm_chip *chip = dev_id;
 	struct i2c_client *client;
-	struct st33zp24_platform_data *pin_infos;
+	struct tpm_stm_dev *tpm_dev;
 
 	disable_irq_nosync(irq);
 
-	client = (struct i2c_client *)TPM_VPRIV(chip);
-	pin_infos = client->dev.platform_data;
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
+	client = tpm_dev->client;
 
-	complete(&pin_infos->irq_detection);
+	complete(&tpm_dev->irq_detection);
 	return IRQ_HANDLED;
 } /* tpm_ioserirq_handler() */
 
@@ -476,13 +480,15 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 	int ret;
 	u8 data;
 	struct i2c_client *client;
+	struct tpm_stm_dev *tpm_dev;
 
 	if (chip == NULL)
 		return -EBUSY;
 	if (len < TPM_HEADER_SIZE)
 		return -EBUSY;
 
-	client = (struct i2c_client *)TPM_VPRIV(chip);
+	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
+	client = tpm_dev->client;
 
 	client->flags = 0;
 
@@ -506,7 +512,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 		if (burstcnt < 0)
 			return burstcnt;
 		size = min_t(int, len - i - 1, burstcnt);
-		ret = I2C_WRITE_DATA(client, TPM_DATA_FIFO, buf, size);
+		ret = I2C_WRITE_DATA(tpm_dev, TPM_DATA_FIFO, buf, size);
 		if (ret < 0)
 			goto out_err;
 
@@ -519,7 +525,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 		goto out_err;
 	}
 
-	ret = I2C_WRITE_DATA(client, TPM_DATA_FIFO, buf + len - 1, 1);
+	ret = I2C_WRITE_DATA(tpm_dev, TPM_DATA_FIFO, buf + len - 1, 1);
 	if (ret < 0)
 		goto out_err;
 
@@ -530,7 +536,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 	}
 
 	data = TPM_STS_GO;
-	I2C_WRITE_DATA(client, TPM_STS, &data, 1);
+	I2C_WRITE_DATA(tpm_dev, TPM_STS, &data, 1);
 
 	return len;
 out_err:
@@ -624,6 +630,7 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	u8 intmask;
 	struct tpm_chip *chip;
 	struct st33zp24_platform_data *platform_data;
+	struct tpm_stm_dev *tpm_dev;
 
 	if (client == NULL) {
 		pr_info("%s: i2c client is NULL. Device not accessible.\n",
@@ -638,11 +645,12 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		goto end;
 	}
 
-	chip = tpm_register_hardware(&client->dev, &st_i2c_tpm);
-	if (!chip) {
-		dev_info(&client->dev, "fail chip\n");
-		err = -ENODEV;
-		goto end;
+	tpm_dev = devm_kzalloc(&client->dev, sizeof(struct tpm_stm_dev),
+			       GFP_KERNEL);
+	if (!tpm_dev) {
+		dev_info(&client->dev, "cannot allocate memory for tpm data\n");
+		err = -ENOMEM;
+		goto _tpm_clean_answer;
 	}
 
 	platform_data = client->dev.platform_data;
@@ -653,20 +661,14 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		goto _tpm_clean_answer;
 	}
 
-	platform_data->tpm_i2c_buffer[0] =
-	    kmalloc(TPM_BUFSIZE * sizeof(u8), GFP_KERNEL);
-	if (platform_data->tpm_i2c_buffer[0] == NULL) {
-		err = -ENOMEM;
-		goto _tpm_clean_answer;
-	}
-	platform_data->tpm_i2c_buffer[1] =
-	    kmalloc(TPM_BUFSIZE * sizeof(u8), GFP_KERNEL);
-	if (platform_data->tpm_i2c_buffer[1] == NULL) {
-		err = -ENOMEM;
-		goto _tpm_clean_response1;
+	chip = tpm_register_hardware(&client->dev, &st_i2c_tpm);
+	if (!chip) {
+		dev_info(&client->dev, "fail chip\n");
+		return -ENODEV;
 	}
 
-	TPM_VPRIV(chip) = client;
+	TPM_VPRIV(chip) = tpm_dev;
+	tpm_dev->client = client;
 
 	chip->vendor.timeout_a = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
 	chip->vendor.timeout_b = msecs_to_jiffies(TIS_LONG_TIMEOUT);
@@ -683,16 +685,16 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	}
 
 	if (interrupts) {
-		init_completion(&platform_data->irq_detection);
+		init_completion(&tpm_dev->irq_detection);
 		if (request_locality(chip) != LOCALITY0) {
 			err = -ENODEV;
-			goto _tpm_clean_response2;
+			goto _tpm_clean_answer;
 		}
 		err = gpio_request(platform_data->io_serirq, "TPM IO_SERIRQ");
 		if (err)
 			goto _gpio_init2;
 
-		clear_interruption(client);
+		clear_interruption(tpm_dev);
 		err = request_irq(gpio_to_irq(platform_data->io_serirq),
 				&tpm_ioserirq_handler,
 				IRQF_TRIGGER_HIGH,
@@ -703,7 +705,7 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			goto _irq_set;
 		}
 
-		err = I2C_READ_DATA(client, TPM_INT_ENABLE, &intmask, 1);
+		err = I2C_READ_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
 		if (err < 0)
 			goto _irq_set;
 
@@ -714,16 +716,16 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			|  TPM_INTF_STS_VALID_INT
 			|  TPM_INTF_DATA_AVAIL_INT;
 
-		err = I2C_WRITE_DATA(client, TPM_INT_ENABLE, &intmask, 1);
+		err = I2C_WRITE_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
 		if (err < 0)
 			goto _irq_set;
 
 		intmask = TPM_GLOBAL_INT_ENABLE;
-		err = I2C_WRITE_DATA(client, (TPM_INT_ENABLE + 3), &intmask, 1);
+		err = I2C_WRITE_DATA(tpm_dev, (TPM_INT_ENABLE + 3), &intmask, 1);
 		if (err < 0)
 			goto _irq_set;
 
-		err = I2C_READ_DATA(client, TPM_INT_STATUS, &intmask, 1);
+		err = I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &intmask, 1);
 		if (err < 0)
 			goto _irq_set;
 
@@ -745,12 +747,6 @@ _gpio_init2:
 _gpio_init1:
 	if (power_mgt)
 		gpio_free(platform_data->io_lpcpd);
-_tpm_clean_response2:
-	kzfree(platform_data->tpm_i2c_buffer[1]);
-	platform_data->tpm_i2c_buffer[1] = NULL;
-_tpm_clean_response1:
-	kzfree(platform_data->tpm_i2c_buffer[0]);
-	platform_data->tpm_i2c_buffer[0] = NULL;
 _tpm_clean_answer:
 	tpm_remove_hardware(chip->dev);
 end:
@@ -766,28 +762,12 @@ end:
  */
 static int tpm_st33_i2c_remove(struct i2c_client *client)
 {
-	struct tpm_chip *chip = (struct tpm_chip *)i2c_get_clientdata(client);
-	struct st33zp24_platform_data *pin_infos =
-		((struct i2c_client *)TPM_VPRIV(chip))->dev.platform_data;
-
-	if (pin_infos != NULL) {
-		free_irq(pin_infos->io_serirq, chip);
-
-		gpio_free(pin_infos->io_serirq);
-		gpio_free(pin_infos->io_lpcpd);
+	struct tpm_chip *chip =
+		(struct tpm_chip *) i2c_get_clientdata(client);
 
+	if (chip)
 		tpm_remove_hardware(chip->dev);
 
-		if (pin_infos->tpm_i2c_buffer[1] != NULL) {
-			kzfree(pin_infos->tpm_i2c_buffer[1]);
-			pin_infos->tpm_i2c_buffer[1] = NULL;
-		}
-		if (pin_infos->tpm_i2c_buffer[0] != NULL) {
-			kzfree(pin_infos->tpm_i2c_buffer[0]);
-			pin_infos->tpm_i2c_buffer[0] = NULL;
-		}
-	}
-
 	return 0;
 }
 
diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.h b/drivers/char/tpm/tpm_i2c_stm_st33.h
deleted file mode 100644
index 3041271..0000000
--- a/drivers/char/tpm/tpm_i2c_stm_st33.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * STMicroelectronics TPM I2C Linux driver for TPM ST33ZP24
- * Copyright (C) 2009, 2010  STMicroelectronics
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
- * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- *
- * STMicroelectronics version 1.2.0, Copyright (C) 2010
- * STMicroelectronics comes with ABSOLUTELY NO WARRANTY.
- * This is free software, and you are welcome to redistribute it
- * under certain conditions.
- *
- * @Author: Christophe RICARD tpmsupport-qxv4g6HH51o@public.gmane.org
- *
- * @File: stm_st33_tpm_i2c.h
- *
- * @Date: 09/15/2010
- */
-#ifndef __STM_ST33_TPM_I2C_MAIN_H__
-#define __STM_ST33_TPM_I2C_MAIN_H__
-
-#define TPM_ST33_I2C			"st33zp24_i2c"
-
-struct st33zp24_platform_data {
-	int io_serirq;
-	int io_lpcpd;
-	struct i2c_client *client;
-	u8 *tpm_i2c_buffer[2]; /* 0 Request 1 Response */
-	struct completion irq_detection;
-	struct mutex lock;
-};
-
-#endif /* __STM_ST33_TPM_I2C_MAIN_H__ */
diff --git a/include/linux/platform_data/tpm_i2c_stm_st33.h b/include/linux/platform_data/tpm_i2c_stm_st33.h
new file mode 100644
index 0000000..c5e4b7f
--- /dev/null
+++ b/include/linux/platform_data/tpm_i2c_stm_st33.h
@@ -0,0 +1,41 @@
+/*
+ * STMicroelectronics TPM I2C Linux driver for TPM ST33ZP24
+ * Copyright (C) 2009, 2010  STMicroelectronics
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
+ *
+ * STMicroelectronics version 1.2.0, Copyright (C) 2010
+ * STMicroelectronics comes with ABSOLUTELY NO WARRANTY.
+ * This is free software, and you are welcome to redistribute it
+ * under certain conditions.
+ *
+ * @Author: Christophe RICARD tpmsupport-qxv4g6HH51o@public.gmane.org
+ *
+ * @File: stm_st33_tpm_i2c.h
+ *
+ * @Date: 09/15/2010
+ */
+#ifndef __STM_ST33_TPM_I2C_MAIN_H__
+#define __STM_ST33_TPM_I2C_MAIN_H__
+
+
+#define TPM_ST33_I2C			"st33zp24_i2c"
+
+struct st33zp24_platform_data {
+	int io_serirq;
+	int io_lpcpd;
+};
+
+#endif /* __STM_ST33_TPM_I2C_MAIN_H__ */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
