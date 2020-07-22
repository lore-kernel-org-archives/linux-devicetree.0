Return-Path: <SRS0=Wzi+=BB=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DA1C433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 10:32:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 142DF20729
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Jul 2020 10:32:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="E9tLlZLy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731951AbgGVKcf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jul 2020 06:32:35 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:31079 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729864AbgGVKce (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 22 Jul 2020 06:32:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595413953; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=x7wA4+lvojLjr8mShenRnk8ElOYsHwhXwXEZ2cLlr/Q=; b=E9tLlZLy8SjymtwL1RWsTzbzLB3kVjC3MLWnxu2sWGrcTN8vO5Rio0Ma4p6XnyLj3G8wnrMx
 lKSY0cNyDHZrHBKPqKFxHab0F9CzeVw5gIXiPeYrgz+RaPtB32ER+jPpoJzdY8dmonr1G9/W
 IB1aMu9lZwIEOZy/IYttIbEQYb8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5f1815b6ed710aec62f6dfa8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 10:32:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A502FC43395; Wed, 22 Jul 2020 10:32:21 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8105AC433CA;
        Wed, 22 Jul 2020 10:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8105AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
From:   Rohit kumar <rohitkr@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH v4 01/12] ASoC: qcom: Add common array to initialize soc based core clocks
Date:   Wed, 22 Jul 2020 16:01:44 +0530
Message-Id: <1595413915-17867-2-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

LPASS variants have their own soc specific clocks that needs to be
enabled for MI2S audio support. Added a common variable in drvdata to
initialize such clocks using bulk clk api. Such clock names is
defined in variants specific data and needs to fetched during init.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c | 39 +++++++++++++++++++--------------------
 sound/soc/qcom/lpass.h         | 10 +++++++---
 2 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index b3610d0..8210e37 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -161,32 +161,27 @@ static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
 static int apq8016_lpass_init(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct lpass_variant *variant = drvdata->variant;
 	struct device *dev = &pdev->dev;
-	int ret;
+	int ret, i;
 
-	drvdata->pcnoc_mport_clk = devm_clk_get(dev, "pcnoc-mport-clk");
-	if (IS_ERR(drvdata->pcnoc_mport_clk)) {
-		dev_err(dev, "error getting pcnoc-mport-clk: %ld\n",
-			PTR_ERR(drvdata->pcnoc_mport_clk));
-		return PTR_ERR(drvdata->pcnoc_mport_clk);
-	}
 
-	ret = clk_prepare_enable(drvdata->pcnoc_mport_clk);
+	drvdata->clks = devm_kcalloc(dev, variant->num_clks,
+				     sizeof(*drvdata->clks), GFP_KERNEL);
+	drvdata->num_clks = variant->num_clks;
+
+	for (i = 0; i < drvdata->num_clks; i++)
+		drvdata->clks[i].id = variant->clk_name[i];
+
+	ret = devm_clk_bulk_get(dev, drvdata->num_clks, drvdata->clks);
 	if (ret) {
-		dev_err(dev, "Error enabling pcnoc-mport-clk: %d\n", ret);
+		dev_err(dev, "Failed to get clocks %d\n", ret);
 		return ret;
 	}
 
-	drvdata->pcnoc_sway_clk = devm_clk_get(dev, "pcnoc-sway-clk");
-	if (IS_ERR(drvdata->pcnoc_sway_clk)) {
-		dev_err(dev, "error getting pcnoc-sway-clk: %ld\n",
-			PTR_ERR(drvdata->pcnoc_sway_clk));
-		return PTR_ERR(drvdata->pcnoc_sway_clk);
-	}
-
-	ret = clk_prepare_enable(drvdata->pcnoc_sway_clk);
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
 	if (ret) {
-		dev_err(dev, "Error enabling pcnoc_sway_clk: %d\n", ret);
+		dev_err(dev, "apq8016 clk_enable failed\n");
 		return ret;
 	}
 
@@ -197,8 +192,7 @@ static int apq8016_lpass_exit(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(drvdata->pcnoc_mport_clk);
-	clk_disable_unprepare(drvdata->pcnoc_sway_clk);
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
 
 	return 0;
 }
@@ -219,6 +213,11 @@ static struct lpass_variant apq8016_data = {
 	.wrdma_reg_stride	= 0x1000,
 	.wrdma_channel_start	= 5,
 	.wrdma_channels		= 2,
+	.clk_name		= (const char*[]) {
+				   "pcnoc-mport-clk",
+				   "pcnoc-sway-clk",
+				  },
+	.num_clks		= 2,
 	.dai_driver		= apq8016_lpass_cpu_dai_driver,
 	.num_dai		= ARRAY_SIZE(apq8016_lpass_cpu_dai_driver),
 	.dai_osr_clk_names	= (const char *[]) {
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index bd19ec5..450020e 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -51,9 +51,9 @@ struct lpass_data {
 	/* used it for handling interrupt per dma channel */
 	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
 
-	/* 8016 specific */
-	struct clk *pcnoc_mport_clk;
-	struct clk *pcnoc_sway_clk;
+	/* SOC specific clock list */
+	struct clk_bulk_data *clks;
+	int num_clks;
 
 };
 
@@ -89,6 +89,10 @@ struct lpass_variant {
 	int num_dai;
 	const char * const *dai_osr_clk_names;
 	const char * const *dai_bit_clk_names;
+
+	/* SOC specific clocks configuration */
+	const char **clk_name;
+	int num_clks;
 };
 
 /* register the platform driver from the CPU DAI driver */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

