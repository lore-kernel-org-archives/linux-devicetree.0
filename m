Return-Path: <SRS0=kXJJ=3D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD29C33CAE
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 07:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 602DC207FD
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jan 2020 07:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YahZMu4j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgANHQM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jan 2020 02:16:12 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33958 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbgANHQM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Jan 2020 02:16:12 -0500
Received: by mail-pl1-f195.google.com with SMTP id g9so2661021plq.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jan 2020 23:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EoATaCn4ot7/fRXVyyupWqTUK/J3grtKGGD0GZimmTI=;
        b=YahZMu4jUSx+kdGsktVd/kysOsca1+L1cDz6GC/y3EdchGBL4lmkZC+vd2F+RyK0A7
         cSFw3LO7hgNpta3FVyHm971uhVjHwJ2SCe+7L/g+HAE+Ip5mi3Zg2ITUK1YM0hs9vyPL
         bojXkbovYxxTJydqmr/V1/I5IiLD5C/gKkXm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EoATaCn4ot7/fRXVyyupWqTUK/J3grtKGGD0GZimmTI=;
        b=WXKsLvaeciiL/aOlaDuAuGFnf8FgfsXeLRUYYJtEyiD/cvWwMJ9sUL5s+pX5CEKKL7
         5MLBwvgtfmfqM/Q8ZS2gLyvEp0ZPnA5Xz2Gp/OGsdNCdcgaDIEkTJm8iU7dIZfXGRClN
         FrgELh5EW8lzZeTEvEhfzbaL7PE5eeeeWlmZU1+HGKQzudhbooxWIwptf/yGdX3cCYc/
         sUtROarfGMXFvvtx0DwZ/zAZjPWMmDj/DxzLx5O9wqAeWOIy6r4PrGZIcHbnIuVNYhdM
         7Q36iaYB3GXLPtlMYg8D8hW65yXwO/FKsrNk6gUx6fB5POaGFLcZf2EsdW+LGuA2G806
         yx/Q==
X-Gm-Message-State: APjAAAWCFd0GXqMTqXb+3NedX6Tzn43QAN/vm7Cp1hK36R0IvXTwN3T4
        aORpIzZixMRxMaa/b38iwaMCoQ==
X-Google-Smtp-Source: APXvYqzQuE+WVs1Zt0wpcg6768ZyfON0VW874YYaBtjWl2nYKw4EH/znBkyBISA8PcAG89pGqwd32g==
X-Received: by 2002:a17:902:d68e:: with SMTP id v14mr25504465ply.36.1578986171223;
        Mon, 13 Jan 2020 23:16:11 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com ([2401:fa00:1:b:d8b7:33af:adcb:b648])
        by smtp.gmail.com with ESMTPSA id b4sm17092976pfd.18.2020.01.13.23.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 23:16:10 -0800 (PST)
From:   Nicolas Boichat <drinkcat@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org
Subject: [PATCH v3 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date:   Tue, 14 Jan 2020 15:15:56 +0800
Message-Id: <20200114071602.47627-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200114071602.47627-1-drinkcat@chromium.org>
References: <20200114071602.47627-1-drinkcat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Define a compatible string for the Mali Bifrost GPU found in
Mediatek's MT8183 SoCs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---

v3:
 - No change

 .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 4ea6a8789699709..9e095608d2d98f0 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - amlogic,meson-g12a-mali
+          - mediatek,mt8183-mali
           - realtek,rtd1619-mali
           - rockchip,px30-mali
       - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
@@ -62,6 +63,23 @@ allOf:
           minItems: 2
       required:
         - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-mali
+    then:
+      properties:
+        sram-supply: true
+        power-domains:
+          description:
+            List of phandle and PM domain specifier as documented in
+            Documentation/devicetree/bindings/power/power_domain.txt
+          minItems: 3
+          maxItems: 3
+      required:
+        - sram-supply
+        - power-domains
 
 examples:
   - |
-- 
2.25.0.rc1.283.g88dfdc4193-goog

