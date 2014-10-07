From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/16] tpm/tpm_i2c_stm_st33: Move tpm registers to tpm_i2c_stm_st33.c
Date: Tue,  7 Oct 2014 21:44:48 +0200
Message-ID: <1412711101-988-4-git-send-email-christophe-h.ricard@st.com>
References: <1412711101-988-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412711101-988-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Move tpm registers to tpm_i2c_stm_st33.c.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 17 +++++++++++++++++
 drivers/char/tpm/tpm_i2c_stm_st33.h | 17 -----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 52d80ef..8a8fc10 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -50,6 +50,23 @@
 #include <linux/slab.h>
 
 #include "tpm.h"
+
+#define TPM_ACCESS			0x0
+#define TPM_STS				0x18
+#define TPM_HASH_END			0x20
+#define TPM_DATA_FIFO			0x24
+#define TPM_HASH_DATA			0x24
+#define TPM_HASH_START			0x28
+#define TPM_INTF_CAPABILITY		0x14
+#define TPM_INT_STATUS			0x10
+#define TPM_INT_ENABLE			0x08
+
+#define TPM_DUMMY_BYTE			0xAA
+#define TPM_WRITE_DIRECTION		0x80
+#define TPM_HEADER_SIZE			10
+#define TPM_BUFSIZE			2048
+
+#define LOCALITY0		0
 #include "tpm_i2c_stm_st33.h"
 
 enum stm33zp24_access {
diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.h b/drivers/char/tpm/tpm_i2c_stm_st33.h
index 439a432..3041271 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.h
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.h
@@ -30,23 +30,6 @@
 #ifndef __STM_ST33_TPM_I2C_MAIN_H__
 #define __STM_ST33_TPM_I2C_MAIN_H__
 
-#define TPM_ACCESS			(0x0)
-#define TPM_STS				(0x18)
-#define TPM_HASH_END			(0x20)
-#define TPM_DATA_FIFO			(0x24)
-#define TPM_HASH_DATA			(0x24)
-#define TPM_HASH_START			(0x28)
-#define TPM_INTF_CAPABILITY		(0x14)
-#define TPM_INT_STATUS			(0x10)
-#define TPM_INT_ENABLE			(0x08)
-
-#define TPM_DUMMY_BYTE			0xAA
-#define TPM_WRITE_DIRECTION		0x80
-#define TPM_HEADER_SIZE			10
-#define TPM_BUFSIZE			2048
-
-#define LOCALITY0		0
-
 #define TPM_ST33_I2C			"st33zp24_i2c"
 
 struct st33zp24_platform_data {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
