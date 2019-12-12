Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7C0C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 07:18:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F39A522527
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 07:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RxxXcjFL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbfLLHSP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 02:18:15 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33374 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbfLLHSP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 02:18:15 -0500
Received: by mail-pj1-f65.google.com with SMTP id r67so653256pjb.0
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 23:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JgfDuTWeBak9bVM7ZWNPsBAm3+sYB1fLtoFMjb0Fxdw=;
        b=RxxXcjFLgonLF4fmVQ9Uh8NGPA48JCLXcBG419PPiBNe6e/fN4bT3KGOPvAsCdib1s
         CV7whYpnFFggopMXHXah8xrpY8aY0pwmZyDzR08smFDcAuwxKR2Sa4xjVGgiJxBQSm6Z
         5i9ViaE59/8nrQrcp9mRVH41oPVaQcU8Qr9ZPo2HUPw7SVcP/osuBNIHgu/RtPlKNbX/
         6yxBEheHDeIB/oaTQP6sATllHhzDBVffb30K27VGcaJsenKqYw9gcYYxM41KUnIxeoaZ
         V2bCnEheP3IyYIt7YqG/Z8nuhlfHRZ1oqmKawJHvW0upRhf0JvSBVVrFJPefVm2vbB3O
         4qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JgfDuTWeBak9bVM7ZWNPsBAm3+sYB1fLtoFMjb0Fxdw=;
        b=judJY6xGWB+JJl8GTdcg22QilrTl6eL2Go7SHrXsr36KtwvjDefQB3u52rWGevd2xG
         qR7kiexGSe9zSKg6skk8s/GZR+1qJgmWudiFFsuIiH6c/Tx+FTOKg/cH0xXxPFDFuccv
         A3RraoPccTuabvfTLIrr+qJ0tk5VhNTfVQScIsGOVtz8Xqkh/R0M7LxBl60EONnJbKYp
         cOEf8TKUR5Q07VEdwGm3JL0trnHYOypADAlpuA7dHeX2JQRUEQzsT5gm7lsZQuwDuxxU
         5Ytfk6zNkS9jM9fl+VvWe0jF8O0mjAGBLzHRrLf2+AqzMOA3kRJ/WA0+hBwHLgc3CjAK
         qQUw==
X-Gm-Message-State: APjAAAVaFIXY1i91HSiXWggZt80nuEyR4jdoq6hYsBYGBwHazYWNE5EA
        qzg6ibQwW7LwEcJU0qHCBEODXw==
X-Google-Smtp-Source: APXvYqy+m0lCq/UpeupyAuDYMkcEh9rkfCM4GG+6qHKYU/CjEuXA+ig6axKgP0DJrVQrHbcsf678BA==
X-Received: by 2002:a17:90a:2808:: with SMTP id e8mr8279272pjd.63.1576135094383;
        Wed, 11 Dec 2019 23:18:14 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i127sm5601071pfc.55.2019.12.11.23.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 23:18:13 -0800 (PST)
Date:   Wed, 11 Dec 2019 23:18:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, jcrouse@codeaurora.org,
        dianders@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/msm/a4xx: set interconnect bandwidth vote
Message-ID: <20191212071811.GN3143381@builder>
References: <20191122012645.7430-1-masneyb@onstation.org>
 <20191122012645.7430-5-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122012645.7430-5-masneyb@onstation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu 21 Nov 17:26 PST 2019, Brian Masney wrote:

> Set the two interconnect paths for the GPU to maximum speed for now to
> work towards getting the GPU working upstream. We can revisit a later
> time to optimize this for battery life.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> index b01388a9e89e..253d8d85daad 100644
> --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> @@ -591,6 +591,14 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
>  		goto fail;
>  	}
>  
> +	/*
> +	 * Set the ICC path to maximum speed for now by multiplying the fastest
> +	 * frequency by the bus width (8). We'll want to scale this later on to
> +	 * improve battery life.
> +	 */
> +	icc_set_bw(gpu->icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +	icc_set_bw(gpu->ocmem_icc_path, 0, Bps_to_icc(gpu->fast_rate) * 8);
> +
>  	return gpu;
>  
>  fail:
> -- 
> 2.21.0
> 
