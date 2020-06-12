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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C96C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 520E120835
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrxOZMIp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgFLOTQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOTQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:16 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0652C03E96F;
        Fri, 12 Jun 2020 07:19:15 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c3so9886048wru.12;
        Fri, 12 Jun 2020 07:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xaSlq4DJKBHwRl6jTo3wc6TAOXiL/Ic/tD7/TZ/vte8=;
        b=RrxOZMIpJPdQg39B1T/42GBbDogXWAOj5RROqD14JGMQB2vkjP5oaJZtIKDeSclPY/
         8xneXbC4Onb8W58gdHMrF3ZwOcnEsmhQ/uUUYiWJrlkER4Qf/x/DkYZRQnbXRtQz4mUj
         eGlWx1X9tvmLqJuXblHQZeTxd11EaO/K2EznJr2wGUdw0B/+tm4A2zBX9qhMP9FEbBPX
         Ac7fKZkQ0vhXuRIc74+80W7VZQ1U2Shk9rccJ2wA9hrHqsHEIScv6H7gXuXv2rGfdODE
         W2DjXQdmhydNCt//mmh0GtchO2eouAWtgmJmRJVHvH5TFMRgngMK9ZWcFbRBt0vDJ/fv
         g4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xaSlq4DJKBHwRl6jTo3wc6TAOXiL/Ic/tD7/TZ/vte8=;
        b=XbLLXCPrK7O3qbM4Wvo9H+wAqLujlhSDgV9VOqLgZiOH5EP3+bjo4fYbAw2gUwZ5DL
         9R0X1un80dUC2Q2gJoN+qDqeZVRVZzj0va8OD2sfQEB/2HRA8nAEOrpby3qr8IxFEsEg
         alZBZQIELlkQfCMZSt6U6q6oRuNri2bebDHc78Qz9TzpPrMVQbPuflGrPFuXeIvczGNe
         IZufnyPwCEqFcbp4lRW7rvxYdCnsDy7Hm95EQonnSul9ZNAx8DSWNBQwoenRMkieZ5Aw
         Qp9t+Ec4aH71MeWT8pwyeOeuBliO+uy2J46ho8yE0eJXwA7Wl8o26zFuQPXRnv91ynaL
         Owmw==
X-Gm-Message-State: AOAM5305CQXmbGFBbxxuZI4sM4xCcUwTidadJ/VfQtU9aK6kznUHCj5K
        ovSkNokilCcVnRO4la18U9w=
X-Google-Smtp-Source: ABdhPJx7TS+09fU0fxiR1SlrZSwrDzbLJg22LYIgD8tFS0tjkdm+HCummwPTBFdZg9Nlpgv99NlcCQ==
X-Received: by 2002:adf:c44e:: with SMTP id a14mr14359616wrg.50.1591971554503;
        Fri, 12 Jun 2020 07:19:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d17sm11022387wrg.75.2020.06.12.07.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 03/38] dt-bindings: memory: Increase number of reg entries on Tegra194
Date:   Fri, 12 Jun 2020 16:18:28 +0200
Message-Id: <20200612141903.2391044-4-thierry.reding@gmail.com>
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

The memory controller and external memory controller control multiple
channels that require additional register ranges. Allow the number of
ranges to be up to 3 or 2 for the memory controller and the external
memory controller, respectively.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia,tegra186-mc.yaml                   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index 581572fe3077..774b04d0da0d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -102,6 +102,31 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra194-mc
+    then:
+      properties:
+        reg:
+          maxItems: 3
+
+  - if:
+      patternProperties:
+        "^external-memory-controller@[0-9a-f]+$":
+          properties:
+            compatible:
+              contains:
+                const: nvidia,tegra194-emc
+    then:
+      patternProperties:
+        "^external-memory-controller@[0-9a-f]+$":
+          properties:
+            reg:
+              maxItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/tegra186-clock.h>
-- 
2.24.1

