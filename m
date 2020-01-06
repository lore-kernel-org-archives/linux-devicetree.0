Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6B4C32771
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 09:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D951820848
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 09:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="d4d8wkF7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgAFJE5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 04:04:57 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40753 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgAFJE5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 04:04:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id u1so50157145ljk.7
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 01:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dv4kZaHmP0u2M0IyOXWbpByeugvSXZTxxTdznseH8Ow=;
        b=d4d8wkF7IDb+D+flhwvrhaF990T0WsWJe4M7mt2SMJrIj6HUuHYs4X75LKEr2z7I37
         Y+CDaSom5N9e2LtQwbqXYfuKf7NvmvwGwsZJVcaNxkYNaeO/R7r1//BQ+yO3/cyuc8bV
         6cZj8sdxypfKO42bnRkXmNoeCUPWf37RjesN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dv4kZaHmP0u2M0IyOXWbpByeugvSXZTxxTdznseH8Ow=;
        b=feoycAA+st/G9n95/HP8zRdmw559CGCkaMuRo+PGRh8Q1zFNMZN5ec/EJjNXfrqX8P
         5HqUI+3Xi2T7oLOuuiY02jrr2D8eOkEcs93DuK55hSIVzvh7lhHLzlahXrEtnMQFilNz
         AOqz7HvVWWd/hXCfgUKTTvMWzl28VZ2YJBYeZWX750LgzY56GUve5Nk4ZtkqggWMU3nL
         K4F5jA4Aqkq0TNh6MMz/EElwsjdla5u89y7+LgnM5ITRZNW1M3ajge8D9sv7G85bX/qc
         /UxLx7hFq+ObvLBf5U8W8Uqybgc6D4kvVVc/VOawhU9DgYh8nJ9r1WeJ+gDc5Mw+z/sV
         E38w==
X-Gm-Message-State: APjAAAXziLMrHqw2IL/yTbJA/bX4Ru3PBcS25Gy8bRQ8wwbWA6/9ez2y
        6dgiSetEA1pzpzsWio3FbkyGvA==
X-Google-Smtp-Source: APXvYqwokHNVbB7L/c4O2qXGQhEJ/GQSE/8g8NHCte9cSr/nfW6YNK7BVLaP9mpkcRNMnt0jrkzxCA==
X-Received: by 2002:a2e:8eda:: with SMTP id e26mr57761749ljl.65.1578301494885;
        Mon, 06 Jan 2020 01:04:54 -0800 (PST)
Received: from virtualbox.ipredator.se (anon-49-200.vpn.ipredator.se. [46.246.49.200])
        by smtp.gmail.com with ESMTPSA id k12sm28675500lfc.33.2020.01.06.01.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 01:04:54 -0800 (PST)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     linux-iio@vger.kernel.org
Cc:     jic23@kernel.org, Matt Ranostay <matt.ranostay@konsulko.com>,
        devicetree@vger.kernel.org
Subject: [PATCH] iio: chemical: atlas-sensor: add DO-SM module support
Date:   Mon,  6 Jan 2020 01:03:35 -0800
Message-Id: <20200106090335.21717-1-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Atlas Scientific DO-SM OEM sensor reads disolved oxygen in
a solution. This is reported back as mg/L which maps directly
to ppm and so the IIO_CONCENTRATION channel type can be used.

Cc: devicetree@vger.kernel.org
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 .../bindings/iio/chemical/atlas,do-sm.txt     | 21 ++++++
 drivers/iio/chemical/atlas-sensor.c           | 64 +++++++++++++++++--
 2 files changed, 81 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/atlas,do-sm.txt

diff --git a/Documentation/devicetree/bindings/iio/chemical/atlas,do-sm.txt b/Documentation/devicetree/bindings/iio/chemical/atlas,do-sm.txt
new file mode 100644
index 000000000000..fc741ea794c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/chemical/atlas,do-sm.txt
@@ -0,0 +1,21 @@
+* Atlas Scientific DO-SM OEM sensor
+
+http://www.atlas-scientific.com/_files/_datasheets/_oem/DO_oem_datasheet.pdf
+
+Required properties:
+
+  - compatible: must be "atlas,do-sm"
+  - reg: the I2C address of the sensor
+  - interrupts: the sole interrupt generated by the device
+
+  Refer to interrupt-controller/interrupts.txt for generic interrupt client
+  node bindings.
+
+Example:
+
+atlas@64 {
+	compatible = "atlas,do-sm";
+	reg = <0x67>;
+	interrupt-parent = <&gpio1>;
+	interrupts = <16 2>;
+};
diff --git a/drivers/iio/chemical/atlas-sensor.c b/drivers/iio/chemical/atlas-sensor.c
index 2f0a6fed2589..42ad1ed76144 100644
--- a/drivers/iio/chemical/atlas-sensor.c
+++ b/drivers/iio/chemical/atlas-sensor.c
@@ -48,6 +48,11 @@
 #define ATLAS_REG_EC_CALIB_STATUS_LOW		BIT(2)
 #define ATLAS_REG_EC_CALIB_STATUS_HIGH		BIT(3)
 
+#define ATLAS_REG_DO_CALIB_STATUS		0x09
+#define ATLAS_REG_DO_CALIB_STATUS_MASK		0x03
+#define ATLAS_REG_DO_CALIB_STATUS_PRESSURE	BIT(0)
+#define ATLAS_REG_DO_CALIB_STATUS_DO		BIT(1)
+
 #define ATLAS_REG_PH_TEMP_DATA		0x0e
 #define ATLAS_REG_PH_DATA		0x16
 
