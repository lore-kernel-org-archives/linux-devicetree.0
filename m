Return-Path: <SRS0=SgxY=BN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241B9C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:42:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36F9520786
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:42:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XCvS7meq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgHCXmQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 19:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbgHCXmP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 19:42:15 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C551C061757
        for <devicetree@vger.kernel.org>; Mon,  3 Aug 2020 16:42:15 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id k23so40312591iom.10
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2020 16:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=riJ3umw0V2+FfFxLjOBTqqOTzlRoPL8VdrC9Npn7RlM=;
        b=XCvS7meqieMCTnygetGwEK0pJso1pPfTOnD6XIxJZ3Uepl0ffi8YRsw/QlwSYrgHdg
         xnz7PgLuS2B57e3/UEnOuDehPoctgxNgnzt0F7ph/fyRZWG9cRN5sCO2WaPZfWM12LgA
         utsMT2ecb+ZKB9bHVVeTo57fv4AA5BnDnCk6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=riJ3umw0V2+FfFxLjOBTqqOTzlRoPL8VdrC9Npn7RlM=;
        b=gHzxs7Zov+VBw2BDoGJvulTWpiddrPM7LgUI22lESgKtLObsLApmoVxNrSWlS1oopJ
         /ue6hkaSZRmDO7sd5K83HI97ST0KWlEKipccc31cWmwkYgz8VmUAKo63T180ozeMO1SS
         D8S+b24bFOLlX+yUxDs0+yGXbGlVbXP4LYLn3UlS/IA/WeAejHLpFDP3thOzIe/D/un8
         VaKA7opHYby4opE5oLw1QhqIjgyYgr+/yholk8wUCW/qpo/vp8Iq13L89MpqgcuLwuT1
         +di9UJ90LigXtGu6B+kFm2C4PSqPHpH/M7cgF496nMFnO4v3/XZGCmHVXcmCQ1bA/zEd
         i3Qg==
X-Gm-Message-State: AOAM532NyPyijy4+QcPLdDzh+ZZ22XHZ7D9EVeaBc3qa3VDsVrEUcc7B
        2tbI38cVGYf+CDJpJmcTR40+D6tIeqOk/w==
X-Google-Smtp-Source: ABdhPJzZk3yQ+cOxunAhzmGr08Vzc3KwmOscO6pv6ZRnMceZ+QX863JCBZEYJ3pblsOKPp8aAi83ZA==
X-Received: by 2002:a02:838e:: with SMTP id z14mr2649202jag.84.1596498134252;
        Mon, 03 Aug 2020 16:42:14 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id g2sm5468435ioe.4.2020.08.03.16.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 16:42:13 -0700 (PDT)
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
Subject: [PATCH v4 15/15] iio: sx9310: Use irq trigger flags from firmware
Date:   Mon,  3 Aug 2020 17:41:54 -0600
Message-Id: <20200803131544.v4.15.I4c344a6793007001bbb3c1c08e96d3acf893b36b@changeid>
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

We shouldn't need to set default irq trigger flags here as the firmware
should have properly indicated the trigger type, i.e. level low, in the
DT or ACPI tables.

Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Daniel Campello <campello@chromium.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

Changes in v4: None
Changes in v3:
 - Added irq trigger flags commit to the series.

Changes in v2: None

 drivers/iio/proximity/sx9310.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index a6e345bb9ffe5c..9d1b35eee304ee 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -947,7 +947,7 @@ static int sx9310_probe(struct i2c_client *client)
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

