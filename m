From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 08/15] tpm/tpm_i2c_stm_st33: Add devicetree structure
Date: Sun, 19 Oct 2014 23:11:18 +0200
Message-ID: <1413753085-9958-9-git-send-email-christophe-h.ricard@st.com>
References: <1413753085-9958-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413753085-9958-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add tpm_stm_st33_i2c dts structure keeping backward compatibility
with static platform_data support as well.
In the mean time to easy this update and to make it much simpler, we:
- Moved all gpio_request to devm_gpio_request_one primitive
- Moved request_irq to devm_request_irq

Reviewed-By: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 166 +++++++++++++++++++++++++-----------
 1 file changed, 115 insertions(+), 51 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index fdcdf9b..7339e84 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -47,6 +47,8 @@
 #include <linux/uaccess.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
 
 #include <linux/platform_data/tpm_i2c_stm_st33.h>
 #include "tpm.h"
@@ -607,13 +609,80 @@ static const struct tpm_class_ops st_i2c_tpm = {
 	.req_canceled = tpm_stm_i2c_req_canceled,
 };
 
-static int interrupts;
-module_param(interrupts, int, 0444);
-MODULE_PARM_DESC(interrupts, "Enable interrupts");
+#ifdef CONFIG_OF
+static int tpm_stm_i2c_of_request_resources(struct tpm_chip *chip)
+{
+	struct device_node *pp;
+	struct tpm_stm_dev *tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
+	struct i2c_client *client = tpm_dev->client;
+
+	int gpio;
+	int r;
+
+	pp = client->dev.of_node;
+	if (!pp) {
+		dev_err(chip->dev, "No platform data\n");
+		return -ENODEV;
+	}
 
-static int power_mgt = 1;
-module_param(power_mgt, int, 0444);
-MODULE_PARM_DESC(power_mgt, "Power Management");
+	/* Get GPIO from device tree */
+	gpio = of_get_named_gpio(pp, "lpcpd-gpios", 0);
+	if (gpio < 0) {
+		dev_err(chip->dev, "Failed to retrieve lpcpd-gpios from dts.\n");
+		tpm_dev->io_lpcpd = -1;
+		/*
+		 * lpcpd pin is not specified. This is not an issue as
+		 * power management can be also managed by TPM specific
+		 * commands. So leave with a success status code.
+		 */
+		return 0;
+	}
+	/* GPIO request and configuration */
+	r = devm_gpio_request_one(&client->dev, gpio,
+			GPIOF_OUT_INIT_HIGH, "TPM IO LPCPD");
+	if (r) {
+		dev_err(chip->dev, "Failed to request lpcpd pin\n");
+		return -ENODEV;
+	}
+	tpm_dev->io_lpcpd = gpio;
+
+	return 0;
+}
+#else
+static int tpm_stm_i2c_of_request_resources(struct i2c_client *client)
+{
+	return -ENODEV;
+}
+#endif
+
+static int tpm_stm_i2c_request_resources(struct i2c_client *client,
+					 struct tpm_chip *chip)
+{
+	struct st33zp24_platform_data *pdata;
+	struct tpm_stm_dev *tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
+	int r;
+
+	pdata = client->dev.platform_data;
+	if (pdata == NULL) {
+		pr_err("No platform data\n");
+		return -EINVAL;
+	}
+
+	/* store for late use */
+	tpm_dev->io_lpcpd = pdata->io_lpcpd;
+
+	if (gpio_is_valid(pdata->io_lpcpd)) {
+		r = devm_gpio_request_one(&client->dev,
+				pdata->io_lpcpd, GPIOF_OUT_INIT_HIGH,
+				"TPM IO_LPCPD");
+		if (r) {
+			dev_err(chip->dev, "%s : reset gpio_request failed\n", __FILE__);
+			return r;
+		}
+	}
+
+	return 0;
+}
 
 /*
  * tpm_stm_i2c_probe initialize the TPM device
@@ -634,31 +703,18 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (client == NULL) {
 		pr_info("%s: i2c client is NULL. Device not accessible.\n",
 			__func__);
-		r = -ENODEV;
-		goto end;
+		return -ENODEV;
 	}
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
 		dev_info(&client->dev, "client not i2c capable\n");
-		r = -ENODEV;
-		goto end;
+		return -ENODEV;
 	}
 
 	tpm_dev = devm_kzalloc(&client->dev, sizeof(struct tpm_stm_dev),
 			       GFP_KERNEL);
-	if (!tpm_dev) {
-		dev_info(&client->dev, "cannot allocate memory for tpm data\n");
-		r = -ENOMEM;
-		goto _tpm_clean_answer;
-	}
-
-	platform_data = client->dev.platform_data;
-
-	if (!platform_data) {
-		dev_info(&client->dev, "chip not available\n");
-		r = -ENODEV;
-		goto _tpm_clean_answer;
-	}
+	if (!tpm_dev)
+		return -ENOMEM;
 
 	chip = tpm_register_hardware(&client->dev, &st_i2c_tpm);
 	if (!chip) {
@@ -669,6 +725,17 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	TPM_VPRIV(chip) = tpm_dev;
 	tpm_dev->client = client;
 
+	platform_data = client->dev.platform_data;
+	if (!platform_data && client->dev.of_node) {
+		r = tpm_stm_i2c_of_request_resources(chip);
+		if (r)
+			goto _tpm_clean_answer;
+	} else if (platform_data) {
+		r = tpm_stm_i2c_request_resources(client, chip);
+		if (r)
+			goto _tpm_clean_answer;
+	}
+
 	chip->vendor.timeout_a = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
 	chip->vendor.timeout_b = msecs_to_jiffies(TIS_LONG_TIMEOUT);
 	chip->vendor.timeout_c = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
@@ -676,14 +743,7 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	chip->vendor.locality = LOCALITY0;
 
-	if (power_mgt) {
-		r = gpio_request(platform_data->io_lpcpd, "TPM IO_LPCPD");
-		if (r)
-			goto _gpio_init1;
-		gpio_set_value(platform_data->io_lpcpd, 1);
-	}
-
-	if (interrupts) {
+	if (client->irq) {
 		init_completion(&tpm_dev->irq_detection);
 		if (request_locality(chip) != LOCALITY0) {
 			r = -ENODEV;
@@ -691,19 +751,19 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		}
 
 		clear_interruption(tpm_dev);
-		err = request_irq(client->irq,
-				&tpm_ioserirq_handler,
+		r = devm_request_irq(&client->dev, client->irq,
+				tpm_ioserirq_handler,
 				IRQF_TRIGGER_HIGH,
 				"TPM SERIRQ management", chip);
 		if (r < 0) {
 			dev_err(chip->dev , "TPM SERIRQ signals %d not available\n",
 				client->irq);
-			goto _irq_set;
+			goto _tpm_clean_answer;
 		}
 
 		r = I2C_READ_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
 		if (r < 0)
-			goto _irq_set;
+			goto _tpm_clean_answer;
 
 		intmask |= TPM_INTF_CMD_READY_INT
 			|  TPM_INTF_FIFO_AVALAIBLE_INT
@@ -714,18 +774,18 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 		r = I2C_WRITE_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
 		if (r < 0)
-			goto _irq_set;
+			goto _tpm_clean_answer;
 
 		intmask = TPM_GLOBAL_INT_ENABLE;
 		r = I2C_WRITE_DATA(tpm_dev, (TPM_INT_ENABLE + 3), &intmask, 1);
 		if (r < 0)
-			goto _irq_set;
+			goto _tpm_clean_answer;
 
 		r = I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &intmask, 1);
 		if (r < 0)
-			goto _irq_set;
+			goto _tpm_clean_answer;
 
-		chip->vendor.irq = interrupts;
+		chip->vendor.irq = client->irq;
 
 		tpm_gen_interrupt(chip);
 	}
@@ -735,15 +795,9 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	dev_info(chip->dev, "TPM I2C Initialized\n");
 	return 0;
-_irq_set:
-	free_irq(client->irq, (void *)chip);
-_gpio_init1:
-	if (power_mgt)
-		gpio_free(platform_data->io_lpcpd);
 _tpm_clean_answer:
 	tpm_remove_hardware(chip->dev);
-end:
-	pr_info("TPM I2C initialisation fail\n");
+	dev_info(chip->dev, "TPM I2C initialisation fail\n");
 	return r;
 }
 
@@ -776,7 +830,7 @@ static int tpm_stm_i2c_pm_suspend(struct device *dev)
 	struct st33zp24_platform_data *pin_infos = dev->platform_data;
 	int r = 0;
 
-	if (power_mgt)
+	if (gpio_is_valid(pin_infos->io_lpcpd))
 		gpio_set_value(pin_infos->io_lpcpd, 0);
 	else
 		r = tpm_pm_suspend(dev);
@@ -795,7 +849,7 @@ static int tpm_stm_i2c_pm_resume(struct device *dev)
 
 	int r = 0;
 
-	if (power_mgt) {
+	if (gpio_is_valid(pin_infos->io_lpcpd)) {
 		gpio_set_value(pin_infos->io_lpcpd, 1);
 		r = wait_for_serirq_timeout(chip,
 					  (chip->ops->status(chip) &
@@ -814,14 +868,24 @@ static const struct i2c_device_id tpm_stm_i2c_id[] = {
 	{TPM_ST33_I2C, 0},
 	{}
 };
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_st33zp24_i2c_match[] = {
+	{ .compatible = "st,st33zp24_i2c", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_st33zp24_i2c_match);
+#endif
+
 MODULE_DEVICE_TABLE(i2c, tpm_stm_i2c_id);
 static SIMPLE_DEV_PM_OPS(tpm_stm_i2c_ops, tpm_stm_i2c_pm_suspend,
 	tpm_stm_i2c_pm_resume);
 static struct i2c_driver tpm_stm_i2c_driver = {
 	.driver = {
-		   .owner = THIS_MODULE,
-		   .name = TPM_ST33_I2C,
-		   .pm = &tpm_stm_i2c_ops,
+		.owner = THIS_MODULE,
+		.name = TPM_ST33_I2C,
+		.pm = &tpm_stm_i2c_ops,
+		.of_match_table = of_match_ptr(of_st33zp24_i2c_match),
 		   },
 	.probe = tpm_stm_i2c_probe,
 	.remove = tpm_stm_i2c_remove,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
