From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v2 4/7] mfd: mt6323: some improvements of mt6397-core
Date: Wed,  3 Jul 2019 18:48:19 +0200
Message-ID: <20190703164822.17924-5-frank-w@public-files.de>
References: <20190703164822.17924-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703164822.17924-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, Eddie Huang <eddie.huang@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, Allison Randal <allison@lohutok.net>, "David S . Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Kroah-Hartman <gr>
Cc: Josef Friedl <josef.friedl@speed.at>, Frank Wunderlich <frank-w@public-files.de>
List-Id: devicetree@vger.kernel.org

From: Josef Friedl <josef.friedl@speed.at>

- simplyfications (resource definitions my DEFINE_RES_* macros)
- add mt6323 rtc+pwrc

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
 drivers/mfd/mt6397-core.c | 40 ++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 337bcccdb914..a4abce00f156 100644
=2D-- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014 MediaTek Inc.
+ * Copyright (c) 2014-2018 MediaTek Inc.
  * Author: Flora Fu, MediaTek
  */

 #include <linux/interrupt.h>
+#include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
@@ -15,24 +16,27 @@
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/mfd/mt6323/registers.h>

+#define MT6323_RTC_BASE		0x8000
+#define MT6323_RTC_SIZE		0x40
+
 #define MT6397_RTC_BASE		0xe000
 #define MT6397_RTC_SIZE		0x3e

+#define MT6323_PWRC_BASE	0x8000
+#define MT6323_PWRC_SIZE	0x40
+
 #define MT6323_CID_CODE		0x23
 #define MT6391_CID_CODE		0x91
 #define MT6397_CID_CODE		0x97

+static const struct resource mt6323_rtc_resources[] =3D {
+	DEFINE_RES_MEM(MT6323_RTC_BASE, MT6323_RTC_SIZE),
+	DEFINE_RES_IRQ(MT6323_IRQ_STATUS_RTC),
+};
+
 static const struct resource mt6397_rtc_resources[] =3D {
-	{
-		.start =3D MT6397_RTC_BASE,
-		.end   =3D MT6397_RTC_BASE + MT6397_RTC_SIZE,
-		.flags =3D IORESOURCE_MEM,
-	},
-	{
-		.start =3D MT6397_IRQ_RTC,
-		.end   =3D MT6397_IRQ_RTC,
-		.flags =3D IORESOURCE_IRQ,
-	},
+	DEFINE_RES_MEM(MT6397_RTC_BASE, MT6397_RTC_SIZE),
+	DEFINE_RES_IRQ(MT6397_IRQ_RTC),
 };

 static const struct resource mt6323_keys_resources[] =3D {
@@ -45,8 +49,17 @@ static const struct resource mt6397_keys_resources[] =
=3D {
 	DEFINE_RES_IRQ(MT6397_IRQ_HOMEKEY),
 };

+static const struct resource mt6323_pwrc_resources[] =3D {
+	DEFINE_RES_MEM(MT6323_PWRC_BASE, MT6323_PWRC_SIZE),
+};
+
 static const struct mfd_cell mt6323_devs[] =3D {
 	{
+		.name =3D "mt6323-rtc",
+		.num_resources =3D ARRAY_SIZE(mt6323_rtc_resources),
+		.resources =3D mt6323_rtc_resources,
+		.of_compatible =3D "mediatek,mt6323-rtc",
+	}, {
 		.name =3D "mt6323-regulator",
 		.of_compatible =3D "mediatek,mt6323-regulator"
 	}, {
@@ -57,6 +70,11 @@ static const struct mfd_cell mt6323_devs[] =3D {
 		.num_resources =3D ARRAY_SIZE(mt6323_keys_resources),
 		.resources =3D mt6323_keys_resources,
 		.of_compatible =3D "mediatek,mt6323-keys"
+	}, {
+		.name =3D "mt6323-pwrc",
+		.num_resources =3D ARRAY_SIZE(mt6323_pwrc_resources),
+		.resources =3D mt6323_pwrc_resources,
+		.of_compatible =3D "mediatek,mt6323-pwrc"
 	},
 };

=2D-
2.17.1
