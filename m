Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFA9C2D0F3
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 07:56:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 32BEA206F6
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 07:56:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="xOoOwaT6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgCaH4n (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 03:56:43 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:50210 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729925AbgCaH4n (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 31 Mar 2020 03:56:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585641402; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=mw7u0T8in9Wk7yv/+Jn7zUsruVSN8kOaTj5sQ3nzoGI=; b=xOoOwaT6zVFTiy8mCtR7WnaqOUGwlsRzSdPHCiYfGn1kyONJ2fgDsfokdGwVwyilxEi01XJT
 6ofJmhuoC0CFw+SoDsgfqdmSIX3P6f3R2C0w9wUDTjLe/2n27deKUX0nWr9q/kJ7HHSVvteq
 b2zQAeDrpuFDbn3/Bt6TudR8KZM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e82f7b0.7feed82c8bc8-smtp-out-n02;
 Tue, 31 Mar 2020 07:56:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2CFFDC43636; Tue, 31 Mar 2020 07:56:32 +0000 (UTC)
Received: from hyd-lnxbld559.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B378C433D2;
        Tue, 31 Mar 2020 07:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B378C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, sibis@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 0/5] Add support for GPU DDR BW scaling
Date:   Tue, 31 Mar 2020 13:25:48 +0530
Message-Id: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series adds support for GPU DDR bandwidth scaling and is based on the
bindings from Sarvana[1]. This work is based on Sibi's work for CPU side [2]
which also lists all the needed dependencies to get this series working.
My workspace is based on a chrome tag [3]. Although the bindings add support
for both peak and average bandwidth votes, I have only added support for peak
bandwidth votes.

[1]: https://patchwork.kernel.org/cover/11277199/
[2]: https://patchwork.kernel.org/cover/11353185/ (this lists further dependencies)
[3]: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2097039/3

Sharat Masetty (5):
  arm64: dts: qcom: sc7180: Add interconnect bindings for GPU
  arm64: dts: qcom: sc7180: Add GPU DDR BW opp table
  drm: msm: scale DDR BW along with GPU frequency
  drm: msm: a6xx: Fix off by one error when setting GPU freq
  dt-bindings: drm/msm/gpu: Document OPP phandle list for the GPU

 .../devicetree/bindings/display/msm/gpu.txt        | 63 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               | 52 +++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 43 ++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 44 +++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h                      |  9 ++++
 5 files changed, 197 insertions(+), 14 deletions(-)

--
2.7.4
