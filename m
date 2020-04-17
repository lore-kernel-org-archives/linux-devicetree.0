Return-Path: <SRS0=b/Hz=6B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB30CC352BE
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 14:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8655E214AF
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Apr 2020 14:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="tgpHOtQE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731150AbgDQOGi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Apr 2020 10:06:38 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:21766 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731091AbgDQOGg (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Apr 2020 10:06:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587132395; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=llUPXRExLvxCFVVAYxO7alUC0qq9GxbKaujBs9DQ9Zc=; b=tgpHOtQE6iTaNLjWjGXexL9hahBvf0V1VrUJVO3uJrXtlHf+9eL4K6ehOKAobcfDb7bBIcLz
 93M7rs9mhlZNxZ5otgtRr5q9G9g45FWaQUwWRA22mA+ursG2ZXO6olsXZZSCX8LMCgly+/WX
 PWR0ouKE/xgJh9Z/XmGCMgrgRQU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e99b7d8.7ff5d0422ea0-smtp-out-n02;
 Fri, 17 Apr 2020 14:06:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF69EC690A5; Fri, 17 Apr 2020 14:06:15 +0000 (UTC)
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DA109C43636;
        Fri, 17 Apr 2020 14:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DA109C43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 13/17] arm64: dts: sdm845: Add OPP tables and power-domains for venus
Date:   Fri, 17 Apr 2020 19:34:35 +0530
Message-Id: <1587132279-27659-14-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the OPP tables in order to be able to vote on the performance state of
a power-domain.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 40 ++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index e6f1af1..67e3b90 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3294,14 +3294,50 @@
 			};
 		};
 
+		venus_opp_table: venus-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+				required-opps = <&rpmhpd_opp_min_svs>;
+			};
+
+			opp-200000000 {
+				opp-hz = /bits/ 64 <200000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+			};
+
+			opp-320000000 {
+				opp-hz = /bits/ 64 <320000000>;
+				required-opps = <&rpmhpd_opp_svs>;
+			};
+
+			opp-380000000 {
+				opp-hz = /bits/ 64 <380000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-444000000 {
+				opp-hz = /bits/ 64 <444000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+
+			opp-533000000 {
+				opp-hz = /bits/ 64 <533000000>;
+				required-opps = <&rpmhpd_opp_turbo>;
+			};
+		};
+
 		venus: video-codec@aa00000 {
 			compatible = "qcom,sdm845-venus-v2";
 			reg = <0 0x0aa00000 0 0xff000>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc VENUS_GDSC>,
 					<&videocc VCODEC0_GDSC>,
-					<&videocc VCODEC1_GDSC>;
-			power-domain-names = "venus", "vcodec0", "vcodec1";
+					<&videocc VCODEC1_GDSC>,
+					<&rpmhpd SDM845_CX>;
+			power-domain-names = "venus", "vcodec0", "vcodec1", "opp-pd";
+			operating-points-v2 = <&venus_opp_table>;
 			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
 				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
 				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
