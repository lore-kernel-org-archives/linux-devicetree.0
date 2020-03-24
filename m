Return-Path: <SRS0=2e0x=5J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45C5C43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 12:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC6B42080C
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 12:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="nOq7QO85"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbgCXMrp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Mar 2020 08:47:45 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:16536 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727502AbgCXMrp (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 24 Mar 2020 08:47:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585054064; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=wpCdJNvYZP9qF1wOYRfniOwkSK/ZZk5UjNBFMZ9bkXA=; b=nOq7QO85v+Uavi3ncVBTML+66OdEsIqAtWyJkmmlz2hY2ft4XApSyfKhvi3+woRtEwWgW+50
 3OjsoN/X9r/1CdaNav+Ijj3SkzAXYw/JEGPfaE622RS32XtS6ur79BDemRMQZqy1x3O0xjTR
 1Wp8l/OHP4kzZ7t1HAagL6ePhmo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7a0167.7fa700d75260-smtp-out-n04;
 Tue, 24 Mar 2020 12:47:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2C96C433BA; Tue, 24 Mar 2020 12:47:33 +0000 (UTC)
Received: from pillair-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9B0EDC43636;
        Tue, 24 Mar 2020 12:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B0EDC43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=pillair@codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     ath10k@lists.infradead.org
Cc:     linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rakesh Pillai <pillair@codeaurora.org>
Subject: [PATCH 1/3] dt-bindings: ath10k: Add wifi-firmware subnode for wifi node
Date:   Tue, 24 Mar 2020 18:17:22 +0530
Message-Id: <1585054044-18667-2-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585054044-18667-1-git-send-email-pillair@codeaurora.org>
References: <1585054044-18667-1-git-send-email-pillair@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a wifi-firmware subnode for the wifi node.
This wifi-firmware subnode is needed for the
targets which do not support TrustZone.

Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.txt       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
index 71bf91f..65ee68e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
@@ -96,6 +96,17 @@ Optional properties:
 - qcom,coexist-gpio-pin : gpio pin number  information to support coex
 			  which will be used by wifi firmware.
 
+* Subnodes
+The ath10k wifi node can contain one optional firmware subnode.
+Firmware subnode is needed when the platform does not have TustZone.
+The firmware subnode must have:
+
+- iommus:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: A list of phandle and IOMMU specifier pairs.
+
+
 Example (to supply PCI based wifi block details):
 
 In this example, the node is defined as child node of the PCI controller.
@@ -196,4 +207,7 @@ wifi@18000000 {
 		memory-region = <&wifi_msa_mem>;
 		iommus = <&apps_smmu 0x0040 0x1>;
 		qcom,msa-fixed-perm;
+		wifi-firmware {
+			iommus = <&apps_iommu 0xc22 0x1>;
+		};
 };
-- 
2.7.4
