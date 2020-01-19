Return-Path: <SRS0=IhJs=3I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767ADC33CB7
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jan 2020 13:14:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CA57206D7
	for <linux-devicetree@archiver.kernel.org>; Sun, 19 Jan 2020 13:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="b2ogX6zR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728778AbgASNOE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 19 Jan 2020 08:14:04 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:41831 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727586AbgASNOE (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sun, 19 Jan 2020 08:14:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579439643; h=References: In-Reply-To: Message-Id: Date:
 Subject: To: From: Sender;
 bh=67cowGFMTCAAqZeDoH/TZ8xNbKLHy1J5B0pUFqY5uZQ=; b=b2ogX6zRm/SOfN0yOBS35l3+abeI449+vrOGObBzmcMnYzpAdbzRSTOcVAmP9uKWDYIgq6q3
 HGO0ArriZy88W39Oz12w24uMGA35bj4BjAQS2mCjLU24fOn0YDm2LIzy9GuugZL0cb7si/S6
 NsTAKivRWqMPZcbrLMKZQ40mKPk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e245617.7f3635262538-smtp-out-n01;
 Sun, 19 Jan 2020 13:13:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 77EBFC447A9; Sun, 19 Jan 2020 13:13:58 +0000 (UTC)
Received: from srichara1-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 51058C447A2;
        Sun, 19 Jan 2020 13:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 51058C447A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
From:   Sricharan R <sricharan@codeaurora.org>
To:     agross@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org,
        robh+dt@kernel.org, sivaprak@codeaurora.org,
        sricharan@codeaurora.org
Subject: [PATCH V6 5/5] arm64: defconfig: Enable qcom ipq6018 clock and pinctrl
Date:   Sun, 19 Jan 2020 18:43:21 +0530
Message-Id: <1579439601-14810-6-git-send-email-sricharan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org>
References: <1579439601-14810-1-git-send-email-sricharan@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

These configs are required for booting kernel in qcom
ipq6018 boards.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 43fa238..16aecea 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -405,6 +405,7 @@ CONFIG_PINCTRL_IMX8MN=y
 CONFIG_PINCTRL_IMX8MQ=y
 CONFIG_PINCTRL_IMX8QXP=y
 CONFIG_PINCTRL_IPQ8074=y
+CONFIG_PINCTRL_IPQ6018=y
 CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_MSM8994=y
 CONFIG_PINCTRL_MSM8996=y
@@ -718,6 +719,7 @@ CONFIG_QCOM_CLK_APCS_MSM8916=y
 CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_GCC_8074=y
+CONFIG_IPQ_GCC_6018=y
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
-- 
2.7.4
