Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDEFC5DF60
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 10:05:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23DC7206C3
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 10:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LUugsRgu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387725AbfKGKFK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 05:05:10 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42838 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfKGKFK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 05:05:10 -0500
Received: by mail-wr1-f66.google.com with SMTP id a15so2265151wrf.9
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 02:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kEhXMhXFOLLSIYkEe6y+Ps/9m3AxUyss8WITOvfYk3w=;
        b=LUugsRguvP4FPzIeQ8XTevKWhLPJFbtPz/2fcT7p66fIRtsK1IeZJlxpAl8TcdYpzw
         FZqOdmsNwF8/bIWHx/t7Rz4fzmliXqfaqycNruMxlPv1JLVy/ZzfxGPmJTr6O+g69u57
         LwIzmX6VI6HfG8x1/cdjH9jS3U1R1oCdoOipPsLuxZzU4qdQyK62+h1OSfwgmJJkdJa8
         +3PpPc5UZdFa/ojGNZwPYqIkP+A2rVMsUO+UbDvWEafLFBnvxD0YMYJimqAZItVaN52r
         lLLC6o2Gt4J0KlTOx8aVnnGMqhA4QDFzMkR3o/IoL9MNyWAA0aCthoKuKsD7JCy1ZqKx
         kFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kEhXMhXFOLLSIYkEe6y+Ps/9m3AxUyss8WITOvfYk3w=;
        b=gX/wstYNPcKJRM9rASLyzdIEFpCQxE7y3Ys9NV3Pyg44rstefH5YC/MEFp2hw0J00D
         NTcNt3N8DD/6MAZkztQPM/UrAxH8IjUSNWjR94m7oR2Pg5WI6SJI3qFAoM/KZBUsbupw
         Fyazqi3E4RNAGSPIztDroblqJADyEDLjiTu8gb5+CraL/JL4Ddiw6nFJBlElhgUaillP
         6DrSRIJ9dAviUphUmaeLJeuuOmVWSZX+DmOP3ZTauyvOuexO8J9mRkMIyECkECJ8AHbv
         daRuf8nzK4lqPNMCA169YCIjHWlC4R0h8sYmnA9mPKT1bZjk8CaKhM6PWGxrxjP6NIUZ
         wKuw==
X-Gm-Message-State: APjAAAXaWZZLD6s7AWDj6rIErYHkc6gA7sjvYstYcdGguFAsvth0p88L
        jdX8K5tcTWRhr49ofKAlL80=
X-Google-Smtp-Source: APXvYqy6v8CkZSM6HMXERGqlNin63tr1BgVsHiXp+80nR/V9jbbeocpl7GMXE8bBN6NCIERmTL/LGQ==
X-Received: by 2002:adf:ef10:: with SMTP id e16mr1189636wro.58.1573121108302;
        Thu, 07 Nov 2019 02:05:08 -0800 (PST)
Received: from mars.home (HSI-KBW-109-192-080-035.hsi6.kabel-badenwuerttemberg.de. [109.192.80.35])
        by smtp.googlemail.com with ESMTPSA id v184sm2225860wme.31.2019.11.07.02.05.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Nov 2019 02:05:07 -0800 (PST)
From:   Christoph Fritz <chf.fritz@googlemail.com>
To:     Fabio Estevam <festevam@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Support Opensource <support.opensource@diasemi.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 2/4] regulator: da9062: add of_map_mode support for bucks
Date:   Thu,  7 Nov 2019 11:04:08 +0100
Message-Id: <1573121050-4728-3-git-send-email-chf.fritz@googlemail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
References: <1573121050-4728-1-git-send-email-chf.fritz@googlemail.com>
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
index 1a95982..f5f2ead 100644
--- a/drivers/regulator/da9062-regulator.c
+++ b/drivers/regulator/da9062-regulator.c
@@ -98,6 +98,20 @@ static const unsigned int da9062_buck_b_limits[] = {
 	2300000, 2400000, 2500000, 2600000, 2700000, 2800000, 2900000, 3000000
 };
 
+static unsigned int da906x_map_buck_mode(unsigned int mode)
+{
+	switch (mode) {
+	case DA906X_BUCK_MODE_SLEEP:
+		return REGULATOR_MODE_STANDBY;
+	case DA906X_BUCK_MODE_SYNC:
+		return REGULATOR_MODE_FAST;
+	case DA906X_BUCK_MODE_AUTO:
+		return REGULATOR_MODE_NORMAL;
+	default:
+		return -EINVAL;
+	}
+}
+
 static int da9062_buck_set_mode(struct regulator_dev *rdev, unsigned mode)
 {
 	struct da9062_regulator *regl = rdev_get_drvdata(rdev);
@@ -363,6 +377,7 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK1_A,
 		.desc.vsel_mask = DA9062AA_VBUCK1_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da906x_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK1_A,
 			__builtin_ffs((int)DA9062AA_BUCK1_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -399,6 +414,7 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK3_A,
 		.desc.vsel_mask = DA9062AA_VBUCK3_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da906x_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK3_A,
 			__builtin_ffs((int)DA9062AA_BUCK3_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -435,6 +451,7 @@ static const struct da9062_regulator_info local_da9061_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK4_A,
 		.desc.vsel_mask = DA9062AA_VBUCK4_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da906x_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK4_A,
 			__builtin_ffs((int)DA9062AA_BUCK4_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -607,6 +624,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK1_A,
 		.desc.vsel_mask = DA9062AA_VBUCK1_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da906x_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK1_A,
 			__builtin_ffs((int)DA9062AA_BUCK1_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -643,6 +661,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK2_A,
 		.desc.vsel_mask = DA9062AA_VBUCK2_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da906x_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK2_A,
 			__builtin_ffs((int)DA9062AA_BUCK2_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -679,6 +698,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK3_A,
 		.desc.vsel_mask = DA9062AA_VBUCK3_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da906x_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK3_A,
 			__builtin_ffs((int)DA9062AA_BUCK3_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
@@ -715,6 +735,7 @@ static const struct da9062_regulator_info local_da9062_regulator_info[] = {
 		.desc.vsel_reg = DA9062AA_VBUCK4_A,
 		.desc.vsel_mask = DA9062AA_VBUCK4_A_MASK,
 		.desc.linear_min_sel = 0,
+		.desc.of_map_mode = da906x_map_buck_mode,
 		.sleep = REG_FIELD(DA9062AA_VBUCK4_A,
 			__builtin_ffs((int)DA9062AA_BUCK4_SL_A_MASK) - 1,
 			sizeof(unsigned int) * 8 -
-- 
2.1.4

