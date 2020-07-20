Return-Path: <SRS0=nYmw=A7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FCBC433E3
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 06:12:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D59DD2176B
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jul 2020 06:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="OpOzfIAb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgGTGMk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jul 2020 02:12:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42805 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgGTGMj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 20 Jul 2020 02:12:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595225559; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vqsEmAjv+qRcg2NQ6PB2AlTP521/eX6OgTdveeztlpg=; b=OpOzfIAbFkYdOn5UvEXYFRoKbCQNVI/37LWT9PgONwigIgr+sxpsTJpI9UrjKKwUnsBtEeTD
 tE0/puCdLXnkRnWYGibEZG8jb/8v65JmJOc9rlorGvLlFrNxC2VZH2UFZmO1d7PMMAiJRB5l
 ZNahNf93GX173F+NrvVLJKyqZbI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f1535d41e603dbb447bb1aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 06:12:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C2125C4339C; Mon, 20 Jul 2020 06:12:35 +0000 (UTC)
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27EFEC433C9;
        Mon, 20 Jul 2020 06:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27EFEC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, kathirav@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     sivaprak@codeaurora.org, sricharan@codeaurora.org
Subject: [PATCH V3 0/4] Add frequency / voltage scaling support for IPQ6018 SoC
Date:   Mon, 20 Jul 2020 11:42:19 +0530
Message-Id: <1595225543-12127-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

IPQ6018 SoC uses the PMIC MP5496. SMPA2 and LDOA2 regulator of MP5496
controls the APSS and SDCC voltage scaling respectively. Add support
for the same.

changes since V2:
	- Rebased on top of linux-next 20200717 tag
	- Addressed Rob's comment to drop the 'syscon' node in qcom,smd-rpm.yaml
	- Picked up the Reviewed-by tag for qcom,smd-rpm-regulator.yaml
	- Regulator patches part of V2 was picked up by Mark and it's available in linux-next tree

changes since V1:
	- Moved YAML conversion to the last as per Mark's comments

Kathiravan T (4):
  dt-bindings: soc: qcom: Add IPQ6018 compatible
  soc: qcom: smd-rpm: Add IPQ6018 compatible
  dt-bindings: soc: qcom: convert the SMD-RPM document to YAML schema
  dt-bindings: regulator: convert QCOM SMD-RPM regulator document to
    YAML schema

 .../bindings/regulator/qcom,smd-rpm-regulator.txt  | 321 ---------------------
 .../bindings/regulator/qcom,smd-rpm-regulator.yaml | 106 +++++++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  |  64 ----
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  87 ++++++
 drivers/soc/qcom/smd-rpm.c                         |   1 +
 5 files changed, 194 insertions(+), 385 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

