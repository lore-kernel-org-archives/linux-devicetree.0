Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A16C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 08:45:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7836206BE
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 08:45:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="rozF7XQ0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731635AbgF3Ipu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 04:45:50 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:38250 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731592AbgF3Ipu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 30 Jun 2020 04:45:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593506749; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rAKtccetH34TV6x/upG9acuC1zVPFGS1zzbOIvOup1g=; b=rozF7XQ0XKnetiQGaDw+rQ3nY0eR67QdMBqo7m5bJ2kI2+QygEadTqN+b7smpYNkSIPvZqxA
 s6wm35sdVJV72TU4KJbcYjmk+EU/2n9Msa1wcQFYf64PkQL2QMD486DTQO44WxrJEDRENPKV
 nkL8/xxUsadkWMzkp3E/t6ojHjo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5efafbac86de6ccd44db6f94 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 08:45:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DAF28C43395; Tue, 30 Jun 2020 08:45:31 +0000 (UTC)
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C108C433C8;
        Tue, 30 Jun 2020 08:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C108C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 0/4] sdm845/sc7180: Add OPP tables to support IO DVFS
Date:   Tue, 30 Jun 2020 14:15:08 +0530
Message-Id: <1593506712-24557-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Driver changes to support DVFS for sdhc and qup (uart and spi) have been merged.
Add OPP tables and power-domains in device tree to enable support for
DVFS in these devices, on sdm845 and sc7180 SoC platforms.

These were posted earlier and reviewed [1] and later dropped by me to first
get the driver changes merged in.
The last outstanding comment on these was from Matthias to move the
OPP tables inside of the node which uses them. I have done that for sdhc,
but left the qup tables outside as its a common table used across many
nodes, and it just gets more confusing adding it elsewhere.

Patches are rebased and should apply cleanly on for-next of the msm tree.

[1] https://lkml.org/lkml/2020/4/28/561

Rajendra Nayak (4):
  arm64: dts: sdm845: Add OPP table for all qup devices
  arm64: dts: sc7180: Add OPP table for all qup devices
  arm64: dts: sdm845: Add sdhc opps and power-domains
  arm64: dts: sc7180: Add sdhc opps and power-domains

 arch/arm64/boot/dts/qcom/sc7180.dtsi |  91 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 109 +++++++++++++++++++++++++++++++++++
 2 files changed, 200 insertions(+)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

