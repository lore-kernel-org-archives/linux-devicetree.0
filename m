Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1BFC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF78420849
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ock+IgY9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgGJF0I (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 01:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgGJFZj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 01:25:39 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842A4C08E85B
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 22:25:37 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 205so5679048yby.19
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 22:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rvt07E/G4Y3HgzjtCgi9q4wlTsU980JvgAHfFfxfTkk=;
        b=Ock+IgY9qdX4YDm3IA6N1vBTSz6q6HQ3LMZJu3aWh7PUhb/fSa7/e/vFX7G/ZnASle
         YhC3Y16TeMnAe8u4GcoRTXeyLI2uFB6O+aohMVj2BvyBrMg9Kgxz8U0P4aeoSJEZE+DU
         ykz7XAifBqYDXsh2WmTbwt2nYlW2YNDAqkDbkkPUJXEr+bQxh2ax34gFS60X5zP/C8sB
         0UewzbA0s3JcwlET+ATFS5hUUZmgiSMosrGudMnSP1PUHSKQZFdbnhGwOWLQ3AXKJmzj
         DV1FD135KWEosQLnY63INaDy4x9uVvJyFALB3S/Zdw1b5SKNuVAKVZygFOX/fYGPhmD7
         l63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rvt07E/G4Y3HgzjtCgi9q4wlTsU980JvgAHfFfxfTkk=;
        b=iiG090OUs9erEMs6wYEq/z4vDZiBY6uZDK3GseJJG9/3SboMdpb8RbU/jLsTET+qtN
         Bc2p71ZRD9/4vqt0wOcDT65w3OHhFUT7sERe8+BoFWCXtYFhUGsDH0INiIQn8iSI0v/M
         p5YNFHNF0WxNkaLNCXgRI0DXuHFzu9KmqyZ8VnHmT0J+JB2Pj1IYzWPMcWpMV5HBz9uk
         eQhEBZap+Kd75TPZAtsbuZT+RXdT0rHs12pWxnFjECj0CrC3hWa/q0O5yeCTYP4DIukn
         /sYhRbtgsVIqkArgLzl/RsOGdaaXnb/KXwWdGtP6Vt+5MUZ7nPt5ad28cb/x4YrwqAAk
         kyFw==
X-Gm-Message-State: AOAM5302iR/LYy2iCItu5Kq4K/yIll0aZuScnOKNa1t9zTJlx9q75bRb
        gxNlyEzXI/aQdhkNvQ9ml9FhvUtCKL/V
X-Google-Smtp-Source: ABdhPJywn1lcKRT98+mACJg5K/qX5eN7ZPxXtFLfkUv1EO1uiB+3ueV8J3p6VYMYWvGCYE74XQheqyTaFl71
X-Received: by 2002:a25:be02:: with SMTP id h2mr110770934ybk.315.1594358736784;
 Thu, 09 Jul 2020 22:25:36 -0700 (PDT)
Date:   Fri, 10 Jul 2020 13:25:05 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-7-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 6/6] ASoC: mediatek: mt8183-da7219: support HDMI jack reporting
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Supports HDMI jack reporting.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index ba120e9441d0..f7bc007bbdec 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -142,6 +142,7 @@ config SND_SOC_MT8183_DA7219_MAX98357A
 	select SND_SOC_RT1015
 	select SND_SOC_DA7219
 	select SND_SOC_BT_SCO
+	select SND_SOC_HDMI_CODEC
 	help
 	  This adds ASoC driver for Mediatek MT8183 boards
 	  with the DA7219 MAX98357A RT1015 audio codec.
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index cbef4a538224..edfbf34a2f45 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <sound/hdmi-codec.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -26,7 +27,7 @@
 #define RT1015_DEV1_NAME "rt1015.6-0029"
 
 struct mt8183_da7219_max98357_priv {
-	struct snd_soc_jack headset_jack;
+	struct snd_soc_jack headset_jack, hdmi_jack;
 };
 
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -357,6 +358,21 @@ SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+static int mt8183_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mt8183_da7219_max98357_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &priv->hdmi_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return hdmi_codec_set_jack_detect(asoc_rtd_to_codec(rtd, 0)->component,
+					  &priv->hdmi_jack);
+}
+
 static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 	/* FE */
 	{
@@ -511,6 +527,7 @@ static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
+		.init = mt8183_da7219_max98357_hdmi_init,
 		SND_SOC_DAILINK_REG(tdm),
 	},
 };
-- 
2.27.0.383.g050319c2ae-goog

