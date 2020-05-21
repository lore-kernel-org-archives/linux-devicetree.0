Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB02C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 15:50:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87A7F20748
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 15:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ID1dvrYm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgEUPuD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 11:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbgEUPuC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 11:50:02 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26528C061A0F
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 08:50:02 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x14so1746211wrp.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 08:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I5QXaX52IPaG+95gPfmlZ0rD63JTAUJslTJmrnwNjQc=;
        b=ID1dvrYmYK5R1R7a0Cw6H9ckAbwIgzD1jEh8cLijWGS6z4cOVQD8npfgacuW3YzbTR
         6p53ASb2F8xqyBMI8KhptHeaQt1pyG6j16NzI19RwIF22j7IKpB1vdhv2vKICxvPmIGS
         L9IwRDjpD8PgKAcggZu7EgMhLsHQK5hYnPirU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I5QXaX52IPaG+95gPfmlZ0rD63JTAUJslTJmrnwNjQc=;
        b=lg176cPekMSar7CKIW4F7iG3a3V3MYXSHY+B2uv7vfdi9LitYMZSUbSRATySAmam7x
         nWyYG3njmSG/FWmSJW/ncYAHz2vIjst8ene3ZoE0lfx1PG9em6KUJ+zZAfxqfkSPJsY1
         oHhpQd05xiBkNhWTs6I0h3ZZ7Hwb7BLBOsaiN1bZ9NMQEO03YeyWh7ZNvsy917Iwqp1K
         ku3UdfWU+zdVwY5PfeqeqPs7Vq13ZkkCkaENF1+v+M1IWx/wJGyKK87B3Yjw5Cm4ne1r
         MlBmRQoHKUc+gK3BtzHZ5jKVrS9Rbc8luHONUs7I+CxdEsq9OHoks/EWHQf1T/OrZi1h
         BWuw==
X-Gm-Message-State: AOAM5334MvCq99J3SQRK8o5aYhRCxjv8MVwv84SBAMoK2M7DANlJkojn
        V8utMo/uZ/XxodTC6wctTeU4QQ==
X-Google-Smtp-Source: ABdhPJw5KfY6ZCQuAckjsE5E7cfiDb7ScpWMpUV7bgUyKbpKFR20CCu1lyQfVtv8YMw85K8xToqg9w==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr9942589wrn.149.1590076200716;
        Thu, 21 May 2020 08:50:00 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id r3sm6663037wmh.48.2020.05.21.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:50:00 -0700 (PDT)
Date:   Thu, 21 May 2020 15:49:58 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream@mediatek.com, senozhatsky@chromium.org,
        mojahsu@chromium.org, drinkcat@chromium.org,
        maoguang.meng@mediatek.com, sj.huang@mediatek.com
Subject: Re: [PATCH v8 10/14] media: platform: Delete redundant code for
 improving code quality
Message-ID: <20200521154958.GI209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-11-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-11-xia.jiang@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:29PM +0800, Xia Jiang wrote:
> Delete unused member variables annotation.
> Delete unused variable definition.
> Delete redundant log print, because V4L2 debug logs already print it.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 16 ++--------------
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h |  5 +++--
>  2 files changed, 5 insertions(+), 16 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 4e64046a6854..9e59b9a51ef0 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -182,7 +182,6 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  				   struct mtk_jpeg_ctx *ctx, int q_type)
>  {
>  	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> -	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
>  	int i;
>  
>  	memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> @@ -190,7 +189,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  
>  	if (ctx->state != MTK_JPEG_INIT) {
>  		mtk_jpeg_adjust_fmt_mplane(ctx, f);
> -		goto end;
> +		return 0;
>  	}
>  
>  	pix_mp->num_planes = fmt->colplanes;
> @@ -210,7 +209,7 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  		pfmt->sizeimage = round_up(pfmt->sizeimage, 128);
>  		if (pfmt->sizeimage == 0)
>  			pfmt->sizeimage = MTK_JPEG_DEFAULT_SIZEIMAGE;
> -		goto end;
> +		return 0;
>  	}
>  
>  	/* type is MTK_JPEG_FMT_TYPE_CAPTURE */
> @@ -224,20 +223,9 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_format *f,
>  		u32 stride = pix_mp->width * fmt->h_sample[i] / 4;
>  		u32 h = pix_mp->height * fmt->v_sample[i] / 4;
>  
> -		memset(pfmt->reserved, 0, sizeof(pfmt->reserved));

This change is not mentioned in the description. I'd suggest moving it
to a separate patch, because it's a functional change.

>  		pfmt->bytesperline = stride;
>  		pfmt->sizeimage = stride * h;
>  	}
> -end:
> -	v4l2_dbg(2, debug, &jpeg->v4l2_dev, "wxh:%ux%u\n",
> -		 pix_mp->width, pix_mp->height);
> -	for (i = 0; i < pix_mp->num_planes; i++) {
> -		v4l2_dbg(2, debug, &jpeg->v4l2_dev,
> -			 "plane[%d] bpl=%u, size=%u\n",
> -			 i,
> -			 pix_mp->plane_fmt[i].bytesperline,
> -			 pix_mp->plane_fmt[i].sizeimage);
> -	}
>  	return 0;
>  }
>  
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 64a731261214..9bbd615b1067 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -30,6 +30,9 @@
>  
>  #define MTK_JPEG_DEFAULT_SIZEIMAGE	(1 * 1024 * 1024)
>  
> +/**
> + * enum mtk_jpeg_ctx_state - contex state of jpeg

typo: s/contex/context/

But I'd rephrase it to "states of the context state machine".

> + */

Not mentioned in the description. Also, the documentation of an enum
should have descriptions for the values.

Best regards,
Tomasz
