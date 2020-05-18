Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2ECC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 14:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E354720657
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 14:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="v48/iUf5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgEROXo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 10:23:44 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52922 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727823AbgEROXo (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 18 May 2020 10:23:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589811824; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=XnR/IfU/T1PqN5i2mz+2EYG87NYU7KY5NbZ546eRMTY=; b=v48/iUf5tI6CPmbV2DPSL0ui6/T0kClQdh3dv0MlHx5qRfBU+0GvAynJx7w6Hgd/gbPbP+/7
 wC3StsMzwaiXhppJOcyPK4fmT4joXDJdCl67BwS0Y/WCTx+7jvsxsa6bmCO7xE3XGwoqu1vL
 upQDqpHsvwTGREee436ICAQV03k=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec29a6a.7f4e7306c420-smtp-out-n03;
 Mon, 18 May 2020 14:23:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7DF14C433F2; Mon, 18 May 2020 14:23:37 +0000 (UTC)
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D63DCC44791;
        Mon, 18 May 2020 14:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D63DCC44791
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 18 May 2020 08:23:34 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, georgi.djakov@linaro.org,
        mka@chromium.org
Subject: Re: [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to set DDR
 bandwidth
Message-ID: <20200518142333.GA10796@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sharat Masetty <smasetty@codeaurora.org>,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, georgi.djakov@linaro.org,
        mka@chromium.org
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 14, 2020 at 04:24:18PM +0530, Sharat Masetty wrote:
> This patches replaces the previously used static DDR vote and uses
> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> GPU frequency.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 2d8124b..79433d3 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -141,11 +141,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> 
>  	gmu->freq = gmu->gpu_freqs[perf_index];
> 
> -	/*
> -	 * Eventually we will want to scale the path vote with the frequency but
> -	 * for now leave it at max so that the performance is nominal.
> -	 */
> -	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +	dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
>  }

This adds an implicit requirement that all targets need bandwidth settings
defined in the OPP or they won't get a bus vote at all. I would prefer that
there be an default escape valve but if not you'll need to add
bandwidth values for the sdm845 OPP that target doesn't regress.

Jordan

>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> --
> 2.7.4
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
