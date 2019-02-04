Return-Path: <SRS0=1YNY=QL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr810130.outbound.protection.outlook.com ([40.107.81.130]:8258
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731040AbfBDOSV (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 4 Feb 2019 09:18:21 -0500
From: Ken Sloat <KSloat@aampglobal.com>
Subject: [PATCH v3 1/2] media: atmel-isc: Add support for BT656 with CRC
 decoding
Date: Mon, 4 Feb 2019 14:18:13 +0000
Message-ID: <20190204141756.234563-1-ksloat@aampglobal.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "eugen.hristev@microchip.com" <eugen.hristev@microchip.com>
Cc: Ken Sloat <KSloat@aampglobal.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>, "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Ken Sloat <ksloat@aampglobal.com>

The ISC driver currently supports ITU-R 601 encoding which
utilizes the external hysync and vsync signals. ITU-R 656
format removes the need for these pins by embedding the
sync pulses within the data packet.

To support this feature, enable necessary register bits
when this feature is enabled via device tree.

Signed-off-by: Ken Sloat <ksloat@aampglobal.com>
---
 drivers/media/platform/atmel/atmel-isc-regs.h | 2 ++
 drivers/media/platform/atmel/atmel-isc.c      | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isc-regs.h b/drivers/media/=
platform/atmel/atmel-isc-regs.h
index 2aadc19235ea..d730693f299c 100644
--- a/drivers/media/platform/atmel/atmel-isc-regs.h
+++ b/drivers/media/platform/atmel/atmel-isc-regs.h
@@ -24,6 +24,8 @@
 #define ISC_PFE_CFG0_HPOL_LOW   BIT(0)
 #define ISC_PFE_CFG0_VPOL_LOW   BIT(1)
 #define ISC_PFE_CFG0_PPOL_LOW   BIT(2)
+#define ISC_PFE_CFG0_CCIR656    BIT(9)
+#define ISC_PFE_CFG0_CCIR_CRC   BIT(10)
=20
 #define ISC_PFE_CFG0_MODE_PROGRESSIVE   (0x0 << 4)
 #define ISC_PFE_CFG0_MODE_MASK          GENMASK(6, 4)
diff --git a/drivers/media/platform/atmel/atmel-isc.c b/drivers/media/platf=
orm/atmel/atmel-isc.c
index 50178968b8a6..9a399aa7ca92 100644
--- a/drivers/media/platform/atmel/atmel-isc.c
+++ b/drivers/media/platform/atmel/atmel-isc.c
@@ -1095,7 +1095,8 @@ static int isc_configure(struct isc_device *isc)
 	pfe_cfg0  |=3D subdev->pfe_cfg0 | ISC_PFE_CFG0_MODE_PROGRESSIVE;
 	mask =3D ISC_PFE_CFG0_BPS_MASK | ISC_PFE_CFG0_HPOL_LOW |
 	       ISC_PFE_CFG0_VPOL_LOW | ISC_PFE_CFG0_PPOL_LOW |
-	       ISC_PFE_CFG0_MODE_MASK;
+	       ISC_PFE_CFG0_MODE_MASK | ISC_PFE_CFG0_CCIR_CRC |
+		   ISC_PFE_CFG0_CCIR656;
=20
 	regmap_update_bits(regmap, ISC_PFE_CFG0, mask, pfe_cfg0);
=20
@@ -2084,6 +2085,10 @@ static int isc_parse_dt(struct device *dev, struct i=
sc_device *isc)
 		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
 			subdev_entity->pfe_cfg0 |=3D ISC_PFE_CFG0_PPOL_LOW;
=20
+		if (v4l2_epn.bus_type =3D=3D V4L2_MBUS_BT656)
+			subdev_entity->pfe_cfg0 |=3D ISC_PFE_CFG0_CCIR_CRC |
+					ISC_PFE_CFG0_CCIR656;
+
 		subdev_entity->asd->match_type =3D V4L2_ASYNC_MATCH_FWNODE;
 		subdev_entity->asd->match.fwnode =3D
 			of_fwnode_handle(rem);
--=20
2.17.1
