Return-Path: <SRS0=pmuo=6W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF35C38A2A
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 20:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D66F218AC
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 May 2020 20:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jvPyzxVG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgEHUm4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 May 2020 16:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727915AbgEHUmz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 May 2020 16:42:55 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EA5C061A0C
        for <devicetree@vger.kernel.org>; Fri,  8 May 2020 13:42:55 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t16so1243179plo.7
        for <devicetree@vger.kernel.org>; Fri, 08 May 2020 13:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DBvISRtpj6ZqDP4JNGI7EM2+JDDMjKa0Ql2Nl6B4K8c=;
        b=jvPyzxVGco9HTkHQkxsTY3p+qIGeyEvgudaaAcCJFYldGgN96fd6jlMbM+k3MIO6sP
         GTDlp98gYKOoOkFPYRyoOPG+cZduT4/VcGbvP6/oRRnh78tssG8N0uqPdhOCF0a0TBMq
         xLs9F1CqmUh15ju+uyC4griAqlcVk6bns23fk/6Hr15MYzdNJpLtmz6kz2t95lEXU4d/
         lwKjN7pMYujqMl/hg0Wsn4+ZtfeaHvc8Qz4AXckC6sT+TOAJILMg6ATBWr+4T/VtDiud
         gYu0yx8sSQqlMrITsgpKoeJyQ8l4BBIUS7A8e+4VwDOlytZQ7ZTETNNZlb9nAWEH7z/w
         Vm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DBvISRtpj6ZqDP4JNGI7EM2+JDDMjKa0Ql2Nl6B4K8c=;
        b=pSZxankN2HEzz7P2iyeDnnC23RQ1ECjbC86gEcuXO/4N4CwwilNVs3+UutQNshB/Mv
         sp9XWgSprQm6JTL6zNRFjy+nRIcJxMUmd1xBJHl1nG9t0Z3gzUm2bAQic3wmBAokjbAJ
         2P2mazvnBsvefZ/cDmgN7MsC2Mq9diR6nUJQEBJWZfLupAbJ4wFaD1vAmwJm5SrWxZSj
         Y86S/1AkN6xUR62kPScuC9adPnkjR6O1Nok7GnRgTkAaB9EkrOre0lvWs+xIQe6+YXhE
         0xJnoma3ClP6q2vj+rOwhnR/93himNdkQRcsxFnNCYZW9+64GIyDM6kNqgdeXrW1jjx2
         4qEQ==
X-Gm-Message-State: AGi0PuZquRltbbjRDT9sdPVTKn8T+JUvMZCLGhNVX7wNe/Qif4QHXUig
        04o3AtuLRzEplcaKv9lgMIxRPg==
X-Google-Smtp-Source: APiQypLV5wFjcNDBDTnRo4F/SCWSkSNmFNrTDkI8vtbYEwihD8GVHkCxIzqXEOFp/ECNQVc0NaxUnA==
X-Received: by 2002:a17:90a:d703:: with SMTP id y3mr7955493pju.75.1588970575321;
        Fri, 08 May 2020 13:42:55 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id h191sm2670720pfe.44.2020.05.08.13.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2020 13:42:54 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [v2 4/4] regulator: qcom: labibb: Add SC interrupt handling
Date:   Sat,  9 May 2020 02:12:00 +0530
Message-Id: <20200508204200.13481-5-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508204200.13481-1-sumit.semwal@linaro.org>
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Nisha Kumari <nishakumari@codeaurora.org>

Add Short circuit interrupt handling and recovery for the lab and
ibb regulators on qcom platforms.

The client panel drivers need to register for REGULATOR_EVENT_OVER_CURRENT
notification which will be triggered on short circuit. They should
try to enable the regulator once, and if it doesn't get enabled,
handle shutting down the panel accordingly.

Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>

--
v2: sumits: reworked handling to user regmap_read_poll_timeout, and handle it
    per-regulator instead of clearing both lab and ibb errors on either irq
    triggering. Also added REGULATOR_EVENT_OVER_CURRENT handling and
    notification to clients.
---
 drivers/regulator/qcom-labibb-regulator.c | 103 +++++++++++++++++++++-
 1 file changed, 100 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index a9dc7c060375..3539631c9f96 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2019, The Linux Foundation. All rights reserved.
 
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/of.h>
@@ -18,11 +19,15 @@
 #define REG_LABIBB_ENABLE_CTL		0x46
 #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
 #define LABIBB_CONTROL_ENABLE		BIT(7)
+#define LABIBB_STATUS1_SC_DETECT_BIT	BIT(6)
 
 #define LAB_ENABLE_CTL_MASK		BIT(7)
 #define IBB_ENABLE_CTL_MASK		(BIT(7) | BIT(6))
 
 #define POWER_DELAY			8000
