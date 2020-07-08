Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF28C433E2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 11:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3A6120772
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 11:32:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KHOuXtI/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgGHLc5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 07:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbgGHLc4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 07:32:56 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6A0C08C5DC
        for <devicetree@vger.kernel.org>; Wed,  8 Jul 2020 04:32:56 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id u64so36401018ybf.13
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2020 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=KAsvhdCaKS8ydAQsJCHTuB9FJ5PJX04J2lATNZHfBGo=;
        b=KHOuXtI/t3agwhO9Br267H9zSxT5wJ7DdrBqD6odYCh+hqV7C/djpJ+wVJAzV+DKUL
         tXuuVhyv9o/dC10fJjFtUYV6SQ9Jad0LRS3b3BivWWPWjCRcjrF6u3UdH/dKrEjy7MSy
         h6nPbecD9N38IXtbewsBXl+RQ8JdODfVgAUH37Aj/zSk294t8IAqmME1CMITp88krYAJ
         8F9WsrRttqfFETQfkM24CNXdEC0wupOe9WrzaALqQaJJHCKX2Q8DndhdINYdW0mpyPV7
         /pCt96NQh8JmyKGN546WovFjPdeLssKB6RNlkAhIaprRgZSsFvOXSOUrDn1/Fe60dikW
         Ngag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=KAsvhdCaKS8ydAQsJCHTuB9FJ5PJX04J2lATNZHfBGo=;
        b=agx9LgQ+yCKu9tKh5egxcU6NqloshMUhjmKHvAHvtFIv6ezl3D6BNqdzNC9A65UgTR
         gBd9T4bVgbtReJF8A6iI0VVcgDtgwNleqe/HTbW5sfizc0bFizc57eoZ3VbcV4JBI/KO
         u3mTaae1RiQNb8/ikuwoG9t/c9pQEhiJhB0xT7Y2n/Mzqlj/QHsUbYOKNnTQkpMdO0QC
         akPojKN4Ot65uUOOHiptow3T3hc2BYVYF2IYYgdptGwkHx910MHb9Rh/U0pacoLSNwMe
         xS0EsJGvevlMWxl6wCHt1uhS8x4TRMTpzXuc1WOq+DXjKWrXqkul74kL4BK0Hz1W7TXs
         Nucg==
X-Gm-Message-State: AOAM532C1PPhRaSC9w191gHwQSZAe0relYJdwXqlY2yqbDqbKGUxzNkF
        igftBq4y0Wkpbwo5/xbg54DNoGTa3CwH
X-Google-Smtp-Source: ABdhPJz6uhuZe1BH9kaKf/WWF8mxBEVJndPeOnnI88Qbr7h1fbziXPbwMGJdWZYcZPzxnOjEwOmuBsdbNq+5
X-Received: by 2002:a25:384f:: with SMTP id f76mr91994364yba.170.1594207975681;
 Wed, 08 Jul 2020 04:32:55 -0700 (PDT)
Date:   Wed,  8 Jul 2020 19:32:33 +0800
In-Reply-To: <20200708113233.3994206-1-tzungbi@google.com>
Message-Id: <20200708113233.3994206-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20200708113233.3994206-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 3/3] ASoC: mediatek: mt8183: support machine driver with rt1015
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Supports machine driver with rt1015 ("mt8183-mt6358-ts3a227-rt1015").
Embeds in existing mt8183-mt6358-ts3a227-max98357.c because they share
most of the code.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/Kconfig                    |   5 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 165 +++++++++++++++---
 2 files changed, 147 insertions(+), 23 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index a656d2014127..238e4871678a 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -118,17 +118,18 @@ config SND_SOC_MT8183
 	  If unsure select "N".
 
 config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
-	tristate "ASoC Audio driver for MT8183 with MT6358 TS3A227E MAX98357A codec"
+	tristate "ASoC Audio driver for MT8183 with MT6358 TS3A227E MAX98357A RT1015 codec"
 	depends on I2C
 	depends on SND_SOC_MT8183
 	select SND_SOC_MT6358
 	select SND_SOC_MAX98357A
+	select SND_SOC_RT1015
 	select SND_SOC_BT_SCO
 	select SND_SOC_TS3A227E
 	select SND_SOC_CROS_EC_CODEC if CROS_EC
 	help
 	  This adds ASoC driver for Mediatek MT8183 boards
-	  with the MT6358 TS3A227E MAX98357A audio codec.
+	  with the MT6358 TS3A227E MAX98357A RT1015 audio codec.
 	  Select Y if you have such device.
 	  If unsure select "N".
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 8cd53403a080..964f2f821782 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -7,14 +7,20 @@
 // Author: Shunli Wang <shunli.wang@mediatek.com>
 
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
+#include "../../codecs/rt1015.h"
 #include "../../codecs/ts3a227e.h"
 #include "mt8183-afe-common.h"
 
