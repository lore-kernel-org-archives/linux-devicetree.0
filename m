From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/16] tpm/tpm_i2c_stm_st33: Update Kconfig in order to be inline to other similar product
Date: Tue,  7 Oct 2014 21:44:46 +0200
Message-ID: <1412711101-988-2-git-send-email-christophe-h.ricard@st.com>
References: <1412711101-988-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412711101-988-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

STMicroelectronics i2c tpm is the only one to have a different tristate
label.

Rename it "TPM Interface Specification 1.2 Interface (I2C - STMicroelectronics)"

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index c54cac3..21abb0e 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -63,6 +63,16 @@ config TCG_TIS_I2C_NUVOTON
 	  To compile this driver as a module, choose M here; the module
 	  will be called tpm_i2c_nuvoton.
 
+config TCG_ST33_I2C
+	tristate "TPM Interface Specification 1.2 Interface (I2C - STMicroelectronics)"
+	depends on I2C
+	depends on GPIOLIB
+	---help---
+	  If you have a TPM security chip from STMicroelectronics working with
+	  an I2C bus say Yes and it will be accessible from within Linux.
+	  To compile this driver as a module, choose M here; the module will be
+	  called tpm_stm_st33_i2c.
+
 config TCG_NSC
 	tristate "National Semiconductor TPM Interface"
 	depends on X86
@@ -100,16 +110,6 @@ config TCG_IBMVTPM
 	  will be accessible from within Linux.  To compile this driver
 	  as a module, choose M here; the module will be called tpm_ibmvtpm.
 
-config TCG_ST33_I2C
-	tristate "STMicroelectronics ST33 I2C TPM"
-	depends on I2C
-	depends on GPIOLIB
-	---help---
-	  If you have a TPM security chip from STMicroelectronics working with
-	  an I2C bus say Yes and it will be accessible from within Linux.
-	  To compile this driver as a module, choose M here; the module will be
-	  called tpm_stm_st33_i2c.
-
 config TCG_XEN
 	tristate "XEN TPM Interface"
 	depends on TCG_TPM && XEN
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
