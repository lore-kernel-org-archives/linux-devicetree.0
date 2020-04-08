Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B479C2BA80
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 13:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D1C620780
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 13:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="sAtOglne"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbgDHNr6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 09:47:58 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:55211 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728026AbgDHNrw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 09:47:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586353672; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qDXeYWdOzaIFeRQkrQQZ1e+GTg6PqbVJi/l/1wjGoTI=; b=sAtOglneTBiF0ss7pFTijSxxS1GuwCn46fD5oWj3+/LXNczVEKpCZCFzoFv/LOx9mrB53LWy
 qkOEegadAkZerWFFq4S6vAEC1YCFhbvcZD27PvK8VDkmbgE4TrkDS8NFIIlaSW9gllMaJvmY
 9Tcn8IW+tPRNzqANIoLKtJdo2Gk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd604.7f7cd0c36b90-smtp-out-n02;
 Wed, 08 Apr 2020 13:47:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 888DDC44798; Wed,  8 Apr 2020 13:47:46 +0000 (UTC)
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D541C44799;
        Wed,  8 Apr 2020 13:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D541C44799
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 09/21] drm/msm/dpu: Use OPP API to set clk/perf state
Date:   Wed,  8 Apr 2020 19:16:35 +0530
Message-Id: <1586353607-32222-10-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On some qualcomm platforms DPU needs to express a perforamnce state
requirement on a power domain depending on the clock rates.
Use OPP table from DT to register with OPP framework and use
dev_pm_opp_set_rate() to set the clk/perf state.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 11f2beb..fe5717df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -7,6 +7,7 @@
 #include <linux/debugfs.h>
 #include <linux/errno.h>
 #include <linux/mutex.h>
+#include <linux/pm_opp.h>
 #include <linux/sort.h>
 #include <linux/clk.h>
 #include <linux/bitmap.h>
@@ -239,7 +240,7 @@ static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
 		rate = core_clk->max_rate;
 
 	core_clk->rate = rate;
-	return msm_dss_clk_set_rate(core_clk, 1);
+	return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);
 }
 
 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ce19f1d..949157a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -10,6 +10,7 @@
 #include <linux/debugfs.h>
 #include <linux/dma-buf.h>
 #include <linux/of_irq.h>
+#include <linux/pm_opp.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
@@ -1033,6 +1034,9 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 	if (!dpu_kms)
 		return -ENOMEM;
 
+	dev_pm_opp_set_clkname(dev, "core");
+	dev_pm_opp_of_add_table(dev);
+
 	mp = &dpu_kms->mp;
 	ret = msm_dss_parse_clock(pdev, mp);
 	if (ret) {
@@ -1059,6 +1063,7 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
 	struct dss_module_power *mp = &dpu_kms->mp;
 
+	dev_pm_opp_of_remove_table(dev);
 	msm_dss_put_clk(mp->clk_config, mp->num_clk);
 	devm_kfree(&pdev->dev, mp->clk_config);
 	mp->num_clk = 0;
@@ -1090,6 +1095,7 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
 	struct dss_module_power *mp = &dpu_kms->mp;
 
+	dev_pm_opp_set_rate(dev, 0);
 	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
 	if (rc)
 		DPU_ERROR("clock disable failed rc:%d\n", rc);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
