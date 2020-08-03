Return-Path: <SRS0=SgxY=BN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68647C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78C05206F8
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:59:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E7jVBRms"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbgHCX7E (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 19:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729276AbgHCX62 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 19:58:28 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B604C06179F
        for <devicetree@vger.kernel.org>; Mon,  3 Aug 2020 16:58:28 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id u126so3112531iod.12
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2020 16:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yik+aMIToEohV7wg7qvgTDzaja0eSR46JIGUiWz8tJI=;
        b=E7jVBRmsXsePU/j4COJ/CgUnuw/aUYFsKgjExjc4hD2pfJstPSKiaVgJ7X1URgMJyF
         xK1XM2aQC8CxxvBwJcRrRPT6jli+Sf6k1SsBeSxkpNHRGUwwhA6clyfLxNLzuT2VqCAF
         A3HnMdocMmQLStbcTkVzL9CgOMh1aXKK0cOPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yik+aMIToEohV7wg7qvgTDzaja0eSR46JIGUiWz8tJI=;
        b=OakmbPjCuZ+DeytS1MHp8+YbIjsBW4kcvYPd5nALGxiaJcGDWFa+Mq05/fOM/qX9Aw
         +f/Ola9AFE4Y7R85uzP9hpfyxAUWsDyxBxfNWFXhftIbrYVPTkvuW/C2jZl35QiRHdvx
         IQtPOCNn09BeHi7L87pg3Dei5hHJRn2qw7Bu2mZ7mwzrZ2fvihUNTnuRiO3axjk6rKW/
         7FqUxb8ZlXgx/spyZJO9M0hKeioI/D9znzGebQtKyIwyF164XulPjClVQoyqdCU6hnIw
         SYfDtVfVh4O5VUyMERWpmyTn084St1gG0TBMd1iKEFva4XkcXLeLTdR+KESfeWYHPn+w
         D5TA==
X-Gm-Message-State: AOAM530mIu3/weo3AY9lmEtBgTcWAqJuyXDug1s0RRhGGhbsBxCX1Y1H
        sD4SB+nqGrcRhfv1ozG7xuL58Af+QiyNkA==
X-Google-Smtp-Source: ABdhPJx95HrouxJZl3V49xPt809qEmM/nrFASnWcwbUgmIIAxqSgr8eUcYm1t5PfpcCDeoLZv3grCw==
X-Received: by 2002:a5e:dd4c:: with SMTP id u12mr2259195iop.93.1596499107453;
        Mon, 03 Aug 2020 16:58:27 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id x185sm11075992iof.41.2020.08.03.16.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 16:58:27 -0700 (PDT)
From:   Daniel Campello <campello@chromium.org>
To:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
Subject: [PATCH v5 08/15] iio: sx9310: Use regmap_read_poll_timeout() for compensation
Date:   Mon,  3 Aug 2020 17:58:08 -0600
Message-Id: <20200803175559.v5.8.Ia205f0b0363bf663db7704026b5b7036b9748c56@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200803235815.778997-1-campello@chromium.org>
References: <20200803235815.778997-1-campello@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Simplify compensation stage by using regmap_read_poll_timeout().

Signed-off-by: Daniel Campello <campello@chromium.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
 - Fixed dev_err() message

 drivers/iio/proximity/sx9310.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index f78500b8a5841e..cd7de40a55c2f6 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -799,7 +799,7 @@ static const struct sx9310_reg_default sx9310_default_regs[] = {
 static int sx9310_init_compensation(struct iio_dev *indio_dev)
 {
 	struct sx9310_data *data = iio_priv(indio_dev);
-	int i, ret;
+	int ret;
 	unsigned int val;
 	unsigned int ctrl0;
 
@@ -813,22 +813,17 @@ static int sx9310_init_compensation(struct iio_dev *indio_dev)
 	if (ret < 0)
 		return ret;
 
-	for (i = 100; i >= 0; i--) {
-		msleep(20);
-		ret = regmap_read(data->regmap, SX9310_REG_STAT1, &val);
-		if (ret < 0)
-			goto out;
-		if (!(val & SX9310_REG_STAT1_COMPSTAT_MASK))
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

