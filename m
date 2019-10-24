Return-Path: <SRS0=F2+Z=YR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39928C47E49
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 12:55:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1AF1B21906
	for <linux-devicetree@archiver.kernel.org>; Thu, 24 Oct 2019 12:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731298AbfJXMzu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 24 Oct 2019 08:55:50 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:41967 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730113AbfJXMzu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 24 Oct 2019 08:55:50 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Oct 2019 08:55:48 EDT
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Oct 2019 18:19:41 +0530
IronPort-SDR: cs4iJpwlc6sky9eVZnBcFDzJWeQ6TgZGw07JErkkrvJvk4COKWh1dr1avRLFEgjENaJNozj8GH
 k6xQ26UZOfYkwHts1329frty+Q6oBzReUXhctFTwnhwaG5zvZM5xuENxftBFxzJ01xVW/PFMzS
 iyZhv73knmZW+eOWV5yw9d8Y8AMnfqa1Y0BugNQeUKHcml6dHmFuf0lnBX84VfkB2vf+cJ6PXG
 Sh0kIFgBIRlsUb/jfFThPqyDFYzx2iHo2nvw+3PqVitb2upIlQmn4YQ2gbyW6QtDbZuKHXaUO/
 lcM+9rd+RDXwPqcCaergzALP
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Oct 2019 18:19:23 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 85A291941; Thu, 24 Oct 2019 18:19:22 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     agross@kernel.org, balbi@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, mgautam@codeaurora.org,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH 0/2] Add USB DWC3 support for SC7180
Date:   Thu, 24 Oct 2019 18:18:46 +0530
Message-Id: <1571921328-13898-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adding compatible for SC7180 in USB DWC3 driver and devicetree bindings

Sandeep Maheswaram (2):
  usb: dwc3: Add support for SC7180 SOC
  dt-bindings: usb: qcom,dwc3: Add compatible for SC7180

 Documentation/devicetree/bindings/usb/qcom,dwc3.txt | 1 +
 drivers/usb/dwc3/dwc3-qcom.c                        | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

