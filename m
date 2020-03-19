Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBB9C4332E
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 05:36:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 347522072C
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 05:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="lDeZYB++"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgCSFgZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 01:36:25 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:49336 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726063AbgCSFgQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Mar 2020 01:36:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584596175; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MINbUZTkSWwgDB4Z3KnGKRZ0AOl8pKCct/9BN0h90hA=; b=lDeZYB++rm+wbK9/qwK0eiDY9J4EyeoPQLelmIWgFlNkFLlrN9qvxuIelWGRmQ/n+Hpxuwyz
 seCdHS8pU6y7J/yT+YjG4ejIIsI3omJaY9GlM+adk4sBlcET8YvX18arOTQrRxVPl2zm7Thl
 t8rGPVr4yfpRXb7mceMNIYF8vkU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7304b7.7f6cebd052d0-smtp-out-n05;
 Thu, 19 Mar 2020 05:35:51 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8598CC433BA; Thu, 19 Mar 2020 05:35:51 +0000 (UTC)
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CBDCCC433D2;
        Thu, 19 Mar 2020 05:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CBDCCC433D2
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
Subject: [PATCH v7 0/3] Add modem Clock controller (MSS CC) driver for SC7180
Date:   Thu, 19 Mar 2020 11:05:28 +0530
Message-Id: <1584596131-22741-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

[v7]
 * Fix Documentation YAML issues reported.

[v6]
 * Combine the Documentation YAML schema and clock IDs for GCC MSS and
   MSS clocks.
 * Remove a unnecessary header file inclusion, define the max_registers for
   regmap and also update the fw_name to remove _clk suffix.
 * Update the copyright year.

[v5]
 * Update the clock ID for GCC_MSS_NAV_AXIS_CLK to GCC_MSS_NAV_AXI_CLK

[v4]
 * Split the GCC MSS clocks and Modem clock driver.
 * Update mss_regmap_config to const.
 * Rename the Documentation binding as per the latest convention.
 * Minor comments of clock-names/clocks properties updated.

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
  clk: qcom: gcc: Add support for modem clocks in GCC
  clk: qcom: Add modem clock controller driver for SC7180

 .../devicetree/bindings/clock/qcom,sc7180-mss.yaml |  62 +++++++++
 drivers/clk/qcom/Kconfig                           |   9 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-sc7180.c                      |  72 ++++++++++-
 drivers/clk/qcom/mss-sc7180.c                      | 143 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc7180.h        |   7 +-
 include/dt-bindings/clock/qcom,mss-sc7180.h        |  12 ++
 7 files changed, 304 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
 create mode 100644 drivers/clk/qcom/mss-sc7180.c
 create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
