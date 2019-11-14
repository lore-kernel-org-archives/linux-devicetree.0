Return-Path: <SRS0=7KoJ=ZG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E65C43141
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 12:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4932520715
	for <linux-devicetree@archiver.kernel.org>; Thu, 14 Nov 2019 12:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfKNMNT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 Nov 2019 07:13:19 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:44603 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726115AbfKNMNT (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 Nov 2019 07:13:19 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Nov 2019 17:43:14 +0530
IronPort-SDR: kwngexKqDpviVScc+CllB8fKAVERMvXgR00r3gbbdq72AdGAke6sHbMj14AYknKSIcmSsmOsmG
 DONrrBy3JBH6AWcMQjCXUbgdsMiiyl1Ffh6s7VdBOEhKcZBX+W+olezmrfMw6pA/Dsjc7frruB
 rFe/CXbQXRfdlkb3ZmSMLzMb24HHEi4tf9/sZJmV0KIK+4+PRlJUGkfnWdzijYPHHto2gSo5ai
 OigLJ0256GELpKOgmvlFEmW/8zlNdYIrpy1laRod9nBTVIlJffZ0cM7uapy91jAfB6xlB7zZ5/
 4JizrweYEljd4t9RFMHHuWeN
Received: from c-sanm-linux.qualcomm.com ([10.206.25.31])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Nov 2019 17:43:01 +0530
Received: by c-sanm-linux.qualcomm.com (Postfix, from userid 2343233)
        id 6EFA0189A; Thu, 14 Nov 2019 17:43:00 +0530 (IST)
From:   Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     =linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: [PATCH v2 0/1] Add USB related nodes for SC7180
Date:   Thu, 14 Nov 2019 17:42:48 +0530
Message-Id: <1573733569-25940-1-git-send-email-sanm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add nodes for DWC3 USB controller, QMP and QUSB PHYs
and enable them in idp device

This patch has dependency on below series

https://lkml.org/lkml/2019/11/8/149

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

