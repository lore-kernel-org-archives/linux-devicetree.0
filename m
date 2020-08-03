Return-Path: <SRS0=SgxY=BN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAEFC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AE1920792
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SL4ZbGfu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbgHCXmO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 19:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728993AbgHCXmN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 19:42:13 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BADDC06174A
        for <devicetree@vger.kernel.org>; Mon,  3 Aug 2020 16:42:13 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id g14so2870039iom.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2020 16:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TlOlrlXvKy/dxP8XanrvFTIVOHJ2xsZzzW4ZNNxbqnE=;
        b=SL4ZbGfufYoeiv5aV67FYPCP69iJJxf1kiGlEKyreAbc/PIQOChKSdcmC4ggJ9rFib
         ORIv7vnPS6aGFJyRJK17nsfXLtm74uFk/k/xf+ANBBvONcFSCEoBLD5ajgiJnsyv2Vmq
         4L0suo+5A4JwHYrFO4brtS0zQn8nwpp3PHaS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TlOlrlXvKy/dxP8XanrvFTIVOHJ2xsZzzW4ZNNxbqnE=;
        b=fnh67wc9+8YYMOX8BoYhYPL3ZLryW1u0EqwIt4mJCdIvFJGVi6XzPlpqpMckogDEwa
         sHSWpKYblkZTD4lvJJMF6KJMgS/QLwTTDBMAaGJtFlHBzCOd2x5escUJTQhj2RsOBtwT
         NL48wCxDDL4SPgPusZlBOMMw8bAiU1w0VCUQzud9J87MC11dqk27xzY+2sHgcueLEqjD
         HQCJkpS3yWuiaou9MkaoVoASxyupAXoCHTCZxpP+1sZ7hN2i6GfRJHr/CGEyIPbRT1QM
         xJBKZnl0293+BtU7SLZysxctFMgtzCHUfDWYhQo4KNlbgJhUaQtCGj1xsm033CR4wjgF
         ofiw==
X-Gm-Message-State: AOAM533VoiYoxx++txJX7sBQ8obxwTvY31NtsOdspDLr/8QFy6F9d/is
        ceWadSnkaFxTSxmThD/UIMETsJ02gI4RLw==
X-Google-Smtp-Source: ABdhPJxFvy1b82IWfcWuSV5sTLUIYinGrrp2h7y5igwOEByQAXV7GORiw6dMaomMLjMkY1d8Kx/jow==
X-Received: by 2002:a6b:8e8c:: with SMTP id q134mr2313383iod.147.1596498132308;
        Mon, 03 Aug 2020 16:42:12 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id g2sm5468435ioe.4.2020.08.03.16.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 16:42:11 -0700 (PDT)
From:   Daniel Campello <campello@chromium.org>
To:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Campello <campello@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Enrico Granata <egranata@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
Subject: [PATCH v4 13/15] iio: sx9310: Drop channel_users[]
Date:   Mon,  3 Aug 2020 17:41:52 -0600
Message-Id: <20200803131544.v4.13.Ia5c5fdbdfff576ab5d034cde46c25cc66a4baf50@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200803234154.320400-1-campello@chromium.org>
References: <20200803234154.320400-1-campello@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Stephen Boyd <swboyd@chromium.org>

This struct member isn't used. Drop it.

Fixes: 72ad02b15d63 ("iio: Add SEMTECH SX9310/9311 sensor driver")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Daniel Campello <campello@chromium.org>
Signed-off-by: Daniel Campello <campello@chromium.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/iio/proximity/sx9310.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 6395f61b720658..2e0ea84dba2118 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -135,7 +135,6 @@ struct sx9310_data {
 	struct completion completion;
 	unsigned long chan_read;
 	unsigned long chan_event;
-	int channel_users[SX9310_NUM_CHANNELS];
 	unsigned int whoami;
 };
 
-- 
2.28.0.163.g6104cc2f0b6-goog

