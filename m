From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 06/10] tpm/tpm_i2c_stm_st33: Add status check when reading data on the FIFO
Date: Tue, 13 Jan 2015 23:13:14 +0100
Message-ID: <1421187198-8503-7-git-send-email-christophe-h.ricard@st.com>
References: <1421187198-8503-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421187198-8503-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a return value check when reading data from the FIFO register.

Reviewed-by: Jasob Gunthorpe <jason.gunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 3289f9d..eeb4816 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -440,7 +440,7 @@ again:
  */
 static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 {
-	int size = 0, burstcnt, len;
+	int size = 0, burstcnt, len, ret;
 	struct tpm_stm_dev *tpm_dev;
 
 	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
@@ -454,7 +454,10 @@ static int recv_data(struct tpm_chip *chip, u8 *buf, size_t count)
 		if (burstcnt < 0)
 			return burstcnt;
 		len = min_t(int, burstcnt, count - size);
-		I2C_READ_DATA(tpm_dev, TPM_DATA_FIFO, buf + size, len);
+		ret = I2C_READ_DATA(tpm_dev, TPM_DATA_FIFO, buf + size, len);
+		if (ret < 0)
+			return ret;
+
 		size += len;
 	}
 	return size;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
