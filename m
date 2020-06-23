Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D12C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 05:18:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7806D2076C
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 05:18:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="WCuR4Ymu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbgFWFSS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 01:18:18 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:39461 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730294AbgFWFSR (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 23 Jun 2020 01:18:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592889497; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qQpRoi8I5lL80EJJsNftfx0IFdSlZOG8s1Q2NR1FHEw=; b=WCuR4YmuzXQNrXJ6k6xYv3CiXY+JDcubvvJg6CqWGV23hdfke6P6TxP12QJYx2OtomMcnd4K
 eEdR1P/QBOlS8GggPfSl1Zr+ux0eSwxpbekqqxEDh+0k8shKdgwIkVI15mn66fVrX1UWUYp/
 xR7QdetN+ehvObT3AIse+DvRQ/k=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ef190945866879c763e20be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 05:18:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B056AC433C8; Tue, 23 Jun 2020 05:18:12 +0000 (UTC)
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A584C43395;
        Tue, 23 Jun 2020 05:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A584C43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, kathirav@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     sivaprak@codeaurora.org
Subject: [PATCH V2 2/6] soc: qcom: smd-rpm: Add IPQ6018 compatible
Date:   Tue, 23 Jun 2020 10:47:48 +0530
Message-Id: <1592889472-6843-3-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
References: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds a compatible for the rpm on the Qualcomm IPQ6018 platform.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 drivers/soc/qcom/smd-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 005dd30..1a5226a 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -230,6 +230,7 @@ static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
 
 static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-apq8084" },
+	{ .compatible = "qcom,rpm-ipq6018" },
 	{ .compatible = "qcom,rpm-msm8916" },
 	{ .compatible = "qcom,rpm-msm8974" },
 	{ .compatible = "qcom,rpm-msm8976" },
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

