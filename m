Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C498CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:46:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 70F7821783
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 11:46:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fvUU4X0S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388181AbfJVLqv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 07:46:51 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:53464 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387977AbfJVLqu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 07:46:50 -0400
Received: by mail-vk1-f202.google.com with SMTP id q5so7491937vkg.20
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=q90rWJEkGm2l9nI3fLz2Cj+itxcilYQDCfUCXu1yWQg=;
        b=fvUU4X0Sib4BfXVWA9CPePFVHefO+pH8Ci8fFdRiFSB5iTPQA+ra5mL+VLYXS7IZNR
         zt4DCioEFPM6+qZU7/V76QviJtdzE8pWUIIYz25OGqu8fcCg/ad/mBFD0X3VMj6iE6sl
         5e5jBG8G1FjxHr/xlaM66aihrErDmJqsgHtVlTctEF8nGdpQyh3/iGguis1EpaVIXxFc
         r9FVu8lnN5mq2/lZJKIog6SciWR7ePKbkaMVHBwIX4gQOmsutILG/GhOmCeRGTxxkxUJ
         a75pPUwAB59Lx1guwRD0KIOKxiPcMXxt31Pn9IJzZN9q+c/Rv4tOuPJCaKinGj7AQDa0
         0CQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=q90rWJEkGm2l9nI3fLz2Cj+itxcilYQDCfUCXu1yWQg=;
        b=j6Kg+znK5RbiM15BGCmPGh2bcESlMgIBX6aO60bivSDjPCsBxd+hQ2K7l529FTB3UJ
         lkPy43KXE91VxS4Efwnxi2Ojz49Qh5ZYMR0v9WjPtSY1dy4Jrq9/hyWRf0TBpMeWkWql
         Vi+z9b2SqbYWEy0w8lsvO/7mA/tQur8av3pNiPqFibJuJu/7f9bJiRgDpaIjh83Jaenm
         eftK4Xbr0TCAzySb2sL4mvkfA3IvhuYM1VyLOJOxChG/hRlANpVwaxsQsjwHqSc4TYMl
         OhlDyBRQgN5WyyW9fGpUhDfs+K8GF+1eKDHxzUaQp1KOiwmTQX/LFuMtkUAHwolAovRJ
         uAUw==
X-Gm-Message-State: APjAAAWSFAqmbvw/xnKPo5XLs/1A5MGNIDMK5kDcYTEPfTg+Tt+rptgM
        yy3ZGScRxWlDXG/Fkq/8AQVOIc85UPdx
X-Google-Smtp-Source: APXvYqzsB+mP+SYK0nkZDI+E5ctlzYSDa2qZV3FsZvCzlBqBSD0WoJVKv1DehaXyYVIbfl0rJsvRLOUyAOTG
X-Received: by 2002:a67:8841:: with SMTP id k62mr1532968vsd.101.1571744809794;
 Tue, 22 Oct 2019 04:46:49 -0700 (PDT)
Date:   Tue, 22 Oct 2019 19:45:00 +0800
In-Reply-To: <20191022114505.196852-1-tzungbi@google.com>
Message-Id: <20191022193301.1.I3039014cf259de5e4d6315fc05dff111591a0901@changeid>
Mime-Version: 1.0
References: <20191022114505.196852-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH 1/6] ASoC: hdmi-codec: add PCM trigger operator
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

HDMI codec may be also interested in PCM triggers.  Add PCM trigger
operator.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 include/sound/hdmi-codec.h    | 13 +++++++++++++
 sound/soc/codecs/hdmi-codec.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 83b17682e01c..9de462ef170d 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -50,6 +50,13 @@ struct hdmi_codec_params {
 typedef void (*hdmi_codec_plugged_cb)(struct device *dev,
 				      bool plugged);
 
+enum {
+	HDMI_CODEC_TRIGGER_EVENT_STOP,
+	HDMI_CODEC_TRIGGER_EVENT_START,
+	HDMI_CODEC_TRIGGER_EVENT_SUSPEND,
+	HDMI_CODEC_TRIGGER_EVENT_RESUME,
+};
+
 struct hdmi_codec_pdata;
 struct hdmi_codec_ops {
 	/*
@@ -66,6 +73,12 @@ struct hdmi_codec_ops {
 			 struct hdmi_codec_daifmt *fmt,
 			 struct hdmi_codec_params *hparms);
 
+	/*
+	 * PCM trigger callback.
+	 * Optional
+	 */
+	int (*trigger)(struct device *dev, int event);
+
 	/*
 	 * Shuts down the audio stream.
 	 * Mandatory
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index b5fd8f08726e..1ba2fa26ba03 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -565,12 +565,42 @@ static int hdmi_codec_digital_mute(struct snd_soc_dai *dai, int mute)
 	return 0;
 }
 
+static int hdmi_codec_trigger(struct snd_pcm_substream *substream, int cmd,
+			      struct snd_soc_dai *dai)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	int event;
+
+	if (!hcp->hcd.ops->trigger)
+		return 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_STOP:
+		event = HDMI_CODEC_TRIGGER_EVENT_STOP;
+		break;
+	case SNDRV_PCM_TRIGGER_START:
+		event = HDMI_CODEC_TRIGGER_EVENT_START;
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		event = HDMI_CODEC_TRIGGER_EVENT_SUSPEND;
+		break;
+	case SNDRV_PCM_TRIGGER_RESUME:
+		event = HDMI_CODEC_TRIGGER_EVENT_RESUME;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return hcp->hcd.ops->trigger(dai->dev->parent, event);
+}
+
 static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
 	.startup	= hdmi_codec_startup,
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
 	.set_fmt	= hdmi_codec_i2s_set_fmt,
 	.digital_mute	= hdmi_codec_digital_mute,
+	.trigger	= hdmi_codec_trigger,
 };
 
 static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
@@ -578,6 +608,7 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
 	.digital_mute	= hdmi_codec_digital_mute,
+	.trigger	= hdmi_codec_trigger,
 };
 
 #define HDMI_RATES	(SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
-- 
2.23.0.866.gb869b98d4c-goog

