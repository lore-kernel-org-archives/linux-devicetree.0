Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFECC11D19
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 18:27:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 881942467A
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 18:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="GFcWXL+Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgBTS1Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 13:27:16 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:40973 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728400AbgBTS1Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Feb 2020 13:27:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582223235; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=TtQnAzuOnawmPyg3olptl7R6/eprOggIRL7i9+AU+Zo=; b=GFcWXL+Zb56WjylLCSYtmHraCx8iNDgo3ecpwE5UUL2SOEthdW9Bd3VfmaoappFiZzbTtb2x
 m2tEivkMYz1rBQOcLJRcR2P4i4pFUx+RhITJu3wQhiDkk22d0KmOI6yP70CIW8Kgpg9eIieb
 9vXFQv+LqtodTHK3V0eyoKGZ9OA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4ecf79.7f0c62fb6f10-smtp-out-n01;
 Thu, 20 Feb 2020 18:27:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4ADFAC447A5; Thu, 20 Feb 2020 18:27:05 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7253BC4479C;
        Thu, 20 Feb 2020 18:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7253BC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     smasetty@codeaurora.org, John Stultz <john.stultz@linaro.org>,
        Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Mark Rutland <mark.rutland@arm.com>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 2/4] dt-bindings: display: msm: Add required dma-range property
Date:   Thu, 20 Feb 2020 11:26:54 -0700
Message-Id: <1582223216-23459-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The GMU node now requires a specific dma-range property so that the driver
can use the DMA API to do the few memory allocations required by the GMU.
This sets the IOMMU iova allocator to match the 'uncached' part of the
GMU virtual address space.

v2: Fix the dma-ranges tag. The third pair should be the size.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 Documentation/devicetree/bindings/display/msm/gmu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 776ff92..d11a073 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -83,6 +83,13 @@ properties:
       Phandle to the OPP table for the available GMU frequencies. Refer to
       ../../opp/opp.txt for more information.
 
+  dma-ranges:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Describe the dma-address range for the device. This should always
+      describe the range between 0x60000000 and 0x80000000 which represents
+      the uncached region of the GMU address space.
+
 required:
   - compatible
   - reg
@@ -95,6 +102,7 @@ required:
   - power-domain-names
   - iommus
   - operating-points-v2
+  - dma-ranges
 
 examples:
  - |
@@ -127,4 +135,6 @@ examples:
 
         iommus = <&adreno_smmu 5>;
         operating-points-v2 = <&gmu_opp_table>;
+
+        dma-ranges = <0 0x60000000 0 0x60000000 0 0x20000000>;
    };
-- 
2.7.4
