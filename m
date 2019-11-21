Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682AEC432C3
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 17:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EC06206D7
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 17:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OiGjZ/6H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbfKURGM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 12:06:12 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35247 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbfKURGC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Nov 2019 12:06:02 -0500
Received: by mail-wr1-f65.google.com with SMTP id s5so5376817wrw.2
        for <devicetree@vger.kernel.org>; Thu, 21 Nov 2019 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=OiGjZ/6HgFqifxkfowVtJjQqTqFfdS/ToscQHYZuAZ457wTJBcCYUY+ZlWODG59Bha
         GghowrjEwvVNEf8bryAhzrQm36CGD+RvjQpy6Z5PWKv5tmhsXmuTJpd2JjpPV6vrC+iv
         AM7zvsDjFlJY9Pn/ieonZa0PmbpX2NUPvzn+APuOy8HBuOrvBXuevczg+Nh2fLbz+I7R
         ZxCE148bKqFoPCYxbQ8SCeTh3k9c+/cdJ91DJxX9YjomlnMhaOEEbuE3f4L4HPCgvBxw
         F1e5g7qgsWnrgyDbPl70cSDThUZ8WFcRBIL4GJ/3erLwkKfg8FAh7oBKe0ebBWEDmVQo
         petA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YC1onaWGjgTiGrUp75mNaoNmZWZWn8ozsG+Lz8zEBxg=;
        b=of4iWJhlZg+s15pk5Y8Cfs7vgJLCRujjzHn/LayWhs0352zSc4b4qdxPvx6klutjk2
         icEPH28iP9ZpJ0v3GwBTtZWFyFqqOGJVidC4SQEhbTEOKuTD1a8wAySR0oFZXFLvjEnG
         rrFuMBmKAdy6c1AcWEyi6+osLZ6ialpFbfDmeq+VcpnvEV1oc2lqHwwqtlBpc3163Knf
         RJJkW47r997eo0FSXql1thiT9Yr5fyI1BUkwIrUz6Z9QAuNrjbBiJZV5XU8k/TEs8UOr
         qr8qj4q7a5vuGXbChF0wjeLSZFrGg1VCLE3yQoqoZLQJA6ysDEUElQFRMljUdpPYW+UW
         xpsg==
X-Gm-Message-State: APjAAAUz/OUFfxCOKu81sMylI5YJG6qbmVWe5T3Cp7oY2cTIed0S7mOc
        AFmOMfpf3lm1vTvDWICtOuAQsw==
X-Google-Smtp-Source: APXvYqxxTp8LzEjyKmHdLa9JtltjBFMatq0lqKOl/TmxVgxr67cJZBCxg7paChQjot9qRNj/gCVHQw==
X-Received: by 2002:adf:edc5:: with SMTP id v5mr12049689wro.322.1574355960208;
        Thu, 21 Nov 2019 09:06:00 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id i71sm4423731wri.68.2019.11.21.09.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 09:05:59 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 11/12] ASoC: qcom: dt-bindings: Add compatible for DB845c and Lenovo Yoga
Date:   Thu, 21 Nov 2019 17:05:08 +0000
Message-Id: <20191121170509.10579-12-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
References: <20191121170509.10579-1-srinivas.kandagatla@linaro.org>
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

