From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v8 02/14] usb: chipidea: drop useless arch-check
Date: Fri, 29 Jun 2012 17:48:50 +0800
Message-ID: <1340963342-28735-3-git-send-email-richard.zhao@freescale.com>
References: <1340963342-28735-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340963342-28735-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

msm glue layer compiles on all arches just
fine. Let's drop the unnecessary ARCH check
so we have easier compile tests.

Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Acked-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
---
 drivers/usb/chipidea/Makefile |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makefile
index cc34937..b69900a 100644
--- a/drivers/usb/chipidea/Makefile
+++ b/drivers/usb/chipidea/Makefile
@@ -5,10 +5,12 @@ ci_hdrc-$(CONFIG_USB_CHIPIDEA_UDC)	+= udc.o
 ci_hdrc-$(CONFIG_USB_CHIPIDEA_HOST)	+= host.o
 ci_hdrc-$(CONFIG_USB_CHIPIDEA_DEBUG)	+= debug.o
 
+# Glue/Bridge layers go here
+
+obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_msm.o
+
+# PCI doesn't provide stubs, need to check
 ifneq ($(CONFIG_PCI),)
 	obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_pci.o
 endif
 
-ifneq ($(CONFIG_ARCH_MSM),)
-	obj-$(CONFIG_USB_CHIPIDEA)	+= ci13xxx_msm.o
-endif
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
