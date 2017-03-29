From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v7 3/3] mailbox: Remove depends on COMPILE_TEST for BCM_FLEXRM_MBOX
Date: Wed, 29 Mar 2017 11:00:55 +0530
Message-ID: <1490765455-8556-4-git-send-email-anup.patel@broadcom.com>
References: <1490765455-8556-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490765455-8556-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod KUMAR <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Broadcom FlexRM mailbox driver uses platform MSI support but
not all ARCHs provide asm/msi.h. Due to this, we get compilation
error in Broadcom FlexRM mailbox driver via linux/msi.h on ARCHs
which lack asm/msi.h.

This patch removes "depends on COMPILE_TEST" for Kconfig option
BCM_FLEXRM_MBOX so that Broadcom FlexRM mailbox driver is only
compiled for ARM64.

Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 drivers/mailbox/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 305018c..9c19b9f 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -155,7 +155,7 @@ config BCM_PDC_MBOX
 
 config BCM_FLEXRM_MBOX
 	tristate "Broadcom FlexRM Mailbox"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARM64
 	depends on HAS_DMA
 	select GENERIC_MSI_IRQ_DOMAIN
 	default ARCH_BCM_IPROC
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
