Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC2EC433E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 12:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF2A62072D
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 12:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="TPLxTBne"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbgGMMmm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 08:42:42 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:29792 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729737AbgGMMml (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 13 Jul 2020 08:42:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594644161; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=YLjZebXB525vE+wY7ILTYsnkukVESCi+HQU325VZ01E=; b=TPLxTBneQI86m7uGv0fpLSJN2JSfsa7Lq0+cOYPaAEoKq5AJ0dI4J0S+RJ8psWoh+cv1z+cq
 TAwrlN8YCpaVFNFqvWi94Ycf20reASmiPX9HWaf/CCN6Le1iAH8TyF1qb1ijHKz1SaFYoOj7
 OV6vmBJ0ZK+a9OcxKBu+VVPt5ZE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f0c56b1512812c070f0c44f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 12:42:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CDCBAC433AD; Mon, 13 Jul 2020 12:42:24 +0000 (UTC)
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4B22C433B2;
        Mon, 13 Jul 2020 12:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4B22C433B2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        smasetty@codeaurora.org, devicetree@vger.kernel.org,
        mka@chromium.org, saravanak@google.com, sibis@codeaurora.org,
        viresh.kumar@linaro.org, jonathan@marek.ca, robdclark@gmail.com
Subject: [PATCH v5 6/6] arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp
Date:   Mon, 13 Jul 2020 18:11:46 +0530
Message-Id: <1594644106-22449-7-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Sharat Masetty <smasetty@codeaurora.org>

Add opp-peak-kBps bindings to the GPU opp table, listing the peak
GPU -> DDR bandwidth requirement for each opp level. This will be
used to scale the DDR bandwidth along with the GPU frequency dynamically.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index a567297..8567e9e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1478,36 +1478,43 @@
 				opp-800000000 {
 					opp-hz = /bits/ 64 <800000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <8532000>;
 				};
 
 				opp-650000000 {
 					opp-hz = /bits/ 64 <650000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <7216000>;
 				};
 
 				opp-565000000 {
 					opp-hz = /bits/ 64 <565000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <5412000>;
 				};
 
 				opp-430000000 {
 					opp-hz = /bits/ 64 <430000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <5412000>;
 				};
 
 				opp-355000000 {
 					opp-hz = /bits/ 64 <355000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <3072000>;
 				};
 
 				opp-267000000 {
 					opp-hz = /bits/ 64 <267000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <3072000>;
 				};
 
 				opp-180000000 {
 					opp-hz = /bits/ 64 <180000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					opp-peak-kBps = <1804000>;
 				};
 			};
 		};
-- 
2.7.4

