Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3661C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F9212076A
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BKscopTz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbgGJF3O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 01:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgGJFZW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 01:25:22 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2ECC08E6DC
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 22:25:21 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id p22so5785272ybg.21
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 22:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=waFmwNjvn8zrzF+MflfsEtX07GKV6zTcqXH2BQIDo6I=;
        b=BKscopTznRI/6PlxNEk0SE0fxVRhoo+fn7dYCuemGdOZIADZEwhPo+ULx0QJjgfT+7
         +PpgH+n/5j3YZS63+Z1hnzoLJIPmPncek9CugDTRvHQ23oS3U5GCn6/elW1K2CnAzUtE
         Ud4kLm8bieJUsuWXMAKjtzaRMe2DKNe6dkj/hIPYueVn74t5rH+wd0V5VmrhoO4SCVQ7
         TveVFJ9J1ykqLXcMNWycZAYCDgE07/HDR0qsBhiwTJPekKdVw+aiiIfFimfAzgA4TUwp
         cNS3YrzX1BVIz4dqspdVMhiPFxB5jkBoDBDQ3BBS01WiPB/1O5eds/f/ZGZMOar1Tz+4
         W6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=waFmwNjvn8zrzF+MflfsEtX07GKV6zTcqXH2BQIDo6I=;
        b=Q9meQB4/RAuH8bkpJf7UP2fB1s683xeGCv69JbUyMDVN7+I/uDFcyEEhU5+jGeWO+o
         UykSyJ57d2Oq3+WXadvlUwaJYrBYlxkMsU0IHXDg2SwRJWw2lUTiLoTZJ3OGzDtDyhA7
         wvAeCvX10+CsiZncifbrqdI7pQGhi28tN3cRNl4GHtRDOEl3Aq8nSDnqwPk3Zmccmo7A
         tYNHypZpguDFWndz62mmEoK6i62Vbqzj62R/Ugh4TUXgPvyx2CdMpp1Bavxkl3NKKvk0
         ADhcbSAN5ofo9VAQE9VH6hMsY72XEnb/LVFhfsZYS9xHQBNFRFaR0OmfyUEEZWmMPemd
         qRcw==
X-Gm-Message-State: AOAM5309NoqtYUAiNQZrnF8VwJvdNZT3Udi2JLkCnudqtgKxtyTrJYpu
        5fuzaP8c9w3BN97OXn6MvascJdInN1h0
X-Google-Smtp-Source: ABdhPJwP7e8k+tjpxgJCNtpdCpHvOKoiQ2NdP3VBQyiLvLA0NAeFA8ZUuQe5WMXbfnvgbYoF7V2Yrys14mtZ
X-Received: by 2002:a25:abd0:: with SMTP id v74mr23431860ybi.222.1594358721171;
 Thu, 09 Jul 2020 22:25:21 -0700 (PDT)
Date:   Fri, 10 Jul 2020 13:25:01 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 2/6] ASoC: mediatek: mt8183: use hdmi-codec
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
 .../soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 964f2f821782..c375e9f91a34 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -258,7 +258,7 @@ SND_SOC_DAILINK_DEFS(i2s5,
 
 SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_CPU("TDM")),
-	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static int mt8183_mt6358_tdm_startup(struct snd_pcm_substream *substream)
@@ -562,7 +562,7 @@ static int
 mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
-	struct device_node *platform_node, *ec_codec;
+	struct device_node *platform_node, *ec_codec, *hdmi_codec;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv;
 	const struct of_device_id *match;
@@ -583,6 +583,8 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ec_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,ec-codec", 0);
+	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
+				      "mediatek,hdmi-codec", 0);
 
 	for_each_card_prelinks(card, i, dai_link) {
 		if (ec_codec && strcmp(dai_link->name, "Wake on Voice") == 0) {
@@ -626,6 +628,9 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
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

