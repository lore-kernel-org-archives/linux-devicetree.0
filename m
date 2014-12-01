From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 14/15] tpm/tpm_i2c_stm_st33: Remove useless i2c read on interrupt registers
Date: Mon,  1 Dec 2014 19:32:59 +0100
Message-ID: <1417458780-25977-15-git-send-email-christophe-h.ricard@st.com>
References: <1417458780-25977-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417458780-25977-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove useless i2c read on TPM_INT_ENABLE and TPM_INT_STATUS

Reviewed-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index eb0244a..1d589e0 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -783,10 +783,6 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			goto _tpm_clean_answer;
 		}
 
-		ret = I2C_READ_DATA(tpm_dev, TPM_INT_ENABLE, &intmask, 1);
-		if (ret < 0)
-			goto _tpm_clean_answer;
-
 		intmask |= TPM_INTF_CMD_READY_INT
 			|  TPM_INTF_STS_VALID_INT
 			|  TPM_INTF_DATA_AVAIL_INT;
@@ -801,10 +797,6 @@ tpm_stm_i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		if (ret < 0)
 			goto _tpm_clean_answer;
 
-		ret = I2C_READ_DATA(tpm_dev, TPM_INT_STATUS, &intmask, 1);
-		if (ret < 0)
-			goto _tpm_clean_answer;
-
 		chip->vendor.irq = client->irq;
 
 		disable_irq_nosync(chip->vendor.irq);
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
