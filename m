From: Arnaud Ebalard <arno@natisbad.org>
Subject: [PATCHv1 3/6] rtc: rtc-isl12057: add proper handling of oscillator
 failure bit
Date: Sat, 15 Nov 2014 00:06:53 +0100
Message-ID: <2bf30d76514c212644453be840ee2379c0f97ea8.1416006090.git.arno@natisbad.org>
References: <cover.1416006090.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cover.1416006090.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
List-Id: devicetree@vger.kernel.org


As suggested by Uwe, instead of clearing oscillator failure bit
unconditionally at driver load, this patch adds proper handling
of the flag. The driver now returns -ENODATA when reading time
from the device and oscillator failure bit is set. The flag
is now cleared only when the a new time value is pushed to the
device.

Reported-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
 drivers/rtc/rtc-isl12057.c | 47 ++++++++++++++++++++++++++++++++------=
--------
 1 file changed, 33 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
index b538fabfcfd3..fe562820a54a 100644
--- a/drivers/rtc/rtc-isl12057.c
+++ b/drivers/rtc/rtc-isl12057.c
@@ -164,17 +164,32 @@ static int isl12057_rtc_read_time(struct device *=
dev, struct rtc_time *tm)
 {
 	struct isl12057_rtc_data *data =3D dev_get_drvdata(dev);
 	u8 regs[ISL12057_RTC_SEC_LEN];
+	unsigned int sr;
 	int ret;
=20
 	mutex_lock(&data->lock);
+	ret =3D regmap_read(data->regmap, ISL12057_REG_SR, &sr);
+	if (ret) {
+		dev_err(dev, "%s: unable to read oscillator status flag\n",
+			__func__);
+		goto out;
+	} else {
+		if (sr & ISL12057_REG_SR_OSF) {
+			ret =3D -ENODATA;
+			goto out;
+		}
+	}
+
 	ret =3D regmap_bulk_read(data->regmap, ISL12057_REG_RTC_SC, regs,
 			       ISL12057_RTC_SEC_LEN);
+	if (ret)
+		dev_err(dev, "%s: unable to read RTC time\n", __func__);
+
+out:
 	mutex_unlock(&data->lock);
=20
-	if (ret) {
-		dev_err(dev, "%s: RTC read failed\n", __func__);
+	if (ret)
 		return ret;
-	}
=20
 	isl12057_rtc_regs_to_tm(tm, regs);
=20
@@ -194,10 +209,22 @@ static int isl12057_rtc_set_time(struct device *d=
ev, struct rtc_time *tm)
 	mutex_lock(&data->lock);
 	ret =3D regmap_bulk_write(data->regmap, ISL12057_REG_RTC_SC, regs,
 				ISL12057_RTC_SEC_LEN);
-	mutex_unlock(&data->lock);
+	if (ret) {
+		dev_err(dev, "%s: writing RTC time failed\n", __func__);
+		goto out;
+	}
=20
-	if (ret)
-		dev_err(dev, "%s: RTC write failed\n", __func__);
+	/*
+	 * Now that RTC time has been updated, let's clear oscillator
+	 * failure flag, if needed.
+	 */
+	ret =3D regmap_update_bits(data->regmap, ISL12057_REG_SR,
+				 ISL12057_REG_SR_OSF, 0);
+	if (ret < 0)
+		dev_err(dev, "Unable to clear oscillator failure bit\n");
+
+out:
+	mutex_unlock(&data->lock);
=20
 	return ret;
 }
@@ -219,14 +246,6 @@ static int isl12057_check_rtc_status(struct device=
 *dev, struct regmap *regmap)
 		return ret;
 	}
=20
-	/* Clear oscillator failure bit if needed */
-	ret =3D regmap_update_bits(regmap, ISL12057_REG_SR,
-				 ISL12057_REG_SR_OSF, 0);
-	if (ret < 0) {
-		dev_err(dev, "Unable to clear oscillator failure bit\n");
-		return ret;
-	}
-
 	/* Clear alarm bit if needed */
 	ret =3D regmap_update_bits(regmap, ISL12057_REG_SR,
 				 ISL12057_REG_SR_A1F, 0);
--=20
2.1.1


