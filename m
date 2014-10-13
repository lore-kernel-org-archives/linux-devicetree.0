From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 06/15] tpm/tpm_i2c_stm_st33: Replace err/rc/ret by r for a function return code
Date: Mon, 13 Oct 2014 22:23:28 +0200
Message-ID: <1413231817-5174-7-git-send-email-christophe-h.ricard@st.com>
References: <1413231817-5174-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413231817-5174-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some functions return err, rc or ret for a status code.

Return r instead for all of them.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 97 ++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 49 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 71ef1da..4997eff 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -292,7 +292,7 @@ static int check_locality(struct tpm_chip *chip)
 static int request_locality(struct tpm_chip *chip)
 {
 	unsigned long stop;
-	long rc;
+	long r;
 	struct tpm_stm_dev *tpm_dev;
 	u8 data;
 
@@ -302,15 +302,15 @@ static int request_locality(struct tpm_chip *chip)
 		return chip->vendor.locality;
 
 	data = TPM_ACCESS_REQUEST_USE;
-	rc = I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
-	if (rc < 0)
+	r = I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
+	if (r < 0)
 		goto end;
 
 	if (chip->vendor.irq) {
-		rc = wait_for_serirq_timeout(chip, (check_locality
+		r = wait_for_serirq_timeout(chip, (check_locality
 						       (chip) >= 0),
 						      chip->vendor.timeout_a);
-		if (rc > 0)
+		if (r > 0)
 			return chip->vendor.locality;
 	} else {
 		stop = jiffies + chip->vendor.timeout_a;
@@ -320,9 +320,9 @@ static int request_locality(struct tpm_chip *chip)
 			msleep(TPM_TIMEOUT);
 		} while (time_before(jiffies, stop));
 	}
-	rc = -EACCES;
+	r = -EACCES;
 end:
-	return rc;
+	return r;
 } /* request_locality() */
 
 /*
@@ -389,14 +389,14 @@ static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
 			 wait_queue_head_t *queue)
 {
 	unsigned long stop;
-	long rc;
+	long r;
 	u8 status;
 
 	 if (chip->vendor.irq) {
-		rc = wait_for_serirq_timeout(chip, ((tpm_stm_i2c_status
+		r = wait_for_serirq_timeout(chip, ((tpm_stm_i2c_status
 							(chip) & mask) ==
 						       mask), timeout);
-		if (rc > 0)
+		if (r > 0)
 			return 0;
 	} else {
 		stop = jiffies + timeout;
@@ -476,7 +476,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 {
 	u32 status, i, size;
 	int burstcnt = 0;
-	int ret;
+	int r;
 	u8 data;
 	struct i2c_client *client;
 	struct tpm_stm_dev *tpm_dev;
@@ -491,9 +491,9 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 
 	client->flags = 0;
 
-	ret = request_locality(chip);
-	if (ret < 0)
-		return ret;
+	r = request_locality(chip);
+	if (r < 0)
+		return r;
 
 	status = tpm_stm_i2c_status(chip);
 	if ((status & TPM_STS_COMMAND_READY) == 0) {
@@ -501,7 +501,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 		if (wait_for_stat
 		    (chip, TPM_STS_COMMAND_READY, chip->vendor.timeout_b,
 		     &chip->vendor.int_queue) < 0) {
-			ret = -ETIME;
+			r = -ETIME;
 			goto out_err;
 		}
 	}
@@ -511,8 +511,8 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 		if (burstcnt < 0)
 			return burstcnt;
 		size = min_t(int, len - i - 1, burstcnt);
-		ret = I2C_WRITE_DATA(tpm_dev, TPM_DATA_FIFO, buf, size);
-		if (ret < 0)
+		r = I2C_WRITE_DATA(tpm_dev, TPM_DATA_FIFO, buf, size);
+		if (r < 0)
 			goto out_err;
 
 		i += size;
@@ -520,17 +520,17 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 
 	status = tpm_stm_i2c_status(chip);
 	if ((status & TPM_STS_DATA_EXPECT) == 0) {
-		ret = -EIO;
+		r = -EIO;
 		goto out_err;
 	}
 
-	ret = I2C_WRITE_DATA(tpm_dev, TPM_DATA_FIFO, buf + len - 1, 1);
-	if (ret < 0)
+	r = I2C_WRITE_DATA(tpm_dev, TPM_DATA_FIFO, buf + len - 1, 1);
+	if (r < 0)
 		goto out_err;
 
 	status = tpm_stm_i2c_status(chip);
 	if ((status & TPM_STS_DATA_EXPECT) != 0) {
-		ret = -EIO;
+		r = -EIO;
 		goto out_err;
 	}
 
@@ -541,7 +541,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 out_err:
 	tpm_stm_i2c_cancel(chip);
 	release_locality(chip);
-	return ret;
+	return r;
 }
 
 /*
@@ -625,7 +625,7 @@ MODULE_PARM_DESC(power_mgt, "Power Management");
 static int
 tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
-	int err;
+	int r;
 	u8 intmask;
 	struct tpm_chip *chip;
 	struct st33zp24_platform_data *platform_data;
@@ -634,13 +634,13 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (client == NULL) {
 		pr_info("%s: i2c client is NULL. Device not accessible.\n",
 			__func__);
-		err = -ENODEV;
+		r = -ENODEV;
 		goto end;
 	}
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_info(&client->dev, "client not i2c capable\n");
-		err = -ENODEV;
+		r = -ENODEV;
 		goto end;
 	}
 
@@ -648,7 +648,7 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			       GFP_KERNEL);
 	if (!tpm_dev) {
 		dev_info(&client->dev, "cannot allocate memory for tpm data\n");
-		err = -ENOMEM;
+		r = -ENOMEM;
 		goto _tpm_clean_answer;
 	}
 
@@ -656,7 +656,7 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	if (!platform_data) {
 		dev_info(&client->dev, "chip not available\n");
-		err = -ENODEV;
+		r = -ENODEV;
 		goto _tpm_clean_answer;
 	}
 
@@ -677,8 +677,8 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	chip->vendor.locality = LOCALITY0;
 
 	if (power_mgt) {
-		err = gpio_request(platform_data->io_lpcpd, "TPM IO_LPCPD");
-		if (err)
+		r = gpio_request(platform_data->io_lpcpd, "TPM IO_LPCPD");
+		if (r)
 			goto _gpio_init1;
 		gpio_set_value(platform_data->io_lpcpd, 1);
 	}
@@ -686,7 +686,7 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (interrupts) {
 		init_completion(&tpm_dev->irq_detection);
 		if (request_locality(chip) != LOCALITY0) {
-			err = -ENODEV;
+			r = -ENODEV;
 			goto _tpm_clean_answer;
 		}
 
@@ -695,14 +695,14 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 				&tpm_ioserirq_handler,
 				IRQF_TRIGGER_HIGH,
 				"TPM SERIRQ management", chip);
-		if (err < 0) {
+		if (r < 0) {
 			dev_err(chip->dev , "TPM SERIRQ signals %d not available\n",
 				client->irq);
 			goto _irq_set;
 		}
 
-		err = I2C_READ_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
-		if (err < 0)
+		r = I2C_READ_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
+		if (r < 0)
 			goto _irq_set;
 
 		intmask |= TPM_INTF_CMD_READY_INT
@@ -712,17 +712,17 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			|  TPM_INTF_STS_VALID_INT
 			|  TPM_INTF_DATA_AVAIL_INT;
 
-		err = I2C_WRITE_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
-		if (err < 0)
+		r = I2C_WRITE_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
+		if (r < 0)
 			goto _irq_set;
 
 		intmask = TPM_GLOBAL_INT_ENABLE;
-		err = I2C_WRITE_DATA(tpm_dev, (TPM_INT_ENABLE + 3), &intmask, 1);
-		if (err < 0)
+		r = I2C_WRITE_DATA(tpm_dev, (TPM_INT_ENABLE + 3), &intmask, 1);
+		if (r < 0)
 			goto _irq_set;
 
-		err = I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &intmask, 1);
-		if (err < 0)
+		r = I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &intmask, 1);
+		if (r < 0)
 			goto _irq_set;
 
 		chip->vendor.irq = interrupts;
@@ -744,7 +744,7 @@ _tpm_clean_answer:
 	tpm_remove_hardware(chip->dev);
 end:
 	pr_info("TPM I2C initialisation fail\n");
-	return err;
+	return r;
 }
 
 /*
@@ -774,14 +774,13 @@ static int tpm_st33_i2c_remove(struct i2c_client *client)
 static int tpm_st33_i2c_pm_suspend(struct device *dev)
 {
 	struct st33zp24_platform_data *pin_infos = dev->platform_data;
-	int ret = 0;
+	int r = 0;
 
 	if (power_mgt)
 		gpio_set_value(pin_infos->io_lpcpd, 0);
 	else
-		ret = tpm_pm_suspend(dev);
-
-	return ret;
+		r = tpm_pm_suspend(dev);
+	return r;
 }				/* tpm_st33_i2c_suspend() */
 
 /*
@@ -794,20 +793,20 @@ static int tpm_st33_i2c_pm_resume(struct device *dev)
 	struct tpm_chip *chip = dev_get_drvdata(dev);
 	struct st33zp24_platform_data *pin_infos = dev->platform_data;
 
-	int ret = 0;
+	int r = 0;
 
 	if (power_mgt) {
 		gpio_set_value(pin_infos->io_lpcpd, 1);
-		ret = wait_for_serirq_timeout(chip,
+		r = wait_for_serirq_timeout(chip,
 					  (chip->ops->status(chip) &
 					  TPM_STS_VALID) == TPM_STS_VALID,
 					  chip->vendor.timeout_b);
 	} else {
-		ret = tpm_pm_resume(dev);
-		if (!ret)
+		r = tpm_pm_resume(dev);
+		if (!r)
 			tpm_do_selftest(chip);
 	}
-	return ret;
+	return r;
 }				/* tpm_st33_i2c_pm_resume() */
 #endif
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
