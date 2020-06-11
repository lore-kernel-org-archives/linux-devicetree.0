Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D85C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 14:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E652A20823
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 14:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j2Zm8WTa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgFKO1d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 10:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgFKO1c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 10:27:32 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59AAC08C5C2
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 07:27:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d128so5260396wmc.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6oNSKO/bfHkroY5E6w01GRrWanZd3YtLMnWhvnjnTpA=;
        b=j2Zm8WTakmUV2T5y/+dMnLN/v4wOdjhGJvK5fkIK2O+ryCylfrjDzedqOoet78T75o
         Ldpf9ZChG1Qa8baFLKfR/dMZfYDYfM/dHdjOp3Yx66MPkJNvGhfScPuLyNt4jF9UKrN9
         lHtbYaVmspsKGB1HNStwdkVEgJW9qsM01+RiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6oNSKO/bfHkroY5E6w01GRrWanZd3YtLMnWhvnjnTpA=;
        b=poJb3ZdbzxRdqWaVTw4nlODuuwf5pd7EdEDagjCY2cJkbQg3klu2EzffHeuoh5sfPS
         vj+OaTSfL9mIeZ1pKvfZOVPFgJttsmMd1rCYGKi8z/SphSe5SQM8XdeVo1/t1nyisJ49
         /IhfxwB0YOFOMvlsfOhxirzPrz8B50ByNivXOMoBw0l0i7Kl9YNi+9k2WZ/WwEQgoPNf
         wEfx5n+BGOnSXGdqYfFecaih8dMn53+jW1fI+j1OSBaPr6JLtWYeT9NJrX1SRH3xC5mo
         5phfSaLM3nshRlrL6AHdRF+eXSlst99hemb+iAlvt+1g36A8/eJ6ACh0kuVjd4TgYtFC
         PS9Q==
X-Gm-Message-State: AOAM533N2D0nRxhzTLS49M7QwWmGPR6cFyArg+d4QgvJe/5QcLBBnp86
        mWP9+ecu3gMg23bUWYPlCvz8iQ==
X-Google-Smtp-Source: ABdhPJwcHlML3GVU5KUrSHCPpOa1Dg4OCgzoWnC1F47mU912hVUwl1saC95zTHAPsWEKo1Yl3nrQ2g==
X-Received: by 2002:a7b:c40e:: with SMTP id k14mr8960381wmi.59.1591885649589;
        Thu, 11 Jun 2020 07:27:29 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id g3sm5808646wrb.46.2020.06.11.07.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:27:29 -0700 (PDT)
Date:   Thu, 11 Jun 2020 14:27:27 +0000
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
Subject: Re: [PATCH RESEND v9 09/18] media: platform: Delete zeroing the
 reserved fields
Message-ID: <20200611142727.GC158633@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-11-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-11-xia.jiang@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:44PM +0800, Xia Jiang wrote:
> Delete zeroing the reserved fields because that the core already
> does it.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: new patch
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
