Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1944C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 16:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABB5F21744
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 16:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UttcU3N3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733180AbgGaQtl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 12:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733174AbgGaQtH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 12:49:07 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60746C06138F
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 09:49:06 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id l17so32282046iok.7
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XHCUU2RRnfaW/xOy0tUCXIP889dh0URjbsp/iA2xySI=;
        b=UttcU3N3nttvXlJ8qC5xBWXsvsAh+sqFPzkIM8khtexWu++q35V94rnwGyOB6FqUHG
         j9Lf5QLydvMp2UmbUpFunMQKamV/WyYDR/Jz1b8x++OcDmZf6VwOUbwJa/FyYFaUNq3B
         VeEKOEjEzFrX7+XJJJsqxSonhDjt08GNWPIIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XHCUU2RRnfaW/xOy0tUCXIP889dh0URjbsp/iA2xySI=;
        b=RPrB1L4VXE4Ea38qFlZu86mfiBPPNkbmyTi9oF8ILbERewL6N0PaQlFKT19EksnNTP
         syeQL7XoAP0ZP1WxRjgrZCHfd8324tEN+B/j99ijrQghdHfsEOzTnddswb7DEIkerYhT
         stRuiJ552cYLeufyMCrFLHVtRjyLk0pruw90uDt0UsJigUdcvjGcrjBPsM0eYOpgsVGZ
         vWVTX3OIuGi1ytQMT/vW4FfJS0k0qnT/aAMygEExr1h2FP0I+9TrZuyefpruFiLwUTBV
         3zxN7yK5yXZjx2f2zmLqz+NcFmHcfWd7rD83H7SoY7x3dm1L7eZwCD4Fx+yqxJB3xghg
         ZVrg==
X-Gm-Message-State: AOAM5319jEo/A+/m0kJgOGMO6hFMXzus0+b67ef9t+W02CjaakxQ1If1
        zUz6MoquTJACfNVZmZtqhu+v9zn8LZh1wQ==
X-Google-Smtp-Source: ABdhPJzIMn/W3JE/0PZaHnMNnre5jGWm2flk0DVLrUPQfgEdwiQciGPBXUWRGcZXYBqJdEes/zE9pQ==
X-Received: by 2002:a02:7092:: with SMTP id f140mr6145335jac.8.1596214145596;
        Fri, 31 Jul 2020 09:49:05 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id e84sm5122083ill.60.2020.07.31.09.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 09:49:05 -0700 (PDT)
From:   Daniel Campello <campello@chromium.org>
To:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Stephen Boyd <swboyd@chromium.org>, linux-iio@vger.kernel.org
Subject: [PATCH v3 08/15] iio: sx9310: Use regmap_read_poll_timeout() for compensation
Date:   Fri, 31 Jul 2020 10:48:45 -0600
Message-Id: <20200731104555.v3.8.Ia205f0b0363bf663db7704026b5b7036b9748c56@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200731164853.3020946-1-campello@chromium.org>
References: <20200731164853.3020946-1-campello@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Simplify compensation stage by using regmap_read_poll_timeout().

Signed-off-by: Daniel Campello <campello@chromium.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

Changes in v3: None
Changes in v2:
 - Fixed dev_err() message

 drivers/iio/proximity/sx9310.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 8f80a4c20ac05e..9f6292cc86146d 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -802,7 +802,7 @@ static const struct sx9310_reg_default sx9310_default_regs[] = {
 static int sx9310_init_compensation(struct iio_dev *indio_dev)
 {
 	struct sx9310_data *data = iio_priv(indio_dev);
-	int i, ret;
+	int ret;
 	unsigned int val;
 	unsigned int ctrl0;
 
@@ -816,22 +816,17 @@ static int sx9310_init_compensation(struct iio_dev *indio_dev)
 	if (ret < 0)
 		return ret;
 
-	for (i = 100; i >= 0; i--) {
-		msleep(20);
-		ret = regmap_read(data->regmap, SX9310_REG_STAT1, &val);
-		if (ret < 0)
-			goto out;
-		if (!(val & SX9310_COMPSTAT_MASK))
-			break;
-	}
-
-	if (i < 0) {
-		dev_err(&data->client->dev,
-			"initial compensation timed out: 0x%02x", val);
-		ret = -ETIMEDOUT;
+	ret = regmap_read_poll_timeout(data->regmap, SX9310_REG_STAT1, val,
+				       !(val & SX9310_REG_STAT1_COMPSTAT_MASK),
+				       20000, 2000000);
+	if (ret) {
+		if (ret == -ETIMEDOUT)
+			dev_err(&data->client->dev,
+				"initial compensation timed out: 0x%02x\n",
+				val);
+		return ret;
 	}
 
-out:
 	regmap_write(data->regmap, SX9310_REG_PROX_CTRL0, ctrl0);
 	return ret;
 }
-- 
2.28.0.163.g6104cc2f0b6-goog

