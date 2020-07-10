Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B96DC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:28:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E215C2076A
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rutmYKmp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgGJF0W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 01:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgGJFZd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 01:25:33 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDA0C08E81E
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 22:25:33 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id w35so5781749ybi.16
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 22:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=tgx1/z4Ge0ad0sjsQ0jzGb9TfRKIZ57I3cV4cHGoXqQ=;
        b=rutmYKmpo55/0BSQcjnPDCi6fy7cob+iyDnew8FHrRmGG6eK5GPZxfao7BsnRL0Eqj
         ceILUQ7K4tgLgE8urMWT9//tvXOzb6nvwEHswxIcio3V8HPjz+Fc23yTsYu1dfdDvN/q
         Hc5ipY/vWNIaMza/1gXL2b66T50xc8INqmaFMcjauJn/jyuFt9VAzAWY0Rpksww4rMC5
         sh33Z51bw6daP+mA+kFHaaT9+j7GGJgmFlmAh8WVXTTMQGnvJJziw8Quh4+sK4cnkW2R
         nucDGElIpNXT0aN2gMdjxbphdpx3SqNHEwH2m0BgIJ5O+m69dnKe/wUKoAyYZEGWBcyr
         huHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tgx1/z4Ge0ad0sjsQ0jzGb9TfRKIZ57I3cV4cHGoXqQ=;
        b=pVh8J56Tkk7P6vszPUi9bqo6d/iwkCryuJx1mNdEX/DuclIBhy+LBYbSfGPGRBO9cY
         /8NVxuJIxeqKVbFJ8oJbludPKQge/OGiMQGGLsckUuKpnCjq8J2umeiWz+avWLTiFLr6
         DzB6HOiH3JnpvJWQr34RhKj+79Y8Uy8kHf4dHYnnlB4LYrj5Et8+uxnzKTJbvCclJhYd
         ZIojpbePjpmrS9BuX5yYLrUmZbp72jJE6965w9+/BkedtG9MtlReQWiec211onVnT9mO
         aRWNIa2TB9ONYANBhWn9NPEmzBeXSeF+dNeH9LZHP6QFsjyf6aGwHQxdAbzyWXu4yjnX
         dtEA==
X-Gm-Message-State: AOAM532KM6m8JlpspCvaTL62xxY5AcMZdW8rAi61pKBsl3RievUyHqnp
        6LBP4ITCgi5uO6ys8tqc7QvA8OGT5bbC
X-Google-Smtp-Source: ABdhPJyMCZkNSLsFKUn19G/Sps8R3ThNMrUeAs+hIRt2DUgCQ+qabdLdWdlMWWvA+cdoaIq0gJlmVD+jPP7f
X-Received: by 2002:a25:f603:: with SMTP id t3mr20443714ybd.49.1594358732859;
 Thu, 09 Jul 2020 22:25:32 -0700 (PDT)
Date:   Fri, 10 Jul 2020 13:25:04 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-6-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 5/6] ASoC: mediatek: mt8183-da7219: use hdmi-codec
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds DAI link to use hdmi-codec.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index bc551a4af25f..cbef4a538224 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -354,7 +354,7 @@ SND_SOC_DAILINK_DEFS(i2s5,
 
 SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_CPU("TDM")),
-	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static struct snd_soc_dai_link mt8183_da7219_dai_links[] = {
@@ -627,7 +627,7 @@ static struct snd_soc_card mt8183_da7219_rt1015_card = {
 static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
-	struct device_node *platform_node;
+	struct device_node *platform_node, *hdmi_codec;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_da7219_max98357_priv *priv;
 	struct pinctrl *pinctrl;
@@ -648,6 +648,9 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	card = (struct snd_soc_card *)match->data;
 	card->dev = &pdev->dev;
 
+	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
+				      "mediatek,hdmi-codec", 0);
+
 	for_each_card_prelinks(card, i, dai_link) {
 		if (strcmp(dai_link->name, "I2S3") == 0) {
 			if (card == &mt8183_da7219_max98357_card) {
@@ -679,6 +682,9 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 			}
 		}
 
+		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0)
+			dai_link->codecs->of_node = hdmi_codec;
+
 		if (!dai_link->platforms->name)
 			dai_link->platforms->of_node = platform_node;
 	}
-- 
2.27.0.383.g050319c2ae-goog

