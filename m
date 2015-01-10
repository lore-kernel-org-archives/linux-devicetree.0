From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 02/10] tpm/tpm_i2c_stm_st33: Sanity cleanup
Date: Sat, 10 Jan 2015 12:20:23 +0100
Message-ID: <1420888831-17491-3-git-send-email-christophe-h.ricard@st.com>
References: <1420888831-17491-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420888831-17491-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cleanup header description and correct some indent.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 5deb9cc..2d6e50e 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -811,8 +811,7 @@ _tpm_clean_answer:
 
 /*
  * tpm_stm_i2c_remove remove the TPM device
- * @param: client, the i2c_client drescription (TPM I2C description).
- *		clear_bit(0, &chip->is_open);
+ * @param: client, the i2c_client description (TPM I2C description).
  * @return: 0 in case of success.
  */
 static int tpm_stm_i2c_remove(struct i2c_client *client)
@@ -887,7 +886,8 @@ MODULE_DEVICE_TABLE(of, of_st33zp24_i2c_match);
 #endif
 
 static SIMPLE_DEV_PM_OPS(tpm_stm_i2c_ops, tpm_stm_i2c_pm_suspend,
-	tpm_stm_i2c_pm_resume);
+			 tpm_stm_i2c_pm_resume);
+
 static struct i2c_driver tpm_stm_i2c_driver = {
 	.driver = {
 		.owner = THIS_MODULE,
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
