Return-Path: <SRS0=ioLT=AU=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E5AC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 20:01:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85C23207DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jul 2020 20:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="dKGLqAGy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgGIUBl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 16:01:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54625 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726756AbgGIUBk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jul 2020 16:01:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594324899; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5cKyK7+V/Mse0miTq/bgfbHYCq9n4I7nwMpmDVcIoHA=; b=dKGLqAGyIXgLk4gNpK+eBGzwcpc5cMq38kr/TRf12mNQzbj6ral2FqxN+gSEoKu1MUWOIGsm
 lOMGUYe+cbi38o9piZKljEU31LYY8dU26pXnHvQFfy5Gu+oI6JPDwMsvyxF/9DjmkQlA3cGH
 l/5zPx5nfcjlsp5bn6lx7uc8gqQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5f0777809b7f1f3df71b1e78 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 20:01:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2984C433C6; Thu,  9 Jul 2020 20:01:03 +0000 (UTC)
Received: from akhilpo-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 381B0C433CA;
        Thu,  9 Jul 2020 20:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 381B0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        smasetty@codeaurora.org, devicetree@vger.kernel.org,
        mka@chromium.org, saravanak@google.com, sibis@codeaurora.org,
        viresh.kumar@linaro.org, jonathan@marek.ca
Subject: [PATCH v4 3/7] drm: msm: a6xx: set gpu freq through hfi
Date:   Fri, 10 Jul 2020 01:30:23 +0530
Message-Id: <1594324828-9571-4-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Newer targets support changing gpu frequency through HFI. So
use that wherever supported instead of the legacy method.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 233afea..b547339 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -121,6 +121,12 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 		if (gpu_freq == gmu->gpu_freqs[perf_index])
 			break;
 
+	if (!gmu->legacy) {
+		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
+		icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
+		return;
+	}
+
 	gmu->current_perf_index = perf_index;
 	gmu->freq = gmu->gpu_freqs[perf_index];
 
@@ -893,10 +899,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	enable_irq(gmu->hfi_irq);
 
 	/* Set the GPU to the current freq */
-	if (gmu->legacy)
-		a6xx_gmu_set_initial_freq(gpu, gmu);
-	else
-		a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
+	a6xx_gmu_set_initial_freq(gpu, gmu);
 
 	/*
 	 * "enable" the GX power domain which won't actually do anything but it
-- 
2.7.4