+#define POLLING_SCP_DONE_INTERVAL_US	5000
+#define POLLING_SCP_TIMEOUT		16000
+
 
 struct labibb_regulator {
 	struct regulator_desc		desc;
@@ -30,6 +35,8 @@ struct labibb_regulator {
 	struct regmap			*regmap;
 	struct regulator_dev		*rdev;
 	u16				base;
+	int				sc_irq;
+	int				vreg_enabled;
 	u8				type;
 };
 
@@ -112,9 +119,10 @@ static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
 		return ret;
 	}
 
-	if (ret)
+	if (ret) {
+		reg->vreg_enabled = 1;
 		return 0;
-
+	}
 
 	dev_err(reg->dev, "Can't enable %s\n", reg->desc.name);
 	return -EINVAL;
@@ -140,8 +148,10 @@ static int qcom_labibb_regulator_disable(struct regulator_dev *rdev)
 		return ret;
 	}
 
-	if (!ret)
+	if (!ret) {
+		reg->vreg_enabled = 0;
 		return 0;
+	}
 
 	dev_err(reg->dev, "Can't disable %s\n", reg->desc.name);
 	return -EINVAL;
@@ -153,6 +163,70 @@ static struct regulator_ops qcom_labibb_ops = {
 	.is_enabled		= qcom_labibb_regulator_is_enabled,
 };
 
+
+static irqreturn_t labibb_sc_err_handler(int irq, void *_reg)
+{
+	int ret, count;
+	u16 reg;
+	u8 sc_err_mask;
+	unsigned int val;
+	struct labibb_regulator *labibb_reg = (struct labibb_regulator *)_reg;
+	bool in_sc_err, reg_en, scp_done = false;
+
+	if (irq == labibb_reg->sc_irq)
+		reg = labibb_reg->base + REG_LABIBB_STATUS1;
+	else
+		return IRQ_HANDLED;
+
+	sc_err_mask = LABIBB_STATUS1_SC_DETECT_BIT;
+
+	ret = regmap_bulk_read(labibb_reg->regmap, reg, &val, 1);
+	if (ret < 0) {
+		dev_err(labibb_reg->dev, "Read failed, ret=%d\n", ret);
+		return IRQ_HANDLED;
+	}
+	dev_dbg(labibb_reg->dev, "%s SC error triggered! STATUS1 = %d\n",
+		labibb_reg->desc.name, val);
+
+	in_sc_err = !!(val & sc_err_mask);
+
+	/*
+	 * The SC(short circuit) fault would trigger PBS(Portable Batch
+	 * System) to disable regulators for protection. This would
+	 * cause the SC_DETECT status being cleared so that it's not
+	 * able to get the SC fault status.
+	 * Check if the regulator is enabled in the driver but
+	 * disabled in hardware, this means a SC fault had happened
+	 * and SCP handling is completed by PBS.
+	 */
+	if (!in_sc_err) {
+
+		reg = labibb_reg->base + REG_LABIBB_ENABLE_CTL;
+
+		ret = regmap_read_poll_timeout(labibb_reg->regmap,
+					reg, val,
+					!(val & LABIBB_CONTROL_ENABLE),
+					POLLING_SCP_DONE_INTERVAL_US,
+					POLLING_SCP_TIMEOUT);
+
+		if (!ret && labibb_reg->vreg_enabled) {
+			dev_dbg(labibb_reg->dev,
+				"%s has been disabled by SCP\n",
+				labibb_reg->desc.name);
+			scp_done = true;
+		}
+	}
+
+	if (in_sc_err || scp_done) {
+		regulator_lock(labibb_reg->rdev);
+		regulator_notifier_call_chain(labibb_reg->rdev,
+						REGULATOR_EVENT_OVER_CURRENT,
+						NULL);
+		regulator_unlock(labibb_reg->rdev);
+	}
+	return IRQ_HANDLED;
+}
+
 static int register_labibb_regulator(struct qcom_labibb *labibb,
 				const struct labibb_regulator_data *reg_data,
 				struct device_node *of_node)
@@ -181,6 +255,29 @@ static int register_labibb_regulator(struct qcom_labibb *labibb,
 	reg->desc.type = REGULATOR_VOLTAGE;
 	reg->desc.ops = &qcom_labibb_ops;
 
+	reg->sc_irq = -EINVAL;
+	ret = of_irq_get_byname(of_node, reg_data->irq_name);
+	if (ret < 0)
+		dev_dbg(labibb->dev,
+			"Unable to get %s, ret = %d\n",
+			reg_data->irq_name, ret);
+	else
+		reg->sc_irq = ret;
+
+	if (reg->sc_irq > 0) {
+		ret = devm_request_threaded_irq(labibb->dev,
+						reg->sc_irq,
+						NULL, labibb_sc_err_handler,
+						IRQF_ONESHOT |
+						IRQF_TRIGGER_RISING,
+						reg_data->irq_name, labibb);
+		if (ret) {
+			dev_err(labibb->dev, "Failed to register '%s' irq ret=%d\n",
+				reg_data->irq_name, ret);
+			return ret;
+		}
+	}
+
 	cfg.dev = labibb->dev;
 	cfg.driver_data = reg;
 	cfg.regmap = labibb->regmap;
-- 
2.26.2

