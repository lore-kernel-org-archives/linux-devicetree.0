Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2634EC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 07:07:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00D812065E
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 07:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com header.i=@semihalf-com.20150623.gappssmtp.com header.b="aZI38iW+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbgGOHHH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 03:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729001AbgGOHHG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 03:07:06 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B727EC08C5C1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 00:07:05 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e8so1439339ljb.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AN6q6cpkTRxXQWeyGXCEz+5PNSY4fUKCWqUMoq2I19U=;
        b=aZI38iW+N0p3zR3+9g94ZzT2QSUYjfLbOoKQH33KYYGZ49ABOvH3cOqHSUnLzI/Evi
         zUcxdYazJI8D/ZT1inTTCw0evilhYmHEN4B9syQCe4F3E+RVsDJFnUq9PanfLe33vDC7
         6mQiKU+ReumQ7VdYGC6R4yUmVdA4cpOnOWqwUn6cH32i4HEWXyVOBfjwWUN2k+YPvrvc
         ps2gcDe3uq84j7bnC0r2fJ8t3D2H9aJ7zRaqNTTevpifETcg19ApyEL7Gw/trUsRXT2f
         mZGiBd1RLGJHA3vk8jsOH6EnGAw2Cp90AHomKWgZ4QaDG5zTqUF31ifFxk4bNkzbG762
         hb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AN6q6cpkTRxXQWeyGXCEz+5PNSY4fUKCWqUMoq2I19U=;
        b=JASR9uxU5+jIN9G7LIRhEBXfqYN6K/EQhf3+3ueDFfYAUFmWi1inflPzbXIf4y3fuK
         6hgQq4Se1Xwxc8dQR9DeoywY/6iB3wWXrboRbbIzbQMTt8reQPap2GYVrx05aK7HmuYE
         Cel1pG5nvG9k7HqzHM+6S+QEZHSKKcPCKPSL6LrX/ZBdCYMFCK3CD8WJWomoIxtU+P46
         W3wK0V6GnaXDN7S8jZ6S+kpSMh4b9oI6Ggf29Nz7QlUcTsMlh6q0G53MFSy6og5veRCW
         vXsAo6294qMUbRf5oh5mnPCQCR6Mn78dpDbIVWjZUKvep3hlrFDA2+9MvD/h5TMKD1a1
         doPQ==
X-Gm-Message-State: AOAM530cW75S6Kgi35ClW/yyXUY01pmHIgwxllXqIVoccXVPEFb/lmP+
        DafntZsSfkBUaVLSvhgkZFR4Sg==
X-Google-Smtp-Source: ABdhPJw8wXKSMLWdz7iN/fEgokVzEzLgEAN75R0DOvwEGBnD1GhqcFfMd0XYyzHDbz0qTTPoOhMbJg==
X-Received: by 2002:a05:651c:3d1:: with SMTP id f17mr3951936ljp.203.1594796824219;
        Wed, 15 Jul 2020 00:07:04 -0700 (PDT)
Received: from localhost.localdomain ([83.68.95.66])
        by smtp.gmail.com with ESMTPSA id 83sm276040ljj.51.2020.07.15.00.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 00:07:03 -0700 (PDT)
From:   Tomasz Nowicki <tn@semihalf.com>
To:     will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        gregory.clement@bootlin.com, robh+dt@kernel.org, hannah@marvell.com
Cc:     linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        devicetree@vger.kernel.org, catalin.marinas@arm.com,
        nadavh@marvell.com, linux-arm-kernel@lists.infradead.org,
        mw@semihalf.com, Tomasz Nowicki <tn@semihalf.com>
Subject: [PATCH v4 3/4] dt-bindings: arm-smmu: add compatible string for Marvell Armada-AP806 SMMU-500
Date:   Wed, 15 Jul 2020 09:06:48 +0200
Message-Id: <20200715070649.18733-4-tn@semihalf.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715070649.18733-1-tn@semihalf.com>
References: <20200715070649.18733-1-tn@semihalf.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add specific compatible string for Marvell usage due to errata of
accessing 64bits registers of ARM SMMU, in AP806.

AP806 SoC uses the generic ARM-MMU500, and there's no specific
implementation of Marvell, this compatible is used for errata only.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Hanna Hawa <hannah@marvell.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Tomasz Nowicki <tn@semihalf.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index d7ceb4c34423..156b38924a00 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -38,6 +38,10 @@ properties:
               - qcom,sc7180-smmu-500
               - qcom,sdm845-smmu-500
           - const: arm,mmu-500
+      - description: Marvell SoCs implementing "arm,mmu-500"
+        items:
+          - const: marvell,ap806-smmu-500
+          - const: arm,mmu-500
       - items:
           - const: arm,mmu-500
           - const: arm,smmu-v2
-- 
2.17.1