@@ -60,14 +65,19 @@
 #define ATLAS_REG_ORP_CALIB_STATUS	0x0d
 #define ATLAS_REG_ORP_DATA		0x0e
 
+#define ATLAS_REG_DO_TEMP_DATA		0x12
+#define ATLAS_REG_DO_DATA		0x22
+
 #define ATLAS_PH_INT_TIME_IN_MS		450
 #define ATLAS_EC_INT_TIME_IN_MS		650
 #define ATLAS_ORP_INT_TIME_IN_MS	450
+#define ATLAS_DO_INT_TIME_IN_MS		450
 
 enum {
 	ATLAS_PH_SM,
 	ATLAS_EC_SM,
 	ATLAS_ORP_SM,
+	ATLAS_DO_SM,
 };
 
 struct atlas_data {
@@ -121,7 +131,7 @@ static const struct iio_chan_spec atlas_ph_channels[] = {
 	},
 };
 
-#define ATLAS_EC_CHANNEL(_idx, _addr) \
+#define ATLAS_CONCENTRATION_CHANNEL(_idx, _addr) \
 	{\
 		.type = IIO_CONCENTRATION, \
 		.indexed = 1, \
@@ -152,8 +162,8 @@ static const struct iio_chan_spec atlas_ec_channels[] = {
 			.endianness = IIO_BE,
 		},
 	},
-	ATLAS_EC_CHANNEL(0, ATLAS_REG_TDS_DATA),
-	ATLAS_EC_CHANNEL(1, ATLAS_REG_PSS_DATA),
+	ATLAS_CONCENTRATION_CHANNEL(0, ATLAS_REG_TDS_DATA),
+	ATLAS_CONCENTRATION_CHANNEL(1, ATLAS_REG_PSS_DATA),
 	IIO_CHAN_SOFT_TIMESTAMP(3),
 	{
 		.type = IIO_TEMP,
@@ -182,6 +192,19 @@ static const struct iio_chan_spec atlas_orp_channels[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(1),
 };
 
+static const struct iio_chan_spec atlas_do_channels[] = {
+	ATLAS_CONCENTRATION_CHANNEL(0, ATLAS_REG_DO_DATA),
+	IIO_CHAN_SOFT_TIMESTAMP(1),
+	{
+		.type = IIO_TEMP,
+		.address = ATLAS_REG_DO_TEMP_DATA,
+		.info_mask_separate =
+			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
+		.output = 1,
+		.scan_index = -1
+	},
+};
+
 static int atlas_check_ph_calibration(struct atlas_data *data)
 {
 	struct device *dev = &data->client->dev;
@@ -262,7 +285,31 @@ static int atlas_check_orp_calibration(struct atlas_data *data)
 		dev_warn(dev, "device has not been calibrated\n");
 
 	return 0;
-};
+}
+
+static int atlas_check_do_calibration(struct atlas_data *data)
+{
+	struct device *dev = &data->client->dev;
+	int ret;
+	unsigned int val;
+
+	ret = regmap_read(data->regmap, ATLAS_REG_DO_CALIB_STATUS, &val);
+	if (ret)
+		return ret;
+
+	if (!(val & ATLAS_REG_DO_CALIB_STATUS_MASK)) {
+		dev_warn(dev, "device has not been calibrated\n");
+		return 0;
+	}
+
+	if (!(val & ATLAS_REG_DO_CALIB_STATUS_PRESSURE))
+		dev_warn(dev, "device missing atmospheric pressure calibration\n");
+
+	if (!(val & ATLAS_REG_DO_CALIB_STATUS_DO))
+		dev_warn(dev, "device missing dissolved oxygen calibration\n");
+
+	return 0;
+}
 
 struct atlas_device {
 	const struct iio_chan_spec *channels;
@@ -295,6 +342,13 @@ static struct atlas_device atlas_devices[] = {
 				.calibration = &atlas_check_orp_calibration,
 				.delay = ATLAS_ORP_INT_TIME_IN_MS,
 	},
+	[ATLAS_DO_SM] = {
+				.channels = atlas_do_channels,
+				.num_channels = 3,
+				.data_reg = ATLAS_REG_DO_DATA,
+				.calibration = &atlas_check_do_calibration,
+				.delay = ATLAS_DO_INT_TIME_IN_MS,
+	},
 };
 
 static int atlas_set_powermode(struct atlas_data *data, int on)
@@ -507,6 +561,7 @@ static const struct i2c_device_id atlas_id[] = {
 	{ "atlas-ph-sm", ATLAS_PH_SM},
 	{ "atlas-ec-sm", ATLAS_EC_SM},
 	{ "atlas-orp-sm", ATLAS_ORP_SM},
+	{ "atlas-do-sm", ATLAS_DO_SM},
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, atlas_id);
@@ -515,6 +570,7 @@ static const struct of_device_id atlas_dt_ids[] = {
 	{ .compatible = "atlas,ph-sm", .data = (void *)ATLAS_PH_SM, },
 	{ .compatible = "atlas,ec-sm", .data = (void *)ATLAS_EC_SM, },
 	{ .compatible = "atlas,orp-sm", .data = (void *)ATLAS_ORP_SM, },
+	{ .compatible = "atlas,do-sm", .data = (void *)ATLAS_DO_SM, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, atlas_dt_ids);
-- 
2.20.1

