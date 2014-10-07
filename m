From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 15/16] tpm/tpm_i2c_stm_st33: Add delay before release_locality to make sure irq are cleared
Date: Tue,  7 Oct 2014 22:03:08 +0200
Message-ID: <1412712189-1234-16-git-send-email-christophe-h.ricard@st.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412712189-1234-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In order to manage irq, locality must be active. As Status Ready interrupt is activated,
when going back into ready state with the cancel function, we need to add a little delay
to make sure the irq is going to be serviced before the release_locality is hit.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index de9f12e..4c78845 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -509,6 +509,7 @@ static int tpm_stm_i2c_send(struct tpm_chip *chip, unsigned char *buf,
 	return len;
 out_err:
 	tpm_stm_i2c_cancel(chip);
+	usleep_range(100, 250);
 	release_locality(chip);
 	return r;
 }
@@ -557,6 +558,7 @@ static int tpm_stm_i2c_recv(struct tpm_chip *chip, unsigned char *buf,
 
 out:
 	chip->ops->cancel(chip);
+	usleep_range(100, 250);
 	release_locality(chip);
 	return size;
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
