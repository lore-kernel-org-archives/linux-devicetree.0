Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C630C4CECE
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 10:29:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 17A6920746
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 10:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="BZOzPLz4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgCMK3v (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 06:29:51 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:13920 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726553AbgCMK3p (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 13 Mar 2020 06:29:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584095385; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fgDWAMgUeJqRKJwknQJfUuQdOToB6apgOLXfL6tOhyY=; b=BZOzPLz4GpYtD9pxsWJ0Y/uM9LwEvXkdWI+HHJAjCrC2r6DKrdJ50dHGU+KUMRfGqW3ps5PF
 XpeKXI8eePES3NLVH9Nrka8sRq/8gfQIJjxUpi3px49DEovOcn4rnZwjsl4Z6eFo9+spkN65
 nvndH018EpSyeaynmpyiqa6pts4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6b6097.7fba7a8ea960-smtp-out-n01;
 Fri, 13 Mar 2020 10:29:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ABF4EC44792; Fri, 13 Mar 2020 10:29:43 +0000 (UTC)
Received: from akashast-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 45019C432C2;
        Fri, 13 Mar 2020 10:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 45019C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, c_skakit@codeaurora.org, mka@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH V5 3/3] dt-bindings: geni-se: Add binding for UART pin swap
Date:   Fri, 13 Mar 2020 15:59:10 +0530
Message-Id: <1584095350-841-4-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
References: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add documentation to support RX/TX/CTS/RTS pin swap in HW.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V5:
 -  As per Matthias's comment, remove rx-tx-cts-rts-swap property from UART 
    child node.

 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 533400b..85f9028 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -172,6 +172,12 @@ patternProperties:
           - description: UART core irq
           - description: Wakeup irq (RX GPIO)
 
+      rx-tx-swap:
+        description: RX and TX pins are swapped
+
+      cts-rts-swap:
+        description: CTS and RTS pins are swapped
+
     required:
       - compatible
       - interrupts
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
