Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF83C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 05:45:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ECF52067D
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 05:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="GsqLnt3k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgGPFpr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 01:45:47 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:53344 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725844AbgGPFpq (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Jul 2020 01:45:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594878346; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=QCdzWtaoCFQUbVW6Q4oVXM+yOcrN8PD2KCUkLjOvy2I=; b=GsqLnt3kCKccaAuzykn1dJ0/1oY3TCTB4TVz0hDp/19gJ+0g/z0AOaNdPRZVCtK77wD/Dt0k
 bM5a/Rll39zxd7T2Ps7A4nOgerozwBKyav2DvlWpXhY7HfZHy+fjGXWgW8kniLy8yJzo6JB1
 HvJs03ChmZ7q5U3lUbYrpjkiWKY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5f0fe97fc7a053446a791c97 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 05:45:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D2A1EC43395; Thu, 16 Jul 2020 05:45:34 +0000 (UTC)
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 80335C433C9;
        Thu, 16 Jul 2020 05:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 80335C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 0/4] DVFS support for Venus
Date:   Thu, 16 Jul 2020 11:12:15 +0530
Message-Id: <1594878139-3402-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

v2: Fixed up the labels of OPP nodes in patch 4
    Included the bindings update patch as part of this series,
    a resend of https://lore.kernel.org/patchwork/patch/1241077/

These patches add DVFS support for Venus

Patch 1 will need to be picked by Rob.
Patch 2 will need to be picked by Stan,
Patch 3 and 4 should land via the qcom tree.

Rajendra Nayak (4):
  dt-bindings: media: venus: Add an optional power domain for perf
    voting
  media: venus: core: Add support for opp tables/perf voting
  arm64: dts: sdm845: Add OPP tables and power-domains for venus
  arm64: dts: sc7180: Add OPP tables and power-domains for venus

 .../bindings/media/qcom,sc7180-venus.yaml          |  6 ++-
 .../bindings/media/qcom,sdm845-venus-v2.yaml       |  6 ++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 35 +++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 40 +++++++++++++++-
 drivers/media/platform/qcom/venus/core.c           | 43 ++++++++++++++---
 drivers/media/platform/qcom/venus/core.h           |  5 ++
 drivers/media/platform/qcom/venus/pm_helpers.c     | 54 ++++++++++++++++++++--
 7 files changed, 173 insertions(+), 16 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

