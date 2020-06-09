Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1679FC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 19:40:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3817206C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 19:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=marek-ca.20150623.gappssmtp.com header.i=@marek-ca.20150623.gappssmtp.com header.b="R4aWwk4h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389301AbgFITkk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 15:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389284AbgFITkf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 15:40:35 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFABC05BD1E
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 12:40:35 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id f18so22081748qkh.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sHWV6OU0cqgaqdPacomRMLT+w3Ah3p0WG4kNzV6/a0A=;
        b=R4aWwk4htZqHave/9h/EmzzlTvfpyow5xa1HrixdbeagLWiDVCahZX+fvgd72MMhKH
         mifgYvUj+jhWaMGg3Sy/QuCRU/M6RKcSTiv3XoeJ3SlLx/OpCDJihfdQDGtJHK6Ma2fv
         57K4OCfyNvmS7Mj4coeIZrZFaJpqmVEx2dQAQ48cfDir+BZHYiiGfFlO10AOnFVbaQ4l
         xacFlXm9XwJChbkrL3Ai0A69gf+8Aqb9dKIOsXRf2SdsS9hTKPcwi9G1oIrDRlCBi1AV
         k2QWPQR6Xa9viXBp+BOnMgIdZtNoxs4Gk5hOWjYWXe04l4pzi5HWgoRZ0X44+xTY6pZd
         w7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sHWV6OU0cqgaqdPacomRMLT+w3Ah3p0WG4kNzV6/a0A=;
        b=NCCaplKWMFznH13kDAg5bwlXx+Fas/vVAeqHUBBhomYLRPSsgJW+esBX7tee/dzRiA
         mNexLKZia9g7/LoKEqoMkg5Lwdj6qjAuu6ukxwgrx8pua329J4WjBWHPCmPTm55SeRnP
         6uTxcJ1Gk0xsBmGiPc9PSgHCGXZA9Laqc+ulUxQoBvGvPZ5OjSdbJbnF8bX1GgPgXEeE
         2KLcV8yvVa31bba1K2JtP7CeYIyC2hsSaHNOdijV393DxYmN1LsVIJ8+tAmtdCG3g5IG
         oD665TyC2xZKOPSEyYjG/OqxyWwHtl+HZbTz1SnjwTKxjDenMduz98JadHdtOES6BAIv
         +z/g==
X-Gm-Message-State: AOAM532T6cYs9ItSNdvnGOEOga7ngM85aVLQMWe7oYBY507aiDRkdQ7x
        /5Ru3W5B0XDRE5IrL7FkCCkFWg==
X-Google-Smtp-Source: ABdhPJylYwtTWOmAgXhVLnUMhpb1BZNqKTLwO9QHJOFRb6EbibLEywFO6AcZedPsGIptantkT+8xEA==
X-Received: by 2002:a05:620a:49c:: with SMTP id 28mr30284895qkr.168.1591731634848;
        Tue, 09 Jun 2020 12:40:34 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v8sm10513181qto.21.2020.06.09.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 12:40:34 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/8] dt-bindings: arm-smmu: Add sm8150 and sm8250 compatible strings
Date:   Tue,  9 Jun 2020 15:40:19 -0400
Message-Id: <20200609194030.17756-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200609194030.17756-1-jonathan@marek.ca>
References: <20200609194030.17756-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add compatible strings for sm8150 and sm8250 iommus to documentation.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index d7ceb4c34423..3ac741236c8b 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,8 @@ properties:
           - enum:
               - qcom,sc7180-smmu-500
               - qcom,sdm845-smmu-500
+              - qcom,sm8150-smmu-500
+              - qcom,sm8250-smmu-500
           - const: arm,mmu-500
       - items:
           - const: arm,mmu-500
-- 
2.26.1

