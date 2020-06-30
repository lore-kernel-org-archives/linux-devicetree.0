Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0381AC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 19:52:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2C8220772
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 19:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="sJpdTUn+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728533AbgF3TwK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 15:52:10 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20301 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728423AbgF3TwK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 30 Jun 2020 15:52:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593546729; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=khdI7KK3P5HEXu5fVmHtaSFBLxX53kdpZO9nigjlUsg=; b=sJpdTUn+wJ0o4WA514CF5BvXkzf+k7VzFkZv3XaSceFHr45vnmgAacg+kTuHKB1KTf+VwKkr
 pQIDv5dvLzw+569fqdLAFTo3HjLWPjum+FxPa5U3/blZH0srMZRmxxRPqpnqN0uOFDjJ9URD
 vm6OgINM/l5qb3h0yBE+1x3HzsU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-west-2.postgun.com with SMTP id
 5efb97e85866879c76f8cff8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 19:52:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65414C433C6; Tue, 30 Jun 2020 19:52:08 +0000 (UTC)
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DBF0AC433C6;
        Tue, 30 Jun 2020 19:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DBF0AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     swboyd@chromium.org, seanpaul@chromium.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sam@ravnborg.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, aravindh@codeaurora.org,
        abhinavk@codeaurora.org, chandanu@codeaurora.org,
        varar@codeaurora.org, Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH v3] arm64: dts: qcom: sc7180: Add Display Port dt node
Date:   Tue, 30 Jun 2020 12:51:51 -0700
Message-Id: <20200630195151.347-1-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DP device node on sc7180.

Changes in v2:

- Add assigned-clocks and assigned-clock-parents
- Remove cell-index and pixel_rcg
- Change compatible to qcom,sc7180-dp

Changes in v3:
- Update commit text
- Make DP child node of MDSS
- Remove data-lanes property from SOC dts
- Disable DP node in SOC dts
- Assign DP to Port2 in MDP node
- Add MDSS AHB clock in DP device node

This patch depends-on:
	https://patchwork.freedesktop.org/series/78953/

Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 49 ++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 31b9217bb5bf..271d55db62ab 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2371,6 +2371,13 @@ dpu_intf1_out: endpoint {
 							remote-endpoint = <&dsi0_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&dp_in>;
+						};
+					};
 				};
 			};
 
@@ -2440,6 +2447,44 @@ dsi_phy: dsi-phy@ae94400 {
 
 				status = "disabled";
 			};
+
+			msm_dp: displayport-controller@ae90000{
+				status = "disabled";
+				compatible = "qcom,sc7180-dp";
+
+				reg = <0 0xae90000 0 0x1400>;
+				reg-names = "dp_controller";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <12 0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+				clock-names = "core_iface", "core_aux", "ctrl_link",
+					      "ctrl_link_iface", "stream_pixel";
+				#clock-cells = <1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+				assigned-clock-parents = <&msm_dp 1>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						dp_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dp_out: endpoint { };
+					};
+				};
+			};
 		};
 
 		dispcc: clock-controller@af00000 {
@@ -2449,8 +2494,8 @@ dispcc: clock-controller@af00000 {
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&dsi_phy 0>,
 				 <&dsi_phy 1>,
-				 <0>,
-				 <0>;
+				 <&msm_dp 0>,
+				 <&msm_dp 1>;
 			clock-names = "bi_tcxo",
 				      "gcc_disp_gpll0_clk_src",
 				      "dsi0_phy_pll_out_byteclk",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

