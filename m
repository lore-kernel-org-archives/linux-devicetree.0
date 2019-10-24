Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670C2CA9EAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 12:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D352205C9
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 12:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502218AbfJXMzw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 08:55:52 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:8043 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730413AbfJXMzw (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 24 Oct 2019 08:55:52 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Oct 2019 18:19:41 +0530
IronPort-SDR: tpI/Cblpl7aMfDEkeqpjOqB9pXTFd3pi51h/wxyFT4WYjBDVRUfgqiN3hhhb000PSvlXW2hrfY
 Buiht9obEoz5yccv4rhxQqGJ45Lv42G/cCH5zchIIG1ptAr/fu/nxNtQ9w1viTOeBHeuMZ/gyC
 qMpwKoJegvbu+nhJtUzvaAS2M3iMAwIWzK4OzrsVnQ52zYaCkOfs60uHZdRHOPbRgdqHEDKviq
 GqfCqqP0bRIyDFNusRT04nczEWC8U2xlhR0bHfsU8kV18KUIPv0YSRnudoRiIyDrEZIL1u+SIV
 nispmSru0p414/PkNMAU1UCN
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Oct 2019 18:19:28 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 7D8F91945; Thu, 24 Oct 2019 18:19:27 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     agross@kernel.org, balbi@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, mgautam@codeaurora.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 2/2] dt-bindings: usb: qcom,dwc3: Add compatible for SC7180
Date:   Thu, 24 Oct 2019 18:18:48 +0530
Message-Id: <1571921328-13898-3-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571921328-13898-1-git-send-email-sanm@codeaurora.org>
References: <1571921328-13898-1-git-send-email-sanm@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add compatible for SC7180 SOC in device tree bindings

Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
index cb695aa..c27c58d 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.txt
@@ -6,6 +6,7 @@ Required properties:
 			"qcom,msm8996-dwc3" for msm8996 SOC.
 			"qcom,msm8998-dwc3" for msm8998 SOC.
 			"qcom,sdm845-dwc3" for sdm845 SOC.
+			"qcom,sc7180-dwc3" for sc7180 SOC.
 - reg:			Offset and length of register set for QSCRATCH wrapper
 - power-domains:	specifies a phandle to PM domain provider node
 - clocks:		A list of phandle + clock-specifier pairs for the
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

