Return-Path: <SRS0=HlsD=ZF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4E5C17447
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 13:41:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47A3122469
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 Nov 2019 13:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JSZUvjnv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfKMNlH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 Nov 2019 08:41:07 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33722 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727001AbfKMNlH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Nov 2019 08:41:07 -0500
Received: by mail-wr1-f66.google.com with SMTP id w9so2439266wrr.0
        for <devicetree@vger.kernel.org>; Wed, 13 Nov 2019 05:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=z396xoABmCvtIfoOGcHfju2S8iT7p9lme+ZFMQUZfmU=;
        b=JSZUvjnvfTYW2BqyR8frEbpl8m3LYdSvC4nMhWsl7+PbJ0sJe3ZjR+JgXsKsXxevcj
         TYAVmlGZcTuzkd6Fdd76ZbZY7OKLMcJ6xLK1D3iZiWpjylOBKmbhxlF8c4OvB3CkFzVY
         xqKJpJ8EfSZsVYaA0Mb2LC4mM8lIJ4r3UL208Ee1yiwyYKVUrw/qJD/DMVWgi02zAuel
         gFxazBCiVPbeDcCQ3B7v7VxlAEWqiGLu7ZiQbbXt22AdGporJXObdHgtJnq95pj6Fk6l
         3jo+K0+RVrQugX9SWAQBV9/MsSSBACl+CFs/OeM9vqDFsUr7RoyYPsjyVH4uC17TMtlL
         nS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=z396xoABmCvtIfoOGcHfju2S8iT7p9lme+ZFMQUZfmU=;
        b=bYkJsCuLv+H6pJnYHahHqgpwN31WRpN4Cx4paEBTm9zUbyDbJdGLx9f3mkMjIMqvgc
         NoWvL3JUKHOpNekZy5aTVs6Ww1TMu+OvIY5DC+hs+Dy+RFDHWwIiKBf8o0MdC+BWjwWL
         iAkfCmLmclXg+JPkgQrV0td+RjksIeLmCMjqHgN4HWNQWloISXpF2zuY0nqqf1BaXJde
         Plln0yInREXC7VnmoF+q013sOO3+lMB/U8CGH2em/j3kce65YSeG3bA74dzEaweMko2o
         j7al3crQAbWKZzi35EF52rDFfMkgVHnTkwnY4rS1DAnCKG3J3vSuqCxTMmC7hVrfBUv5
         Pdmw==
X-Gm-Message-State: APjAAAWBeHH/paz1Xj+YdqOAjHnvCYyzlgr0+5e3+08jjJ8ArQiIp3Ed
        M16pqzZ6M2BcufODpYU/KDg=
X-Google-Smtp-Source: APXvYqyNgmOe/bUP9uPtIIzi51yTDGJBVprgB7WW9ikZ+2AW1qATLCTa/Ucd4U5GSp13VyxbmcJVYA==
X-Received: by 2002:a5d:4f06:: with SMTP id c6mr2947765wru.211.1573652464794;
        Wed, 13 Nov 2019 05:41:04 -0800 (PST)
Received: from mars.home (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.googlemail.com with ESMTPSA id r15sm4195831wrc.5.2019.11.13.05.41.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 05:41:04 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2 2/4] regulator: da9062: add of_map_mode support for bucks
Date:   Wed, 13 Nov 2019 14:40:14 +0100
Message-Id: <1573652416-9848-3-git-send-email-chf.fritz@googlemail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1573652416-9848-1-git-send-email-chf.fritz@googlemail.com>
References: <1573652416-9848-1-git-send-email-chf.fritz@googlemail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds of_map_mode support for bucks to set regulator modes
from within regulator framework.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
Signed-off-by: Christian Hemp <c.hemp@phytec.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 drivers/regulator/da9062-regulator.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/regulator/da9062-regulator.c b/drivers/regulator/da9062-regulator.c
index 601002e..29f4a60 100644
--- a/drivers/regulator/da9062-regulator.c
+++ b/drivers/regulator/da9062-regulator.c
@@ -98,6 +98,20 @@ static const unsigned int da9062_buck_b_limits[] = {
 	2300000, 2400000, 2500000, 2600000, 2700000, 2800000, 2900000, 3000000
 };
 
+static unsigned int da9062_map_buck_mode(unsigned int mode)
+{
+	switch (mode) {
+	case DA9063_BUCK_MODE_SLEEP:
+		return REGULATOR_MODE_STANDBY;
+	case DA9063_BUCK_MODE_SYNC:
+		return REGULATOR_MODE_FAST;
+	case DA9063_BUCK_MODE_AUTO:
+		return REGULATOR_MODE_NORMAL;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int da9062_buck_set_mode(struct regulator_dev *rdev, unsigned mode)
 {
 	struct da9062_regulator *regl = rdev_get_drvdata(rdev);
@@ -360,6 +374,7 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK1_A,
 		.desc.vsel_mask = DA9062AA_VBUCK1_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da9062_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK1_A,
 			__builtin_ffs((int)DA9062AA_BUCK1_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -396,6 +411,7 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK3_A,
 		.desc.vsel_mask = DA9062AA_VBUCK3_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da9062_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK3_A,
 			__builtin_ffs((int)DA9062AA_BUCK3_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -432,6 +448,7 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK4_A,
 		.desc.vsel_mask = DA9062AA_VBUCK4_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da9062_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK4_A,
 			__builtin_ffs((int)DA9062AA_BUCK4_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -604,6 +621,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK1_A,
 		.desc.vsel_mask = DA9062AA_VBUCK1_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da9062_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK1_A,
 			__builtin_ffs((int)DA9062AA_BUCK1_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -640,6 +658,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK2_A,
 		.desc.vsel_mask = DA9062AA_VBUCK2_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da9062_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK2_A,
 			__builtin_ffs((int)DA9062AA_BUCK2_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -676,6 +695,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK3_A,
 		.desc.vsel_mask = DA9062AA_VBUCK3_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da9062_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK3_A,
 			__builtin_ffs((int)DA9062AA_BUCK3_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -712,6 +732,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK4_A,
 		.desc.vsel_mask = DA9062AA_VBUCK4_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da9062_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK4_A,
 			__builtin_ffs((int)DA9062AA_BUCK4_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
-- 
2.1.4

