From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/16] tpm/tpm_i2c_stm_st33: Remove useless i2c read on interrupt registers
Date: Tue,  7 Oct 2014 22:03:04 +0200
Message-ID: <1412712189-1234-12-git-send-email-christophe-h.ricard@st.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412712189-1234-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove useless i2c read on TPM_INT_ENABLE and TPM_INT_STATUS

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index e99bb78..660ff8b 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -187,7 +187,6 @@ static u8 clear_interruption(struct tpm_stm_dev *tpm_dev)
 
 	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
 	I2C_WRITE_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
-	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
 
 	return interrupt;
 } /* clear_interruption() */
@@ -753,10 +752,6 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			goto _tpm_clean_answer;
 		}
 
-		r = I2C_READ_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
-		if (r < 0)
-			goto _tpm_clean_answer;
-
 		intmask |= TPM_INTF_CMD_READY_INT
 			|  TPM_INTF_FIFO_AVALAIBLE_INT
 			|  TPM_INTF_WAKE_UP_READY_INT
@@ -773,10 +768,6 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		if (r < 0)
 			goto _tpm_clean_answer;
 
-		r = I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &intmask, 1);
-		if (r < 0)
-			goto _tpm_clean_answer;
-
 		chip->vendor.irq = client->irq;
 
 		tpm_gen_interrupt(chip);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
