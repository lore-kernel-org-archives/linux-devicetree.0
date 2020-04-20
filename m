Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE368C55181
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 21:57:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CED42084D
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 21:57:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4dOiAhj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgDTV5T (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 17:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727873AbgDTV5S (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Apr 2020 17:57:18 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF401C061A0E
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 14:57:18 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d184so1224609pfd.4
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2020 14:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NrTIGfIIMpJ/CNe125wA13W3OdRcgnbEi+8exEuNX+0=;
        b=c4dOiAhj7WKuRROmTvZUIggJYFStbr93zDKyoIo4mrZUZ7Dg0w0KzGPAqwZq6aHbE/
         pEWv+AQ/0f4aTdwmFkHYFgA2pmNLICB3fJ5bvS5og3alGEZIR7gcLUHnn3OLMrfTEYO3
         tRdz/XGvdb0TlZGlfEnXBDtrCa8wIIIcHaigWXxDve6A+8jL9FZ+SyRGgj1j9rm3/drh
         6JPd928o1fbfm2N3hcOsNJKsCdlTMgzv5X6YKwnoi29NHuD+BJhL0Q+Tff58Hd1q2OHe
         5pHVWhp2Y2bk2BLYUnjPIvhaEVoW5L+NcKVPegmXsfphEBHb7lIfVPrtAYR29t0Et9rb
         wyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NrTIGfIIMpJ/CNe125wA13W3OdRcgnbEi+8exEuNX+0=;
        b=YZbBy9wcfhbAtK4Sc4t3Jue/zhtPARvVrIObqjIpxvCGiUZ8g9nolc3WgC38uNfXOm
         mOVuE9mtjYAARk+D2c5c5QO/Xm5jvyM9T9UpvweN1iRoZPJiAXkO5g0EeZmXdb7tcQd3
         j9kB+8f+6QPPWheiz4Ii49bYf4uZbcsKxMC6BB8YnjzrwoG+6+BbqywD+WUSSREAFCRP
         xLughC+35TCAgnbfX2qynBHiCFWRQU4roOKNBRav1JBEF/d+3Ngh7CZJyvQZ3AqC6jum
         Zp/tUkIA0BjgQ6AkNebV1iqgx+TcmT8YwwuK9PR+zrbOF5lnQKIpBGcJsWvUxQatPmTI
         QnQw==
X-Gm-Message-State: AGi0PuYqhYFQwh0PiBoxmc1/t3PgCYfxzoQO/RLL/KtINmsxdjEHecJn
        3MwuTIz0YWf0C2C18QBnb9GPHg==
X-Google-Smtp-Source: APiQypJkcauE8WYj/wEOtxvtf/dp5pe0DcnKKp0GqhsvfSTlhq2o/cL8mXcrJ3FrznI2EiXkU2dXVQ==
X-Received: by 2002:a62:4d43:: with SMTP id a64mr20050370pfb.156.1587419838263;
        Mon, 20 Apr 2020 14:57:18 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 62sm455565pfu.181.2020.04.20.14.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:57:17 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: simple: Add BOE NV133FHM-N61
Date:   Mon, 20 Apr 2020 14:57:41 -0700
Message-Id: <20200420215742.1927498-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel to the
compatible list of panel-simple.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 393ffc6acbba..daf86ba18f47 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -69,6 +69,8 @@ properties:
       - boe,hv070wsa-100
         # BOE OPTOELECTRONICS TECHNOLOGY 10.1" WXGA TFT LCD panel
       - boe,nv101wxmn51
+        # BOE NV133FHM-N61 13.3" FHD (1920x1080) TFT LCD Panel
+      - boe,nv133fhm-n61
         # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
       - boe,nv140fhmn49
         # Boe Corporation 8.0" WUXGA TFT LCD panel
-- 
2.26.0

