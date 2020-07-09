Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D39EC433E5
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 20:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3917F20836
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 20:01:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="RlMNMJq7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgGIUBR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 16:01:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54625 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgGIUBQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jul 2020 16:01:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594324875; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PNOP+bZPHesDULINFSwcTHhksYZyEMphqAZ0RdLbWck=; b=RlMNMJq7+W/8PxvCMnmduaDL+9Gr8iIB5vfGZVIiiyyq75sfZ3bUP7obB4kz4Ae5E/CNRUvQ
 IYd7cOcq9mJGGuTOQjRXJ8UN9V3TTbu0wzHvKuD5gETlNobcpwlhi3zjvsnvMBeF9Jp5wrGM
 XekL6FOaf7QHrScx9C4lmIjyobI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5f0777736e56afc68d8d77d5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 20:00:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43465C433A1; Thu,  9 Jul 2020 20:00:51 +0000 (UTC)
Received: from akhilpo-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 068C8C433C8;
        Thu,  9 Jul 2020 20:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 068C8C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        smasetty@codeaurora.org, devicetree@vger.kernel.org,
        mka@chromium.org, saravanak@google.com, sibis@codeaurora.org,
        viresh.kumar@linaro.org, jonathan@marek.ca
Subject: [PATCH v4 0/7] Add support for GPU DDR BW scaling
Date:   Fri, 10 Jul 2020 01:30:20 +0530
Message-Id: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This is mostly a rebase of Sharat's patches [1] on the tip of msm-next branch.
Changes compared to v3:
	1. Rebased on top of Jonathan's patch which adds support for changing
	gpu freq through hfi on newer targets. Created patch 1 to make
	this the generic approach of setting gpu freq on newer targets.
	2. As suggested by Rob, left the icc_path intact for pre-a6xx
	GPUs.

As mentioned in [1], these patches have dependency on Georgi's series from
opp/linux-next [2] and also Sibi's patch which adds a helper function to
set and clear ddr bandwidth vote [2].

[1] https://patchwork.freedesktop.org/series/75291/
[2] https://kernel.googlesource.com/pub/scm/linux/kernel/git/vireshk/pm/+log/opp/linux-next/

Akhil P Oommen (1):
  drm: msm: a6xx: set gpu freq through hfi

Sharat Masetty (6):
  dt-bindings: drm/msm/gpu: Document gpu opp table
  drm: msm: a6xx: send opp instead of a frequency
  drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR
  arm64: dts: qcom: SDM845: Enable GPU DDR bw scaling
  arm64: dts: qcom: sc7180: Add interconnects property for GPU
  arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp

 .../devicetree/bindings/display/msm/gpu.txt        |  28 ++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   9 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 105 +++++++++++----------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   3 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   3 +-
 7 files changed, 106 insertions(+), 53 deletions(-)

-- 
2.7.4

