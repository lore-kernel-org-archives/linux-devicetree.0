From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 12/15] tpm/tpm_i2c_stm_st33: Remove useless i2c read on interrupt registers
Date: Mon, 13 Oct 2014 22:23:34 +0200
Message-ID: <1413231817-5174-13-git-send-email-christophe-h.ricard@st.com>
References: <1413231817-5174-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413231817-5174-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove useless i2c read on TPM_INT_ENABLE and TPM_INT_STATUS

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 388bb64..ed4176e 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -184,7 +184,6 @@ static void clear_interruption(struct tpm_stm_dev *tpm_dev)
 
 	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
 	I2C_WRITE_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
-	I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &interrupt, 1);
 } /* clear_interruption() */
 
 /*
@@ -725,10 +724,6 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			goto _tpm_clean_answer;
 		}
 
-		r = I2C_READ_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
-		if (r < 0)
-			goto _tpm_clean_answer;
-
 		intmask |= TPM_INTF_CMD_READY_INT
 			|  TPM_INTF_STS_VALID_INT
 			|  TPM_INTF_DATA_AVAIL_INT;
@@ -742,10 +737,6 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		if (r < 0)
 			goto _tpm_clean_answer;
 
-		r = I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &intmask, 1);
-		if (r < 0)
-			goto _tpm_clean_answer;
-
 		chip->vendor.irq = client->irq;
 
 		disable_irq_nosync(chip->vendor.irq);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
