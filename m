Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFF7C47409
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 04:19:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10E852173E
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 04:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="bht9i79H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgA3ETK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 23:19:10 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:51491 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727093AbgA3ETJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Jan 2020 23:19:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580357949; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9bR2g9tbVwKjs+QZ9HECb6QYigrlwi+UX4vqqyB1mIY=; b=bht9i79H68kqFr+gNk+Tc/LqiXKXcgLlti3U14j1eIf4YIp0ByOkZ6dGUPykwR93uWkdXbDL
 7zAhzAOIZYfETFTSLN4TVpMHEZbNr+GRuS/vjD0ozR63/Z8gtkOA0S4JOnwXVyuQf+xum2V4
 2NoZpTkMJM1qQ/zE9X05XFLB+yM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e32593a.7fbfea173d18-smtp-out-n02;
 Thu, 30 Jan 2020 04:19:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB2A8C4479F; Thu, 30 Jan 2020 04:19:05 +0000 (UTC)
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2A7DC43383;
        Thu, 30 Jan 2020 04:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2A7DC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 0/3] Add modem Clock controller (MSS CC) driver for SC7180
Date:   Thu, 30 Jan 2020 09:48:40 +0530
Message-Id: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

[v3]
  * Add clocks/clock-names required for the MSS clock controller.
  * Add pm_ops to enable/disable the required dependent clock.
  * Add parent_data for the MSS clocks.
  * Update the GCC MSS clocks from _CBCR to _CLK.

[v2]
  * Update the license for the documentation and fix minor comments in the
    YAML bindings.

[v1]
  * Add driver support for Modem clock controller for SC7180 and also
    update device tree bindings for the various clocks supported in the
    clock controller.

Taniya Das (3):
  dt-bindings: clock: Add YAML schemas for the QCOM MSS clock bindings
  dt-bindings: clock: Introduce QCOM Modem clock bindings
  clk: qcom: Add modem clock controller driver for SC7180

 .../devicetree/bindings/clock/qcom,mss.yaml        |  58 +++++++++
 drivers/clk/qcom/Kconfig                           |   9 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-sc7180.c                      |  70 ++++++++++
 drivers/clk/qcom/mss-sc7180.c                      | 143 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h        |   5 +
 include/dt-bindings/clock/qcom,mss-sc7180.h        |  12 ++
 7 files changed, 298 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
 create mode 100644 drivers/clk/qcom/mss-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
