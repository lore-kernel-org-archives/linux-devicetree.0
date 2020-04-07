Return-Path: <SRS0=WBDS=5X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD06C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 22:24:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D24DF2082F
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 22:24:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Z2miYVQB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgDGWYm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Apr 2020 18:24:42 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:20252 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726621AbgDGWYm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Apr 2020 18:24:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586298281; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=dx666URRqJLgHx/92TiYUOVZjVVrAvoOpoacNAgGDDg=; b=Z2miYVQBoOVrt/fWoel5lZc+xxH8UDVlu0zvBneEdMND8yuNeRVp2DaXz/71BcP2paBOzJRx
 x81UmsMF4u5DZl/9KkvtlmIEfHCrNfxKIdrSjwoLCmdJcEpVCCaV8SUcfqigOKv2fHTsXeL2
 78luR1/nSJtpDGnvMZmxnElUj0s=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8cfda8.7f235810db90-smtp-out-n01;
 Tue, 07 Apr 2020 22:24:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E882DC43637; Tue,  7 Apr 2020 22:24:39 +0000 (UTC)
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BF6BBC433D2;
        Tue,  7 Apr 2020 22:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF6BBC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v3 0/2] Enable SS/HS USB support on SM8150
Date:   Tue,  7 Apr 2020 15:24:25 -0700
Message-Id: <1586298267-4722-1-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add required device tree nodes to enable the USB SS and HS
paths on the primary USB controller on SM8150.  In addition,
implement missing resources from the SM8150 GCC driver, which
includes the USB GDSC and the USB PIPE clocks.

Changes in v3:
 - Set dr_mode to "peripheral" on the SM8150 MTP DTSI file.

Changes in v2:
 - Combine GDSC and USB PIPE clock changes.
 - Re-order DTS nodes based on address

Jack Pham (1):
  arm64: dts: qcom: sm8150: Add USB and PHY device nodes

Wesley Cheng (1):
  clk: qcom: gcc: Add USB3 PIPE clock and GDSC for SM8150

 arch/arm64/boot/dts/qcom/sm8150-mtp.dts     | 21 +++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi        | 92 +++++++++++++++++++++++++++++
 drivers/clk/qcom/gcc-sm8150.c               | 52 ++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8150.h |  4 ++
 4 files changed, 169 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
