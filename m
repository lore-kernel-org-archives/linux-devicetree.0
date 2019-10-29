Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95557CA9EC6
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 11:29:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66ED4208E3
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 11:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7btE6bN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733214AbfJ2L3Z (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 29 Oct 2019 07:29:25 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40511 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732753AbfJ2L3J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Oct 2019 07:29:09 -0400
Received: by mail-wm1-f65.google.com with SMTP id w9so1981850wmm.5
        for <devicetree@vger.kernel.org>; Tue, 29 Oct 2019 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=a7btE6bNZTalO6uJ2Q3J3SGFmmVteAIhrL2W5H4pHkfPFeWdizziBlnvYU1k1l7H1z
         VdrT98Yc2YK24o81kwrEhi25dlcKpAucXw20r5kJuGqR0fzFvFUw8IyUa3TgkZ2+N/t0
         kalOcSQm4sdNPsAmabcWb0eXbbr+cuZ9EAttgV9ScQoeY44mDD7Z2p8rOaFugm7ina25
         mWzB9+MTesKrQxHw6b6ECD69xcpwkkFvtIJszfhMRF/Ixrj+yHOnxxXqXgGK4gF1kTLt
         3V1IwLIrJdwy4tglpaWjmrMYZFXtJAcIj1zPGzAeDvXzO4ghDIJGPkCuTuwW2LyBmXRv
         xIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=DDMW2ak6fTfeQGz0Bb2Zzp2J+8WtYlNYEEi/FBlsm7nBCfjJIvfLM29DmoK/HT9NSm
         U8H1EHNrvgp3TTjR+HMFYFKPLu4f1kxRYCB2BL2730uYkTmimIqbHndQ8WBtQBsJA4pQ
         aIiHV9lLDXKAAcsOVJMxASmiKoij7yYT4jjc1kE4JWnm5TDbGeoDqHO9hAc394NrLv/G
         BUb1booPJ2IeLRV1SEFfD/ZXuXPZFJtx0CxaoEUqoduaTJ2HkLe//PXAC9LzEYShBXoI
         FdrNn/i/GG+BySzJc4/kHDo7uvibNFZvidCvmN74Ba0BQ9ZZr/TnjiZsFTl1TKHkmezD
         PnQQ==
X-Gm-Message-State: APjAAAURo5B7gDsUS2NSvXlzNcIxB6VsWJvVsQmGEVI+/oNGkRYoxdKm
        Q2H3MJKTbVBtc5zaarUUQM1xvw==
X-Google-Smtp-Source: APXvYqy1tl4LyuCywYWNRuqXZdWjtRzeYlP86wtCjCStz54zWcC6oJciXhUYQAJM9je4iY3Kq745ww==
X-Received: by 2002:a1c:d8:: with SMTP id 207mr3548367wma.65.1572348547207;
        Tue, 29 Oct 2019 04:29:07 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f20sm2373247wmb.6.2019.10.29.04.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 04:29:06 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 10/11] ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
Date:   Tue, 29 Oct 2019 11:26:59 +0000
Message-Id: <20191029112700.14548-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds compatible strings for DB845c and Lenovo Yoga C630
soundcard. Based on this compatible strings common machine driver
will be in better position to setup board specific configuration.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/qcom,sdm845.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
index 408c4837e6d5..ca8c89e88bfa 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
@@ -5,7 +5,10 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
 - compatible:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "qcom,sdm845-sndcard"
+	Definition: must be one of this
+			"qcom,sdm845-sndcard"
+			"qcom,db845c-sndcard"
+			"lenovo,yoga-c630-sndcard"
 
 - audio-routing:
 	Usage: Optional
-- 
2.21.0

