Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4DC2CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:47:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8F0421783
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DIDqCZeA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388823AbfJVLrQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 07:47:16 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:53787 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387977AbfJVLrQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 07:47:16 -0400
Received: by mail-qt1-f202.google.com with SMTP id 44so10812157qtu.20
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=T48tWlGrH2z44TnaLtsbXFIJ8HnlGaqO67n3JM09Qog=;
        b=DIDqCZeA05PLNKgdNR65FcBeK7ZuNM7RI1WYpop1VdWJpSktWHN7BLQmxoJ95oSoOj
         ocZM3wTXiXYuUAVS3FEX93PO9ufyw6CP5i+YYDPIty/fxPlMSKCcXkNPvmNBh84O7ji3
         RblCbKUAZNaBzTtr/pR/axxmyCdv692dB/bTcDeCPKl3MVNMNqRZbJ6Z/adaA3BTYQrS
         w5zSQ7dCbF1AqeSzyQTOSzMWPMjCvxo9vc1bzvGXkIvJQhoNDrBnxJUZLg5JCENpRl9s
         Zpbj++fZL3ZTMl0SHwrvyNXSlunWa1bW5Nlgh/uS0SUoUVN8gBsUbUseQXGQ57MR3Sxq
         8QlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=T48tWlGrH2z44TnaLtsbXFIJ8HnlGaqO67n3JM09Qog=;
        b=l52IdqprA2yFoghTD7b6Oao0vCUnyugbeWleau3hTSxcQxaFDaOdpiv0oyGFPwnmhs
         qdPssQhdDHFVun/CkGLzL0yShNzigyorCt6e+7icym5IX3r7LjbdYVW/0tm6J2wyhjp1
         9DHxATz7JfV+X1oUW+a6L6qfZPT2nKchnGRuEtuiJ2erp8wLHBKd0wKiT1s2uVYHvFqP
         jWZM47JZ4dYZQ3Ex4ri65qlrpNdQ7fPPLx6r1jhsncKrQIP+nMTbPw1VUrQTcM65X7hw
         hXXOsljSKgDJu67qisB5XvGEgT35X59tz9hX9Mblge9wWP97qX+fxxHjQb50DoQlWaiO
         BvzQ==
X-Gm-Message-State: APjAAAVXPIGuUcVjTVwkVXf0A4ICR96OJfi8rlEPzBcTvsKDtfBck8Iw
        EoRbjCGkjpnRteUqtGESAPVIlZtmhzO7
X-Google-Smtp-Source: APXvYqzLdQNX1Nkvs2wlFXNLo0RhFNgzd7th7BWIbuHvGPweK4oFS5GnrmsAHjH7EiF1oJZrrO6Xb3PQN00l
X-Received: by 2002:a0c:b59b:: with SMTP id g27mr2657124qve.184.1571744835079;
 Tue, 22 Oct 2019 04:47:15 -0700 (PDT)
Date:   Tue, 22 Oct 2019 19:45:05 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.6.I2e59e084bcd3aa34a651a7279bc63400e818cf0f@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 6/6] ASoC: mediatek: mt8183: support HDMI jack reporting
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net,
        dri-devel@lists.freedesktop.org, allen.chen@ite.com.tw,
        cychiang@google.com, dgreid@google.com, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Support HDMI jack reporting.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/Kconfig                    |  3 ++-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 20 ++++++++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 8b29f3979899..0d8d75c5f984 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -126,9 +126,10 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 	select SND_SOC_BT_SCO
 	select SND_SOC_TS3A227E
 	select SND_SOC_CROS_EC_CODEC
+	select SND_SOC_HDMI_CODEC
 	help
 	  This adds ASoC driver for Mediatek MT8183 boards
-	  with the MT6358 TS3A227E MAX98357A audio codec.
+	  with the MT6358 TS3A227E MAX98357A audio codec and HDMI codec.
 	  Select Y if you have such device.
 	  If unsure select "N".
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 258f1416fae1..23305dd2f958 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -11,6 +11,7 @@
 #include <sound/soc.h>
 #include <sound/jack.h>
 #include <linux/pinctrl/consumer.h>
+#include <sound/hdmi-codec.h>
 
 #include "mt8183-afe-common.h"
 #include "../../codecs/ts3a227e.h"
@@ -30,7 +31,7 @@ static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
 struct mt8183_mt6358_ts3a227_max98357_priv {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pin_states[PIN_STATE_MAX];
-	struct snd_soc_jack headset_jack;
+	struct snd_soc_jack headset_jack, hdmi_jack;
 };
 
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -270,6 +271,22 @@ static const struct snd_soc_ops mt8183_mt6358_ts3a227_max98357_wov_ops = {
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
+	return hdmi_codec_set_jack_detect(rtd->codec_dai->component,
+					  &priv->hdmi_jack);
+}
+
 static struct snd_soc_dai_link
 mt8183_mt6358_ts3a227_max98357_dai_links[] = {
 	/* FE */
@@ -436,6 +453,7 @@ mt8183_mt6358_ts3a227_max98357_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
 		.ops = &mt8183_mt6358_tdm_ops,
+		.init = mt8183_mt6358_ts3a227_max98357_hdmi_init,
 		SND_SOC_DAILINK_REG(tdm),
 	},
 };
-- 
2.23.0.866.gb869b98d4c-goog

