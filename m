Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5B0C43141
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 14:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72AC72230E
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 14:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bbGGdIG8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730882AbfKTOVU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 09:21:20 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35521 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730960AbfKTOVU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 09:21:20 -0500
Received: by mail-wm1-f65.google.com with SMTP id 8so8044009wmo.0
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 06:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Hc8hYB3tbZIod+IQ6MbwVcYHzkJ7GhB4LPUoKfpHBhg=;
        b=bbGGdIG8CJ1VEwyvm3y8H9OEzouxX5YUlVCLvoh6v+C2mp5+I3HC5s5lrDBbxANKk1
         cW3mLQhthQBpB6dK1G8UH5qpHOayPMkgVbLUim7e2ePY/pq0TNd5Add/viZsjSZQl+si
         //3W73zDWghkbFXIWkkWUPHTfv4GUJFnmTEdzN9U/9pWsk+dVTAfD0F6wnhVRf36ISDi
         CZTcdbRZPmQ1EfsMkC1gq3kwLiieQA48/nSscfZhpIgL5hO5bxJKF9O2KIHQRMCfCto4
         1uRDYDVbbUUvqxjiUkoHfHQe6cKiJGK/6NlZdiR4Q5tdmuFEBN7pqTQp6iC0fEqVH2AW
         jGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Hc8hYB3tbZIod+IQ6MbwVcYHzkJ7GhB4LPUoKfpHBhg=;
        b=o1mywVtryRvbUmXExorL+NyEiTvbV0a5PAzVOmbFTIfBvN8jdF7+qIt+gt482yFWY6
         lv0YsRjx9to5zgHNPvEvuDPQdDRGXKI/gQ1bqMI5Ywp4eBYg0JC9HNreXeNihcnhU7Cg
         D4r+AQbD7rQzn+jvM2SGT+hDzIHNZyq3VMqnxRpt1iaa9H25xzjZep/szeYLDOXmGHSB
         c+JWvy9P303EPX94urpDw553Wxak6BZP7eFSEkYung1Xb+BykPlWfD1tNSnG0dM6bhgX
         7uOj4p1w3Ngm3ScJN/sgm58tASWSFzw1X7UgqZqXeZ8Qi57jdq1+7zdn0h+bZPP1l9p2
         JVww==
X-Gm-Message-State: APjAAAXGOGvZ+Kn2kkWkTxWdOTdc2TC3BuLoAg7k1FpHEpSd+5ULWJbz
        majryvLvYflRqh+JbKI4bICpXg==
X-Google-Smtp-Source: APXvYqxwZ6NxHy5lxmuWtOfJ8fr/iWLuyRSEw7VcXF5Wp1+axm988/wxsbwGi9rjW87fA0wtR/au+w==
X-Received: by 2002:a1c:7d16:: with SMTP id y22mr3453604wmc.106.1574259678325;
        Wed, 20 Nov 2019 06:21:18 -0800 (PST)
Received: from khouloud-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a6sm34544352wrh.69.2019.11.20.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 06:21:17 -0800 (PST)
From:   Khouloud Touil <ktouil@baylibre.com>
To:     bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, srinivas.kandagatla@linaro.org,
        baylibre-upstreaming@groups.io
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        Khouloud Touil <ktouil@baylibre.com>
Subject: [PATCH 4/4] eeprom: at24: remove the write-protect pin support
Date:   Wed, 20 Nov 2019 15:20:38 +0100
Message-Id: <20191120142038.30746-5-ktouil@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120142038.30746-1-ktouil@baylibre.com>
References: <20191120142038.30746-1-ktouil@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

NVMEM framework is an interface for the at24 EEPROMs as well as for
other drivers, instead of passing the wp-gpios over the different
drivers each time, it would be better to pass it over the NVMEM
subsystem once and for all.

Removing the support for the write-protect pin after adding it to the
NVMEM subsystem.

Signed-off-by: Khouloud Touil <ktouil@baylibre.com>
---
 drivers/misc/eeprom/at24.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 2cccd82a3106..eec2a34b7051 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -22,7 +22,6 @@
 #include <linux/nvmem-provider.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
-#include <linux/gpio/consumer.h>
 
 /* Address pointer is 16 bit. */
 #define AT24_FLAG_ADDR16	BIT(7)
@@ -89,8 +88,6 @@ struct at24_data {
 
 	struct nvmem_device *nvmem;
 
-	struct gpio_desc *wp_gpio;
-
 	/*
 	 * Some chips tie up multiple I2C addresses; dummy devices reserve
 	 * them for us, and we'll use them with SMBus calls.
@@ -457,12 +454,10 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 	 * from this host, but not from other I2C masters.
 	 */
 	mutex_lock(&at24->lock);
-	gpiod_set_value_cansleep(at24->wp_gpio, 0);
 
 	while (count) {
 		ret = at24_regmap_write(at24, buf, off, count);
 		if (ret < 0) {
-			gpiod_set_value_cansleep(at24->wp_gpio, 1);
 			mutex_unlock(&at24->lock);
 			pm_runtime_put(dev);
 			return ret;
@@ -472,7 +467,6 @@ static int at24_write(void *priv, unsigned int off, void *val, size_t count)
 		count -= ret;
 	}
 
-	gpiod_set_value_cansleep(at24->wp_gpio, 1);
 	mutex_unlock(&at24->lock);
 
 	pm_runtime_put(dev);
@@ -662,9 +656,6 @@ static int at24_probe(struct i2c_client *client)
 	at24->client[0].client = client;
 	at24->client[0].regmap = regmap;
 
-	at24->wp_gpio = devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_HIGH);
-	if (IS_ERR(at24->wp_gpio))
-		return PTR_ERR(at24->wp_gpio);
 
 	writable = !(flags & AT24_FLAG_READONLY);
 	if (writable) {
-- 
2.17.1

