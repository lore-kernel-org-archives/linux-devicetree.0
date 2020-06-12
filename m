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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E58CC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BCB82067B
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cd4wB7sZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgFLOTe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgFLOTe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:19:34 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4867CC03E96F;
        Fri, 12 Jun 2020 07:19:34 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id c3so9887085wru.12;
        Fri, 12 Jun 2020 07:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NHW4S6pgLnCqNwviWrUFq/OjognDDu6KJ5Cxc+/UpG4=;
        b=cd4wB7sZ52k5Fxu7WTg9a1UXVZRE8F/bjbxc/z8X62yldOxfvA7PGiLSs7uzUYbtCv
         xSJgfuU+OD2MrxepWU/NRC2vErohzaW6qTNAyvvxmUd5YBXTPVBrbtftA/PhPXKw8c3P
         hnQux+bcz46QuyPlBvnHDIrWUIBIriWQqY5dls1rmrSH3I4vK6x6gY3BfqZI7/v75MAp
         shCfBUlY++zNlRdrU5DNJW/+pIRSqh9heTjykpqqoTSpJGnsx9EGuwGQ4jQS4ycGjnGB
         6YxD/Tj1UVh7OYfEPw4mHGyZQQUTYlcOJ6MZZ1IaZrwKw1I5Hls3T9cWZJRLLbBmrN0r
         vYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NHW4S6pgLnCqNwviWrUFq/OjognDDu6KJ5Cxc+/UpG4=;
        b=a1kZd9qSnUnB1qzrsIMFxNT3jFT2WVEgvt4SBreaQYSuOnVDDuxT8+dBk0IFlxZGzF
         sUUoig8tMiEtnD/vuzGXrLQkk498wWQ3WcqZh1oTZfFN+U6EeeCf6kUNOEmVwr+WSqF6
         LOBXMKcrNv8A4oE3Jt40wIb+mpZ0EktQSUsHPYe93EUfTFTaRGiwhQJ3mEkquH9TONe/
         wJXQ2LX+sVH2y1WTQdEuXb08Nv+xrGPlqW1gS+ImeoGeyu5XQSnGPBMbW6sBZzYUk6Fl
         qaaACE/yuXWLylaRVs0xtFzYXWuSHZZ2TG5Xa99mR84xZvXryB7K61KBChD748BwBUJ3
         RyTg==
X-Gm-Message-State: AOAM5321Gys1xERjBKds4nsveMLURQjJxpPW6r+TYilIhGSIOd65iXwW
        qaiFSWT3U8sOnx44Yg7ZBuIjvqYL
X-Google-Smtp-Source: ABdhPJxSROkGZKx6lZlyeum7+01uR5cGvIHSZPi/dPpAaU0/9m9YhLDDVa1EoGfr8u7kZp4uV/k3bQ==
X-Received: by 2002:a5d:54c3:: with SMTP id x3mr14854558wrv.312.1591971573028;
        Fri, 12 Jun 2020 07:19:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i10sm10182332wrw.51.2020.06.12.07.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:19:32 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 12/38] dt-bindings: mmc: tegra: Document interconnect paths
Date:   Fri, 12 Jun 2020 16:18:37 +0200
Message-Id: <20200612141903.2391044-13-thierry.reding@gmail.com>
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
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
index 7652c2c1ff35..70931288bc70 100644
--- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
@@ -86,6 +86,19 @@ properties:
   iommus:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
+  interconnects:
+    description: A list of phandle and specifier pairs that describe the
+      interconnect paths to and from the SDHCI controller.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  interconnect-names:
+    description: One string for each pair of phandle and specifier in the
+      "interconnects" property.
+    $ref: "/schemas/types.yaml#/definitions/string-array"
+    items:
+      - const: dma-mem # read
+      - const: write
+
   nvidia,default-tap:
     description: Specify the default inbound sampling clock trimmer value for
       non-tunable modes.
-- 
2.24.1

