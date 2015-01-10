From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 01/10] tpm/tpm_i2c_stm_st33: Remove sparse spaces
Date: Sat, 10 Jan 2015 12:20:22 +0100
Message-ID: <1420888831-17491-2-git-send-email-christophe-h.ricard@st.com>
References: <1420888831-17491-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420888831-17491-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove some useless spaces (new line or space)

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 48c4808..5deb9cc 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -238,7 +238,6 @@ static int check_locality(struct tpm_chip *chip)
 		return chip->vendor.locality;
 
 	return -EACCES;
-
 } /* check_locality() */
 
 /*
@@ -352,7 +351,7 @@ static u8 interrupt_to_status(u8 irq_mask)
 {
 	u8 status = 0;
 
-	if ((irq_mask & TPM_INTF_STS_VALID_INT) ==  TPM_INTF_STS_VALID_INT)
+	if ((irq_mask & TPM_INTF_STS_VALID_INT) == TPM_INTF_STS_VALID_INT)
 		status |= TPM_STS_VALID;
 	if ((irq_mask & TPM_INTF_DATA_AVAIL_INT) == TPM_INTF_DATA_AVAIL_INT)
 		status |= TPM_STS_DATA_AVAIL;
@@ -570,7 +569,7 @@ out_err:
  * @param: buf,	the buffer to store datas.
  * @param: count, the number of bytes to send.
  * @return: In case of success the number of bytes received.
- *		In other case, a < 0 value describing the issue.
+ *	    In other case, a < 0 value describing the issue.
  */
 static int tpm_stm_i2c_recv(struct tpm_chip *chip, unsigned char *buf,
 			    size_t count)
@@ -633,7 +632,6 @@ static int tpm_stm_i2c_of_request_resources(struct tpm_chip *chip)
 	struct device_node *pp;
 	struct tpm_stm_dev *tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
 	struct i2c_client *client = tpm_dev->client;
-
 	int gpio;
 	int ret;
 
@@ -846,7 +844,7 @@ static int tpm_stm_i2c_pm_suspend(struct device *dev)
 		ret = tpm_pm_suspend(dev);
 
 	return ret;
-}				/* tpm_stm_i2c_suspend() */
+} /* tpm_stm_i2c_suspend() */
 
 /*
  * tpm_stm_i2c_pm_resume resume the TPM device
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
