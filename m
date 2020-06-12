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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14327C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E982D2067B
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnHw95Z5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgFLOTN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOTN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:13 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE79C03E96F;
        Fri, 12 Jun 2020 07:19:11 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l11so9937997wru.0;
        Fri, 12 Jun 2020 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JUt0AYJfKj8MFIRdgCqpJFPgWOUl9j9MjA+Lv1m1gLo=;
        b=WnHw95Z5sgr6+4PZ7sgqX0OFcNVk/y0rGpSU1IJ48g6Cy78jTDGf/+8Z/rDRqStgA+
         jX68f35Q4R1OGjwEQvpxpFcBhT8Z9yeFX0nBxEf8TgJZmIjhz6QRhkAm5Eb/ESXM2+zF
         C15F8gZ7vHYIYfdLvDToQQDIxK58aLTrVIkFTuv8pvR7zw+aHknjuT/HXeVERCXn3KDa
         pDw4S8N9r+opbtn+VHU3A+ztdFHF4OXZGh8uwS+pyngOvcahO2a2XArdUQ5e2OXF0Npv
         lu+ItthggEogyMKcTJwJcKWNBQDy6dxq10O9M/i5NxZFw0qL+RzT9e/gPNpITIoAhvHz
         Bfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JUt0AYJfKj8MFIRdgCqpJFPgWOUl9j9MjA+Lv1m1gLo=;
        b=RuVxf4mDKEgLgyw4F2iYlcNzrklASl/utM1/bgyeugI8tnvQ3xjfGnxze2Lti2fd9u
         STcOy0lELwtBQKMvgoQcm7UNMXe9+wIOnTZyjoYLMK423JGEFbmPFDQZWqNfxbxcp6Ln
         EVPbHQmENj6aVT6gNnIuw+hjdqL3KfYWGfQdlB8f+l6Wa8F9abi20ymHqh3GJNIwA9Xh
         2IPYoeayS0IrMbAhxAGP76UmQOIHfqufkNwC/6awIgG1jDUezSe2od61zVCJ1FqdOCsC
         Xn/J7GBMf6xClCwYnByA/uAQ4p4/N9Ul3pkpWPPPtiyqVvyyXzXCe/RJMXslSO8Y3Zk8
         A5TQ==
X-Gm-Message-State: AOAM533c1IzVhgzYlp/1MGKe/eaNbMMh8OT62NATweLi/5PnpMS57DRl
        8B4Vrb7TuH5H31whzjS+hSk=
X-Google-Smtp-Source: ABdhPJzrQ6l51HHfjTONB8AutgpgeffBJbKk/3o2lfToaCipNyaAuNyoeGfTSA2+lMpc/ZhIz+vmTg==
X-Received: by 2002:adf:a396:: with SMTP id l22mr14989009wrb.24.1591971550526;
        Fri, 12 Jun 2020 07:19:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q11sm10285928wrv.67.2020.06.12.07.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 01/38] dt-bindings: interrupt-controller: arm,gic: Add compatible for Tegra186 AGIC
Date:   Fri, 12 Jun 2020 16:18:26 +0200
Message-Id: <20200612141903.2391044-2-thierry.reding@gmail.com>
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

The AGIC variant of GIC found in the audio subsystem of NVIDIA Tegra186
SoCs is mostly compatible with the version found on Tegra210. Provide a
Tegra210 compatible as a fallback compatible, but also require a
Tegra186 specific compatible for forwards compatibility in case there's
ever a need to implement instantiation-specific quirks.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/interrupt-controller/arm,gic.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index 96f8803ff4e6..becc4364e419 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -53,6 +53,13 @@ properties:
           - const: brcm,brahma-b15-gic
           - const: arm,cortex-a15-gic
 
+      - items:
+          - enum:
+              - nvidia,tegra186-agic
+              - nvidia,tegra194-agic
+          - enum:
+              - nvidia,tegra210-agic
+
   interrupt-controller: true
 
   "#address-cells":
-- 
2.24.1

