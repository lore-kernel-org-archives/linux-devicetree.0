From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 01/15] tpm/tpm_i2c_stm_st33: Fix potential bug in tpm_stm_i2c_send
Date: Mon,  1 Dec 2014 19:32:46 +0100
Message-ID: <1417458780-25977-2-git-send-email-christophe-h.ricard@st.com>
References: <1417458780-25977-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417458780-25977-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

When sending data in tpm_stm_i2c_send, each loop iteration send buf.
Send buf + i instead as the goal of this for loop is to send a number
of byte from buf that fit in burstcnt. Once those byte are sent, we are
supposed to send the next ones.

The driver was working because the burstcount value returns always the maximum size for a TPM
command or response. (0x800 for a command and 0x400 for a response).

Reviewed-by: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 4669e37..7d1c540 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -487,7 +487,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 		if (burstcnt < 0)
 			return burstcnt;
 		size = min_t(int, len - i - 1, burstcnt);
-		ret = I2C_WRITE_DATA(client, TPM_DATA_FIFO, buf, size);
+		ret = I2C_WRITE_DATA(client, TPM_DATA_FIFO, buf + i, size);
 		if (ret < 0)
 			goto out_err;
 
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
