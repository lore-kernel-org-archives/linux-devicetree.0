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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E80C433E3
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:42:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8791120792
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Aug 2020 23:42:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kS6kSvUW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgHCXmK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Aug 2020 19:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbgHCXmJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Aug 2020 19:42:09 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B708C061757
        for <devicetree@vger.kernel.org>; Mon,  3 Aug 2020 16:42:09 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id v6so25113105iow.11
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2020 16:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/skwDGOu2nehnv18qT3IFvoLq0QiOWOte/D4orwDVqQ=;
        b=kS6kSvUWuhPB6rHlgXKENziRqn8Xb+cvstktJgAj55sFgsPTsKaaID8UgizpA2plTv
         2HSTbhdM+R7emETz84X8vU5jWlVsPQ6VrJ9oUFW65kKuNdmfi8UNLYXzxtSUWTmuWtBw
         EQPNO84AVaBO6qoCPs0USYGXM0iRCMi50JM0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/skwDGOu2nehnv18qT3IFvoLq0QiOWOte/D4orwDVqQ=;
        b=qOMrE50EjpeZI3oYxCMH86xT37p7EYpRmTwUol/rci9Abppe45z5HBvffJ1QUbYivK
         k+YIkzD+BDkLwfh4WnywlCOLeqg4xhFxNjtM7CYy8qLlOygDoaeQCk1vqOuhfQbgqawP
         G/AmaGklkVSQwYnGxK5I0lOy3HugiWCe/0ujT5U9WP9RM+/NjNtfwfoQ7Dg26y1PVqBZ
         hRnDvAcAPCubvEqRTjFONKJEmchFSF7dYo2A/I46AiXYuwo+Soa4/neiOwMAwh35MqE2
         v6Z1C5eLGLCQd1AWdgzFG06LQQYas/nBDIQNQ3C7rwttmGZNJ7StClc/GwBHkc+050WD
         /dLQ==
X-Gm-Message-State: AOAM530eYP7l3ITFHgC1Xpr7IzHu/23Jw3KkEOGc2YNY/6fbAlaosLdc
        HFS8cvqliV5QrQA91MwrnM+I/m7cqMVYDg==
X-Google-Smtp-Source: ABdhPJyyzjip/hI2kd2WW3oXWVJy1Fk6QaKzYFBTkNRk51qp4ji3wfF3zEwqRMQEYDGmU+zdqbsziQ==
X-Received: by 2002:a02:cc53:: with SMTP id i19mr2551216jaq.33.1596498128403;
        Mon, 03 Aug 2020 16:42:08 -0700 (PDT)
Received: from derch.Home (97-122-92-59.hlrn.qwest.net. [97.122.92.59])
        by smtp.gmail.com with ESMTPSA id g2sm5468435ioe.4.2020.08.03.16.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 16:42:08 -0700 (PDT)
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
Subject: [PATCH v4 09/15] iio: sx9310: Update copyright
Date:   Mon,  3 Aug 2020 17:41:48 -0600
Message-Id: <20200803131544.v4.9.If88afce92bbc1e97a532874cca35e642a9566172@changeid>
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
In-Reply-To: <20200803234154.320400-1-campello@chromium.org>
References: <20200803234154.320400-1-campello@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fixes wrong copyright year.

Signed-off-by: Daniel Campello <campello@chromium.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/iio/proximity/sx9310.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 9636a3beabeb36..fa5009e39605ca 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -1,13 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright 2018 Google LLC.
+ * Copyright 2020 Google LLC.
  *
  * Driver for Semtech's SX9310/SX9311 capacitive proximity/button solution.
  * Based on SX9500 driver and Semtech driver using the input framework
  * <https://my.syncplicity.com/share/teouwsim8niiaud/
  *          linux-driver-SX9310_NoSmartHSensing>.
- * Reworked April 2019 by Evan Green <evgreen@chromium.org>
- * and January 2020 by Daniel Campello <campello@chromium.org>
+ * Reworked in April 2019 by Evan Green <evgreen@chromium.org>
+ * and in January 2020 by Daniel Campello <campello@chromium.org>.
  */
 
 #include <linux/acpi.h>
-- 
2.28.0.163.g6104cc2f0b6-goog

