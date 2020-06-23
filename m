Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8285EC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 05:18:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B1F120738
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 05:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="WNOXvoEZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730020AbgFWFSK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 01:18:10 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:46465 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728275AbgFWFSJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 23 Jun 2020 01:18:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592889489; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=QowtBxkc41APmwk5o1o189COfMVUFA+fFOkUfYrKZhA=; b=WNOXvoEZWrV63S2+i8HFx3vRKDQ/SpQxJcEOFGqw8gytSxH7+y4hXkfcxhgX3iuD6KAwXCzF
 c5rz8opWBa7r372pNZfDklKvQ4SvuBp39m0xyVXmQhWg76akKZMDfdc1NmurrfQnF9hL2R7E
 I+vOKgxVTPapu9s/RN6vFxm5HXQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ef1908f4c9690533a6c1595 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 05:18:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E04CDC4339C; Tue, 23 Jun 2020 05:18:06 +0000 (UTC)
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 967EAC433C6;
        Tue, 23 Jun 2020 05:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 967EAC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, kathirav@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     sivaprak@codeaurora.org
Subject: [PATCH V2 0/6] Add frequency / voltage scaling support for IPQ6018 SoC
Date:   Tue, 23 Jun 2020 10:47:46 +0530
Message-Id: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

IPQ6018 SoC uses the PMIC MP5496. SMPA2 and LDOA2 regulator of MP5496
controls the APSS and SDCC voltage scaling respectively. Add support
for the same.

changes since V1:
	- Moved YAML conversion to the last as per Mark's comments

Kathiravan T (6):
  dt-bindings: soc: qcom: Add IPQ6018 compatible
  soc: qcom: smd-rpm: Add IPQ6018 compatible
  dt-bindings: regulator: add MP5496 regulator compatible
  regulator: qcom_smd: Add MP5496 regulators
  dt-bindings: soc: qcom: convert the SMD-RPM document to YAML schema
  dt-bindings: regulator: convert QCOM SMD-RPM regulator document to
    YAML schema

 .../bindings/regulator/qcom,smd-rpm-regulator.txt  | 320 ---------------------
 .../bindings/regulator/qcom,smd-rpm-regulator.yaml | 106 +++++++
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  |  62 ----
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml |  92 ++++++
 drivers/regulator/qcom_smd-regulator.c             |  34 +++
 drivers/soc/qcom/smd-rpm.c                         |   1 +
 6 files changed, 233 insertions(+), 382 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

