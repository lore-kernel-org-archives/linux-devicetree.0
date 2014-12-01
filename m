From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 04/15] tpm/tpm_i2c_stm_st33: Fix few coding style error reported by scripts/checkpatch.pl
Date: Mon,  1 Dec 2014 19:32:49 +0100
Message-ID: <1417458780-25977-5-git-send-email-christophe-h.ricard@st.com>
References: <1417458780-25977-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417458780-25977-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix:
- WARNING: Missing a blank line after declarations
- WARNING: braces {} are not necessary for any arm of this statement

Reviewed-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index a205d5d..68a45a9 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -156,6 +156,7 @@ static int read8_reg(struct i2c_client *client, u8 tpm_register,
 static void clear_interruption(struct i2c_client *client)
 {
 	u8 interrupt;
+
 	I2C_READ_DATA(client, TPM_INT_STATUS, &interrupt, 1);
 	I2C_WRITE_DATA(client, TPM_INT_STATUS, &interrupt, 1);
 	I2C_READ_DATA(client, TPM_INT_STATUS, &interrupt, 1);
@@ -232,6 +233,7 @@ static u8 tpm_stm_i2c_status(struct tpm_chip *chip)
 {
 	struct i2c_client *client;
 	u8 data;
+
 	client = (struct i2c_client *)TPM_VPRIV(chip);
 
 	I2C_READ_DATA(client, TPM_STS, &data, 1);
@@ -783,11 +785,11 @@ static int tpm_st33_i2c_pm_suspend(struct device *dev)
 	struct st33zp24_platform_data *pin_infos = dev->platform_data;
 	int ret = 0;
 
-	if (power_mgt) {
+	if (power_mgt)
 		gpio_set_value(pin_infos->io_lpcpd, 0);
-	} else {
+	else
 		ret = tpm_pm_suspend(dev);
-	}
+
 	return ret;
 }				/* tpm_st33_i2c_suspend() */
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
