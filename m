Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671CDC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44185206C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYhx24H5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgFLOUX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgFLOUW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:22 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8111AC03E96F;
        Fri, 12 Jun 2020 07:20:22 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id p5so9898536wrw.9;
        Fri, 12 Jun 2020 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=928I1EM2JTj1UZSMBEzZJZORHvh9ByE5ku+bNL6Agqs=;
        b=kYhx24H5FDC8t8XEj8GUi8Rjf2nic57OZXC66H6ah/HtjuOMRiqr6tkzN1CF0EUqVi
         XDHN8Wp4mlMj3yb74Zq5G+HDXGlpxmEfE3mlyQg4H/HN3D9VP0SO5cWPFNvbv6r4sUy2
         XlR4CYnSehnl0x0ppnHcfC1pEvSQbk90KWVazrcM5fv2pmR6FJ1Evss1KMsi1Jdhm3WD
         uToWacEa0aBayRejkIEqO8teFpUaW/r/mvvyJ/tzh5PqO/yj6NL7P7DDbSg7/HD8AjiY
         m4ZRANIokwetpaJ+aKJYpGmFnWFeIAbi4Vk8OlRLMctR3wuKgTX6V+m28C7axQylyQk1
         Y3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=928I1EM2JTj1UZSMBEzZJZORHvh9ByE5ku+bNL6Agqs=;
        b=MSe8pSheot8uI+SQ22lZD8jSj5WWGZj9r+/3CmVGSbQqsIJ7TlZNlNquYVJc3NKZPq
         6eppmt9ekpwwmXGnBfRByAZp7bceAU53wtuksh9Q+BpZHss7poxAncrm+J2pPJbeNzMQ
         SXRcOnRfYt0by0LNaav7WnzSGR3cuw0P+d/HZ7FmHIOIr5/6RqTBCPpHVb7zIU91UqHN
         bMWpzFe4XnS9FfOg+VUzAK5h4odCJ7xSN1WhCSgxXDz3SiVN2kmnWw4VeI8yup7dRPGm
         wbEULtTQ5KS5vyzh4ilCiD+arryi8yu7ExmDaHYCoFdIeKqiMCBVF4mGRjC8ZIGQmKF/
         vFSw==
X-Gm-Message-State: AOAM530VUcdB4a3sS4C/nrWWedYO1Zrf3vEqgrr4hRrd0UjX9+3G5Gf4
        OazbWsnhpaR3X/kUzQgXnd/rHcZs
X-Google-Smtp-Source: ABdhPJxFrkuREvSwg+jAXEHXF7DQW9le4FvzwTa1pI+nXWIhkuGUWw0GbtMjmOPHyTrX+3a7BPcPXg==
X-Received: by 2002:adf:9404:: with SMTP id 4mr14934222wrq.367.1591971621285;
        Fri, 12 Jun 2020 07:20:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 14sm7121126wmi.20.2020.06.12.07.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:20 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 36/38] dt-bindings: power: supply: sbs-battery: Document TI BQ20Z45 compatible
Date:   Fri, 12 Jun 2020 16:19:01 +0200
Message-Id: <20200612141903.2391044-37-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612141903.2391044-1-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The TI BQ20Z45 battery is used for example on Tegra114 Dalmore but was
never documented. Add the missing compatible string.

While at it, also pull in the power-supply.yaml core bindings so that
the standard power-supplies property is properly validated. Also switch
to unevaluatedProperties to make sure the power-supply.yaml snippet is
properly validated against (additionalProperties doesn't have visibility
across a $ref).

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/power/supply/sbs,sbs-battery.yaml   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml b/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml
index 205bc826bd20..bb2803850ea6 100644
--- a/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - ti,bq20z45
               - ti,bq20z65
               - ti,bq20z75
           - enum:
@@ -62,7 +63,10 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+allOf:
+  - $ref: power-supply.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.24.1

