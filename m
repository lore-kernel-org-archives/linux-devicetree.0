Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B7DC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 17:24:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EECCC218AC
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 17:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KiZx8uNr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfLRRYm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 12:24:42 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40628 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727225AbfLRRYe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 12:24:34 -0500
Received: by mail-wm1-f66.google.com with SMTP id t14so2793699wmi.5
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 09:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ed5DlqEWvxMQUQebFWG7u2PHMS/9BBAGCyGgvqZnXFo=;
        b=KiZx8uNrDxyr1CKrK3b3Awr2DIit9WJR7AcPGhvWh+Ke9RMBBmd6WxOoHo+tvd/q/U
         Vd88yOfuR+PmI8SIyl1Rq1yi0jopIL3Co9YOI4tOZ1xevV68SYk/Hv+F+zMeal3Dud7u
         FQE7uWelTZ2p/qj9Egevpr/DMohozAfSke97hCvCLczo8NzvXK0u2EilAijqxpLG5xOx
         yrKwR331SHgQhKO8GJEXHNt0szTAsSQKs3f+xhkQkJ9vEbdSfnFhF0E2u5uiUq4HXoHj
         a/5wUgK4r4F+MYvViijY3zW4dVF3vo75atXvOjboq7yx41hWoqaC4peqLJC5a41rRCb/
         5XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ed5DlqEWvxMQUQebFWG7u2PHMS/9BBAGCyGgvqZnXFo=;
        b=Cn9c2D85rJxWYPiupwyE0goPgi4CY58oo/R3pzzc9my5HGM8qn57OixtzhT/O+0V4D
         pBIjuAucJLgBfFLi9e2vtNoblsLWWRWX2aMNy+IoZtLgd30nlngCtGPGH28PDox2i6nK
         g0IMbF7a8inbwoBjFzceBQfOGFjdTWLUX+uRx/AnZTeSA8XBhykTbzf8z6+loyvVSKV2
         +R+cZdg1NJ0BCVvT6tHv6WUUB6f8i2mZzpNcIgPyc3Gnse8U3z84IRLK97N4jIiQJ+Qi
         0cIiAJcCc/ioeXqCRfkUwOgXo2bOdkdXlZYhoWhDVrXflF3kDUvVxytMqh1ME9BhxY69
         JsZg==
X-Gm-Message-State: APjAAAWFnXnLh3LP4xjsOcGIH6kzseDLQubg9aKhCJ8W1YF59qGC/mgy
        uU7DQKN2UFGdm/SSBzP0j9Y+VI9xgdg=
X-Google-Smtp-Source: APXvYqz1xXfHwFgFh5QLFX88XE5XgeTWKeWYDflM/DWqS6617x+CfPOPUBBnnPnD6LnKcIJMUh8fWA==
X-Received: by 2002:a1c:9814:: with SMTP id a20mr4437299wme.94.1576689872845;
        Wed, 18 Dec 2019 09:24:32 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id 4sm2883231wmg.22.2019.12.18.09.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 09:24:32 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 4/4] ASoC: meson: axg-fifo: relax period size constraints
Date:   Wed, 18 Dec 2019 18:24:20 +0100
Message-Id: <20191218172420.1199117-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218172420.1199117-1-jbrunet@baylibre.com>
References: <20191218172420.1199117-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Now that the fifo depths and thresholds are properly in the axg-fifo
driver, we can relax the constraints on period. As long as the period is a
multiple of the fifo burst size (8 bytes) things should be OK.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 8 ++++----
 sound/soc/meson/axg-fifo.h | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index c2742a02d866..c12b0d5e8ebf 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -34,7 +34,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 	.rate_max = 192000,
 	.channels_min = 1,
 	.channels_max = AXG_FIFO_CH_MAX,
-	.period_bytes_min = AXG_FIFO_MIN_DEPTH,
+	.period_bytes_min = AXG_FIFO_BURST,
 	.period_bytes_max = UINT_MAX,
 	.periods_min = 2,
 	.periods_max = UINT_MAX,
@@ -227,17 +227,17 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 
 	/*
 	 * Make sure the buffer and period size are multiple of the FIFO
-	 * minimum depth size
+	 * burst
 	 */
 	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-					 AXG_FIFO_MIN_DEPTH);
+					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
 	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
-					 AXG_FIFO_MIN_DEPTH);
+					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index 521b54e98fd3..b63acd723c87 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -31,8 +31,6 @@ struct snd_soc_pcm_runtime;
 					 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 #define AXG_FIFO_BURST			8
-#define AXG_FIFO_MIN_CNT		64
-#define AXG_FIFO_MIN_DEPTH		(AXG_FIFO_BURST * AXG_FIFO_MIN_CNT)
 
 #define FIFO_INT_ADDR_FINISH		BIT(0)
 #define FIFO_INT_ADDR_INT		BIT(1)
-- 
2.23.0