+#define RT1015_CODEC_DAI "rt1015-aif"
+#define RT1015_DEV0_NAME "rt1015.6-0028"
+#define RT1015_DEV1_NAME "rt1015.6-0029"
+
 enum PINCTRL_PIN_STATE {
 	PIN_STATE_DEFAULT = 0,
 	PIN_TDM_OUT_ON,
@@ -49,6 +55,48 @@ static const struct snd_soc_ops mt8183_mt6358_i2s_ops = {
 	.hw_params = mt8183_mt6358_i2s_hw_params,
 };
 
+static int
+mt8183_mt6358_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	unsigned int rate = params_rate(params);
+	unsigned int mclk_fs_ratio = 128;
+	unsigned int mclk_fs = rate * mclk_fs_ratio;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+		if (ret < 0) {
+			dev_err(card->dev, "failed to set bclk ratio\n");
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
+				rate * 64, rate * 256);
+		if (ret < 0) {
+			dev_err(card->dev, "failed to set pll\n");
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
+				rate * 256, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(card->dev, "failed to set sysclk\n");
+			return ret;
+		}
+	}
+
+	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
+				      0, mclk_fs, SND_SOC_CLOCK_OUT);
+}
+
+static const struct snd_soc_ops mt8183_mt6358_rt1015_i2s_ops = {
+	.hw_params = mt8183_mt6358_rt1015_i2s_hw_params,
+};
+
 static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_pcm_hw_params *params)
 {
@@ -62,6 +110,19 @@ static int mt8183_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int mt8183_rt1015_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					     struct snd_pcm_hw_params *params)
+{
+	dev_dbg(rtd->dev, "%s(), fix format to 32bit\n", __func__);
+
+	/* fix BE i2s format to 32bit, clean param mask first */
+	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
+			     0, SNDRV_PCM_FORMAT_LAST);
+
+	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+	return 0;
+}
+
 static int
 mt8183_mt6358_ts3a227_max98357_bt_sco_startup(
 	struct snd_pcm_substream *substream)
