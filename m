From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] tpm/st33zp24: Add proper wait for ordinal duration in case of irq mode
Date: Thu, 19 Mar 2015 22:15:09 +0100
Message-ID: <1426799709-9696-2-git-send-email-christophe-h.ricard@st.com>
References: <1426799709-9696-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426799709-9696-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

In case the driver is configured to use irq, we are not waiting the command
command for a duration period to see the DATA_AVAIL status bit to raise but
at maximum timeout_c. This may result in critical failure as we will
not wait long enough for command completion.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/st33zp24/st33zp24.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33zp24/st33zp24.c
index 03f2543..976ccb5 100644
--- a/drivers/char/tpm/st33zp24/st33zp24.c
+++ b/drivers/char/tpm/st33zp24/st33zp24.c
@@ -393,7 +393,7 @@ static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
 static int st33zp24_send(struct tpm_chip *chip, unsigned char *buf,
 			 size_t len)
 {
-	u32 status, i, size;
+	u32 status, i, size, ordinal;
 	int burstcnt = 0;
 	int ret;
 	u8 data;
@@ -456,6 +456,17 @@ static int st33zp24_send(struct tpm_chip *chip, unsigned char *buf,
 	if (ret < 0)
 		goto out_err;
 
+	if (chip->vendor.irq) {
+		ordinal = be32_to_cpu(*((__be32 *) (buf + 6)));
+
+		if (wait_for_stat(chip, TPM_STS_DATA_AVAIL | TPM_STS_VALID,
+				  tpm_calc_ordinal_duration(chip, ordinal),
+				  &chip->vendor.read_queue, true) < 0) {
+			ret = -ETIME;
+			goto out_err;
+		}
+	}
+
 	return len;
 out_err:
 	st33zp24_cancel(chip);
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
