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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF97C433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C982C206C3
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNYovplp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgFLOUT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgFLOUT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:19 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC814C03E96F;
        Fri, 12 Jun 2020 07:20:18 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id c71so8313078wmd.5;
        Fri, 12 Jun 2020 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tpmIWV63uwyKISwK17nisGC9fQffTHu8K3PSofNUxqw=;
        b=qNYovplpWh9OlnkBHZw8SzslGKxfwPum3b3M4cGorznGnmFRLBSlRnaw2mzLv5sOJl
         KRIWKVyrn1reU2AmCxo872ZpkswXCZyKvMf+DLgRI2EPO2iWT94ERNRn4uHlujBHMtKY
         3n2wV8gn57yLnnFqcHNdrx28wDsdbp8cdDOGCTftEepyBhxjI2Y5gptowMqMYknFBSfI
         FC4Yv50Tl2mTFeHxn2HsMFnS5IsKYF9bB9z0p9WPYOM/38IHZw19X6NHGHNBh9usXxKZ
         XOJm6Xt2fruz8Ke0/p6DXHNNsKhHhZ5fId14nHIi5zf4XtDqdg/PGUYNuuAtI4hDzpfT
         Iuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tpmIWV63uwyKISwK17nisGC9fQffTHu8K3PSofNUxqw=;
        b=h7pHUWN7PvrVTG+R+yMV1HaewY/kVjGDl0BmevKjIpLp/q3LesVnTc/Z7CTIjo03ZX
         /88aGVNWzVWcQ1JgdIpvkFYiXWyTgAVflaMnGK5RnxTi0UhBN3iYFisuI8nkGgMKTXDS
         7/RZynh6jxDAPFKzDPKt98LWsDAJoVc2sAyZU1MXbEe4N5Nb+GWJ2w3yQnA0jOa80azA
         fy3oWWYyvYND084q4xs2sLkszDQ2ea50P1BFU+Twrc93m5dycjEL6xqUeZyjgmGJ7N0p
         zCUandYzzdJOsFrMg28lOkOtXjJ0w/Xb9qHlRp/fxYbBYXjVS3w5HUY8zJM0GmXO5wLQ
         JFrA==
X-Gm-Message-State: AOAM531tD2pwscAoq6stMPPV4BCEjnFlCCWvpZOszZtlO84rj8TjP10w
        WEM9ybOwiKD6ffizSJvVIlc=
X-Google-Smtp-Source: ABdhPJyGSmDd3eH2dVwfMvJqcyEZqbzyq61yzi1YykKZ5cD53NrpL1elzUn4wgdSvQ5F3zW4c8Qlsg==
X-Received: by 2002:a1c:6744:: with SMTP id b65mr13612519wmc.170.1591971617583;
        Fri, 12 Jun 2020 07:20:17 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 104sm11024820wrl.25.2020.06.12.07.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 34/38] dt-bindings: memory-controller: Fix "reg" entries on Tegra194
Date:   Fri, 12 Jun 2020 16:18:59 +0200
Message-Id: <20200612141903.2391044-35-thierry.reding@gmail.com>
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

The Tegra194 memory controller needs a couple more "reg" entries.
Document this properly so that device trees can be validated.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia,tegra186-mc.yaml                   | 39 ++++++++++++++-----
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index 774b04d0da0d..b04485c5cf5f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -27,13 +27,15 @@ properties:
     pattern: "^memory-controller@[0-9a-f]+$"
 
   compatible:
-    items:
-      - enum:
-          - nvidia,tegra186-mc
-          - nvidia,tegra194-mc
+    oneOf:
+      - description: NVIDIA Tegra186 memory controller
+        const: nvidia,tegra186-mc
+      - description: NVIDIA Tegra194 memory controller
+        const: nvidia,tegra194-mc
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -74,12 +76,13 @@ patternProperties:
               - nvidia,tegra186-emc
               - nvidia,tegra194-emc
 
-      reg:
-        maxItems: 1
-
       interrupts:
         maxItems: 1
 
+      reg:
+        minItems: 1
+        maxItems: 2
+
       clocks:
         items:
           - description: external memory clock
@@ -107,11 +110,18 @@ allOf:
       properties:
         compatible:
           contains:
-            const: nvidia,tegra194-mc
+            anyOf:
+              - const: nvidia,tegra194-mc
     then:
       properties:
         reg:
+          minItems: 3
           maxItems: 3
+    else:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 1
 
   - if:
       patternProperties:
@@ -119,13 +129,22 @@ allOf:
           properties:
             compatible:
               contains:
-                const: nvidia,tegra194-emc
+                anyOf:
+                  - const: nvidia,tegra194-emc
     then:
       patternProperties:
         "^external-memory-controller@[0-9a-f]+$":
           properties:
             reg:
+              minItems: 2
               maxItems: 2
+    else:
+      patternProperties:
+        "^external-memory-controller@[0-9a-f]+$":
+          properties:
+            reg:
+              minItems: 1
+              maxItems: 1
 
 examples:
   - |
-- 
2.24.1

