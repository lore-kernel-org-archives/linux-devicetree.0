From: Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Subject: [PATCHv2 1/3] ARM: imx27: add pwm pingrp
Date: Tue,  3 Dec 2013 08:50:50 +0100
Message-ID: <1386057052-9978-1-git-send-email-gwenhael.goavec-merou@armadeus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
---
Changelog:
v2:
 * rename mail subject : pwm0 -> pwm

 arch/arm/boot/dts/imx27-pingrp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/imx27-pingrp.h b/arch/arm/boot/dts/imx27-pingrp.h
index f3fbf5a..24df7dd7 100644
--- a/arch/arm/boot/dts/imx27-pingrp.h
+++ b/arch/arm/boot/dts/imx27-pingrp.h
@@ -88,6 +88,9 @@
 #define MX27_OWIRE1_PINGRP1 \
 	MX27_PAD_RTCK__OWIRE 0x0
 
+#define MX27_PWM_PINGRP1 \
+	MX27_PAD_PWMO__PWMO 0x0
+
 #define MX27_SDHC1_PINGRP1 \
 	MX27_PAD_SD1_CLK__SD1_CLK \
 	MX27_PAD_SD1_CMD__SD1_CMD \
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
