Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B381C43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 04:58:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0C9922527
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 04:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="EOQyjqt+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731839AbfLME6v (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 23:58:51 -0500
Received: from m228-4.mailgun.net ([159.135.228.4]:60175 "EHLO
        m228-4.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731684AbfLME6v (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 23:58:51 -0500
X-Greylist: delayed 304 seconds by postgrey-1.27 at vger.kernel.org; Thu, 12 Dec 2019 23:58:42 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576213131; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=hBwq830ssQQu7DOCklsksw2TNX9kkLNPJbT5z7eq4z8=; b=EOQyjqt+YMeDOBuoa9VX1kiyCNSnu76ExMMb11SU8WJKLWq5C/jfU2SHYniujNV2BKyusVaz
 JqAuJRTIw0SQy96p6yJmKN2aZc9JW7f4Xj2jHnZ2xFJNtBwxhk/dm+DRaYrNGOZyfXmn9n8U
 q+wjVsjhtMNv4WisBN16PtTc1cs=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df3195b.7f511a9c5340-smtp-out-n03;
 Fri, 13 Dec 2019 04:53:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C8BBDC447A1; Fri, 13 Dec 2019 04:53:46 +0000 (UTC)
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D97C1C447A2;
        Fri, 13 Dec 2019 04:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D97C1C447A2
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
Subject: [PATCH 3/3] arm64: dts: qcom: qcs404: Update the compatible for watchdog timer
Date:   Fri, 13 Dec 2019 10:23:20 +0530
Message-Id: <757995875cc12d3f5a8f5fd5659b04653950970a.1576211720.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1576211720.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1576211720.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Update the compatible for QCS404 watchdog timer with proper
SoC specific compatible.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index f5f0c4c9cb16..c9e8e629045b 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -905,7 +905,7 @@
 		};
 
 		watchdog@b017000 {
-			compatible = "qcom,kpss-wdt";
+			compatible = "qcom,apss-wdt-qcs404", "qcom,kpss-wdt";
 			reg = <0x0b017000 0x1000>;
 			clocks = <&sleep_clk>;
 		};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
