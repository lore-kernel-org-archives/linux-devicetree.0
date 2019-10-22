Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DB0CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:47:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80AF121872
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SIBiN9mi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388820AbfJVLrG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 07:47:06 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:49125 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387977AbfJVLrF (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 07:47:05 -0400
Received: by mail-pf1-f202.google.com with SMTP id z13so13174666pfr.15
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 04:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bhx4XpOMOAvSvKbY+GNWUpjZmdRh9xAzVtH8yGRzOsQ=;
        b=SIBiN9miBukP2vHVz9yb1Z7FzYKWBp7bstUfIx/l48YcGQot4ut6+8V5YUJL6c1Vqp
         0A/NHXnagesp/88Em+/Q++21OMqJgdwe9fSH0k6LaOG4jpyJyc5tDwISjoBwE6mLxDSa
         5veKygBQcZRHA4AZSjrCwhGgXe5MlbkeCUSywhc1nboAqBjXAADehO5RiEnoH+Ya/rkn
         8ncAtmX9QmchPk8cZwR0wLlGED4guLq/cpUFd7MfjP5n9FZtZt9lRPqBFKOrIKm+5r9x
         hpFDohJpJTr9QNLCYOEN8Ii6mALgfaNKpGwWnkxxYn5ezvpwhygwN7nAytfE7CPmcqJN
         cXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bhx4XpOMOAvSvKbY+GNWUpjZmdRh9xAzVtH8yGRzOsQ=;
        b=NI8ikPLwISWIWhIDlRZYGI8+xors/N9KTTkcf2J4ouqUWgILDBW44K43PwqV+/My+f
         y0IqGw6qNCTjte3pL88NUzwpZylmVk+Axv+FaBG8TSMX6X89pVuZkGgB2X/KjOtmm0mN
         //oUUQEZXey/khGWyuBGLDxN2XNAXuddLgMxBNTV6wf5hpNgq0HH97J5L+EtDZGIqJWI
         nUCTRjoNtaVFPocZIsZrKJCx6H0hRnbBnUwN8ITql+krqj8gBt3qz6a+mOAV+rl5t2T1
         dwiRl61JTEWzDxQMTI6tT+OSkYegqE/8YGDqMgjh7zSQ8HUBv+0E3mTw9ipvEFPd79lB
         m9Xw==
X-Gm-Message-State: APjAAAUl/q7rlKRwtlgiFEBDejPSfII0SmFiUdYrzv04MSXM4gvYehgF
        q+VTRtt+uAye0DrGn8uI+qIkxxR/3RYo
X-Google-Smtp-Source: APXvYqxav0HrOfMpw4960RSWWzv7KqgN4pnD2wXbdoyd8cYu/tGEv/ffv9S5k7+O4gnGu3yAJgDijmZjv4MQ
X-Received: by 2002:a63:6116:: with SMTP id v22mr3089716pgb.95.1571744825052;
 Tue, 22 Oct 2019 04:47:05 -0700 (PDT)
Date:   Tue, 22 Oct 2019 19:45:03 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.4.I659b5e6b25155890b85eb1c361e60f92d2500b7e@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 4/6] ASoC: mediatek: mt8183: use hdmi-codec
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

Add DAI link to use hdmi-codec.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c      | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 0555f7d73d05..258f1416fae1 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -191,7 +191,7 @@ SND_SOC_DAILINK_DEFS(i2s5,
 
 SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_CPU("TDM")),
-	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static int mt8183_mt6358_tdm_startup(struct snd_pcm_substream *substream)
@@ -479,7 +479,7 @@ static int
 mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8183_mt6358_ts3a227_max98357_card;
-	struct device_node *platform_node, *ec_codec;
+	struct device_node *platform_node, *ec_codec, *hdmi_codec;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv;
 	int ret;
@@ -496,9 +496,12 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 
 	ec_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,ec-codec", 0);
 
+	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
+				      "mediatek,hdmi-codec", 0);
+
 	for_each_card_prelinks(card, i, dai_link) {
-		if (dai_link->platforms->name)
-			continue;
+		if (!dai_link->platforms->name)
+			dai_link->platforms->of_node = platform_node;
 
 		if (ec_codec && strcmp(dai_link->name, "Wake on Voice") == 0) {
 			dai_link->cpus[0].name = NULL;
@@ -509,9 +512,10 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 			dai_link->codecs[0].dai_name = "Wake on Voice";
 			dai_link->platforms[0].of_node = ec_codec;
 			dai_link->ignore = 0;
-		} else {
-			dai_link->platforms->of_node = platform_node;
 		}
+
+		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0)
+			dai_link->codecs->of_node = hdmi_codec;
 	}
 
 	mt8183_mt6358_ts3a227_max98357_headset_dev.dlc.of_node =
-- 
2.23.0.866.gb869b98d4c-goog

