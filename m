Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DDCC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 01:05:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 841D520748
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 01:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nC6qh/RR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgEOBFj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 14 May 2020 21:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726168AbgEOBFi (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 May 2020 21:05:38 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBA0C061A0C
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 18:05:37 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q9so241447pjm.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2020 18:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6eDmVoxMjvhjUTcVq+QS+luvVgKfEd6UeTKYi0GYY/Q=;
        b=nC6qh/RRtLo5YkFASVNTjzmS6hB2wcHOSlCr6oyH+TRQvoERZi7p4K1Xcm4kuC4zfI
         IPZu7/uOH/jDh4/sS6a6Wl7/uYnk7PYrM5mxSbz3KCnEHIgK9FBWlUpMFggDwzTHihUK
         oVuWf5zTDw/mr7UpS8XDlsrUQ8ldUVXmPUc90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6eDmVoxMjvhjUTcVq+QS+luvVgKfEd6UeTKYi0GYY/Q=;
        b=VOxl1UmIHwOQD5amPgy+h5Dwrf4nlMS9tMj2H/67aOyY/m7vRbP1tVYScF63Bxf40Z
         9kt9ZVkgZTZF3GDVMCWFI+u3/0tnMcoUhS5lkVc/0hkA+Xq3QIR01/dPFhJrvuv8QZfy
         tdWGuFEq0985MEHU1yvwxxwny96DaIYG3dcK/VxUdiXafHb1OVtF8f7k9A3kh991x062
         igqaeiXya+o3D0TtjuJcIw1bVu8Sw0AfZGj3M10Vmk3/b3kKxv2PpayPz/+LKM23mW1+
         lS3XY9lFrmFnTjmRIA87YElwzC6ZzwiSq3bU8zrnLcO8tCTvmLESd9e5+sYY5bgfJ71q
         YEmw==
X-Gm-Message-State: AOAM533fQXEs4YXtm5OUvZz/iwFXSsBjI1l5cQdwZZakE7a1k+KAT0+T
        sNHV6faoAawgM9Nh9C0Y/V9r3g==
X-Google-Smtp-Source: ABdhPJwB6PAoOJYeS3qdfXHG1VARwSCyiTzJNK443oUUSG4LRJTMdwSgD9Whi8xkSHQq+C2mHa74PQ==
X-Received: by 2002:a17:90b:c90:: with SMTP id o16mr717743pjz.59.1589504737439;
        Thu, 14 May 2020 18:05:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id g14sm363169pfh.49.2020.05.14.18.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 18:05:36 -0700 (PDT)
Date:   Thu, 14 May 2020 18:05:35 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org
Subject: Re: [PATCH 5/6] drm: msm: a6xx: use dev_pm_opp_set_bw to set DDR
 bandwidth
Message-ID: <20200515010535.GX4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1589453659-27581-6-git-send-email-smasetty@codeaurora.org>
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

Is there a particular reason to keep this one liner in a separate patch?
I think it would make sense to squash it into "drm: msm: a6xx: send opp
instead of a frequency" and change the subject of the combined patch to
something like "drm: msm: a6xx: Scale the DDR bandwidth dynamically".
