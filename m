Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F58C43465
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 23:06:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D57620829
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 23:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BarEV0ov"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbgG1XGX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 19:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730036AbgG1XFk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 19:05:40 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4F4C0619DC
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 16:05:38 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id w12so8953209iom.4
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ckdl4rRSej+TpSQNUfdzpqHgfB1W1nhYEbGg+nzFza8=;
        b=BarEV0ovrLCUh0MdcCNuv9Iya/tsHqfYXc1+zb7Pr+Rgdv9Sr9OxrYmLSvCrGEC+an
         /huzljzKU+yIifhVNdt6i4SdeCPwgHzSMJ/52KURRXP11KIEgFhJ+DWKU/hCoANgTd5G
         yZgNmU9zkD2Ov5Vnw4m5O6ugjPKQekbh5sLH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ckdl4rRSej+TpSQNUfdzpqHgfB1W1nhYEbGg+nzFza8=;
        b=INdNju/vM/Bgnq/LAJD+zlkAhSlfjTmP+0EpR2a4+US55Xxr1imecYyGYh229eHz5w
         UZJEnx+uIj36iPUgClioYwFJEgasnQ3eVHw/pHB6TzPqnzoc55rZhlc/Q0pWWnKphgRe
         udjxC3gNXyZI1XO3k0QC/THEaMU1rhXWiF25lDzJU/2LQza8wLjNXWbaKka4vPlx5KT0
         BB9GOn4dmEgBUcYB/345fWzq2/4Vr6KKQEYl9wvS/WBW48S2XOeN0QhZP40U9+88NDc4
         HyasX/V0AD0P0hkseQ5czMTUSzAY8m5SBnhvTvWJr7FeLy5NpCumBBJAu129Pk2HnQL5
         k9xw==
X-Gm-Message-State: AOAM5324Q/2tv2Fl0IYuq0/BeFS8PyXWs/q20WAh74wX7eoKyZRBYPr3
        HBFmVC/F0l54kTsuQTLgxxxJCt//10ffYQ==
X-Google-Smtp-Source: ABdhPJzGSH1oEOQzZQiA6n/X77Umratilf3Tp30+qtl4G3Ep3KRfzTXFX9YiySzRFD4aKYorhSkqcA==
X-Received: by 2002:a05:6602:29c9:: with SMTP id z9mr30956817ioq.4.1595977538023;
        Tue, 28 Jul 2020 16:05:38 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id w10sm148945ilo.10.2020.07.28.16.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 16:05:37 -0700 (PDT)
From:   Daniel Campello <campello@chromium.org>
To:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        kbuild test robot <lkp@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Stephen Boyd <swboyd@chromium.org>, linux-iio@vger.kernel.org
Subject: [PATCH v2 04/14] iio: sx9310: Remove acpi and of table macros
Date:   Tue, 28 Jul 2020 17:05:10 -0600
Message-Id: <20200728170317.v2.4.I9bf713a86d6076b44441ef5f534f9c240271699a@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200728230520.2011240-1-campello@chromium.org>
References: <20200728151258.1222876-1-campello@chromium.org>
 <20200728230520.2011240-1-campello@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Avoids unused warnings due to acpi/of table macros.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Daniel Campello <campello@chromium.org>
---

Changes in v2:
 - Added #include <linux/mod_devicetable.h>

 drivers/iio/proximity/sx9310.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 108d82ba81146e..04b646ae8a1009 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -15,8 +15,8 @@
 #include <linux/i2c.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -1051,8 +1051,8 @@ MODULE_DEVICE_TABLE(i2c, sx9310_id);
 static struct i2c_driver sx9310_driver = {
 	.driver = {
 		.name	= "sx9310",
-		.acpi_match_table = ACPI_PTR(sx9310_acpi_match),
-		.of_match_table = of_match_ptr(sx9310_of_match),
+		.acpi_match_table = sx9310_acpi_match,
+		.of_match_table = sx9310_of_match,
 		.pm = &sx9310_pm_ops,
 	},
 	.probe		= sx9310_probe,
-- 
2.28.0.163.g6104cc2f0b6-goog

