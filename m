Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36B3C5DF61
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 10:05:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BB35F206C3
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 10:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="diJNUb/i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387843AbfKGKFC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 05:05:02 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53903 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387812AbfKGKFC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 05:05:02 -0500
Received: by mail-wm1-f65.google.com with SMTP id x4so1781446wmi.3
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 02:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1NFQx4M7emlsOeIvgOTsRMLDiElPASaNlDD1uGqCI9o=;
        b=diJNUb/iqjOHP2Xj1cSylihQV+7/r7MfJilAJ2oLrT8dh5354m1aWr0Fr3aSFuBHNY
         WFejV8e7dFIohZvEYGtLW3cW1dkGlurSFdnehO/gWkehDw7aWCOd3H1qbqd3Obx5HrOR
         gX9fSNqC9fNamh+pBS557hFiD32qre1Wr1+zFU5DehEUoDWCUO0wAfJ8Wg0r6RWa0iPI
         5n3QvfI9OFzmRDqmWSMKgHKnB1Tr9GStM5EnFrU1fCnlrthkgjsed+ZIgJ0oVmonzG+R
         HxcBS8SVEcfnLq2MYd1rN9jDjoHY5hzM5OCfn6kI3yU6pWeaFObEOVqC/Y87KpfR6BiB
         Zogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1NFQx4M7emlsOeIvgOTsRMLDiElPASaNlDD1uGqCI9o=;
        b=J7a3oKyts7NbiPuBSxHVAhJfHNGCpXch3HWzJENCA5qNw+P0pQKaTNeDsWWYWuWteP
         enym2FUNUUm0lT0KL/m2RLjR3wYoe9YkIKtfd8kHpvx1Yb2wOj84RXaKjyKB3jniE62y
         alPBBCSvjmt4n7kDYyZUQB1xIXibCNXQNMQUJGGDrdm7r1os/o2wCNTzxLxZbKBdr6Fg
         47sORFP7YYlAJyCN4zcmzwrwwEdPyr4wlQHET+CtHzZnn1+SlQNEcQ7jjQyl5lRC1ZGK
         dcRGLWUvMmcu2YO5MYIJFtx2hYkObaMTzrk7L6lCcfsIpDtKYIYu8Cne5z14N0CgUTbk
         UC0w==
X-Gm-Message-State: APjAAAXViKGyp2STYs8Z/9BMB+EbSQaqlZC0VePFgg1QisX5AqmPBUOp
        HoiLzpY84fLX4F9p2MIOnhQ=
X-Google-Smtp-Source: APXvYqw3uqt19gFI7raXLutn/B4OZcKPgyz5jJ1h81dP5ShmDytquJGh634QWG6In8rf3PzvJ9gfaQ==
X-Received: by 2002:a1c:9d4a:: with SMTP id g71mr2146692wme.66.1573121099896;
        Thu, 07 Nov 2019 02:04:59 -0800 (PST)
Received: from mars.home (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.googlemail.com with ESMTPSA id v184sm2225860wme.31.2019.11.07.02.04.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Nov 2019 02:04:59 -0800 (PST)
From:   Christoph Fritz <chf.fritz@googlemail.com>
To:     Fabio Estevam <festevam@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <support.opensource@diasemi.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] regulator: da9062: refactor buck modes into header
Date:   Thu,  7 Nov 2019 11:04:07 +0100
Message-Id: <1573121050-4728-2-git-send-email-chf.fritz@googlemail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
References: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch refactors buck modes into a header so that device trees
can make use of these mode constants.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/regulator/da9062-regulator.c               | 28 ++++++++--------------
 .../dt-bindings/regulator/dlg,da906x-regulator.h   | 16 +++++++++++++
 2 files changed, 26 insertions(+), 18 deletions(-)
 create mode 100644 include/dt-bindings/regulator/dlg,da906x-regulator.h