@@ -179,11 +240,17 @@ SND_SOC_DAILINK_DEFS(i2s2,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-SND_SOC_DAILINK_DEFS(i2s3,
+SND_SOC_DAILINK_DEFS(i2s3_max98357a,
 	DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
 	DAILINK_COMP_ARRAY(COMP_CODEC("max98357a", "HiFi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+SND_SOC_DAILINK_DEFS(i2s3_rt1015,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(RT1015_DEV0_NAME, RT1015_CODEC_DAI),
+			   COMP_CODEC(RT1015_DEV1_NAME, RT1015_CODEC_DAI)),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 SND_SOC_DAILINK_DEFS(i2s5,
 	DAILINK_COMP_ARRAY(COMP_CPU("I2S5")),
 	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm")),
@@ -270,8 +337,7 @@ static const struct snd_soc_ops mt8183_mt6358_ts3a227_max98357_wov_ops = {
 	.shutdown = mt8183_mt6358_ts3a227_max98357_wov_shutdown,
 };
 
-static struct snd_soc_dai_link
-mt8183_mt6358_ts3a227_max98357_dai_links[] = {
+static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 	/* FE */
 	{
 		.name = "Playback_1",
@@ -413,9 +479,6 @@ mt8183_mt6358_ts3a227_max98357_dai_links[] = {
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
-		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
-		.ops = &mt8183_mt6358_i2s_ops,
-		SND_SOC_DAILINK_REG(i2s3),
 	},
 	{
 		.name = "I2S5",
@@ -443,8 +506,28 @@ mt8183_mt6358_ts3a227_max98357_dai_links[] = {
 static struct snd_soc_card mt8183_mt6358_ts3a227_max98357_card = {
 	.name = "mt8183_mt6358_ts3a227_max98357",
 	.owner = THIS_MODULE,
-	.dai_link = mt8183_mt6358_ts3a227_max98357_dai_links,
-	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_dai_links),
+	.dai_link = mt8183_mt6358_ts3a227_dai_links,
+	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_dai_links),
+};
+
+static struct snd_soc_codec_conf mt8183_mt6358_ts3a227_rt1015_amp_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(RT1015_DEV0_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1015_DEV1_NAME),
+		.name_prefix = "Right",
+	},
+};
+
+static struct snd_soc_card mt8183_mt6358_ts3a227_rt1015_card = {
+	.name = "mt8183_mt6358_ts3a227_rt1015",
+	.owner = THIS_MODULE,
+	.dai_link = mt8183_mt6358_ts3a227_dai_links,
+	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_dai_links),
+	.codec_conf = mt8183_mt6358_ts3a227_rt1015_amp_conf,
+	.num_configs = ARRAY_SIZE(mt8183_mt6358_ts3a227_rt1015_amp_conf),
 };
 
 static int
@@ -455,7 +538,7 @@ mt8183_mt6358_ts3a227_max98357_headset_init(struct snd_soc_component *component)
 			snd_soc_card_get_drvdata(component->card);
 
 	/* Enable Headset and 4 Buttons Jack detection */
-	ret = snd_soc_card_jack_new(&mt8183_mt6358_ts3a227_max98357_card,
+	ret = snd_soc_card_jack_new(component->card,
 				    "Headset Jack",
 				    SND_JACK_HEADSET |
 				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
@@ -478,14 +561,12 @@ static struct snd_soc_aux_dev mt8183_mt6358_ts3a227_max98357_headset_dev = {
 static int
 mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = &mt8183_mt6358_ts3a227_max98357_card;
+	struct snd_soc_card *card;
 	struct device_node *platform_node, *ec_codec;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv;
-	int ret;
-	int i;
-
-	card->dev = &pdev->dev;
+	const struct of_device_id *match;
+	int ret, i;
 
 	platform_node = of_parse_phandle(pdev->dev.of_node,
 					 "mediatek,platform", 0);
@@ -494,12 +575,16 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	match = of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
+	if (!match || !match->data)
+		return -EINVAL;
+
+	card = (struct snd_soc_card *)match->data;
+	card->dev = &pdev->dev;
+
 	ec_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,ec-codec", 0);
 
 	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->platforms->name)
-			continue;
-
 		if (ec_codec && strcmp(dai_link->name, "Wake on Voice") == 0) {
 			dai_link->cpus[0].name = NULL;
 			dai_link->cpus[0].of_node = ec_codec;
@@ -509,9 +594,40 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 			dai_link->codecs[0].dai_name = "Wake on Voice";
 			dai_link->platforms[0].of_node = ec_codec;
 			dai_link->ignore = 0;
-		} else {
-			dai_link->platforms->of_node = platform_node;
 		}
+
+		if (strcmp(dai_link->name, "I2S3") == 0) {
+			if (card == &mt8183_mt6358_ts3a227_max98357_card) {
+				dai_link->be_hw_params_fixup =
+					mt8183_i2s_hw_params_fixup;
+				dai_link->ops = &mt8183_mt6358_i2s_ops;
+				dai_link->cpus = i2s3_max98357a_cpus;
+				dai_link->num_cpus =
+					ARRAY_SIZE(i2s3_max98357a_cpus);
+				dai_link->codecs = i2s3_max98357a_codecs;
+				dai_link->num_codecs =
+					ARRAY_SIZE(i2s3_max98357a_codecs);
+				dai_link->platforms = i2s3_max98357a_platforms;
+				dai_link->num_platforms =
+					ARRAY_SIZE(i2s3_max98357a_platforms);
+			} else if (card == &mt8183_mt6358_ts3a227_rt1015_card) {
+				dai_link->be_hw_params_fixup =
+					mt8183_rt1015_i2s_hw_params_fixup;
+				dai_link->ops = &mt8183_mt6358_rt1015_i2s_ops;
+				dai_link->cpus = i2s3_rt1015_cpus;
+				dai_link->num_cpus =
+					ARRAY_SIZE(i2s3_rt1015_cpus);
+				dai_link->codecs = i2s3_rt1015_codecs;
+				dai_link->num_codecs =
+					ARRAY_SIZE(i2s3_rt1015_codecs);
+				dai_link->platforms = i2s3_rt1015_platforms;
+				dai_link->num_platforms =
+					ARRAY_SIZE(i2s3_rt1015_platforms);
+			}
+		}
+
+		if (!dai_link->platforms->name)
+			dai_link->platforms->of_node = platform_node;
 	}
 
 	mt8183_mt6358_ts3a227_max98357_headset_dev.dlc.of_node =
@@ -568,14 +684,21 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id mt8183_mt6358_ts3a227_max98357_dt_match[] = {
-	{.compatible = "mediatek,mt8183_mt6358_ts3a227_max98357",},
+	{
+		.compatible = "mediatek,mt8183_mt6358_ts3a227_max98357",
+		.data = &mt8183_mt6358_ts3a227_max98357_card,
+	},
+	{
+		.compatible = "mediatek,mt8183_mt6358_ts3a227_rt1015",
+		.data = &mt8183_mt6358_ts3a227_rt1015_card,
+	},
 	{}
 };
 #endif
 
 static struct platform_driver mt8183_mt6358_ts3a227_max98357_driver = {
 	.driver = {
-		.name = "mt8183_mt6358_ts3a227_max98357",
+		.name = "mt8183_mt6358_ts3a227",
 #ifdef CONFIG_OF
 		.of_match_table = mt8183_mt6358_ts3a227_max98357_dt_match,
 #endif
-- 
2.27.0.383.g050319c2ae-goog

