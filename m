Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54502C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 20:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 349342075D
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 20:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="qctEqQmx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgFZUBj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 16:01:39 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:46131 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725806AbgFZUBi (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Jun 2020 16:01:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593201698; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=CCDJosHB5mbNTbda0xIOZV8MFSOhmNJXwZyaB7uwS4I=; b=qctEqQmxGsnPhz6rLJFL9AMh8F3fdHhTHJhacfFgJ4Q1xiVHzBFfpl21nwdTx9WOXr2tqVS5
 PYMEV/FPpFNGFr6cXK9omEPLq0VqiuUV1JRbNbQL788SKCk3h+9R9EdLqy6enNRCc4F8+4Vw
 hb8IDRCUxtANaOTOsOu1aSdCSGI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5ef653f56bebe35deb38d4f4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Jun 2020 20:00:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21A3CC433A1; Fri, 26 Jun 2020 20:00:53 +0000 (UTC)
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 16C2FC433CB;
        Fri, 26 Jun 2020 20:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 16C2FC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     John Stultz <john.stultz@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        freedreno@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/7] dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
Date:   Fri, 26 Jun 2020 14:00:37 -0600
Message-Id: <20200626200042.13713-4-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626200042.13713-1-jcrouse@codeaurora.org>
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Every Qcom Adreno GPU has an embedded SMMU for its own use. These
devices depend on unique features such as split pagetables,
different stall/halt requirements and other settings. Identify them
with a compatible string so that they can be identified in the
arm-smmu implementation specific code.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index d7ceb4c34423..e52a1b146c97 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -38,6 +38,10 @@ properties:
               - qcom,sc7180-smmu-500
               - qcom,sdm845-smmu-500
           - const: arm,mmu-500
+      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
+        items:
+          - const: qcom,adreno-smmu
+          - const: qcom,smmu-v2
       - items:
           - const: arm,mmu-500
           - const: arm,smmu-v2
-- 
2.17.1

