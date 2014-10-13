From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 01/15] tpm/tpm_i2c_stm_st33: Update Kconfig in order to be inline to other similar product
Date: Mon, 13 Oct 2014 22:23:23 +0200
Message-ID: <1413231817-5174-2-git-send-email-christophe-h.ricard@st.com>
References: <1413231817-5174-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413231817-5174-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org
Cc: tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

STMicroelectronics i2c tpm is the only one to have a different tristate
label.

Rename it "TPM Interface Specification 1.2 Interface (I2C - STMicroelectronics)"

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 drivers/char/tpm/Kconfig  | 4 ++--
 drivers/char/tpm/Makefile | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index c54cac3..edfb45c 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -100,8 +100,8 @@ config TCG_IBMVTPM
 	  will be accessible from within Linux.  To compile this driver
 	  as a module, choose M here; the module will be called tpm_ibmvtpm.
 
-config TCG_ST33_I2C
-	tristate "STMicroelectronics ST33 I2C TPM"
+config TCG_TIS_I2C_ST33
+	tristate "TPM Interface Specification 1.2 Interface (I2C - STMicroelectronics)"
 	depends on I2C
 	depends on GPIOLIB
 	---help---
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 4d85dd6..7f54dae 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -20,5 +20,5 @@ obj-$(CONFIG_TCG_NSC) += tpm_nsc.o
 obj-$(CONFIG_TCG_ATMEL) += tpm_atmel.o
 obj-$(CONFIG_TCG_INFINEON) += tpm_infineon.o
 obj-$(CONFIG_TCG_IBMVTPM) += tpm_ibmvtpm.o
-obj-$(CONFIG_TCG_ST33_I2C) += tpm_i2c_stm_st33.o
+obj-$(CONFIG_TCG_TIS_I2C_ST33) += tpm_i2c_stm_st33.o
 obj-$(CONFIG_TCG_XEN) += xen-tpmfront.o
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
