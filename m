Return-Path: <SRS0=a2/f=7Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4307FC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 14:25:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DF632065C
	for <linux-devicetree@archiver.kernel.org>; Thu, 11 Jun 2020 14:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l28f8UvD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgFKOZw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 11 Jun 2020 10:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728212AbgFKOZv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 11 Jun 2020 10:25:51 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBA9C08C5C3
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 07:25:50 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u13so5157386wml.1
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2020 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4Wl9FPjQM/OmioKsKPEd8aDegLYWZmFx0p2ql/A57hk=;
        b=l28f8UvDUpME1nIHWAzTfBskecEhX50JaBZhgjJEeNEemNi2o5jq6jzfPAXaUlfCc0
         Tsgd8VVnkXoyX74/1DMaTTXjBT2cVYaVJLtAnFt53WEJI1amkTsQZ6pe40TWM7f+u8tf
         gAFiVIgbp/zn78MwZ11YBE5DZge2oKlRtDmMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Wl9FPjQM/OmioKsKPEd8aDegLYWZmFx0p2ql/A57hk=;
        b=U0UN/kqFXyJNZ0h1SRgySGrkC49to6k4kVu2+2UpAfNRGjqiNzzz1h5QBXhQRhYZQE
         7BrYccTkRPHe0yb/vdSjcHeUnScmxD78F9QIDWwGOh7E2qLh5L9SucnKzGiy4BTmciBi
         iRaBf3uUbNpZyuPS1zPGbpVU6VkY3Vb3rqbdPCR9W5byJt3h0WlZbEOjeZp/cjOcWLk6
         hZ6eDEKKTp6CtSyMQS0eX9a8AZkE1j1+uvZcGFRS0To5hzrlUcXjPW1ESGriu5//z/5+
         0+uh30B7c4nbGdCasdivzoaf7q/VrCt4Xxb2fpx91yMjYs4MeRHHDTz6kEtQFHeaLYTa
         Fxqg==
X-Gm-Message-State: AOAM5306414TrmZwhfkeLbqa25feMUkmSorDWuYTvNcdFhGnI/fTDNWU
        VyoPLCDTSFmEbbywU0CIi65MyYJsJtYhdw==
X-Google-Smtp-Source: ABdhPJwq/eOqXtITLK+kyOLCk4mNDfVsqXIZV2F3yV+6GfhTdR4AaBB6cuDCKN+FCMKfYALtIfLtaA==
X-Received: by 2002:a1c:1d16:: with SMTP id d22mr8733030wmd.174.1591885548499;
        Thu, 11 Jun 2020 07:25:48 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id b14sm4310840wmj.47.2020.06.11.07.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:25:47 -0700 (PDT)
Date:   Thu, 11 Jun 2020 14:25:46 +0000
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
Subject: Re: [PATCH RESEND v9 08/18] media: platform: Cancel the last frame
 handling flow
Message-ID: <20200611142546.GB158633@chromium.org>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-10-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604090553.10861-10-xia.jiang@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Xia,

On Thu, Jun 04, 2020 at 05:05:43PM +0800, Xia Jiang wrote:
> There is no need to queue an empty buffer for signaling a last frame,
> because all frames are separate from each other in JPEG.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v9: new patch
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 21 +------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
