From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 6/7] usb: chipidea: udc: add force-full-speed option
Date: Fri, 31 May 2013 20:38:48 +0200
Message-ID: <1370025529-7414-7-git-send-email-mgr@pengutronix.de>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370025529-7414-1-git-send-email-mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

This patch makes it possible to set the chipidea udc
into full-speed only mode. It can be set by the oftree
property "force-full-speed".

Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/usb/chipidea/bits.h |  2 ++
 drivers/usb/chipidea/core.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits.h
index 93efe4e..4c14ab7 100644
--- a/drivers/usb/chipidea/bits.h
+++ b/drivers/usb/chipidea/bits.h
@@ -49,11 +49,13 @@
 #define PORTSC_HSP            BIT(9)
 #define PORTSC_PTC            (0x0FUL << 16)
 /* PTS and PTW for non lpm version only */
+#define PORTSC_PFSC           BIT(24)
 #define PORTSC_PTS(d)         ((((d) & 0x3) << 30) | (((d) & 0x4) ? BIT(25) : 0))
 #define PORTSC_PTW            BIT(28)
 #define PORTSC_STS            BIT(29)
 
 /* DEVLC */
+#define DEVLC_PFSC            BIT(23)
 #define DEVLC_PSPD            (0x03UL << 25)
 #define DEVLC_PSPD_HS         (0x02UL << 25)
 #define DEVLC_PTW             BIT(27)
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index dcf2a0b..4b8b3e7 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -73,6 +73,11 @@
 #include "host.h"
 #include "debug.h"
 
+/* force full-speed operation */
+static bool full_speed;
+module_param(full_speed, bool, 0444);
+MODULE_PARM_DESC(full_speed, "force full-speed mode");
+
 /* Controller register map */
 static uintptr_t ci_regs_nolpm[] = {
 	[CAP_CAPLENGTH]		= 0x000UL,
@@ -265,6 +270,12 @@ int hw_device_reset(struct ci13xxx *ci, u32 mode)
 	while (hw_read(ci, OP_USBCMD, USBCMD_RST))
 		udelay(10);		/* not RTOS friendly */
 
+	if (full_speed) {
+		if (ci->hw_bank.lpm)
+			hw_write(ci, OP_PORTSC, DEVLC_PFSC, DEVLC_PFSC);
+		else
+			hw_write(ci, OP_PORTSC, PORTSC_PFSC, PORTSC_PFSC);
+	}
 
 	if (ci->platdata->notify_event)
 		ci->platdata->notify_event(ci,
-- 
1.8.2.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
