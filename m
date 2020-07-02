Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7B8C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 06:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0988B20874
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 06:23:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HpO8j+oo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgGBGXt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 02:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgGBGXt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 02:23:49 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FCBC08C5C1
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 23:23:49 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e82so28703755ybh.12
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 23:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=MaFXFUTySiLKYk3Z8Ey8ljkWyigRLA9QlN8KpEVxaas=;
        b=HpO8j+ooh+DAxXHg28sv9p6lhCrB1r7AJwKn3FWvCL7Paa0RV1y7CZudbCkjxY0KV+
         n72PRRaqDGQhUZQHNggZCAWf7jI+GiM6bpUiRpXsNkrvTrI6WpupwUDmvs6ayML5k9hA
         uWuCFog9HN3f7U6A3Ch77vna3rMlKTNhfdfWrCbG3KJc9LXr1fbsrLjvHAbeazQmzTrD
         Qeya3T0QHKtAWY5tfs04Ewd9Fqqvh+LsDCBn2pnd6xoeOrTCHYtQGCkG/CJ2e5AIyOd9
         14OCWdylxbNxCvsVJyeGHS6zkW5Uox2NesJFpP2g6rzPGStCszqKfAdz7mbYVKv9fpu8
         pasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MaFXFUTySiLKYk3Z8Ey8ljkWyigRLA9QlN8KpEVxaas=;
        b=M/0uc2ZSWJ2i/oMyFhrt77c4BEQ9AwTm1fJOyUJUJ11in2SCi3I/kKVG/BLbaljcnK
         +VwUcd+7HETMlOdIvfxZRJFvnBLvgRDi4g6OaRuiFQStdwjChbYHYQQF3yZo15cMaG06
         Djo4Gm98OSj9PP0GR176rHDabqM6WeyvwpJD/KizvW40F9u1FwX2qyzyzxyv5TeWe5A+
         Tls7ybrPJTGvtZ1LA4V+M6OG5sK2UrIUaEeomZ1xaqSDRQyFV5U/OR/iN8sN4s1gi36U
         lJ3RwNE8uQcvG+wSbjzVsOo33aG4YmVwWbO+gzbQcFHmDV/g4R8bQ4yU7tdPzrTnM5tB
         uWeA==
X-Gm-Message-State: AOAM530sRI+Z7n8z0L7ocj5PGyH/u5JAxShPIm4NI73cwIuQ9rGTuD6Z
        cmwXTqFoK1jhDEuhb4mk61CMgxR76Ej2
X-Google-Smtp-Source: ABdhPJyX4ZwBQKR2MfzfX9ehWTPofcH8pisBfi1+UkVEQTv0xTZgjt23xNzESqt2av4NzoI9gb5MuUXtyPXs
X-Received: by 2002:a25:9904:: with SMTP id z4mr47219203ybn.146.1593671028182;
 Wed, 01 Jul 2020 23:23:48 -0700 (PDT)
Date:   Thu,  2 Jul 2020 16:23:17 +1000
In-Reply-To: <20200702062320.2903147-1-amistry@google.com>
Message-Id: <20200702162231.v2.1.Icf69e2041b1af4548347018186c3ba6310f53e66@changeid>
Mime-Version: 1.0
References: <20200702062320.2903147-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 1/4] regulator: mt6397: Move buck modes into header file
From:   Anand K Mistry <amistry@google.com>
To:     linux-mediatek@lists.infradead.org
Cc:     hsin-hsiung.wang@mediatek.com, drinkcat@chromium.org,
        Anand K Mistry <amistry@google.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This will allow device trees to make use of these constants.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

Changes in v2: None

 drivers/regulator/mt6397-regulator.c              |  4 +---
 .../regulator/mediatek,mt6397-regulator.h         | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6397-regulator.h

diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index 269c2a6028e8..d51e98ce1138 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -13,9 +13,7 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/mt6397-regulator.h>
 #include <linux/regulator/of_regulator.h>
-
-#define MT6397_BUCK_MODE_AUTO	0
-#define MT6397_BUCK_MODE_FORCE_PWM	1
+#include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
 
 /*
  * MT6397 regulators' information
diff --git a/include/dt-bindings/regulator/mediatek,mt6397-regulator.h b/include/dt-bindings/regulator/mediatek,mt6397-regulator.h
new file mode 100644
index 000000000000..99869a8665cf
--- /dev/null
+++ b/include/dt-bindings/regulator/mediatek,mt6397-regulator.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6397_H_
+#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6397_H_
+
+/*
+ * Buck mode constants which may be used in devicetree properties (eg.
+ * regulator-initial-mode, regulator-allowed-modes).
+ * See the manufacturer's datasheet for more information on these modes.
+ */
+
+#define MT6397_BUCK_MODE_AUTO		0
+#define MT6397_BUCK_MODE_FORCE_PWM	1
+
+#endif
-- 
2.27.0.212.ge8ba1cc988-goog

