Return-Path: <SRS0=kqCD=VI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.bugwerft.de ([46.23.86.59]:35052 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbfGKMpQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 11 Jul 2019 08:45:16 -0400
From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 2/2] drivers: hwmon: lm75: add support for PCT2075
Date: Thu, 11 Jul 2019 14:45:04 +0200
Message-Id: <20190711124504.7580-2-daniel@zonque.org>
In-Reply-To: <20190711124504.7580-1-daniel@zonque.org>
References: <20190711124504.7580-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com, Daniel Mack <daniel@zonque.org>
List-ID: <devicetree@vger.kernel.org>

The NXP PCT2075 is largely compatible with other chips already supported
by the LM75 driver. It uses an 11-bit resolution and defaults to 100 ms
sampling period. The datasheet is here:

  https://www.nxp.com/docs/en/data-sheet/PCT2075.pdf

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/hwmon/lm75.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 447af07450f1..a8aba628468e 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -49,6 +49,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	max6626,
 	max31725,
 	mcp980x,
+	pct2075,
 	stds75,
 	stlm75,
 	tcn75,
@@ -353,6 +354,10 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		data->resolution = 9;
 		data->sample_time = MSEC_PER_SEC / 8;
 		break;
+	case pct2075:
+		data->resolution = 11;
+		data->sample_time = MSEC_PER_SEC / 10;
+		break;
 	case mcp980x:
 		data->resolution_limits = 9;
 		/* fall through */
@@ -428,6 +433,7 @@ static const struct i2c_device_id lm75_ids[] = {
 	{ "max31725", max31725, },
 	{ "max31726", max31725, },
 	{ "mcp980x", mcp980x, },
+	{ "pct2075", pct2075, },
 	{ "stds75", stds75, },
 	{ "stlm75", stlm75, },
 	{ "tcn75", tcn75, },
@@ -496,6 +502,10 @@ static const struct of_device_id lm75_of_match[] = {
 		.compatible = "maxim,mcp980x",
 		.data = (void *)mcp980x
 	},
+	{
+		.compatible = "nxp,pct2075",
+		.data = (void *)pct2075
+	},
 	{
 		.compatible = "st,stds75",
 		.data = (void *)stds75
-- 
2.21.0
