From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 14/16] tpm/tpm_i2c_stm_st33: Fix potential bug in tpm_stm_i2c_send
Date: Tue,  7 Oct 2014 21:44:59 +0200
Message-ID: <1412711101-988-15-git-send-email-christophe-h.ricard@st.com>
References: <1412711101-988-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412711101-988-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When sending data in tpm_stm_i2c_send, each loop iteration send buf.
Send buf + i instead as the goal of this for loop is to send a number
of byte from buf that fit in burstcnt. Once those byte are sent, we are
supposed to send the next ones.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 8d32ade..de9f12e 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -480,7 +480,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 		if (burstcnt < 0)
 			return burstcnt;
 		size = min_t(int, len - i - 1, burstcnt);
-		r = i2c_write_data(tpm_dev, TPM_DATA_FIFO, buf, size);
+		r = i2c_write_data(tpm_dev, TPM_DATA_FIFO, buf + i, size);
 		if (r < 0)
 			goto out_err;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
