Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8723EC33C99
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 05:24:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 610222072D
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 05:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfKOFYd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 00:24:33 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:1699 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726017AbfKOFYd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Nov 2019 00:24:33 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Nov 2019 10:54:30 +0530
IronPort-SDR: vxTg9i1Y+eCQlZwLbivVbWwdRfWIP9iBYJfWOFQnGU0CbKbSj//p3UlwCQ7md8s53ulKdAhfpJ
 0j6Ut1crYYWI4KGCgsWXUe1vRhfKTGtaCSR3dFEg4Owb0dUH2SRZbuiKHl3wlq2jtVmslqFQ7L
 asl5QRrNkW6NyPvXRmhM6I+QXJBy8Xm9AaGOMSusG0Ys8tU0e6FZOpeVBpUemPYlhz5Z4sCD5I
 SAn++neg+NxXhe3Ad9Wplywgo0Z23LSBz0k25p23hJoCGO9kWiRJmGDmZHnXGq86aNEyDlcrA7
 geF3tTOFegzB+1zBahEU5Qgf
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg02-blr.qualcomm.com with ESMTP; 15 Nov 2019 10:54:16 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 0C3911D2C; Fri, 15 Nov 2019 10:54:14 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v3 0/1] Add USB related nodes for SC7180
Date:   Fri, 15 Nov 2019 10:53:40 +0530
Message-Id: <1573795421-13989-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add nodes for DWC3 USB controller, QMP and QUSB PHYs
and enable them in idp device.

This patch has dependency on below series

https://lkml.org/lkml/2019/11/8/149

changes in v3:
*Added a space after cfg_ahb", as per Stephen's comment

changes in v2:
* Addressed Stephen's comments on sorting the include file
 and alignment issues. 

Sandeep Maheswaram (1):
  arm64: dts: qcom: sc7180: Add USB related nodes

 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  25 ++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 105 ++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

