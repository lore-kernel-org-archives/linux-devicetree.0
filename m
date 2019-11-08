Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEFCFA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:35:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12A8B21882
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573227343;
	bh=kIAf46wtogcVIqzw5kroWn6NGwzlDD8M+MZF+eyeihU=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=mp8YSsluBMOohtL/CAU3p4hL5IvZKeplrRxoFivGMTh5rdtFUsTHiXnyL2jeHqMho
	 e41SEN1Dsuq3ll1B5nRYiy/sEx8NtqTP6I5OSjwbQlpCU/Xozvx+OM9ZezzMx5Fd6/
	 o9thtE/ySu7+Ljq4HTUJg8IgcxbjLEGNyOHtA+Sk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbfKHPfm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 10:35:42 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:33279 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfKHPfm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 10:35:42 -0500
Received: by mail-oi1-f176.google.com with SMTP id m193so5605022oig.0
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 07:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NfUR7AY48iGFIM63M9JPwQgnYKrGoOgxnaqbx8BPJk8=;
        b=cuMiX3A4+YnrLxgHbBwqvuhoqzVZTkqOTG3ZRWDEtAU9TWMs0BBVXAnwFpd8XvsRVm
         eohMhTvtxvcR+799aJbtXj2qv73/Gtt0VXNbhFPJAezEr6uu8inlgOfaRfcmt2bBsrVC
         sT8ftDKUTaT3KVQFXoMkMC8grNm30z1pAFPyNkNbJ1v/KedzCxFF+MqziSm+5/llly/B
         t9wXn2AlOr7GFD9mPLtuCJKnwK+7T7iAUTr2/36YuugU0SGu8I+OFFTXzMSgeovPsN35
         UsFwLQ2NK20BkjndKw3t+ULZFyVwNzyb2TdL/oktPibJBnT3LSRxDtcs+YRSZW3NT4GG
         lNpw==
X-Gm-Message-State: APjAAAX0jyZqi/j6twFKrfGrAMN+3l2GXRMxZbG4Q+ZhymKnfHBxxNkk
        hpA1wNdqS/jRomlv+7TW6g==
X-Google-Smtp-Source: APXvYqx68DVoAj2vGw2SptgDRf5u6t42E0asrMtHMURk1fJLAHVzUY4jKd1c0hgskKtnqGcWkLyxMQ==
X-Received: by 2002:a05:6808:6c5:: with SMTP id m5mr10126783oih.16.1573227341487;
        Fri, 08 Nov 2019 07:35:41 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id d205sm1861423oig.28.2019.11.08.07.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:35:39 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] dt-bindings: vendor-prefixes: Add 'fsi[ab]' to the list of non-vendor prefixes
Date:   Fri,  8 Nov 2019 09:35:38 -0600
Message-Id: <20191108153538.11970-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

'fsia' and 'fsib' property prefixes were added as schema in commit
2f52475bac7e ("ASoC: fsi: switch to yaml base Documentation").
Unfortunately to do checks on actual vendor prefixes, we have to track
the handful of prefixes which are not vendors like 'fsia' and 'fsib'.

Fixes: 2f52475bac7e ASoC: fsi: switch to yaml base Documentation
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Seems to be an old binding, but there aren't any upstream dts files 
using these properties. If there's not backwards compatibility concerns, 
another option would be to rename these properties.

Mark, probably should go via your tree as that is where the error is 
introduced.

Rob

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c5ec0a..67b89db54aa2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -16,7 +16,7 @@ properties: {}
 patternProperties:
   # Prefixes which are not vendors, but followed the pattern
   # DO NOT ADD NEW PROPERTIES TO THIS LIST
-  "^(at25|devbus|dmacap|dsa|exynos|gpio-fan|gpio|gpmc|hdmi|i2c-gpio),.*": true
+  "^(at25|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio|gpmc|hdmi|i2c-gpio),.*": true
   "^(keypad|m25p|max8952|max8997|max8998|mpmc),.*": true
   "^(pinctrl-single|#pinctrl-single|PowerPC),.*": true
   "^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*": true
-- 
2.20.1

