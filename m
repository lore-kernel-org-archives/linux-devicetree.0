Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3A3C54FCB
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 11:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 581DD20724
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 11:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1SIVE6W4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgDTLp2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 07:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726405AbgDTLpS (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 07:45:18 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87683C061A41
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 04:45:18 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x4so10639880wmj.1
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Eo7z/bW/75JbK01dAXq1seEbWg98VkTUnan0t5hkQw=;
        b=1SIVE6W4mcJTTZWKBGYOHiT3uHXcmVOkHZQEgxjGTgee8IoV3FNLpqrFJnZH923Fbc
         O39HPbopLAKYTRR45NG3vTPnxj5NHjj8qR2uA+BkBQj7XtBehqKHLrfwwLN7f+/st2WD
         fbmTHYA24mggSSRuPIZwNruyXT4eWW+uMBp2QCLJ05Ap7oFG8pcGGCEZ1duH0RK3cDr7
         UTuoV9A8YjhkemvD0Ex9zHzyjnoM5DW9pegWP7m3SOic/0r97TfutOjBBdrHU1zi/cyk
         nyebTDYjUvVUl/iTOyJ0Fcg+K7pnhJpb/4JoVs+q0Cg4QXq/DEhIl6IVNC1z2LV3HU84
         E4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Eo7z/bW/75JbK01dAXq1seEbWg98VkTUnan0t5hkQw=;
        b=F1NJedIqKuxTD5h/NHpFyyTBkhGi/bfvw3mDxJzxwQ3Hs0S3hvaGdK3rfO2q7AqecI
         JNZrHkus+x1E3kfJOJycPymiO5KI2E0eHBDoJjedkEsblo6INDnxAhF6cM8WNKhw7zYh
         FwuCBrc5tXdMNnlMXbiiZbHRUfnbwi6DSQGorTITjIdMh5sF32/RP3CZ4RPeLjSlPx0G
         w9F32QIreqxMR4G1CCSMQ37LbEZzn+suaKgtMvwEAVZG159uxDtbwT86+Xudb7SGHvwy
         ruZDv1t0wjBvioi0KYSqe/GZije/l8jw3VXdLqao3snOgMV3lD441mROWjK04hToNXfd
         6tew==
X-Gm-Message-State: AGi0PuZcKfwTUniZ3vZzLGO4uAjxUEw7dqR6+rEcpU1v6Vs5QRvpecRv
        s9neQByX3F/TEvk+0YYM+CDb4Q==
X-Google-Smtp-Source: APiQypIXImpuNN70wYFRkSp5hlI7aYph/2B0xZyzWhfHsi7Idg5iyDUi1yNEDGrbmDiFOIN9oJI1fQ==
X-Received: by 2002:a05:600c:29c2:: with SMTP id s2mr17145704wmd.111.1587383117186;
        Mon, 20 Apr 2020 04:45:17 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.googlemail.com with ESMTPSA id k6sm1079182wma.19.2020.04.20.04.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 04:45:16 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] ASoC: meson: axg-card: fix codec-to-codec link setup
Date:   Mon, 20 Apr 2020 13:45:10 +0200
Message-Id: <20200420114511.450560-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200420114511.450560-1-jbrunet@baylibre.com>
References: <20200420114511.450560-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
playback/capture if supported"), meson-axg cards which have codec-to-codec
links fail to init and Oops:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000128
  Internal error: Oops: 96000044 [#1] PREEMPT SMP
  CPU: 3 PID: 1582 Comm: arecord Not tainted 5.7.0-rc1
  pc : invalidate_paths_ep+0x30/0xe0
  lr : snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
  Call trace:
   invalidate_paths_ep+0x30/0xe0
   snd_soc_dapm_dai_get_connected_widgets+0x170/0x1a8
   dpcm_path_get+0x38/0xd0
   dpcm_fe_dai_open+0x70/0x920
   snd_pcm_open_substream+0x564/0x840
   snd_pcm_open+0xfc/0x228
   snd_pcm_capture_open+0x4c/0x78
   snd_open+0xac/0x1a8
   ...

While initiliazing the links, ASoC treats the codec-to-codec links of this
card type as a DPCM backend. This error eventually leads to the Oops.

Most of the card driver code is shared between DPCM backends and
codec-to-codec links. The property "no_pcm" marking DCPM BE was left set on
codec-to-codec links, leading to this problem. This commit fixes that.

Fixes: 0a8f1117a680 ("ASoC: meson: axg-card: add basic codec-to-codec link support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index af46845f4ef2..89f7f64747cd 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -338,8 +338,10 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
 		ret = axg_card_parse_tdm(card, np, index);
-	else if (axg_card_cpu_is_codec(dai_link->cpus->of_node))
+	else if (axg_card_cpu_is_codec(dai_link->cpus->of_node)) {
 		dai_link->params = &codec_params;
+		dai_link->no_pcm = 0; /* link is not a DPCM BE */
+	}
 
 	return ret;
 }
-- 
2.25.2

