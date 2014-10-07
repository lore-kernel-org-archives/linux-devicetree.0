From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 16/16] tpm: Increment driver version to 1.2.1.
Date: Tue,  7 Oct 2014 22:03:09 +0200
Message-ID: <1412712189-1234-17-git-send-email-christophe-h.ricard@st.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412712189-1234-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Many changes were added to the driver so increment the version.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/tpm_i2c_stm_st33.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/tpm/tpm_i2c_stm_st33.c b/drivers/char/tpm/tpm_i2c_stm_st33.c
index 4c78845..b0d9bc2 100644
--- a/drivers/char/tpm/tpm_i2c_stm_st33.c
+++ b/drivers/char/tpm/tpm_i2c_stm_st33.c
@@ -1,6 +1,6 @@
 /*
  * STMicroelectronics TPM I2C Linux driver for TPM ST33ZP24
- * Copyright (C) 2009, 2010  STMicroelectronics
+ * Copyright (C) 2009, 2010, 2014  STMicroelectronics
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -15,7 +15,7 @@
  * You should have received a copy of the GNU General Public License
  * along with this program; if not, see <http://www.gnu.org/licenses/>.
  *
- * STMicroelectronics version 1.2.0, Copyright (C) 2010
+ * STMicroelectronics version 1.2.1, Copyright (C) 2014
  * STMicroelectronics comes with ABSOLUTELY NO WARRANTY.
  * This is free software, and you are welcome to redistribute it
  * under certain conditions.
@@ -907,5 +907,5 @@ module_i2c_driver(tpm_stm_i2c_driver);
 
 MODULE_AUTHOR("Christophe Ricard (tpmsupport-qxv4g6HH51o@public.gmane.org)");
 MODULE_DESCRIPTION("STM TPM I2C ST33 Driver");
-MODULE_VERSION("1.2.0");
+MODULE_VERSION("1.2.1");
 MODULE_LICENSE("GPL");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
