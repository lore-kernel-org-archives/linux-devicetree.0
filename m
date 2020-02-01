Return-Path: <SRS0=GCsk=3V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF1EC33CB3
	for <linux-devicetree@archiver.kernel.org>; Sat,  1 Feb 2020 15:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC753206F0
	for <linux-devicetree@archiver.kernel.org>; Sat,  1 Feb 2020 15:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="MNbktu76"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgBAPaM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 1 Feb 2020 10:30:12 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:24691 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726643AbgBAPaM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 1 Feb 2020 10:30:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580571009; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=K25uKYs78oVbN8Z+pz12gqxsEvgxT5fPrOSVg0wLRTE=; b=MNbktu76Gi3esJ5uGRYj4/6898uEl3X/MdGiwtYcCTiVyIW5uiAM2xwYOK09uYI0xhpZLFoo
 ESVDfoQoH0KWMI7SK+MqPDzBN0us/RlZ6tu4eIkVVMHed3byFwOFjy7g0tvNe0SG+Se1d0Qv
 WE6mKJZYtJe6b1r7ib7YeGQW744=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e359980.7efdf00db7d8-smtp-out-n03;
 Sat, 01 Feb 2020 15:30:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 126B5C447A6; Sat,  1 Feb 2020 15:30:08 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC7DAC433CB;
        Sat,  1 Feb 2020 15:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC7DAC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 0/2] Convert QCOM watchdog timer bindings to YAML
Date:   Sat,  1 Feb 2020 20:59:47 +0530
Message-Id: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series converts QCOM watchdog timer bindings to YAML. Also
it adds the missing SoC-specific compatible for QCS404, SC7180,
SDM845 and SM8150 SoCs.

v1: https://lore.kernel.org/lkml/cover.1576211720.git.saiprakash.ranjan@codeaurora.org/

Changes since v1:
 As per Rob's suggestion:
  * Replaced oneOf+const with enum.
  * Removed timeout-sec and included watchdog.yaml.
  * Removed repeated use of const:qcom,kpss-wdt and made use of enum.

Sai Prakash Ranjan (2):
  dt-bindings: watchdog: Convert QCOM watchdog timer bindings to YAML
  dt-bindings: watchdog: Add compatible for QCS404, SC7180, SDM845,
    SM8150

 .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 -----------
 .../bindings/watchdog/qcom-wdt.yaml           | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
