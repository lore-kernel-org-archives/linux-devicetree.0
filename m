Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C163EC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 05:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A12AE20720
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 05:09:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="RDJ7c8BD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbgGHFJX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 01:09:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20796 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729209AbgGHFJU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 8 Jul 2020 01:09:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594184959; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VSHM2/YV7ANiTjEG5pC2jzezjdMwYMdReakR4aD7eD8=; b=RDJ7c8BDk96FJnJCMwCHyqQ0/LQSDJWa1n/DM4iJzKn3jYs0wmxspl519u7+sEF85kQZS1bC
 5KeHwkEVxKw2iNepgX7NLUk4VMkuyHAhorFZR7wXjYQL2DRcKwSmJTCAdm2faDdO4jUA1bAD
 qSOwdlicF30I2tNG5LnXRAZKcDg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-west-2.postgun.com with SMTP id
 5f0554f36e56afc68d8b5fee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 05:09:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30D5DC433C6; Wed,  8 Jul 2020 05:09:07 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DAD57C433C8;
        Wed,  8 Jul 2020 05:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DAD57C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
From:   Rohit kumar <rohitkr@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>
Subject: [PATCH v3 5/8] ASoC: qcom: lpass-platform: Replace card->dev with component->dev
Date:   Wed,  8 Jul 2020 10:38:13 +0530
Message-Id: <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

We are allocating dma memory for component->dev but trying to mmap
such memory for substream->pcm->card->dev. Replace device argument
in mmap with component->dev to fix this.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
---
 sound/soc/qcom/lpass-platform.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 445ca193..f9424cc 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -472,9 +472,8 @@ static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	return dma_mmap_coherent(substream->pcm->card->dev, vma,
-			runtime->dma_area, runtime->dma_addr,
-			runtime->dma_bytes);
+	return dma_mmap_coherent(component->dev, vma, runtime->dma_area,
+				 runtime->dma_addr, runtime->dma_bytes);
 }
 
 static irqreturn_t lpass_dma_interrupt_handler(
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

