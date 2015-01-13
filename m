From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/10] tpm/tpm_i2c_stm_st33: Change tpm_i2c_stm_st33.h to tpm_stm_st33.h
Date: Tue, 13 Jan 2015 23:13:13 +0100
Message-ID: <1421187198-8503-6-git-send-email-christophe-h.ricard@st.com>
References: <1421187198-8503-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421187198-8503-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: PeterHuewe-Mmb7MZpHnFY@public.gmane.org
Cc: ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, benoit.houyere-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, jarkko.sakkinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

include/linux/platform_data/tpm_i2c_stm_st33.h can be used by other st33
tpm device driver not using i2c protocol.

Reviewed-by: Jasob Gunthorpe <jason.gunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c            |  2 +-
 include/linux/platform_data/tpm_i2c_stm_st33.h | 39 --------------------------
 include/linux/platform_data/tpm_stm_st33.h     | 39 ++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 40 deletions(-)
 delete mode 100644 include/linux/platform_data/tpm_i2c_stm_st33.h
 create mode 100644 include/linux/platform_data/tpm_stm_st33.h

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 9d3c9c8..3289f9d 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -50,7 +50,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_gpio.h>
 
-#include <linux/platform_data/tpm_i2c_stm_st33.h>
+#include <linux/platform_data/tpm_stm_st33.h>
 #include "tpm.h"
 
 #define TPM_ACCESS			0x0
diff --git a/include/linux/platform_data/tpm_i2c_stm_st33.h b/include/linux/platform_data/tpm_i2c_stm_st33.h
deleted file mode 100644
index 85775cf..0000000
--- a/include/linux/platform_data/tpm_i2c_stm_st33.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * STMicroelectronics TPM I2C Linux driver for TPM ST33ZP24
- * Copyright (C) 2009, 2010  STMicroelectronics
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>.
- *
- * STMicroelectronics version 1.2.0, Copyright (C) 2010
- * STMicroelectronics comes with ABSOLUTELY NO WARRANTY.
- * This is free software, and you are welcome to redistribute it
- * under certain conditions.
- *
- * @Author: Christophe RICARD tpmsupport-qxv4g6HH51o@public.gmane.org
- *
- * @File: stm_st33_tpm_i2c.h
- *
- * @Date: 09/15/2010
- */
-#ifndef __STM_ST33_TPM_I2C_MAIN_H__
-#define __STM_ST33_TPM_I2C_MAIN_H__
-
-
-#define TPM_ST33_I2C			"st33zp24_i2c"
-
-struct st33zp24_platform_data {
-	int io_lpcpd;
-};
-
-#endif /* __STM_ST33_TPM_I2C_MAIN_H__ */
diff --git a/include/linux/platform_data/tpm_stm_st33.h b/include/linux/platform_data/tpm_stm_st33.h
new file mode 100644
index 0000000..ff75310
--- /dev/null
+++ b/include/linux/platform_data/tpm_stm_st33.h
@@ -0,0 +1,39 @@
+/*
+ * STMicroelectronics TPM I2C Linux driver for TPM ST33ZP24
+ * Copyright (C) 2009, 2010  STMicroelectronics
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ * STMicroelectronics version 1.2.0, Copyright (C) 2010
+ * STMicroelectronics comes with ABSOLUTELY NO WARRANTY.
+ * This is free software, and you are welcome to redistribute it
+ * under certain conditions.
+ *
+ * @Author: Christophe RICARD tpmsupport-qxv4g6HH51o@public.gmane.org
+ *
+ * @File: stm_st33_tpm.h
+ *
+ * @Date: 09/15/2010
+ */
+#ifndef __STM_ST33_TPM_H__
+#define __STM_ST33_TPM_H__
+
+#define TPM_ST33_I2C			"st33zp24-i2c"
+#define TPM_ST33_SPI			"st33zp24-spi"
+
+struct st33zp24_platform_data {
+	int io_lpcpd;
+};
+
+#endif /* __STM_ST33_TPM_H__ */
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