diff --git a/drivers/regulator/da9062-regulator.c b/drivers/regulator/da9062-regulator.c
index 710e670..1a95982 100644
--- a/drivers/regulator/da9062-regulator.c
+++ b/drivers/regulator/da9062-regulator.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/of_regulator.h>
 #include <linux/mfd/da9062/core.h>
 #include <linux/mfd/da9062/registers.h>
+#include <dt-bindings/regulator/dlg,da906x-regulator.h>
 
 /* Regulator IDs */
 enum {
@@ -75,14 +76,6 @@ struct da9062_regulators {
 	struct da9062_regulator			regulator[0];
 };
 
-/* BUCK modes */
-enum {
-	BUCK_MODE_MANUAL,	/* 0 */
-	BUCK_MODE_SLEEP,	/* 1 */
-	BUCK_MODE_SYNC,		/* 2 */
-	BUCK_MODE_AUTO		/* 3 */
-};
-
 /* Regulator operations */
 
 /* Current limits array (in uA)
@@ -112,13 +105,13 @@ static int da9062_buck_set_mode(struct regulator_dev *rdev, unsigned mode)
 
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
-		val = BUCK_MODE_SYNC;
+		val = DA906X_BUCK_MODE_SYNC;
 		break;
 	case REGULATOR_MODE_NORMAL:
-		val = BUCK_MODE_AUTO;
+		val = DA906X_BUCK_MODE_AUTO;
 		break;
 	case REGULATOR_MODE_STANDBY:
-		val = BUCK_MODE_SLEEP;
+		val = DA906X_BUCK_MODE_SLEEP;
 		break;
 	default:
 		return -EINVAL;
@@ -145,15 +138,14 @@ static unsigned da9062_buck_get_mode(struct regulator_dev *rdev)
 
 	switch (val) {
 	default:
-	case BUCK_MODE_MANUAL:
 		mode = REGULATOR_MODE_FAST | REGULATOR_MODE_STANDBY;
 		/* Sleep flag bit decides the mode */
 		break;
-	case BUCK_MODE_SLEEP:
+	case DA906X_BUCK_MODE_SLEEP:
 		return REGULATOR_MODE_STANDBY;
-	case BUCK_MODE_SYNC:
+	case DA906X_BUCK_MODE_SYNC:
 		return REGULATOR_MODE_FAST;
-	case BUCK_MODE_AUTO:
+	case DA906X_BUCK_MODE_AUTO:
 		return REGULATOR_MODE_NORMAL;
 	}
 
@@ -282,13 +274,13 @@ static int da9062_buck_set_suspend_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
-		val = BUCK_MODE_SYNC;
+		val = DA906X_BUCK_MODE_SYNC;
 		break;
 	case REGULATOR_MODE_NORMAL:
-		val = BUCK_MODE_AUTO;
+		val = DA906X_BUCK_MODE_AUTO;
 		break;
 	case REGULATOR_MODE_STANDBY:
-		val = BUCK_MODE_SLEEP;
+		val = DA906X_BUCK_MODE_SLEEP;
 		break;
 	default:
 		return -EINVAL;
diff --git a/include/dt-bindings/regulator/dlg,da906x-regulator.h b/include/dt-bindings/regulator/dlg,da906x-regulator.h
new file mode 100644
index 00000000..848a4df
--- /dev/null
+++ b/include/dt-bindings/regulator/dlg,da906x-regulator.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DLG_DA906X_REGULATOR_H
+#define __DLG_DA906X_REGULATOR_H
+
+/*
+ * These buck mode constants may be used to specify values in device tree
+ * properties (e.g. regulator-initial-mode).
+ * A description of the following modes is in the manufacturers datasheet.
+ */
+
+#define DA906X_BUCK_MODE_SLEEP		1
+#define DA906X_BUCK_MODE_SYNC		2
+#define DA906X_BUCK_MODE_AUTO		3
+
+#endif
-- 
2.1.4

