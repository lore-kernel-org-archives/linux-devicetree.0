Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F72C11D1B
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 18:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA7E22467A
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 18:27:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="DpfiOBbc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbgBTS1J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 13:27:09 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:58217 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728534AbgBTS1I (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Feb 2020 13:27:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582223228; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=FNc3ciCRQ3MW3zYHSCJZEO99ElwwHxEZQHD1BF08YYw=; b=DpfiOBbc6uG3dyIQM4A2UX/dSTCNtbo9PJNgk69nwDsoWMS/LxNhMekOkZemh3PNYtlJHA6e
 Gc0Km4hLRnQ6RH/6n8zc9GHTcgPQC2ZBBiaGIK6kEoqc1t3wAi2cc55pQW7QoQq0arugRBGp
 SVhhEoEkldjKYWqw+rWvDgGwK9Y=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4ecf7a.7fd11088e1f0-smtp-out-n03;
 Thu, 20 Feb 2020 18:27:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1B4AAC447A4; Thu, 20 Feb 2020 18:27:06 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E049BC43383;
        Thu, 20 Feb 2020 18:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E049BC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     smasetty@codeaurora.org, John Stultz <john.stultz@linaro.org>,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 3/4] arm64: dts: sdm845: Set the virtual address range for GMU allocations
Date:   Thu, 20 Feb 2020 11:26:55 -0700
Message-Id: <1582223216-23459-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

GMU DMA allocations need to be mapped between 0x60000000 and 0x80000000 in
the GMU virtual address space. Specify the dma-range so the iova allocator
does the right thing.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d42302b..3c766423 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2911,6 +2911,8 @@
 					<&gpucc GPU_GX_GDSC>;
 			power-domain-names = "cx", "gx";
 
+			dma-ranges = <0 0x60000000 0 0x60000000 0 0x20000000>;
+
 			iommus = <&adreno_smmu 5>;
 
 			operating-points-v2 = <&gmu_opp_table>;
-- 
2.7.4
