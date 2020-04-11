Return-Path: <SRS0=gZHh=53=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0350C2BB85
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Apr 2020 08:04:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8904B20692
	for <linux-devicetree@archiver.kernel.org>; Sat, 11 Apr 2020 08:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Oncp7HXG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgDKIEu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 11 Apr 2020 04:04:50 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:25069 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725905AbgDKIEu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sat, 11 Apr 2020 04:04:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586592290; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rrzX+ketE8liRSQeYxzXWxe01TDmOvv8yvmqAlD4FDc=; b=Oncp7HXGaEoFVafsCAF+NhPrRw2MldCBGl9fOJxxs9IqMktX/Oefqxvbgvx0RwYFusVitJZX
 33ssUs+3EwENWzEYZSLJXPT8Q0Ihx/ZTWgv5Z7OTrwXLrsZozNKpOQCZEEeCtvWJ4DA6p3Bj
 zCUpDgSIXOf3u4QohgG6yDXcOKE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e917a1f.7f8abad29ca8-smtp-out-n03;
 Sat, 11 Apr 2020 08:04:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 93C1CC43636; Sat, 11 Apr 2020 08:04:46 +0000 (UTC)
Received: from c-ajitp-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ajitp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A6C2C43637;
        Sat, 11 Apr 2020 08:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A6C2C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=ajitp@codeaurora.org
From:   Ajit Pandey <ajitp@codeaurora.org>
To:     alsa-devel@alsa-project.org, broonie@kernel.org,
        devicetree@vger.kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, srinivas.kandagatla@linaro.org
Cc:     linux-kernel@vger.kernel.org, tiwai@suse.com,
        Ajit Pandey <ajitp@codeaurora.org>
Subject: [PATCH 11/11] ASoC: qcom: lpass-platform: Replace card->dev with component->dev
Date:   Sat, 11 Apr 2020 13:32:51 +0530
Message-Id: <1586592171-31644-12-git-send-email-ajitp@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We are allocating dma memory for component->dev but trying to mmap
such memory for substream->pcm->card->dev. Replace device argument
in mmap with component->dev to fix this.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
---
 sound/soc/qcom/lpass-platform.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 821599e..9ab2dd5 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -401,9 +401,8 @@ static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
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
1.9.1
