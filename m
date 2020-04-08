Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21173C2BA1A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 13:48:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E733B20753
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 13:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="sNMZWWsf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbgDHNrv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 09:47:51 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:61249 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729299AbgDHNru (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 09:47:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586353670; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=H9bFMAAq6wc4O9X/I/zoSuCyfls/aBTfSn27q/TP8ag=; b=sNMZWWsftVKfmRZ3dwIN2ETQqw4S+My15Q/IoQeHiAMxSqKF9bXvdsMLIznailCTZrUJspA/
 z7uCg0pkcAZJ3FDC/zRsWVMoiRBQFMxld/02md+xIm0ZMycB0FTzJjIcUokEPAWYA0Vv8phq
 uD9U3g+7U2emK5Zd5l3Pp/ndKF4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd600.7f62f281cdf8-smtp-out-n03;
 Wed, 08 Apr 2020 13:47:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75F7FC00448; Wed,  8 Apr 2020 13:47:41 +0000 (UTC)
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3ECFC4478F;
        Wed,  8 Apr 2020 13:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3ECFC4478F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 08/21] arm64: dts: sdm845: Add ufs opps and power-domains
Date:   Wed,  8 Apr 2020 19:16:34 +0530
Message-Id: <1586353607-32222-9-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the additional power domain and the OPP table for ufs on sdm845
so the driver can set the appropriate performance state of the
power domain while setting the clock rate.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 36b9fb1..9a82f78 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1803,6 +1803,21 @@
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		ufs_opp_table: ufs-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-50000000 {
+				opp-hz = /bits/ 64 <50000000>;
+				required-opps = <&rpmhpd_opp_min_svs>;
+			};
+
+			opp-200000000 {
+				opp-hz = /bits/ 64 <200000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+
+			};
+		};
+
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sdm845-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
@@ -1811,7 +1826,8 @@
 			phys = <&ufs_mem_phy_lanes>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
-			power-domains = <&gcc UFS_PHY_GDSC>;
+			power-domains = <&gcc UFS_PHY_GDSC>, <&rpmhpd SDM845_CX>;
+			power-domain-names = "gdsc_pd", "rpmh_pd";
 			#reset-cells = <1>;
 			resets = <&gcc GCC_UFS_PHY_BCR>;
 			reset-names = "rst";
@@ -1836,6 +1852,9 @@
 				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+
+			operating-points-v2 = <&ufs_opp_table>;
+
 			freq-table-hz =
 				<50000000 200000000>,
 				<0 0>,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
