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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD1DC433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DD812067B
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQvgAEmn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgFLOTa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgFLOTa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:30 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340D7C03E96F;
        Fri, 12 Jun 2020 07:19:30 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r9so8328477wmh.2;
        Fri, 12 Jun 2020 07:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gThTdFphuXnB1DL0fq0c4kS0rmEMNDUD3dbdNO3reiY=;
        b=PQvgAEmn6bX8+E/8wfvofLtRM2kAovn+8Rz1HdZlH/FViUJPVAXB310qortWCRQrz+
         r0TwB2JqU0VnaKr4kmY/dUR1C6ri1v34qMuuTHBPY+hCFw7B3AenJ9zFliQJUD3XUXBR
         X2i0v2Ofi1oTNOuzlPQmkpmA9Mwd8nTNVMu/hybSJKTQoKnw1MZUe6PnYy990fJ0fX3L
         x+llBYCwlGzWswR1ffw3gwxJRyEVVvEzr8nj1nEMqm1AUfajf3aNcVGrvuX6u05cbAfI
         M7RIFQxLf3blQbUSzGvBGUMQBRSAcTmUUJIrBcynP6VD55J0ImQJi1Qf4nX9kqohQjAR
         Bs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gThTdFphuXnB1DL0fq0c4kS0rmEMNDUD3dbdNO3reiY=;
        b=AB0ZK+hUjxdkgLcqw6nYBovSeh/MG20Rj26YBThWJOzEXjDBRWZIshdK7Wjry5zwT+
         qEE4z/KolRfWeCw7NqaCO/tVYyz86oKo4WoQXF8AaUGQF2F1LzwYbAqy2YES+ZNbTJuk
         C3KiLt/6GNviznUFODuqriUI2unNR2ubMwXBrH8VblKAgyiTA62h9zN7sntUWPDIQa+L
         qo81jjQ2SpD/F3MqnbM0okkpPZwJC+jH+PeBSkG6S5eZW2bsaZ5dsdBr2lSMRmgZxSjW
         CtsyoOJyU85Ymzjn0/0jvRVFk7Yn2lJgmR7HKHxxIE5t7uD0j4S6jD3ByG8ovsh+0E51
         eQcA==
X-Gm-Message-State: AOAM531nvX/o3CTZBGVzQeL18FwEu1h692C8bOp5zkr4M5kJOecL4ejy
        pp+7N1KRU/24C3RNTC2wVx4=
X-Google-Smtp-Source: ABdhPJw/3eHWtnMtoUW2xSgEZPa92BouhmWcg5lbmLLZXkNyj1pZPql+54KTPLMT7wXVpr1xMtrOaA==
X-Received: by 2002:a1c:c1:: with SMTP id 184mr13666427wma.74.1591971568979;
        Fri, 12 Jun 2020 07:19:28 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id s5sm8915628wme.37.2020.06.12.07.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 10/38] dt-bindings: gpu: tegra: Document interconnect paths
Date:   Fri, 12 Jun 2020 16:18:35 +0200
Message-Id: <20200612141903.2391044-11-thierry.reding@gmail.com>
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

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/gpu/nvidia,gk20a.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
index 726ef39b2221..40191e1a241e 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
@@ -71,6 +71,21 @@ properties:
       ../iommu/iommu.txt for details.
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
+  interconnects:
+    description: A list of phandle and specifier pairs that describe the
+      interconnect paths to and from the GPU.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  interconnect-names:
+    description: One string for each pair of phandle and specifier in the
+      "interconnects" property.
+    $ref: "/schemas/types.yaml#/definitions/string-array"
+    items:
+      - const: dma-mem # read-0
+      - const: write-0
+      - const: read-1
+      - const: write-1
+
 required:
   - compatible
   - reg
-- 
2.24.1

