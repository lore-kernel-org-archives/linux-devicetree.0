From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/16] tpm/tpm_i2c_stm_st33: Add devicetree structure
Date: Tue,  7 Oct 2014 22:03:00 +0200
Message-ID: <1412712189-1234-8-git-send-email-christophe-h.ricard@st.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412712189-1234-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add tpm_stm_st33_i2c dts structure keeping backward compatibility
with static platform_data support as well.
In the mean time the code is made much simpler by:
- Moving all gpio_request to devm_gpio_request_one primitive
- Moving request_irq to devm_request_threaded_irq

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 198 +++++++++++++++++++++++++++---------
 1 file changed, 152 insertions(+), 46 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 9466422..ac23f0f 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -48,6 +48,10 @@
 #include <linux/uaccess.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#ifdef CONFIG_OF
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#endif
 
 #include <linux/platform_data/tpm_i2c_stm_st33.h>
 #include "tpm.h"
@@ -618,6 +622,108 @@ static int power_mgt = 1;
 module_param(power_mgt, int, 0444);
 MODULE_PARM_DESC(power_mgt, "Power Management");
 
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
+	if (!pp)
+		return -ENODEV;
+
+	/* Get GPIO from device tree */
+	gpio = of_get_named_gpio(pp, "lpcpd-gpios", 0);
+	if (gpio < 0) {
+		pr_err("Failed to retrieve lpcpd-gpios from dts.\n");
+		power_mgt = 0;
+		goto _irq_probe;
+	}
+	power_mgt = 1;
+	/* GPIO request and configuration */
+	r = devm_gpio_request_one(&client->dev, gpio,
+			GPIOF_OUT_INIT_HIGH, "TPM IO LPCPD");
+	if (r) {
+		pr_err("Failed to request serirq pin\n");
+		return -ENODEV;
+	}
+	tpm_dev->io_lpcpd = gpio;
+
+_irq_probe:
+	/* IRQ */
+	r = irq_of_parse_and_map(pp, 0);
+	if (r < 0) {
+		pr_err("Unable to get irq, error: %d\n", r);
+		interrupts = 0;
+		goto _end;
+	}
+	interrupts = 1;
+	client->irq = r;
+
+	return 0;
+_end:
+	return r;
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
+	int irq;
+
+	pdata = client->dev.platform_data;
+	if (pdata == NULL) {
+		pr_err("No platform data\n");
+		return -EINVAL;
+	}
+
+	/* store for late use */
+	tpm_dev->io_serirq = pdata->io_serirq;
+	tpm_dev->io_lpcpd = pdata->io_lpcpd;
+
+	if (interrupts) {
+		r = devm_gpio_request_one(&client->dev, pdata->io_serirq,
+					GPIOF_IN, "TPM IO_SERIRQ");
+		if (r) {
+			pr_err("%s : gpio_request failed\n", __FILE__);
+			return -ENODEV;
+		}
+
+		/* IRQ */
+		irq = gpio_to_irq(pdata->io_serirq);
+		if (irq < 0) {
+			pr_err("Unable to get irq number for GPIO %d %d\n",
+				pdata->io_serirq, r);
+			return -ENODEV;
+		}
+		client->irq = irq;
+	}
+
+	if (power_mgt) {
+		r = devm_gpio_request_one(&client->dev,
+				pdata->io_lpcpd, GPIOF_OUT_INIT_HIGH,
+				"TPM IO_LPCPD");
+		if (r) {
+			pr_err("%s : reset gpio_request failed\n", __FILE__);
+			return -ENODEV;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * tpm_stm_i2c_probe initialize the TPM device
  * @param: client, the i2c_client drescription (TPM I2C description).
@@ -637,30 +743,19 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
 	if (!tpm_dev) {
 		dev_info(&client->dev, "cannot allocate memory for tpm data\n");
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
+		return -ENOMEM;
 	}
 
 	chip = tpm_register_hardware(&client->dev, &st_i2c_tpm);
@@ -672,6 +767,25 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	TPM_VPRIV(chip) = tpm_dev;
 	tpm_dev->client = client;
 
+	platform_data = client->dev.platform_data;
+	if (!platform_data && client->dev.of_node) {
+		r = tpm_stm_i2c_of_request_resources(chip);
+		if (r) {
+			pr_err("No platform data\n");
+			goto _tpm_clean_answer;
+		}
+	} else if (platform_data) {
+		r = tpm_stm_i2c_request_resources(client, chip);
+		if (r) {
+			pr_err("Cannot get platform resources\n");
+			goto _tpm_clean_answer;
+		}
+	} else {
+		pr_err("tpm_stm_st33 platform resources not available\n");
+		goto _tpm_clean_answer;
+	}
+
+
 	chip->vendor.timeout_a = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
 	chip->vendor.timeout_b = msecs_to_jiffies(TIS_LONG_TIMEOUT);
 	chip->vendor.timeout_c = msecs_to_jiffies(TIS_SHORT_TIMEOUT);
@@ -679,37 +793,27 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	chip->vendor.locality = LOCALITY0;
 
-	if (power_mgt) {
-		r = gpio_request(platform_data->io_lpcpd, "TPM IO_LPCPD");
-		if (r)
-			goto _gpio_init1;
-		gpio_set_value(platform_data->io_lpcpd, 1);
-	}
-
 	if (interrupts) {
 		init_completion(&tpm_dev->irq_detection);
 		if (request_locality(chip) != LOCALITY0) {
 			r = -ENODEV;
 			goto _tpm_clean_answer;
 		}
-		r = gpio_request(platform_data->io_serirq, "TPM IO_SERIRQ");
-		if (r)
-			goto _gpio_init2;
 
 		clear_interruption(tpm_dev);
-		r = request_irq(gpio_to_irq(platform_data->io_serirq),
-				&tpm_ioserirq_handler,
-				IRQF_TRIGGER_HIGH,
+		r = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+				tpm_ioserirq_handler,
+				IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 				"TPM SERIRQ management", chip);
 		if (r < 0) {
 			dev_err(chip->dev , "TPM SERIRQ signals %d not available\n",
-				gpio_to_irq(platform_data->io_serirq));
-			goto _irq_set;
+				client->irq);
+			goto _tpm_clean_answer;
 		}
 
 		r = I2C_READ_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
 		if (r < 0)
-			goto _irq_set;
+			goto _tpm_clean_answer;
 
 		intmask |= TPM_INTF_CMD_READY_INT
 			|  TPM_INTF_FIFO_AVALAIBLE_INT
@@ -720,18 +824,18 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
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
@@ -741,17 +845,8 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	dev_info(chip->dev, "TPM I2C Initialized\n");
 	return 0;
-_irq_set:
-	free_irq(gpio_to_irq(platform_data->io_serirq), (void *)chip);
-_gpio_init2:
-	if (interrupts)
-		gpio_free(platform_data->io_serirq);
-_gpio_init1:
-	if (power_mgt)
-		gpio_free(platform_data->io_lpcpd);
 _tpm_clean_answer:
 	tpm_remove_hardware(chip->dev);
-end:
 	pr_info("TPM I2C initialisation fail\n");
 	return r;
 }
@@ -823,14 +918,25 @@ static const struct i2c_device_id tpm_stm_i2c_id[] = {
 	{TPM_ST33_I2C, 0},
 	{}
 };
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_st33zp24_i2c_match[] = {
+	{ .compatible = "st,st33zp24_i2c", },
+	{}
+};
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
+		#ifdef CONFIG_OF
+			.of_match_table = of_match_ptr(of_st33zp24_i2c_match),
+		#endif
 		   },
 	.probe = tpm_stm_i2c_probe,
 	.remove = tpm_stm_i2c_remove,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
