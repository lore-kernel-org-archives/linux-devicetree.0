Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF56C35242
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 22:33:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC9BB2072C
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 22:33:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="UySVP0Hf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbgAXWdF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 17:33:05 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:36352 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729273AbgAXWcr (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Jan 2020 17:32:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579905167; h=Message-Id: Date: Subject: To: From: Sender;
 bh=+VyCGh8CGrDtWBvdHmu30YsoZRjC+pFVKCdY2gMhLTo=; b=UySVP0HfPkyIlKSVT8XUKFHyU+o/TnaxFrbINaJ+Rszed6pHvzbDpy/cmRu6AM92rZF0cm3u
 unFltG5FEAeCHGDqgPhgKLILXpbLzIDVtCMnExeSlrldmoEdfQNhxDtR5yedqG8p7pUtqxRw
 89as4vqK7lGpPKnSepsgCVqwVCw=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2b7083.7f5b1894d8f0-smtp-out-n02;
 Fri, 24 Jan 2020 22:32:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 29B73C447A4; Fri, 24 Jan 2020 22:32:34 +0000 (UTC)
Received: from vgutta-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vgutta)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B681AC43383;
        Fri, 24 Jan 2020 22:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B681AC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vnkgutta@codeaurora.org
From:   Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        vnkgutta@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/7] Add device tree and clock drivers for SM8250 SoC
Date:   Fri, 24 Jan 2020 14:32:20 -0800
Message-Id: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds device tree support and clock drivers support
for SM8250 SoC.
As part of the device tree, the sm8250 dts file has basic nodes
like CPU, PSCI, intc, timer and clock controller.

Required clock controller driver and RPMH cloks are added to
support peripherals like USB.

All this configuration is added to support SM8250 to boot up to the
serial console.

V2:
 * Addressed comments on patch 2, kept new compatible in sorted order
   and fixed the additional spaces.
 * Addressed comments on patch 7, fixed the clk-cells of "sleep_clk"
   and updated name of the scm node.
 * Added reviewed-by/Acked-by tags.

Whole series:
Tested-by: Vinod Koul <vkoul@kernel.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
  
This patchset depends on one of the RPMH clock driver fix
https://patchwork.kernel.org/patch/11318949/

Taniya Das (6):
  dt-bindings: clock: Add RPMHCC bindings for SM8250
  clk: qcom: rpmh: Add support for RPMH clocks on SM8250
  clk: qcom: clk-alpha-pll: Refactor and cleanup trion PLL
  clk: qcom: clk-alpha-pll: Add support for controlling Lucid PLLs
  dt-bindings: clock: Add SM8250 GCC clock bindings
  clk: qcom: gcc: Add global clock controller driver for SM8250

Venkata Narendra Kumar Gutta (1):
  arm64: dts: qcom: sm8250: Add sm8250 dts file

 .../devicetree/bindings/clock/qcom,gcc.yaml        |    1 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |   29 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  450 +++
 drivers/clk/qcom/Kconfig                           |    7 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  259 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   12 +
 drivers/clk/qcom/clk-rpmh.c                        |   25 +-
 drivers/clk/qcom/gcc-sm8250.c                      | 3720 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8250.h        |  271 ++
 include/dt-bindings/clock/qcom,rpmh.h              |    4 +-
 13 files changed, 4731 insertions(+), 50 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250.dtsi
 create mode 100644 drivers/clk/qcom/gcc-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8250.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
