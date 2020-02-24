Return-Path: <SRS0=+Je1=4M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DE3C11D2F
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 14:59:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A020320836
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Feb 2020 14:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lcWN9cUq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgBXO62 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Feb 2020 09:58:28 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41616 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727724AbgBXO61 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Feb 2020 09:58:27 -0500
Received: by mail-wr1-f67.google.com with SMTP id c9so10740599wrw.8
        for <devicetree@vger.kernel.org>; Mon, 24 Feb 2020 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eR8sRZ0eNtaE7U9M/Ye9eF8UlxBXj3WB9fmrHU+msXI=;
        b=lcWN9cUqpNnTBKxLL1DcDeE96TbfbhNrt4m4Zx+HhxEUh4/4IfxF+6fPGTklNwHtBV
         jNbp8eSsTC1LMdNWtEMJF6cwYJ0LM8mGwpEyzrNbUxd/RKJPZaWX1tNhbIvtJqZU6AHK
         im1JpjWuiJRALN2PkArUCotAgTMzlxnXW/1C4IrXSz6IRS4m3BmJ62w8DChEng86uLVO
         KmoB9kUfLuVae0i7qIM7uOfcV+h2J5yye52aLZZJ9Mrhl0hqq0szE3IUNRhhuOd3MWFy
         RBdNpRUZIhVY5ImD4FlGsQniP5+y8xIpyPGLN9iAoTm6DvQzkuJwKWfwBf3Fxnx9baYK
         gAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eR8sRZ0eNtaE7U9M/Ye9eF8UlxBXj3WB9fmrHU+msXI=;
        b=RGsQOlArZse5Ufu++GmxgbOXdbOIevXXnV95onqbpwYjQ4HorGBa7jfs/h4HjOvfzj
         gyc/hVYzu9UKiWTaHUVoVPZrn++xEENkiTEoepgwSxWCnSwTZjchTflR9bpeM6yw1Cp0
         RlTpEvWjzOakhh9+8sOMBEbDRUnEOvok0WiNCmuT/xbxq/eu34NQW11KHDsMdVG++0Qc
         x6DAHON2B/F9qq1N4hAxtQXdJ+jd5EMIYaj9y2gfA0+HwnKiaoLjZG4O+cCprOMnlmg8
         aKBbZh/qEPj36SwF2SJmUsIXouIuhr7jriNJuVZWiv1yc4l0xP3VPJw6kYYhomgzz3DN
         BSuQ==
X-Gm-Message-State: APjAAAWLK4j6ClyVcrBetHrZnnIUG23IKw9xnpau5r6RAXXnGNhDSoia
        Ta9UWVSi77RfU7By3x+lKZTsKw==
X-Google-Smtp-Source: APXvYqyY/zCmUw3P89UUJMhoBFx2AFHF7hUSFeRrBu9pIR4glCF3WbIF9YxgUdR8YOokcfi9ViiMYg==
X-Received: by 2002:a05:6000:110b:: with SMTP id z11mr14887981wrw.252.1582556305282;
        Mon, 24 Feb 2020 06:58:25 -0800 (PST)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j12sm8035127wrt.35.2020.02.24.06.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 06:58:24 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/9] ASoC: meson: gx-card: fix sound-dai dt schema
Date:   Mon, 24 Feb 2020 15:58:13 +0100
Message-Id: <20200224145821.262873-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224145821.262873-1-jbrunet@baylibre.com>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

There is a fair amount of warnings when running 'make dtbs_check' with
amlogic,gx-sound-card.yaml.

Ex:
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:1: missing phandle tag in 0
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:2: missing phandle tag in 0
arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0: [66, 0, 0] is too long

The reason is that the sound-dai phandle provided has cells, and in such
case the schema should use 'phandle-array' instead of 'phandle', even if
the property expects a single phandle.

Fixes: fd00366b8e41 ("ASoC: meson: gx: add sound card dt-binding documentation")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Hi Mark,

 The statement above is based on this LKML discussion I found:
 https://lkml.org/lkml/2019/9/30/382

 To be honest, I don't really get why the consumer should know whether
 the phandle will have cells or not. AFAIK, the consumer does not care
 about this ...

 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index fb374c659be1..a48222e8cd08 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -57,7 +57,7 @@ patternProperties:
           rate
 
       sound-dai:
-        $ref: /schemas/types.yaml#/definitions/phandle
+        $ref: /schemas/types.yaml#/definitions/phandle-array
         description: phandle of the CPU DAI
 
     patternProperties:
@@ -71,7 +71,7 @@ patternProperties:
 
         properties:
           sound-dai:
-            $ref: /schemas/types.yaml#/definitions/phandle
+            $ref: /schemas/types.yaml#/definitions/phandle-array
             description: phandle of the codec DAI
 
         required:
-- 
2.24.1

