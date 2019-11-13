Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8202C43331
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 13:41:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B10B822467
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 13:41:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iakvQVh7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfKMNlH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 Nov 2019 08:41:07 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42893 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbfKMNlH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Nov 2019 08:41:07 -0500
Received: by mail-wr1-f65.google.com with SMTP id a15so2401489wrf.9
        for <devicetree@vger.kernel.org>; Wed, 13 Nov 2019 05:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g0Reo92qEknJT+JrEapTAi5GfksVulSHB7AHlQhZpQI=;
        b=iakvQVh7cNx5bXD4bxwf7dkBIfVjeJlyqfsMagf2SWHTpbsocpW47MTVX/0M9nNseq
         M38FiXfEaEqR+CvoF6D3U38lBSRI/E3Taov1au7U9pwu6a6p6mNWy3huwbRdGB7JywSQ
         8LTsIyk+zzgs33ptiNzzExcftKdq/nDU0L6prx2DhqQHJlcTOgJ7Fmjf7sjnbyItPmBr
         V3tWr6bNqfXgT/bjY3Zd+UZpRZ0gL+Sw+Qdmg7M0scahrcgkodqX+CcTGn1zR/TWLn6V
         o8qdr+Fr9eGf3P7IgfkNNGLHtUWK0E1RAYfPGA5xOA/7+K4ZFiJCAcHewHrwiNEovxFj
         QhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g0Reo92qEknJT+JrEapTAi5GfksVulSHB7AHlQhZpQI=;
        b=tsPu7uPWI2bOT1ub0qHGTJlWXyChTEC+veXgfZuyOd7bWmGGiNHlav89qbPE6CvSP2
         UJIoGMUBbiD4ktxoRXT2q5obPXPfQhUgiVfD1v3J5zW4nbcBivBcj63+eSK2V48imX8C
         cnQidAgcEQ5MWayst7BUO5l9qQ44YXbJjx+WoKbMutFD056ClSnOKzTkj/eWFTF+1SXE
         DGF3hol/K0Xi/NKcmQNKhkpUAfMzUM+lKAgWiMX0r89oi1eN4YPZLUVDmKwUc52VPdRD
         PLAuhdiIlK2SQAvpw1vWVOeGAM98DeIfILw8iCmelDZdyQsGiXJmYtbyMp0txqkLPVvB
         R/fQ==
X-Gm-Message-State: APjAAAUGfII/Tm1ONASAEmh7vofzZkeLlPRl/cQUCrs1fPU0CThRxifa
        bzEk32JOZXW/RADO5pV/A/8=
X-Google-Smtp-Source: APXvYqxtB/tHkCWuTXTACCflWIufqfG0V13c5vDCKObyaNE35kyrkhilP05Y3h7O5l41adByy9fcvQ==
X-Received: by 2002:adf:e94e:: with SMTP id m14mr3002351wrn.233.1573652463766;
        Wed, 13 Nov 2019 05:41:03 -0800 (PST)
Received: from mars.home (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.googlemail.com with ESMTPSA id r15sm4195831wrc.5.2019.11.13.05.41.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 05:41:03 -0800 (PST)
From:   Christoph Fritz <chf.fritz@googlemail.com>
To:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Mark Brown <broonie@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <support.opensource@diasemi.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] regulator: da9062: refactor buck modes into header
Date:   Wed, 13 Nov 2019 14:40:13 +0100
Message-Id: <1573652416-9848-2-git-send-email-chf.fritz@googlemail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1573652416-9848-1-git-send-email-chf.fritz@googlemail.com>
References: <1573652416-9848-1-git-send-email-chf.fritz@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch refactors buck modes into a header file so that device trees
can make use of these mode constants.

The new header filename uses da9063 because DA9063 was the earlier chip
and its driver code will want updating at some point in a similar manner.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/regulator/da9062-regulator.c               | 28 ++++++++--------------
 .../dt-bindings/regulator/dlg,da9063-regulator.h   | 16 +++++++++++++
 2 files changed, 26 insertions(+), 18 deletions(-)
 create mode 100644 include/dt-bindings/regulator/dlg,da9063-regulator.h

diff --git a/drivers/regulator/da9062-regulator.c b/drivers/regulator/da9062-regulator.c
index 4b24518..601002e 100644
--- a/drivers/regulator/da9062-regulator.c
+++ b/drivers/regulator/da9062-regulator.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/of_regulator.h>
 #include <linux/mfd/da9062/core.h>
 #include <linux/mfd/da9062/registers.h>
+#include <dt-bindings/regulator/dlg,da9063-regulator.h>
 
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
+		val = DA9063_BUCK_MODE_SYNC;
 		break;
 	case REGULATOR_MODE_NORMAL:
-		val = BUCK_MODE_AUTO;
+		val = DA9063_BUCK_MODE_AUTO;
 		break;
 	case REGULATOR_MODE_STANDBY:
-		val = BUCK_MODE_SLEEP;
+		val = DA9063_BUCK_MODE_SLEEP;
 		break;
 	default:
 		return -EINVAL;
@@ -145,14 +138,13 @@ static unsigned da9062_buck_get_mode(struct regulator_dev *rdev)
 
 	switch (val) {
 	default:
-	case BUCK_MODE_MANUAL:
 		/* Sleep flag bit decides the mode */
 		break;
-	case BUCK_MODE_SLEEP:
+	case DA9063_BUCK_MODE_SLEEP:
 		return REGULATOR_MODE_STANDBY;
-	case BUCK_MODE_SYNC:
+	case DA9063_BUCK_MODE_SYNC:
 		return REGULATOR_MODE_FAST;
-	case BUCK_MODE_AUTO:
+	case DA9063_BUCK_MODE_AUTO:
 		return REGULATOR_MODE_NORMAL;
 	}
 
@@ -279,13 +271,13 @@ static int da9062_buck_set_suspend_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_FAST:
-		val = BUCK_MODE_SYNC;
+		val = DA9063_BUCK_MODE_SYNC;
 		break;
 	case REGULATOR_MODE_NORMAL:
-		val = BUCK_MODE_AUTO;
+		val = DA9063_BUCK_MODE_AUTO;
 		break;
 	case REGULATOR_MODE_STANDBY:
-		val = BUCK_MODE_SLEEP;
+		val = DA9063_BUCK_MODE_SLEEP;
 		break;
 	default:
 		return -EINVAL;
diff --git a/include/dt-bindings/regulator/dlg,da9063-regulator.h b/include/dt-bindings/regulator/dlg,da9063-regulator.h
new file mode 100644
index 00000000..1de710d
--- /dev/null
+++ b/include/dt-bindings/regulator/dlg,da9063-regulator.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_REGULATOR_DLG_DA9063_H
+#define _DT_BINDINGS_REGULATOR_DLG_DA9063_H
+
+/*
+ * These buck mode constants may be used to specify values in device tree
+ * properties (e.g. regulator-initial-mode).
+ * A description of the following modes is in the manufacturers datasheet.
+ */
+
+#define DA9063_BUCK_MODE_SLEEP		1
+#define DA9063_BUCK_MODE_SYNC		2
+#define DA9063_BUCK_MODE_AUTO		3
+
+#endif
-- 
2.1.4

