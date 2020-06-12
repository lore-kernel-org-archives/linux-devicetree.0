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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BDDC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A285C20835
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLnZKemN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgFLOUZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgFLOUY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:24 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D8C6C03E96F;
        Fri, 12 Jun 2020 07:20:24 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id y20so8480428wmi.2;
        Fri, 12 Jun 2020 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ih6rrUh9kk4w2OAPwugug+lsyzP8zbXUsO+hMWuXafs=;
        b=HLnZKemNLIRineuRLSQ6u6EngnPPCnej/o7/Ihfn3+imC92ohawSG++iQjn6c3PNuz
         lGBgZHNh3eJ6SETT21J92wSFoTr9TwqkYuRWHqsmy3Xr9jWSZi4BBuh3lfCLnD7cR5ku
         zGKxTtJhv+SajA5tn/xTynrX9JIz6UfoH/KwI9y1dUE/BOh2qfCMV+l6b6eP8WUmoNe5
         2trM6wQ2vv3SBjMmF3B/LDiEp42Boca8dGk+387NWDB+h0uzJlDW7P5t55NSZ34mfQ5O
         rZnLjxZs0ExcU/h+k47rM1cHnSVD+m+w1LYxrhSdLdL+9RyKGbOKGLEXwdD3HcZG5ltq
         HY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ih6rrUh9kk4w2OAPwugug+lsyzP8zbXUsO+hMWuXafs=;
        b=jbyt49JtpFfDiMxca8eP4t/6k5eQIINo/+g8W2E2JaFMHdVAIhOAPwWstcbA3Y7y0k
         s1Ks877/NezqKuDNh3nke66KXUao6EnQT7pPgQDmpGN4qt33VRUtBYfy1yvsZoDtQWpq
         20umZyeX8c7XxsT/EszidC5/sym3NeXkmdlWugSc0iFNxG00IMYidVIA6XFPHHcSIf5R
         ekEyjVWH6oilLTkwxigZw/BWh6dqwb+1RRbyofOxEa2iRMzfUg9vmY2alJoeVewu7WeK
         5yiNKbiW69wJMh9qVjJrR2KmpF0A5nCop5vfklz+ArtqHXSUAUfalmIvywH2dW3Olrkk
         CkXA==
X-Gm-Message-State: AOAM533XdHqkiGDovxKQsy97SCsdy14fQnxgmpPA6e1nLiQ3TQz5q2jo
        kNe/yWJE5PdOxk3IRLssSe8=
X-Google-Smtp-Source: ABdhPJx3PwizkggA57ZFW2LtZtKZREtpb3SAd0ZDtxd5IfSjz6pDGfCT/8GUmrIJNAxOPtngi1hn/Q==
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr13906431wmy.79.1591971623332;
        Fri, 12 Jun 2020 07:20:23 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id b18sm9970516wrn.88.2020.06.12.07.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 37/38] dt-bindings: pwm: Explicitly include pwm.yaml
Date:   Fri, 12 Jun 2020 16:19:02 +0200
Message-Id: <20200612141903.2391044-38-thierry.reding@gmail.com>
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

For PWM controller device tree bindings, make sure that they include the
pwm.yaml controller core bindings explicitly. This prevents the tooling
from matching on the $nodename pattern, which can falsely match things
like pinmux nodes, etc.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml | 51 ++++++++++---------
 .../bindings/pwm/google,cros-ec-pwm.yaml      |  4 +-
 .../devicetree/bindings/pwm/iqs620a-pwm.yaml  |  4 +-
 .../devicetree/bindings/pwm/pwm-samsung.yaml  |  1 -
 .../devicetree/bindings/pwm/pwm.yaml          |  2 +
 .../bindings/pwm/renesas,pwm-rcar.yaml        |  4 +-
 .../bindings/pwm/renesas,tpu-pwm.yaml         |  4 +-
 7 files changed, 40 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 7dcab2bf8128..0a7e70114af0 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -50,33 +50,34 @@ properties:
   resets:
     maxItems: 1
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: allwinner,sun50i-h6-pwm
-
-then:
-  properties:
-    clocks:
-      maxItems: 2
-
-    clock-names:
-      items:
-        - const: mod
-        - const: bus
-
-  required:
-    - clock-names
-    - resets
-
-else:
-  properties:
-    clocks:
-      maxItems: 1
+allOf:
+  - $ref: pwm.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h6-pwm
+
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: mod
+            - const: bus
+
+      required:
+        - clock-names
+        - resets
+
+    else:
+      properties:
+        clocks:
+          maxItems: 1
 
 required:
-  - "#pwm-cells"
   - compatible
   - reg
   - clocks
diff --git a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
index 41ece1d85315..a5a1e4f3df48 100644
--- a/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/google,cros-ec-pwm.yaml
@@ -25,7 +25,9 @@ properties:
 
 required:
   - compatible
-  - '#pwm-cells'
+
+allOf:
+  - $ref: pwm.yaml#
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml b/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
index 1d7c27be50da..a375cc9e8fd0 100644
--- a/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
@@ -25,7 +25,9 @@ properties:
 
 required:
   - compatible
-  - "#pwm-cells"
+
+allOf:
+  - $ref: pwm.yaml#
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
index fc799b0577d4..e1487194d9a7 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
@@ -89,7 +89,6 @@ required:
   - clock-names
   - compatible
   - interrupts
-  - "#pwm-cells"
   - reg
 
 additionalProperties: false
diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentation/devicetree/bindings/pwm/pwm.yaml
index fa4f9de92090..b0ebd2881a91 100644
--- a/Documentation/devicetree/bindings/pwm/pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
@@ -9,6 +9,8 @@ title: PWM controllers (providers)
 maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
 
+select: false
+
 properties:
   $nodename:
     pattern: "^pwm(@.*|-[0-9a-f])*$"
diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
index daadde9ff9c4..d2cc1226f309 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
@@ -57,9 +57,11 @@ properties:
 required:
   - compatible
   - reg
-  - '#pwm-cells'
   - clocks
 
+allOf:
+  - $ref: pwm.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
index 4bf62a3d5bba..0db96f38ab0a 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
@@ -56,7 +56,9 @@ properties:
 required:
   - compatible
   - reg
-  - '#pwm-cells'
+
+allOf:
+  - $ref: pwm.yaml#
 
 additionalProperties: false
 
-- 
2.24.1

