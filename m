Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41284C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BCCD2076A
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VWwToPDP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbgGJF3O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 01:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgGJFZ0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 01:25:26 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCDEC08E763
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 22:25:26 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 124so5843115ybb.5
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 22:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=i2NhQTpZuhCYWTnxTi14iTiCHJsPokmxWx+SDqUiObw=;
        b=VWwToPDPM0rGsgdyXx/MPzUW2/SUmATrBTK/cVKkCbVOG57hyj0/7MaNB26EhSt0J8
         Ime7xaCK6wahKUFxUHqAPrrf5uzNNen9Pnz5GK2LmkS84Y4xZUwN2cbHM+3fpiv1tnCR
         gJdrh1puHrnTOK19Aaa531xhgtHEtW/23Gdk/5RDzNWleHEv8BTC8wm/Qod2SR2ocr1g
         /BZb2oPsB+2USOHWcs0mFdSboheF7YB+1KrfRrwUxdDYj4P/R3T6B6g01GhtP9AnPdn2
         Y5qiFKx15E/18d7prk1YpciA4Js8VqJApyoKaQTd/of3WGBmtRgm1b3rUOl9XX1E/4ye
         4PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=i2NhQTpZuhCYWTnxTi14iTiCHJsPokmxWx+SDqUiObw=;
        b=Ge9wAQAPxzNlMSf0xOyswlBi/7xj8gzPXZfMsN5/NcpCI9SAU1U0ujztmsoq7EtSdj
         C2gJAQQVZhk/zlI4QrZXX0GQg/Mi/M3N4J3f79/q3ymJ6OjVVMq4XXsobOREiaJ6jVLc
         WQU4sV8fqI7ojH4r4/oZRGygGiNJZm4Fs/DQG8FwUzpfbDYciH3IqPOCQiNtTedN9vzU
         /TAciNMIMOmmDTgo8cwPi0sdJJW80zPHdZMOBCu6mcYFytP/yFBRTMMtigZ/L4XADB37
         YNS6PVd/YkcqTuS0rahpy5y5qrzYZqbl3xEvlK4x6cwJdaeOMWDHp9/fNi+l4RxHDNpi
         RY/w==
X-Gm-Message-State: AOAM530ONwnFZrDwGv/jWzmxvNGEozWsZKeSnK2+swU9QEU5JyXGnrhX
        5V7Gnp6C51D5Wzxue78xHVFCgnrQdq8t
X-Google-Smtp-Source: ABdhPJyxdVQdC7BceZ8J2XZQ+dXvuO4Jq88o+nRWRKXh9lYZoRE6UwV4YfwXKJyNApczRBaWatW2bG5w5N0t
X-Received: by 2002:a25:cb42:: with SMTP id b63mr45668907ybg.266.1594358725304;
 Thu, 09 Jul 2020 22:25:25 -0700 (PDT)
Date:   Fri, 10 Jul 2020 13:25:02 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 3/6] ASoC: mediatek: mt8183: support HDMI jack reporting
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
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 20 ++++++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 786a8d5031e4..ba120e9441d0 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -127,6 +127,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 	select SND_SOC_BT_SCO
 	select SND_SOC_TS3A227E
 	select SND_SOC_CROS_EC_CODEC if CROS_EC
+	select SND_SOC_HDMI_CODEC
 	help
 	  This adds ASoC driver for Mediatek MT8183 boards
 	  with the MT6358 TS3A227E MAX98357A RT1015 audio codec.
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index c375e9f91a34..bd04c4bd309b 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
+#include <sound/hdmi-codec.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -36,7 +37,7 @@ static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
 struct mt8183_mt6358_ts3a227_max98357_priv {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pin_states[PIN_STATE_MAX];
-	struct snd_soc_jack headset_jack;
+	struct snd_soc_jack headset_jack, hdmi_jack;
 };
 
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -337,6 +338,22 @@ static const struct snd_soc_ops mt8183_mt6358_ts3a227_max98357_wov_ops = {
 	.shutdown = mt8183_mt6358_ts3a227_max98357_wov_shutdown,
 };
 
+static int
+mt8183_mt6358_ts3a227_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
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
 static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 	/* FE */
 	{
@@ -499,6 +516,7 @@ static struct snd_soc_dai_link mt8183_mt6358_ts3a227_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_tdm_ops,
+		.init = mt8183_mt6358_ts3a227_max98357_hdmi_init,
 		SND_SOC_DAILINK_REG(tdm),
 	},
 };
-- 
2.27.0.383.g050319c2ae-goog

