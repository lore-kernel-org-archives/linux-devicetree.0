From: ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Subject: [PATCH/RFT 04/12] USB: ohci-da8xx: Divide power up time in the ohci driver
Date: Fri,  7 Oct 2016 18:42:49 +0200
Message-ID: <1475858577-10366-5-git-send-email-ahaslam@baylibre.com>
References: <1475858577-10366-1-git-send-email-ahaslam@baylibre.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475858577-10366-1-git-send-email-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Instead of requiring platform data to know that the effective time
should be diveded by two, Make that operation in the driver so that
users (platform board files/Device tree) dont have to worry about it.

Signed-off-by: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/mach-davinci/board-da830-evm.c     | 2 +-
 arch/arm/mach-davinci/board-omapl138-hawk.c | 2 +-
 drivers/usb/host/ohci-da8xx.c               | 8 ++++++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index 18d2b10..8d126e4 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -94,7 +94,7 @@ static struct da8xx_ohci_platform_data da830_evm_usb11_pdata = {
 	.ocic_notify	= da830_evm_usb_ocic_notify,
 
 	/* TPS2065 switch @ 5V */
-	.potpgt		= (3 + 1) / 2,	/* 3 ms max */
+	.potpgt		= 3,	/* 3 ms max */
 };
 
 static irqreturn_t da830_evm_usb_ocic_irq(int irq, void *dev_id)
diff --git a/arch/arm/mach-davinci/board-omapl138-hawk.c b/arch/arm/mach-davinci/board-omapl138-hawk.c
index a2bf3eb..f9cd388 100644
--- a/arch/arm/mach-davinci/board-omapl138-hawk.c
+++ b/arch/arm/mach-davinci/board-omapl138-hawk.c
@@ -232,7 +232,7 @@ static struct da8xx_ohci_platform_data omapl138_hawk_usb11_pdata = {
 	.get_oci        = hawk_usb_get_oci,
 	.ocic_notify    = hawk_usb_ocic_notify,
 	/* TPS2087 switch @ 5V */
-	.potpgt         = (3 + 1) / 2,  /* 3 ms max */
+	.potpgt         = 3  /* 3 ms max */
 };
 
 static irqreturn_t omapl138_hawk_usb_ocic_irq(int irq, void *dev_id)
diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index 8ed9a52..3c85d6c 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -115,8 +115,12 @@ static int ohci_da8xx_init(struct usb_hcd *hcd)
 		rh_a &= ~RH_A_NOCP;
 		rh_a |=  RH_A_OCPM;
 	}
-	rh_a &= ~RH_A_POTPGT;
-	rh_a |= pdata->potpgt << 24;
+
+	if (pdata->potpgt) {
+		rh_a &= ~RH_A_POTPGT;
+		rh_a |= (DIV_ROUND_UP(pdata->potpgt, 2) << 24);
+	}
+
 	ohci_writel(ohci, rh_a, &ohci->regs->roothub.a);
 
 	return result;
-- 
2.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
