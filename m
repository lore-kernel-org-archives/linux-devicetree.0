Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7C2C2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 13:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D78872086A
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 13:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="crz6YhDt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729339AbgBNNOK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 08:14:10 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34878 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbgBNNOB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 08:14:01 -0500
Received: by mail-wm1-f67.google.com with SMTP id b17so10585741wmb.0
        for <devicetree@vger.kernel.org>; Fri, 14 Feb 2020 05:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R5hDX2fKXXUqTN4gPhmTaSqEJNj3ED130xdKjaE+HMU=;
        b=crz6YhDtrV4g8O0/zuiDTYuG8zBCm32KRjK1pD7VSdJPhUVaoAYvLpqkt3v7PIzjH3
         obkCAkhtBFnXK0ExU10NKjBrPtLnGlHTsfOGNOgSjcQhRYEOeRtAg1kX/YRO+Cpa9CLE
         SyXdc2npbGM93qpvkjgJrD/mv/tT2utWUvKQKBvK9rmNbTqeXFFI5Ah27zYZyLJdsPlH
         abrWcUMYrrH+AJtI+u6RxalK5ymeul/ch5gXVOK15AQlgMEAY5XYjtclqy18QKxpgTHN
         EzYMvc6y+368tLzlLAASePwT+nXO3iliU+BhwY4QgFIoei+DzzeE7FcVSYd8tUstN+zy
         snGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R5hDX2fKXXUqTN4gPhmTaSqEJNj3ED130xdKjaE+HMU=;
        b=riiXTPrNEYkZajH6t1c402hXgQTsrGjSbK2A2qvTxY+H97m2fkMhag51cNs0WjbS5h
         fZDAwfjPXln9sSuY9aS+LP1TdUcgHl3bjJ5MH2+A3TB48r4Xk+5cg4OQ330lvH1ANVU4
         c/VaoANE5qlat2/24V9zlQ3oODzLk4NbEP/W/0lhEnl9HAScL7ZfwZyCR337Rt9MbtzB
         yeqm/k2oHNpf1kAWyMP/crBKUTzdrB9mh62rlUYgp9QiCSRq/9sh0VWk/K6ATpPwuAbo
         sqEtUOL8eFGYBmFL10NrYmUFy2w17jOzdcBXDipnbiZMxwNi7a3u3Z1PdAHnd/ntMbyE
         1nMA==
X-Gm-Message-State: APjAAAWJEEY9vqc40KC8djYmi84JT8A+LSDHg75pi24GtcpfkEgvqllV
        K/WCVouk/TZIGROKRh1tB/FcBw==
X-Google-Smtp-Source: APXvYqwgaIoCglawV5EQ+iFySvSsaN3OWiu9vP82DWE/KGYV9dscwOSz5sA+BE7GOlaYfgmLrE+ljA==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr4579049wmf.75.1581686038936;
        Fri, 14 Feb 2020 05:13:58 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id w7sm6760792wmi.9.2020.02.14.05.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 05:13:58 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 4/5] ASoC: meson: aiu: fix acodec dai input name init
Date:   Fri, 14 Feb 2020 14:13:49 +0100
Message-Id: <20200214131350.337968-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214131350.337968-1-jbrunet@baylibre.com>
References: <20200214131350.337968-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Remove the double initialization of the dai input name as reported by
sparse.

Fixes: 65816025d461 ("ASoC: meson: aiu: add internal dac codec control support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu-acodec-ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 12d8a4d351a1..b8e88b1a4fc8 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -128,7 +128,6 @@ static const struct snd_soc_dai_ops aiu_acodec_ctrl_output_ops = {
 
 #define AIU_ACODEC_INPUT(xname) {				\
 	.name = "ACODEC CTRL " xname,				\
-	.name = xname,						\
 	.playback = AIU_ACODEC_STREAM(xname, "Playback", 8),	\
 	.ops = &aiu_acodec_ctrl_input_ops,			\
 	.probe = meson_codec_glue_input_dai_probe,		\
-- 
2.24.1

