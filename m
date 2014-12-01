From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 08/15] tpm/tpm_i2c_stm_st33: Replace err/rc/ret by ret for a function return code
Date: Mon,  1 Dec 2014 01:20:40 +0100
Message-ID: <1417393247-4479-9-git-send-email-christophe-h.ricard@st.com>
References: <1417393247-4479-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417393247-4479-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some functions return err, rc or ret for a status code.

Return ret instead for all of them.

Reviewed-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 61 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 7286116..d425fa1 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -291,7 +291,7 @@ static int check_locality(struct tpm_chip *chip)
 static int request_locality(struct tpm_chip *chip)
 {
 	unsigned long stop;
-	long rc;
+	long ret;
 	struct tpm_stm_dev *tpm_dev;
 	u8 data;
 
@@ -301,15 +301,15 @@ static int request_locality(struct tpm_chip *chip)
 		return chip->vendor.locality;
 
 	data = TPM_ACCESS_REQUEST_USE;
-	rc = I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
-	if (rc < 0)
+	ret = I2C_WRITE_DATA(tpm_dev, TPM_ACCESS, &data, 1);
+	if (ret < 0)
 		goto end;
 
 	if (chip->vendor.irq) {
-		rc = wait_for_serirq_timeout(chip, (check_locality
+		ret = wait_for_serirq_timeout(chip, (check_locality
 						       (chip) >= 0),
 						      chip->vendor.timeout_a);
-		if (rc > 0)
+		if (ret > 0)
 			return chip->vendor.locality;
 	} else {
 		stop = jiffies + chip->vendor.timeout_a;
@@ -319,9 +319,9 @@ static int request_locality(struct tpm_chip *chip)
 			msleep(TPM_TIMEOUT);
 		} while (time_before(jiffies, stop));
 	}
-	rc = -EACCES;
+	ret = -EACCES;
 end:
-	return rc;
+	return ret;
 } /* request_locality() */
 
 /*
@@ -388,14 +388,14 @@ static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
 			 wait_queue_head_t *queue)
 {
 	unsigned long stop;
-	long rc;
+	long ret;
 	u8 status;
 
 	 if (chip->vendor.irq) {
-		rc = wait_for_serirq_timeout(chip, ((tpm_stm_i2c_status
+		ret = wait_for_serirq_timeout(chip, ((tpm_stm_i2c_status
 							(chip) & mask) ==
 						       mask), timeout);
-		if (rc > 0)
+		if (ret > 0)
 			return 0;
 	} else {
 		stop = jiffies + timeout;
@@ -624,7 +624,7 @@ MODULE_PARM_DESC(power_mgt, "Power Management");
 static int
 tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
-	int err;
+	int ret;
 	u8 intmask;
 	struct tpm_chip *chip;
 	struct st33zp24_platform_data *platform_data;
@@ -633,20 +633,20 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (client == NULL) {
 		pr_info("%s: i2c client is NULL. Device not accessible.\n",
 			__func__);
-		err = -ENODEV;
+		ret = -ENODEV;
 		goto end;
 	}
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_info(&client->dev, "client not i2c capable\n");
-		err = -ENODEV;
+		ret = -ENODEV;
 		goto end;
 	}
 
 	tpm_dev = devm_kzalloc(&client->dev, sizeof(struct tpm_stm_dev),
 			       GFP_KERNEL);
 	if (!tpm_dev) {
-		err = -ENOMEM;
+		ret = -ENOMEM;
 		goto _tpm_clean_answer;
 	}
 
@@ -654,7 +654,7 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	if (!platform_data) {
 		dev_info(&client->dev, "chip not available\n");
-		err = -ENODEV;
+		ret = -ENODEV;
 		goto _tpm_clean_answer;
 	}
 
@@ -675,8 +675,8 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	chip->vendor.locality = LOCALITY0;
 
 	if (power_mgt) {
-		err = gpio_request(platform_data->io_lpcpd, "TPM IO_LPCPD");
-		if (err)
+		ret = gpio_request(platform_data->io_lpcpd, "TPM IO_LPCPD");
+		if (ret)
 			goto _gpio_init1;
 		gpio_set_value(platform_data->io_lpcpd, 1);
 	}
@@ -684,23 +684,23 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (interrupts) {
 		init_completion(&tpm_dev->irq_detection);
 		if (request_locality(chip) != LOCALITY0) {
-			err = -ENODEV;
+			ret = -ENODEV;
 			goto _tpm_clean_answer;
 		}
 
 		clear_interruption(tpm_dev);
-		err = request_irq(client->irq,
+		ret = request_irq(client->irq,
 				&tpm_ioserirq_handler,
 				IRQF_TRIGGER_HIGH,
 				"TPM SERIRQ management", chip);
-		if (err < 0) {
+		if (ret < 0) {
 			dev_err(chip->dev , "TPM SERIRQ signals %d not available\n",
 				client->irq);
 			goto _irq_set;
 		}
 
-		err = I2C_READ_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
-		if (err < 0)
+		ret = I2C_READ_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
+		if (ret < 0)
 			goto _irq_set;
 
 		intmask |= TPM_INTF_CMD_READY_INT
@@ -710,18 +710,18 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			|  TPM_INTF_STS_VALID_INT
 			|  TPM_INTF_DATA_AVAIL_INT;
 
-		err = I2C_WRITE_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
-		if (err < 0)
+		ret = I2C_WRITE_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
+		if (ret < 0)
 			goto _irq_set;
 
 		intmask = TPM_GLOBAL_INT_ENABLE;
-		err = I2C_WRITE_DATA(tpm_dev, (TPM_INT_ENABLE + 3),
+		ret = I2C_WRITE_DATA(tpm_dev, (TPM_INT_ENABLE + 3),
 				     &intmask, 1);
-		if (err < 0)
+		if (ret < 0)
 			goto _irq_set;
 
-		err = I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &intmask, 1);
-		if (err < 0)
+		ret = I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &intmask, 1);
+		if (ret < 0)
 			goto _irq_set;
 
 		chip->vendor.irq = interrupts;
@@ -743,7 +743,7 @@ _tpm_clean_answer:
 	tpm_remove_hardware(chip->dev);
 end:
 	pr_info("TPM I2C initialisation fail\n");
-	return err;
+	return ret;
 }
 
 /*
@@ -779,7 +779,6 @@ static int tpm_st33_i2c_pm_suspend(struct device *dev)
 		gpio_set_value(pin_infos->io_lpcpd, 0);
 	else
 		ret = tpm_pm_suspend(dev);
-
 	return ret;
 }				/* tpm_st33_i2c_suspend() */
 
@@ -807,7 +806,7 @@ static int tpm_st33_i2c_pm_resume(struct device *dev)
 			tpm_do_selftest(chip);
 	}
 	return ret;
-}				/* tpm_st33_i2c_pm_resume() */
+} /* tpm_st33_i2c_pm_resume() */
 #endif
 
 static const struct i2c_device_id tpm_st33_i2c_id[] = {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
