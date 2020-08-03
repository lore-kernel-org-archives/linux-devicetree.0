Return-Path: <SRS0=SgxY=BN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08230C433E4
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:59:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1987620786
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V88DoAJz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729220AbgHCX7K (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 19:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729189AbgHCX6Y (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 19:58:24 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E7BC061756
        for <devicetree@vger.kernel.org>; Mon,  3 Aug 2020 16:58:24 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id z6so40449599iow.6
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2020 16:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5cSkoNniKNC956C/ks1iOGmqLlwslZdR0J6VVIESB2A=;
        b=V88DoAJzfQvpiH+5JxevlSU6EhKal8pET2oyqthvc2pFhCs3Sp9rwSgY5coM8nTZPO
         wruV+Ufx3cSmBIt+yyoql6iJzRJmTpmrYvBC0A1UF9XPu5pIFNda+pySkz8y5Vl6zA22
         cITV089oYBOg5Togk9Qdt83DQPR/anpO6qYE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5cSkoNniKNC956C/ks1iOGmqLlwslZdR0J6VVIESB2A=;
        b=XkCAPwgVHcQN/IWn+neLApsRmmZABXKRtM3qxogwiNB7Gu7XDGIYnbzQIvQkdHZa+6
         gmz4qy1vQldsgnKxkc22AINyZhXgdPoD6natAZecvRYy1Gz365S125SdoVTDtqY6g1br
         Xg1t0GBNhoVuTYcis0q3wq5PevVf5XDYMQq1CormJ0kmgRwlvMKpfvUlxd2dfgtO/BOw
         ViE/TvoqFdsDLDIS1WTxFriuJGIZo8DRjFK47L0LxIyGDvKMrCWTZsHnXjCRWOgNOZnE
         EPet2j3efF4yX2hlcPeeG76Xg6BjhEHi2QnftbLMq4XCLfp4zSU66SYYG4bm03Q6o7Hg
         Dsow==
X-Gm-Message-State: AOAM531yziZWj7mbAy72DvkOTbaNByys0wvx/k/NHjbc81rKh3rjbsWZ
        p82Ii6a/hXq5MdgFZkjqWGQisO1S4ISZWw==
X-Google-Smtp-Source: ABdhPJyqY7hE+U+7SMnQ+qMn5joVOAC/qjH45Yfs0wJshVR9Up1oVmmnvOB4rHGp4B9hYhCW0JjSJA==
X-Received: by 2002:a05:6602:1343:: with SMTP id i3mr2388451iov.134.1596499103295;
        Mon, 03 Aug 2020 16:58:23 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id x185sm11075992iof.41.2020.08.03.16.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 16:58:22 -0700 (PDT)
From:   Daniel Campello <campello@chromium.org>
To:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        kbuild test robot <lkp@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
Subject: [PATCH v5 04/15] iio: sx9310: Remove acpi and of table macros
Date:   Mon,  3 Aug 2020 17:58:04 -0600
Message-Id: <20200803175559.v5.4.I9bf713a86d6076b44441ef5f534f9c240271699a@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200803235815.778997-1-campello@chromium.org>
References: <20200803235815.778997-1-campello@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Avoids unused warnings due to acpi/of table macros.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Daniel Campello <campello@chromium.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
 - Added #include <linux/mod_devicetable.h>

 drivers/iio/proximity/sx9310.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index dafee85018aa6d..9daf2b8591a0a0 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -16,8 +16,8 @@
 #include <linux/i2c.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -1049,8 +1049,8 @@ MODULE_DEVICE_TABLE(i2c, sx9310_id);
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

