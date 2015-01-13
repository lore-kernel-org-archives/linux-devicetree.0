From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 03/10] tpm/tpm_i2c_stm_st33: Replace remaining r by ret
Date: Tue, 13 Jan 2015 23:13:11 +0100
Message-ID: <1421187198-8503-4-git-send-email-christophe-h.ricard@st.com>
References: <1421187198-8503-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421187198-8503-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some places are still using r instead of ret.

Reviewed-by: Jasob Gunthorpe <jason.gunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 2d6e50e..d12d507 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -374,7 +374,7 @@ static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
 			wait_queue_head_t *queue, bool check_cancel)
 {
 	unsigned long stop;
-	int r;
+	int ret;
 	bool canceled = false;
 	bool condition;
 	u32 cur_intrs;
@@ -400,7 +400,7 @@ again:
 		if ((long) timeout <= 0)
 			return -1;
 
-		r = wait_event_interruptible_timeout(*queue,
+		ret = wait_event_interruptible_timeout(*queue,
 					cur_intrs != tpm_dev->intrs, timeout);
 
 		interrupt |= clear_interruption(tpm_dev);
@@ -408,12 +408,12 @@ again:
 		condition = wait_for_tpm_stat_cond(chip, mask,
 						   check_cancel, &canceled);
 
-		if (r >= 0 && condition) {
+		if (ret >= 0 && condition) {
 			if (canceled)
 				return -ECANCELED;
 			return 0;
 		}
-		if (r == -ERESTARTSYS && freezing(current)) {
+		if (ret == -ERESTARTSYS && freezing(current)) {
 			clear_thread_flag(TIF_SIGPENDING);
 			goto again;
 		}
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
