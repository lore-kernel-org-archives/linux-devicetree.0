From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: imx53: add another pingroup for NAND pads
Date: Mon, 13 Jan 2014 11:32:37 +0100
Message-ID: <1389609158-11179-2-git-send-email-LW@KARO-electronics.de>
References: <1389609158-11179-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389609158-11179-1-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Signed-off-by: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
---
 arch/arm/boot/dts/imx53-pingrp.h |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx53-pingrp.h b/arch/arm/boot/dts/imx53=
-pingrp.h
index ac8e73d..f8d7d9c 100644
--- a/arch/arm/boot/dts/imx53-pingrp.h
+++ b/arch/arm/boot/dts/imx53-pingrp.h
@@ -300,6 +300,23 @@
 	MX53_PAD_PATA_DATA6__EMI_NANDF_D_6		0xa4 \
 	MX53_PAD_PATA_DATA7__EMI_NANDF_D_7		0xa4
=20
+#define MX53_NAND_PINGRP2 \
+	MX53_PAD_NANDF_WE_B__EMI_NANDF_WE_B		0x4 \
+	MX53_PAD_NANDF_RE_B__EMI_NANDF_RE_B		0x4 \
+	MX53_PAD_NANDF_CLE__EMI_NANDF_CLE		0x4 \
+	MX53_PAD_NANDF_ALE__EMI_NANDF_ALE		0x4 \
+	MX53_PAD_NANDF_WP_B__EMI_NANDF_WP_B		0xe0 \
+	MX53_PAD_NANDF_RB0__EMI_NANDF_RB_0		0xe0 \
+	MX53_PAD_NANDF_CS0__EMI_NANDF_CS_0		0x4 \
+	MX53_PAD_EIM_DA0__EMI_NAND_WEIM_DA_0		0xa4 \
+	MX53_PAD_EIM_DA1__EMI_NAND_WEIM_DA_1		0xa4 \
+	MX53_PAD_EIM_DA2__EMI_NAND_WEIM_DA_2		0xa4 \
+	MX53_PAD_EIM_DA3__EMI_NAND_WEIM_DA_3		0xa4 \
+	MX53_PAD_EIM_DA4__EMI_NAND_WEIM_DA_4		0xa4 \
+	MX53_PAD_EIM_DA5__EMI_NAND_WEIM_DA_5		0xa4 \
+	MX53_PAD_EIM_DA6__EMI_NAND_WEIM_DA_6		0xa4 \
+	MX53_PAD_EIM_DA7__EMI_NAND_WEIM_DA_7		0xa4
+
 #define MX53_OWIRE_PINGRP1 \
 	MX53_PAD_GPIO_18__OWIRE_LINE			0x80000000
=20
--=20
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
