Return-Path: <SRS0=aO3b=7J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF96BC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 12:38:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4B0F20899
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 May 2020 12:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730022AbgE0MiV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 May 2020 08:38:21 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:54815 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728964AbgE0MiV (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 May 2020 08:38:21 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 27 May 2020 05:38:20 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg04-sd.qualcomm.com with ESMTP; 27 May 2020 05:38:18 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id B772921800; Wed, 27 May 2020 18:08:16 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH 0/4] Add ipq6018 apcs mailbox driver
Date:   Wed, 27 May 2020 18:08:08 +0530
Message-Id: <1590583092-24290-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The ipq6018 devices has apcs block for ipc interrupts, this block also
provides a clock controller which provides cpu clocks.

This series adds support for the apcs block found in ipq6018 devices.

This series was originally part of ipq6018 apss clock controller series
https://lkml.org/lkml/2020/5/27/637

The patch 4 has dtb dependency with apss pll driver which can be found in
https://lkml.org/lkml/2020/5/27/637

Sivaprakash Murugesan (4):
  dt-bindings: mailbox: Add YAML schemas for QCOM APCS global block
  dt-bindings: mailbox: Add dt-bindings for ipq6018 apcs global block
  mailbox: qcom: Add ipq6018 apcs compatible
  arm64: dts: ipq6018: Add support for apcs clk

 .../bindings/mailbox/qcom,apcs-kpss-global.txt     | 88 -------------------
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 99 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  8 +-
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            | 23 +++--
 4 files changed, 118 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml

-- 
2.7.4

