Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90C9C433E4
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 01:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B32C720738
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 01:53:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iSv3LGf0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgFDBxd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 21:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728039AbgFDBx2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 21:53:28 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105DAC08C5C5
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 18:53:28 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id y9so2200492qvs.4
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 18:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i858jJWQbhuwRMj8E1/bxOovHVRlGVAzlzhMfpqJNyU=;
        b=iSv3LGf08jzGFo42mX0KR7PGLzCPQauNhYrrp3BXnzbEc2CW7abMVDkozTgcYHf/yf
         s06fyMTLbG0oexq0OXdsjoYiPqq3jub1muv86cBhQuRun9lTu9qyObmSQhH+ZbqwEspx
         j+/cCPcW9aXerBwgotYV3sFiQLISg0OInwfqnT898hy7S+mmH5v2P4oIe7/lJJrdIma8
         qFVD9dKIT603LPHP8ksXAJ9aP8QhIhZSkHv7lEUp1bmgFT3A+SRbUw3uvSz9z8pa6i+6
         oZybQtGht8sq8EH5pgK8aWzj1S21q4RDdPUoKXCQGvEKkHuWOwKWiNyr2lbuh+H8JmMM
         T8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i858jJWQbhuwRMj8E1/bxOovHVRlGVAzlzhMfpqJNyU=;
        b=sxX6xu/9WKLoeZPuM90m+N5HC+EyHVdbQESmd1n/wqvOGn39TMiCowq5nzqEPYuxia
         Lcn1E+TqU7V2u8p3QMfIItX/P0llpkikyM8ywbtxW2Pzki/Oe5+lv7aMxMUAs3DdSmjb
         LROVP5bb5+ydZ/YKd8x9en9KbmY5SsUMwUH/MUyg4+ePGWlwn5kMaRskEg5a3tlEJRub
         Uf59B1+PByV4nnqkOPiP/c7PVMU1qbIDLaAoBjnVloX/3RRuTaiZYxQwIOAC3kki2oOQ
         kHRejBzRtn66fhmV8aoOStdDLUV8fz7Px8fIlznkv7ci9vl27IxOqkhBILClavPKGLpQ
         RpHQ==
X-Gm-Message-State: AOAM5303TaqlGf6UpFHjrwhxbkYQ8oUg4dNmYT0ZLPDmFQOpYQYWkqoH
        9FmM8c2/dQH2UqKOi+k6/7vsWw==
X-Google-Smtp-Source: ABdhPJy/qVnYPDu7TwQ009JRMbLWRxZ8N0T6NTl5vAfmesQQgKmZ693NBu1XxWhNl9aBfX2gOnZ6KA==
X-Received: by 2002:a05:6214:28:: with SMTP id b8mr2571818qvr.60.1591235607224;
        Wed, 03 Jun 2020 18:53:27 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id t74sm2986439qka.21.2020.06.03.18.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 18:53:26 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, robh@kernel.org
Cc:     amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/6] dt-bindings: power: Extend RPMh power controller binding to describe thermal warming device
Date:   Wed,  3 Jun 2020 21:53:16 -0400
Message-Id: <20200604015317.31389-6-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604015317.31389-1-thara.gopinath@linaro.org>
References: <20200604015317.31389-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

RPMh power controller hosts mx domain that can be used as thermal warming
device. Add #cooling-cells property to the power domain provider node to
indicate this.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---

v3->v4:
	- Removed subnode to indicate that mx power domain is a warming
	  device. Instead #cooling-cells is used as a power domain
	  provider property to indicate if the provider hosts a power
	  domain that can be used as a warming device.

v4->v5:
	Moved the property from .txt format to .yaml format.

 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8058955fb3b9..a4fbbd88ce18 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -28,6 +28,9 @@ properties:
   '#power-domain-cells':
     const: 1
 
+  '#cooling-cells':
+    const: 2
+
   operating-points-v2: true
 
   opp-table:
-- 
2.20.1

