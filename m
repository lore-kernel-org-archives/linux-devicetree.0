Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A79DC2D0C9
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 04:58:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C2EC22527
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 04:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Q0hAqvj5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731357AbfLME6o (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 23:58:44 -0500
Received: from m228-4.mailgun.net ([159.135.228.4]:64283 "EHLO
        m228-4.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731839AbfLME6o (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 23:58:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576213123; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=EmDuMybAbHkzS0TZek+TSUIMQantp+DpWmZhHZUvP1c=; b=Q0hAqvj5wgq1F2q8W1JkDy2tR4Fhj9KYDACAd6rgJgs/sp9XOWBdbw55z+I3GEIDwz8eBX+q
 BWYwhw+6wzJxde9Q232XZOxXzaQPaBlXPlpDB5c3MuTTaJYDN6k4Bh697uyhckAwPnq3I8le
 bcTgoTg4MqoAyqjJyPh6NvCE3Xs=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df3194b.7fb8d579f260-smtp-out-n02;
 Fri, 13 Dec 2019 04:53:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2EC55C4479C; Fri, 13 Dec 2019 04:53:31 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 29CAAC43383;
        Fri, 13 Dec 2019 04:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 29CAAC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/3] Convert QCOM watchdog timer bindings to YAML
Date:   Fri, 13 Dec 2019 10:23:17 +0530
Message-Id: <cover.1576211720.git.saiprakash.ranjan@codeaurora.org>
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

Sai Prakash Ranjan (3):
  dt-bindings: watchdog: Convert QCOM watchdog timer bindings to YAML
  dt-bindings: watchdog: Add compatible for QCS404, SC7180, SDM845,
    SM8150
  arm64: dts: qcom: qcs404: Update the compatible for watchdog timer

 .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 ---------
 .../bindings/watchdog/qcom-wdt.yaml           | 59 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  2 +-
 3 files changed, 60 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
