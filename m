From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/15] tpm/tpm_i2c_stm_st33: Remove reference to io_serirq
Date: Mon, 13 Oct 2014 22:19:29 +0200
Message-ID: <1413231580-4970-6-git-send-email-christophe-h.ricard@st.com>
References: <1413231580-4970-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413231580-4970-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

The serirq gpio pin is used only as interrupt. After driver initialization,
the serirq signal is always used through interrupt and never with gpio
kernel API.

The irq can then be initialized during the platform_data definition within the client->irq pin.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c            | 13 +++----------
 include/linux/platform_data/tpm_i2c_stm_st33.h |  1 -
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 07ce463..71ef1da 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -104,7 +104,6 @@ struct tpm_stm_dev {
 	struct completion irq_detection;
 	struct tpm_chip *chip;
 	u8 buf[TPM_BUFSIZE + 1];
-	int io_serirq;
 	int io_lpcpd;
 };
 
@@ -690,18 +689,15 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			err = -ENODEV;
 			goto _tpm_clean_answer;
 		}
-		err = gpio_request(platform_data->io_serirq, "TPM IO_SERIRQ");
-		if (err)
-			goto _gpio_init2;
 
 		clear_interruption(tpm_dev);
-		err = request_irq(gpio_to_irq(platform_data->io_serirq),
+		err = request_irq(client->irq,
 				&tpm_ioserirq_handler,
 				IRQF_TRIGGER_HIGH,
 				"TPM SERIRQ management", chip);
 		if (err < 0) {
 			dev_err(chip->dev , "TPM SERIRQ signals %d not available\n",
-				gpio_to_irq(platform_data->io_serirq));
+				client->irq);
 			goto _irq_set;
 		}
 
@@ -740,10 +736,7 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	dev_info(chip->dev, "TPM I2C Initialized\n");
 	return 0;
 _irq_set:
-	free_irq(gpio_to_irq(platform_data->io_serirq), (void *)chip);
-_gpio_init2:
-	if (interrupts)
-		gpio_free(platform_data->io_serirq);
+	free_irq(client->irq, (void *)chip);
 _gpio_init1:
 	if (power_mgt)
 		gpio_free(platform_data->io_lpcpd);
diff --git a/include/linux/platform_data/tpm_i2c_stm_st33.h b/include/linux/platform_data/tpm_i2c_stm_st33.h
index c5e4b7f..ec698f2 100644
--- a/include/linux/platform_data/tpm_i2c_stm_st33.h
+++ b/include/linux/platform_data/tpm_i2c_stm_st33.h
@@ -34,7 +34,6 @@
 #define TPM_ST33_I2C			"st33zp24_i2c"
 
 struct st33zp24_platform_data {
-	int io_serirq;
 	int io_lpcpd;
 };
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
