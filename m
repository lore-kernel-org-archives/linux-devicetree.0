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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FACC433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAD152067B
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kkb8O79B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgFLOTU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFLOTU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:20 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D666BC03E96F;
        Fri, 12 Jun 2020 07:19:19 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l11so9938503wru.0;
        Fri, 12 Jun 2020 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vX9MKJW8wweNyEpOdFefXX+Pm5osjIbsFmCtkArM0kw=;
        b=Kkb8O79Bk/zeza1zOhpzsut5ZWjE3K40vUpfgsJhAukmTNpG2pCxMViRie3zc+S6Vs
         Z5BrWsuQkPRPZoso0ZHWPLATzm8XkHGqUs078+FBixx0WFpMYEcmbaBTQoEedPiduhUr
         kLeAlyZlnZZ4CCz3BgmAi3y/MnO4Rtfas1/HGQSHq25LOWzxQAUpszg5r9hAUFS6N32d
         dATJaMNNifhazRcpkaZyVM+0ge0Tb4wH/mmKe0+JAbvpd5L0s7LbkZY/mi14k5oJMKRg
         yFaMkJatTSC9P36W2r2fh9zuqYWMPX6zmAurXaK+KBxmKXptTgirbxsyqDaFbpC3yHUV
         MYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vX9MKJW8wweNyEpOdFefXX+Pm5osjIbsFmCtkArM0kw=;
        b=Sfq47Ascsf1jXZiW2mNLDcOFuEqwe/23fanj5fwuloBdI6fKgLJTuytA76MlmuXucQ
         3G1FDGhZZYNfXqTG4xQyDG8yOEDBcimdQ30UzQ3EaOnTdGWVUB28lMkFg7pLa/+nQef1
         NjAcMriQklN7OrABv0uoqEIwqjfOY6xctGQQX1EZSXX2rpCo4ZKaFg8DdYFARdG2WmZX
         5KpK2v7NMTf3yWUSrWClKA4y9erahg/89xlKYPgMy3uhqCIZzqykIbz7DP1hayGieYJh
         LOWjy+72E59KaoeBloRXVH/B9/YzH4Ui3y/7LRUU3JtoHOl2PsH7iWsLt6eTAZJ6AG8D
         7y4w==
X-Gm-Message-State: AOAM530Gw8leySFLA2s7XY+kQIayyMUG8CzlvWlZrS4D5CIhQ3m6aK5w
        6s19r+NRAvW3ZNZGohixdAo=
X-Google-Smtp-Source: ABdhPJwEYU4bMLQmJ1g4z97rAM3TNlP7/7ENsuM52k6pQmkGfHm87f3s7SzBD89Nd64LaeISJmfj8g==
X-Received: by 2002:adf:e58c:: with SMTP id l12mr15284425wrm.34.1591971558641;
        Fri, 12 Jun 2020 07:19:18 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a15sm10426183wra.86.2020.06.12.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 05/38] dt-bindings: firmware: tegra186-bpmp: Document interconnect paths
Date:   Fri, 12 Jun 2020 16:18:30 +0200
Message-Id: <20200612141903.2391044-6-thierry.reding@gmail.com>
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

Document the interconnects property that is used to describe the paths
from and to system memory from and to the BPMP.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../firmware/nvidia,tegra186-bpmp.yaml        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
index 0e4d51ba7aa1..fd642eeb8dde 100644
--- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
+++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
@@ -43,6 +43,21 @@ properties:
       - enum:
           - nvidia,tegra186-bpmp
 
+  interconnects:
+    description: A list of phandle and specifier pairs that describe the
+      interconnect paths to and from the BPMP.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  interconnect-names:
+    description: One string for each pair of phandle and specifier in the
+      "interconnects" property.
+    $ref: "/schemas/types.yaml#/definitions/string-array"
+    items:
+      - const: read
+      - const: write
+      - const: dma-mem # dma-read
+      - const: dma-write
+
   iommus:
     description: |
       The phandle of the IOMMU and the IOMMU specifier. See ../iommu/iommu.txt
@@ -158,6 +173,12 @@ examples:
 
     bpmp {
         compatible = "nvidia,tegra186-bpmp";
+        interconnects = <&mc TEGRA186_MEMORY_CLIENT_BPMPR &emc>,
+                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
+                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &emc>,
+                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
+        interconnect-names = "read", "write", "dma-mem", "dma-write";
+
         iommus = <&smmu TEGRA186_SID_BPMP>;
         mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
         shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
-- 
2.24.1

