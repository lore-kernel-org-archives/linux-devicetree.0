Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF093C43445
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 16:45:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DB2A206E9
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 16:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="M1yao2QG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbgGTQpJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 12:45:09 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:39129 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729863AbgGTPlU (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Jul 2020 11:41:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595259680; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=c+9g487VCuxdYlLYhQcWqBlR8deNztaM6xeYdqugpnw=; b=M1yao2QGS6OgZXLISl+5sqKuJY2A9qqBVO5A1e8ZCE6qYYVZOs2F8pxYm8fkD8GNcvs/OM6h
 LDbCYS2K+I46UUO2r0mXMP0CdqwhqCa+lkrmj0mphoB5jMqlCtJ4sJn1MnEKn302Ss2HgG0s
 F3X8Eewg4tx9pwHTYSJOHSQ84lg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f15bb1fd50c36e729769739 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 15:41:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AD7C7C433C6; Mon, 20 Jul 2020 15:41:17 +0000 (UTC)
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D42DC433BA;
        Mon, 20 Jul 2020 15:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D42DC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        iommu@lists.linux-foundation.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rob Herring <robh@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 07/13] dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
Date:   Mon, 20 Jul 2020 09:40:41 -0600
Message-Id: <20200720154047.3611092-8-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720154047.3611092-1-jcrouse@codeaurora.org>
References: <20200720154047.3611092-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Every Qcom Adreno GPU has an embedded SMMU for its own use. These
devices depend on unique features such as split pagetables,
different stall/halt requirements and other settings. Identify them
with a compatible string so that they can be identified in the
arm-smmu implementation specific code.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.25.1

