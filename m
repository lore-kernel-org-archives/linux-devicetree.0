Return-Path: <SRS0=sOYF=2R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E354C2D0C6
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 08:38:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01929206F4
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 08:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="dURDHFVw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfL0IiF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Dec 2019 03:38:05 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:30978 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726169AbfL0IiF (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Dec 2019 03:38:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577435884; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZAwTtd+vANwBBrSFC/tu9EY6hQdene2XI7S+re+K9yg=; b=dURDHFVwivqsQsNqZLJy8Gh1vA500rSnUdaxYVHMFDrzbQfUPMBljRHDJa0s9R9EgRAlJVuc
 iKfige7CM/PEi/jYN5A63U477ujIkyH2wiWtQ+bCdF5sxkjFq90scBPSJtKA4IoHhTmr3GS1
 YcVA3l7bTWwin+ODCazVTTyIECc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05c2eb.7faf26aef880-smtp-out-n01;
 Fri, 27 Dec 2019 08:38:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 55A2CC4479F; Fri, 27 Dec 2019 08:38:02 +0000 (UTC)
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9952DC433CB;
        Fri, 27 Dec 2019 08:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9952DC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     inux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH] arm64: dts: sc7180: Add clock controller nodes
Date:   Fri, 27 Dec 2019 14:07:47 +0530
Message-Id: <1577435867-32254-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the display, video & graphics clock controller nodes supported on
SC7180.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 3676bfd..3bb7b65 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -931,6 +931,18 @@
 			};
 		};

+		gpucc: clock-controller@5090000 {
+			compatible = "qcom,sc7180-gpucc";
+			reg = <0 0x05090000 0 0x9000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			clock-names = "bi_tcxo", "gpll0_main", "gpll0_div";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		qspi: spi@88dc000 {
 			compatible = "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x600>;
@@ -1043,6 +1055,27 @@
 			};
 		};

+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,sc7180-videocc";
+			reg = <0 0x0ab00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "bi_tcxo";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,sc7180-dispcc";
+			reg = <0 0x0af00000 0 0x200000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>;
+			clock-names = "bi_tcxo", "gpll0";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
