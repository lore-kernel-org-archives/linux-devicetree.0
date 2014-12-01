From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 07/15] tpm/tpm_i2c_stm_st33: Remove reference to io_serirq
Date: Mon,  1 Dec 2014 19:32:52 +0100
Message-ID: <1417458780-25977-8-git-send-email-christophe-h.ricard@st.com>
References: <1417458780-25977-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417458780-25977-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

The serirq gpio pin is used only as interrupt. After driver initialization,
the serirq signal is always used through interrupt and never with gpio
kernel API.

The irq can then be initialized during the platform_data definition within the client->irq pin.

Reviewed-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c            | 13 +++----------
 include/linux/platform_data/tpm_i2c_stm_st33.h |  1 -
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 4f72538..7286116 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -103,7 +103,6 @@ struct tpm_stm_dev {
 	struct completion irq_detection;
 	struct tpm_chip *chip;
 	u8 buf[TPM_BUFSIZE + 1];
-	int io_serirq;
 	int io_lpcpd;
 };
 
@@ -688,18 +687,15 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
 
@@ -739,10 +735,7 @@ tpm_st33_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
index 88f9cb1..85775cf 100644
--- a/include/linux/platform_data/tpm_i2c_stm_st33.h
+++ b/include/linux/platform_data/tpm_i2c_stm_st33.h
@@ -33,7 +33,6 @@
 #define TPM_ST33_I2C			"st33zp24_i2c"
 
 struct st33zp24_platform_data {
-	int io_serirq;
 	int io_lpcpd;
 };
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
