Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DC5C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:56:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00E67206A4
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 13:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fftOCneX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgFLN4j (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 09:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLNyb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 09:54:31 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299FAC08C5C8
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:54:25 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s1so11189428ljo.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 06:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/H496xjB4IoQDnldRUbAyOpNgcDxVGf3TevH7sGSKHU=;
        b=fftOCneXKWTkNFqnZ6vGP1HVU13C17BsBFNoDXh5Ok1/67dFsKQ3z5di7POtXubw1X
         qlbOVqUZCcLe7150o8uALCOI+GHdIdDkph46GH8a6gGmUsBFfNQRc0EA/IrxrtY+Ards
         P3Zx6N/lWGwn5NZ7yZnj8ZnvK1e1cdM821f+nofLbzK43YYcCrdkWW4DHFfmbnPJgx6R
         E04UlhA46fqziCP/tPjlKNpD5MopSfB6RNaJyTd+8pzGI86sJ1ghxwWr/31VVdRSgUxc
         3xS2MZ3HvtM9IqRMTnhhzhDwl6HHff+R5DI9ocwxKMJg8zVZVRQhXjQTSvTFzTuVgRW+
         veEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/H496xjB4IoQDnldRUbAyOpNgcDxVGf3TevH7sGSKHU=;
        b=ZtBR4e3OHXAhCiZ2KSK7Jcpuxt8JWq/SKyksLlS5k8FPUFN3MJdxU2UYa+Oaaro+Ct
         2yKkoGZUZoj18rq1z60/TwHmRxkeQM5QRvYR8cVcLhBytOAiHFxrAwbIc8iFtHqKM4v5
         tc4Ptx1pv52VOKLT/HDCNSs/+b3EG0tAlZp2BVAi4SpuP4BJ+rcp2s4ES9e0VWPzuawD
         pGoVnPv0V/WQNRJp3TaloqxhTPoVZfDX5V5FFo8AEGN978de3WCjcYk3u5gdI3u/FMoL
         pK8yIlsRitqHIyY9JYktXljhmFoszlWLdEnk951Q3IIjlHSUsenJAqivqxh8Po++UIxu
         eF3Q==
X-Gm-Message-State: AOAM530gSSp/Td87R2hBtfrtfrhq1ULnVGmnTVc+Omp9uI1Ix2UzwFP9
        APIYDciBjHkHG4eENLglE0aCbw==
X-Google-Smtp-Source: ABdhPJwlb3/wxuty/SZIBTpkct0LjnKA/4EXzC4V4+HBA4UnXLSXwnV+whcUVTZ+zjjx2+jBHZo2LQ==
X-Received: by 2002:a2e:3003:: with SMTP id w3mr6744730ljw.11.1591970063574;
        Fri, 12 Jun 2020 06:54:23 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id a1sm2414415lfi.36.2020.06.12.06.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 06:54:22 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v5 03/10] media: i2c: imx290: fix reset GPIO pin handling
Date:   Fri, 12 Jun 2020 16:53:48 +0300
Message-Id: <20200612135355.30286-4-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200612135355.30286-1-andrey.konovalov@linaro.org>
References: <20200612135355.30286-1-andrey.konovalov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

According to https://www.kernel.org/doc/Documentation/gpio/consumer.txt,

- all of the gpiod_set_value_xxx() functions operate with the *logical*
value. So in imx290_power_on() the reset signal should be cleared
(de-asserted) with gpiod_set_value_cansleep(imx290->rst_gpio, 0), and in
imx290_power_off() the value of 1 must be used to apply/assert the reset
to the sensor. In the device tree the reset pin is described as
GPIO_ACTIVE_LOW, and gpiod_set_value_xxx() functions take this into
account,

- when devm_gpiod_get_optional() is called with GPIOD_ASIS, the GPIO is
not initialized, and the direction must be set later; using a GPIO
without setting its direction first is illegal and will result in undefined
behavior. Fix this by using GPIOD_OUT_HIGH instead of GPIOD_ASIS (this
asserts the reset signal to the sensor initially).

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/media/i2c/imx290.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index d0322f9a8856..7b1de1f0c8b7 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -628,7 +628,7 @@ static int imx290_power_on(struct device *dev)
 	}
 
 	usleep_range(1, 2);
-	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
+	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
 	usleep_range(30000, 31000);
 
 	return 0;
@@ -641,7 +641,7 @@ static int imx290_power_off(struct device *dev)
 	struct imx290 *imx290 = to_imx290(sd);
 
 	clk_disable_unprepare(imx290->xclk);
-	gpiod_set_value_cansleep(imx290->rst_gpio, 0);
+	gpiod_set_value_cansleep(imx290->rst_gpio, 1);
 	regulator_bulk_disable(IMX290_NUM_SUPPLIES, imx290->supplies);
 
 	return 0;
@@ -757,7 +757,8 @@ static int imx290_probe(struct i2c_client *client)
 		goto free_err;
 	}
 
-	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
+	imx290->rst_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_HIGH);
 	if (IS_ERR(imx290->rst_gpio)) {
 		dev_err(dev, "Cannot get reset gpio\n");
 		ret = PTR_ERR(imx290->rst_gpio);
-- 
2.17.1

