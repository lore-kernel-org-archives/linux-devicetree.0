Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB60C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 12:32:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F5F820774
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 12:32:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="iB1u14VG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732804AbgF3McA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 08:32:00 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:35704 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732042AbgF3Mb7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 30 Jun 2020 08:31:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593520318; h=Message-ID: References: In-Reply-To: Subject:
 To: From: Date: Content-Transfer-Encoding: Content-Type: MIME-Version:
 Sender; bh=k0MdTyKtV4z22dAVkmjS3nxPgaMUlZ3id20kmVJEhWM=; b=iB1u14VGapzOLtu3Yg284PV+XPuo9R6a8qy17AB+ThH3xZTgtQcvC/7dmrg2QUK2o58WFVqa
 7UKWWZ6D2P2o9oV9B1RNbdwqHBixic69q2bKM3x1vMvjnoIE5QJwehFcj16ZDm1p22oQDlrq
 wR+89M2nEs7kTD3yKiUInYMnBdE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5efb30b1c4bb4f886db6ea4b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 12:31:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4C166C4339C; Tue, 30 Jun 2020 12:31:44 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gokulsri)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A0D0C433C8;
        Tue, 30 Jun 2020 12:31:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 30 Jun 2020 18:01:43 +0530
From:   gokulsri@codeaurora.org
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: Re: [PATCH V5 00/10] remoteproc: qcom: q6v5-wcss: Add support for
 secure pil
In-Reply-To: <1589362265-22702-1-git-send-email-gokulsri@codeaurora.org>
References: <1589362265-22702-1-git-send-email-gokulsri@codeaurora.org>
Message-ID: <14579d9dbcc06bca392b41ace1b0ce49@codeaurora.org>
X-Sender: gokulsri@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

  Hi Bjorn,
  My below patch series (https://patchwork.kernel.org/cover/11545511/) 
with all the review comments addressed and this is on top of
  Govind's series (https://patchwork.kernel.org/cover/11060629/) "[v5] 
"Add non PAS wcss Q6 support for QCS404".
  Need your help to know how should I proceed further to merge these 
patches.

  Regards,
  Gokul

On 2020-05-13 15:00, Gokul Sriram Palanisamy wrote:
> IPQ8074 needs support for secure pil as well.
> Also, currently only unified firmware is supported.
> IPQ8074 supports split firmware for q6 and m3, so
> adding support for that.
> 
> This series is based on Govind's
> "[v5] Add non PAS wcss Q6 support for QCS404"
> 
> changes since v4:
>  - Rebased patch 8
> 
> changes since v3:
>  - In patch 10, Added release_firmware to free up
>    memory requested for m3 firmware.
> 
> changes since v2:
>  - In patch 5, Added a driver data 'bcr_reset_required'
>    to select if bcr reset is required
>  - In patch 10, Removed syscon implementation and moved
>    to mailbox framework to access APCS IPC
> 
> changes since v1:
>  - In patch 10, Addressed minor review comments.
> 
> Gokul Sriram Palanisamy (10):
>   remoteproc: qcom: Add PRNG proxy clock
>   remoteproc: qcom: Add secure PIL support
>   remoteproc: qcom: Add support for split q6 + m3 wlan firmware
>   remoteproc: qcom: Add ssr subdevice identifier
>   remoteproc: qcom: Update regmap offsets for halt register
>   dt-bindings: clock: qcom: Add reset for WCSSAON
>   clk: qcom: Add WCSSAON reset
>   dt-bindings: firmware: qcom: Add compatible for IPQ8074 SoC
>   arm64: dts: Add support for scm on IPQ8074 SoCs
>   arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
> 
>  .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi              | 127 
> +++++++++++++++++
>  drivers/clk/qcom/gcc-ipq8074.c                     |   1 +
>  drivers/remoteproc/qcom_q6v5_wcss.c                | 157 
> +++++++++++++++++----
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h       |   1 +
>  5 files changed, 258 insertions(+), 29 deletions(-)
