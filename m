Return-Path: <SRS0=OP5l=QE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr70042.outbound.protection.outlook.com ([40.107.7.42]:36192
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726648AbfA1JGX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 28 Jan 2019 04:06:23 -0500
From: Matthias Fend <Matthias.Fend@wolfvision.net>
Subject: [PATCH 2/2] Input: st1232 - handle common DT bindings
Date: Mon, 28 Jan 2019 09:06:08 +0000
Message-ID: <1548666345-24667-2-git-send-email-matthias.fend@wolfvision.net>
References: <1548666345-24667-1-git-send-email-matthias.fend@wolfvision.net>
 <419160a7-edf5-48cf-85ea-d6d5e9cd6e59.95bf7d06-047e-438c-8c7b-895af195351a.6448af99-cd65-4518-8f79-5ccc17d038ab@emailsignatures365.codetwo.com>
In-Reply-To: <1548666345-24667-1-git-send-email-matthias.fend@wolfvision.net>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
Cc: Matthias Fend <Matthias.Fend@wolfvision.net>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

This is required to specify generic touchscreen properties via DT.

Signed-off-by: Matthias Fend <matthias.fend@wolfvision.net>
---
 drivers/input/touchscreen/st1232.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen=
/st1232.c
index 11ff32c..ad617ac 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -21,6 +21,7 @@
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/input/touchscreen.h>
=20
 #define ST1232_TS_NAME	"st1232-ts"
=20
@@ -195,6 +196,7 @@ static int st1232_ts_probe(struct i2c_client *client,
 	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, MAX_AREA, 0, 0);
 	input_set_abs_params(input_dev, ABS_MT_POSITION_X, MIN_X, MAX_X, 0, 0);
 	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, MIN_Y, MAX_Y, 0, 0);
+	touchscreen_parse_properties(input_dev, true, NULL);
=20
 	error =3D devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, st1232_ts_irq_handler,
--=20
2.7.4


Matthias Fend=0A=
R&D Electronics =0A=
=0A=
Wolfvision GmbH=0A=
Oberes Ried 14 | 6833 Klaus | Austria =0A=
Tel: +43 5523 52250 | Mail: Matthias.Fend@wolfvision.net =0A=
=0A=
Webpage: www.wolfvision.com | www.wolfvision.com/green=0A=
Firmenbuch / Commercial Register: FN283521v Feldkirch/Austria=0A=
=0A=
