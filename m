Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7C2C0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 10:55:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44F9B20719
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 10:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="kDktN3no"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730745AbgCPKzZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 06:55:25 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:37108 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730718AbgCPKzZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 16 Mar 2020 06:55:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584356124; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=DKwrELKnjwH9SwHQIhyY0Hh3JIa8xcnhF4BLtd/Q+B0=; b=kDktN3not5wnZEB45q9jOKsqJMT4y1ztn0OjZyPwLJucZuJDh4VCjARPGKStysE7DajimnRd
 6neoRQFQuCTmIEl4c16GDMYE3RCsNXzv4ljYhf02hCgLZpGD4a54ua48t7MtDpHPLUcFFyiZ
 YJSy4gm9687Vrgz2KKBwGKkHzqU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6f5b0a.7fcdc2696110-smtp-out-n01;
 Mon, 16 Mar 2020 10:55:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5798AC43636; Mon, 16 Mar 2020 10:55:06 +0000 (UTC)
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2510BC433CB;
        Mon, 16 Mar 2020 10:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2510BC433CB
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
Subject: [PATCH v1 0/3] Add GCC clock driver support
Date:   Mon, 16 Mar 2020 16:24:39 +0530
Message-Id: <1584356082-26769-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

 [v1]
  * Add a new frequency of 51.2MHz for QUP clock.
  * Add support for gcc_sec_ctrl_clk_src RCG for client to be able to request
   various frequencies.

Taniya Das (3):
  clk: qcom: gcc: Add support for a new frequency for SC7180
  dt-bindings: clock: Add gcc_sec_ctrl_clk_src clock ID
  clk: qcom: gcc: Add support for Secure control source clock

 drivers/clk/qcom/gcc-sc7180.c               | 94 ++++++++++++++++++-----------
 include/dt-bindings/clock/qcom,gcc-sc7180.h |  1 +
 2 files changed, 59 insertions(+), 36 deletions(-)

--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
