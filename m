From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: imx6qdl: add new pingroup for audmux
Date: Thu, 12 Dec 2013 14:09:32 +0100
Message-ID: <1386853773-1319-4-git-send-email-LW@KARO-electronics.de>
References: <1386853773-1319-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386853773-1319-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This will be used by the TX6 modules from Ka-Ro electronics.

Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-pingrp.h |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-pingrp.h b/arch/arm/boot/dts/imx=
6qdl-pingrp.h
index 4932249..68f18e9 100644
--- a/arch/arm/boot/dts/imx6qdl-pingrp.h
+++ b/arch/arm/boot/dts/imx6qdl-pingrp.h
@@ -32,6 +32,12 @@
 	MX6QDL_PAD_EIM_D25__AUD5_RXC			0x130b0 \
 	MX6QDL_PAD_DISP0_DAT19__AUD5_RXD		0x130b0
=20
+#define MX6QDL_AUDMUX_PINGRP5 \
+	MX6QDL_PAD_KEY_ROW1__AUD5_RXD			0x130b0 \
+	MX6QDL_PAD_KEY_COL0__AUD5_TXC			0x130b0 \
+	MX6QDL_PAD_KEY_ROW0__AUD5_TXD			0x110b0 \
+	MX6QDL_PAD_KEY_COL1__AUD5_TXFS			0x130b0
+
 #define MX6QDL_ECSPI1_PINGRP1 \
 	MX6QDL_PAD_EIM_D17__ECSPI1_MISO			0x100b1 \
 	MX6QDL_PAD_EIM_D18__ECSPI1_MOSI			0x100b1 \
--=20
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
