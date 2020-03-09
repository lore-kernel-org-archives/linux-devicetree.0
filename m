Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DE9C10F29
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 18:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FB45208C3
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 18:23:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="B7oTd5vB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbgCISXa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 14:23:30 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:41291 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727451AbgCISXa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 14:23:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583778210; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=GX+dz/is320lqcSRtGzhyX1xm5hzo2sSwZB3Hj6u3VU=; b=B7oTd5vBxOGoKsO1Gr3OATmCQcMl/RMEEFVXfZMSJBmQiAWQlwMYdVwMmWqMqDY+ZY1CC/4I
 zqxXR3LboinYewSTMMiC4OzghI0LgPxPyPooRGXbaGKjJGqEtyC2FxZaSw1BQRZUJoXLYXO2
 dh452JV8e/ndVbOdZEJuXOv8yRs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e66899a.7f0011d1f880-smtp-out-n02;
 Mon, 09 Mar 2020 18:23:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4937C44799; Mon,  9 Mar 2020 18:23:21 +0000 (UTC)
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1FBEC433D2;
        Mon,  9 Mar 2020 18:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1FBEC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/3] Request direct mapping for modem firmware subdevice
Date:   Mon,  9 Mar 2020 23:52:52 +0530
Message-Id: <20200309182255.20142-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The Q6 modem sub-system has direct access to DDR through memnoc and
an indirect access routed through a SMMU which MSS CE (crypto engine
sub-component of MSS) uses during out of reset sequence. Request direct
mapping for the modem-firmware subdevice since smmu is not expected
to provide access control/translation for these SIDs (sandboxing of the
modem is achieved through XPUs engaged using SMC calls).

Sibi Sankar (3):
  iommu: Export "iommu_request_dm_for_dev"
  dt-bindings: remoteproc: qcom: Add modem-firmware bindings
  remoteproc: qcom_q6v5_mss: Request direct mapping for firmware
    subdevice

 .../bindings/remoteproc/qcom,q6v5.txt         |  4 ++
 drivers/iommu/iommu.c                         |  1 +
 drivers/remoteproc/qcom_q6v5_mss.c            | 68 +++++++++++++++++++
 3 files changed, 73 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
