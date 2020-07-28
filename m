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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EC0C433F1
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 15:14:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 352D520663
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 15:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XHy3Hkgo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730747AbgG1POD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jul 2020 11:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730740AbgG1PNT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Jul 2020 11:13:19 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A21C0619D7
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 08:13:17 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id z3so6237596ilh.3
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2020 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X77SPgqeRzIi7EPS0EuqxV7/IKv3AykZrtE724jPXxg=;
        b=XHy3HkgoBzyU7B0kjB5UebEtF+vf06VHhx0/jKsJcL5bugXvMSbqZpMi8LdXQsiAhs
         pA9Q4Mvy6EMrzMQqeo179qzEolOlL2P210L6mZPhKXNPHkK3jYFB+kyEovPurqDOskHe
         ruyA7I6IGIUfSEYtFOk+INJ51lS916hhvF6MI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X77SPgqeRzIi7EPS0EuqxV7/IKv3AykZrtE724jPXxg=;
        b=hav5N122O4RHRLXgBl9Ye5BanmE+p615g99Pz0BtensZFcH1bF+UAmbPxJ6BxBLax/
         LBqrzlINBd394V6es+4bnpaOKehhOGpkEm1JPOBa04QX7FOU0nwpyp9DvT1NeZ1rF0K0
         vf/Nuo9dGMVZvIN+T6V4oG6hJnvf3YOd8Xp2UJUeZS3OomLeAKVGRcB8efCFYJ6fMw7Q
         gBLk3vT3dJ0daipjxXTwHHV43QMBWyrV+Ofl/C4CQqpCswKz+Vja/KIjBPF2EQMcCuA5
         NDlF8QYoOo8lsguImCiGE/FMIoacw5MoyjBddfQKTfaPa1lVdi/Q8JqJ49QtnZnjoP1D
         nwJA==
X-Gm-Message-State: AOAM530BdOqRa159J7O82XwD2lu8mJaqE9ihkRoLg4lRSZ+IjJC2HPr8
        c8Ull6Ik6aKI/HpSVzsibF/8dyA6Baz4PA==
X-Google-Smtp-Source: ABdhPJySXXN72bxVJJIeBDgnmesD5K+vdd8uvbwtfSploVLqeodEPgHI3v5z+I/kvRvKqA3xmgBA3Q==
X-Received: by 2002:a92:1b5b:: with SMTP id b88mr22688298ilb.104.1595949196575;
        Tue, 28 Jul 2020 08:13:16 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id q70sm6399781ili.49.2020.07.28.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 08:13:16 -0700 (PDT)
From:   Daniel Campello <campello@chromium.org>
To:     LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Daniel Campello <campello@chromium.org>,
        kbuild test robot <lkp@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Stephen Boyd <swboyd@chromium.org>, linux-iio@vger.kernel.org
Subject: [PATCH 04/15] iio: sx9310: Remove acpi and of table macros
Date:   Tue, 28 Jul 2020 09:12:47 -0600
Message-Id: <20200728091057.4.I33c50453845a8167969130d514af86e573b6ef31@changeid>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
In-Reply-To: <20200728151258.1222876-1-campello@chromium.org>
References: <20200724183954.1.I2e29ae25368ba8a72a9e44121cfbc36ead8ecc6b@changeid>
 <20200728151258.1222876-1-campello@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Avoids unused warnings due to acpi/of table macros.

Signed-off-by: Daniel Campello <campello@chromium.org>
Reported-by: kbuild test robot <lkp@intel.com>
---

 drivers/iio/proximity/sx9310.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 76b8bedebeef50..0fb88ad66f7342 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -16,7 +16,6 @@
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -1051,8 +1050,8 @@ MODULE_DEVICE_TABLE(i2c, sx9310_id);
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
2.28.0.rc0.142.g3c755180ce-goog

