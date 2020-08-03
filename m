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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8351DC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:58:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91F7F206F8
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AiShUQSX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729368AbgHCX6f (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 19:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729265AbgHCX6f (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 19:58:35 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B834C06174A
        for <devicetree@vger.kernel.org>; Mon,  3 Aug 2020 16:58:35 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id s189so33168515iod.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2020 16:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wsVqyjHcA1iKwUDBxCp9up0hP+cWrDA1sHvlf/BCc1I=;
        b=AiShUQSXnB6sCwZ0hjrv/cNhWcDpdxOe25FBTj9xmqPNXeVLzAbER2ihz09Fw2BE/h
         YCyLmXGXXdiSiLOx1Mrvd3H1roH+ItiZNmy7HKicnANGt6drgrndXYPcgDL3giO6mb4K
         JLMaHIv8CT3pyKRiMubXM+tZUjlW8GFAoAfy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wsVqyjHcA1iKwUDBxCp9up0hP+cWrDA1sHvlf/BCc1I=;
        b=lJi6W2N+CsXicLfrVp8pEjWT5J67Pdli+GXMbiM9L3H2L/ETulb8tEP+/1vPCm1jJ2
         BgZeLQd3ksbuiK1QwJ/rTog6aWqU8ddsNYk1JDh8G9nULccWnhO1DopSamoB5zxAbJDF
         u+BBAo1+VmP97irxWvjdMpusFVroW4LhKFDaRaRmc9puaC6tjHp82owpjrC2yHzZ2p6r
         6Ok2uaiCgfz/1vXF7cfFq10L6tU89Nz9/BeX4H6kacrCCvv50fZFgKED9UzayLeukjIz
         oBeAB40JVexaLPZOXlM8JvFuCr2Gk6HiUI+xIhgW+H2LfLw2D2U3vDfVVciafyH1oV0b
         FBKQ==
X-Gm-Message-State: AOAM5335E9vXs2gh8YfBDtggtDLXJT9z8dGpaNljONZNMC5Bar3l4+eU
        /KA9f0p4EQu9tXpj2oT6Q0Q8JeAc78DWXw==
X-Google-Smtp-Source: ABdhPJxDqAh8c8N6NwS66oD3lSYhKYcAZzbzw5XKTWBN5KQaQPgLB22TF0PmY9OHGTOqtWAiSzHV+w==
X-Received: by 2002:a05:6602:381:: with SMTP id f1mr2386096iov.193.1596499114281;
        Mon, 03 Aug 2020 16:58:34 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id x185sm11075992iof.41.2020.08.03.16.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 16:58:33 -0700 (PDT)
From:   Daniel Campello <campello@chromium.org>
To:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Campello <campello@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
Subject: [PATCH v5 15/15] iio: sx9310: Use irq trigger flags from firmware
Date:   Mon,  3 Aug 2020 17:58:15 -0600
Message-Id: <20200803175559.v5.15.I4c344a6793007001bbb3c1c08e96d3acf893b36b@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200803235815.778997-1-campello@chromium.org>
References: <20200803235815.778997-1-campello@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

We shouldn't need to set default irq trigger flags here as the firmware
should have properly indicated the trigger type, i.e. level low, in the
DT or ACPI tables.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Daniel Campello <campello@chromium.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3:
 - Added irq trigger flags commit to the series.

Changes in v2: None

 drivers/iio/proximity/sx9310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index a68766708fb304..db97b5339d0eff 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -948,7 +948,7 @@ static int sx9310_probe(struct i2c_client *client)
 		ret = devm_request_threaded_irq(dev, client->irq,
 						sx9310_irq_handler,
 						sx9310_irq_thread_handler,
-						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						IRQF_ONESHOT,
 						"sx9310_event", indio_dev);
 		if (ret)
 			return ret;
-- 
2.28.0.163.g6104cc2f0b6-goog

