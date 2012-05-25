From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v3 09/12] ARM: imx6q: disable usb charger detector
Date: Fri, 25 May 2012 10:24:22 +0800
Message-ID: <1337912665-16615-10-git-send-email-richard.zhao@freescale.com>
References: <1337912665-16615-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337912665-16615-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

The external charger detector needs to be disabled,
or the signal at DP will be poor

Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/mach-imx/mach-imx6q.c |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6q.c
index 577cf19..c4f9b82 100644
--- a/arch/arm/mach-imx/mach-imx6q.c
+++ b/arch/arm/mach-imx/mach-imx6q.c
@@ -25,6 +25,7 @@
 #include <linux/pinctrl/machine.h>
 #include <linux/phy.h>
 #include <linux/micrel_phy.h>
+#include <linux/mfd/anatop.h>
 #include <asm/smp_twd.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/hardware/gic.h>
@@ -141,9 +142,32 @@ static void __init imx6q_config_on_boot(void)
 	of_node_put(np);
 }
 
+static void __init imx6q_usb_init(void)
+{
+#define HW_ANADIG_USB1_CHRG_DETECT		0x000001b0
+#define HW_ANADIG_USB2_CHRG_DETECT		0x00000210
+
+#define BM_ANADIG_USB_CHRG_DETECT_EN_B		0x00100000
+#define BM_ANADIG_USB_CHRG_DETECT_CHK_CHRG_B	0x00080000
+
+	/*
+	 * The external charger detector needs to be disabled,
+	 * or the signal at DP will be poor
+	 */
+	anatop_write_reg(NULL, HW_ANADIG_USB1_CHRG_DETECT,
+			BM_ANADIG_USB_CHRG_DETECT_EN_B
+			| BM_ANADIG_USB_CHRG_DETECT_CHK_CHRG_B,
+			~0);
+	anatop_write_reg(NULL, HW_ANADIG_USB2_CHRG_DETECT,
+			BM_ANADIG_USB_CHRG_DETECT_EN_B |
+			BM_ANADIG_USB_CHRG_DETECT_CHK_CHRG_B,
+			~0);
+}
+
 static void __init imx6q_post_populate(void)
 {
 	imx6q_config_on_boot();
+	imx6q_usb_init();
 }
 
 static void __init imx6q_init_machine(void)
-- 
1.7.5.4


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
