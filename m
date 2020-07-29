Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABA8C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 15:44:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A7A3207E8
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 15:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FS6h71u5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgG2PoI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 11:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgG2PoI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 11:44:08 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2344EC061794
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 08:44:08 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id r2so17010728wrs.8
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tuiwq6PL49LgBLJB2iEw3NbuM/jiIuCvykCzTBqHaAA=;
        b=FS6h71u5nG4XhXmL0xBxzPU4diQE9Q2Zpew4j4jjY4WuGIDjtKoxp0YtFc9dj8HhrN
         QoIgPpKfjk6Soe8qvPm3YZMHmP0SRtiDVUBnoEPPmjbqkI9eaiPuNt/hjt6di05vUfOj
         sCR1Q+Lrnz+hYJ+ACuqXBgwWdmTWTgDb8jShGJDuuAF6oWFDJBEwaPu3N+lSLavKpMJI
         29f8AjvI6+LmYSO7I4uhSysBwYF1Nk/2NZxQBDu1FlJks0amxkSRjc7F3JevXv/D5pXZ
         s4l4bvNHDcNxZI+w6gMwVDs97ktovsnGTXTJNs3L8UEMeLVlKNSVmZrpDZdxnQqHDG74
         pmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tuiwq6PL49LgBLJB2iEw3NbuM/jiIuCvykCzTBqHaAA=;
        b=JQN3pzb16LZegbC5TJtLSt35hRS8JBUTaL+B0aQxYqDhRcqUmY6WuRvAYDEzsaMZA6
         wNajBfLeil2nWiM6inJt4AO6YViI8/Jb5uFnzBCNTaHdkfLjHKxUFN49U6Et0GYsejF9
         MOJDSsEpdWVDw+pYqBvGCWpdagrbvU0Mub7bt6nkNOXD9UIWvLWUlI4OU0rrxLAlr2v5
         /vHdyWOJRN7fSJvVRGKltLRiy+IAASxkcxe54YH55EkorXd9UX6oz9yd6/qiOL9ARR+w
         rKaeQwV+2lRMT8VjfDpqvojn0zMbkJysLERTJzU0kOb39DanaPqxEBaaJjgl6Ete9ATV
         qTLg==
X-Gm-Message-State: AOAM530rsEaEXqpB1cq1AjUgEsE4VMKnxva0+gihoVG7fE0Fx8JmUpUq
        b24nbzW8Z4bud43BStxlXm5i9Q==
X-Google-Smtp-Source: ABdhPJyTMeEr287ehDzeTN6mcV+wNZneeb9TvFO04zB+QZ6QobJZHTZKK3fS+lbNnvjc9AqXgsXxZw==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr30067384wrn.253.1596037446658;
        Wed, 29 Jul 2020 08:44:06 -0700 (PDT)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a134sm6526030wmd.17.2020.07.29.08.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 08:44:06 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: meson: axg-audio: fix tdmout sclk inverter
Date:   Wed, 29 Jul 2020 17:43:56 +0200
Message-Id: <20200729154359.1983085-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The patchset fixes a problem with TDMOUT sclk inverter found on the
g12a and following SoCs.

On the the axg, a single bit was enough to drive the inverter. On
the g12a a bit was added to, somehow, change how the clock is sampled.
For the inverter to behave as intended, the new bit should be the
inverse of the inverter bit at all time.

Quite a lot of lines for a single bit ...

Jerome Brunet (3):
  clk: meson: add sclk-ws driver
  clk: meson: axg-audio: separate axg and g12a regmap tables
  clk: meson: axg-audio: fix g12a tdmout sclk inverter

 drivers/clk/meson/axg-audio.c | 214 +++++++++++++++++++++++++++++-----
 drivers/clk/meson/clk-phase.c |  56 +++++++++
 drivers/clk/meson/clk-phase.h |   6 +
 3 files changed, 246 insertions(+), 30 deletions(-)

-- 
2.25.4

