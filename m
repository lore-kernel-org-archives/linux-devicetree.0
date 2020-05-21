Return-Path: <SRS0=MDPI=7D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B91C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 13:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2DAE2078B
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 May 2020 13:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dGmoucgr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgEUNpa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 May 2020 09:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgEUNpa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 May 2020 09:45:30 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA72CC061A0E
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 06:45:29 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id t8so2290072wmi.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2020 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MIZbow6oCp6jhBPcKsqdy9EnMAR8LQb1Wb+CIClZf0I=;
        b=dGmoucgrWl3fcaqDll9a/qRPLlA7s730yc2z/WBzNFxuL2a+M1qwz4OOCwGd++fhKy
         p8H1ZqTfH5xn8dw70XzKJISp6Vd7YqNQ/dPn7g8DE4Th7Ys7glQVxU1ajIvWn44+3/e0
         7gWzJKL3HsAPQXv9L62UgO6S71k5LFILN3dbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MIZbow6oCp6jhBPcKsqdy9EnMAR8LQb1Wb+CIClZf0I=;
        b=oJE5UVA79BwBJtEOCLzGepih625gQWqH3EG1MzcENqveOFdipYvGp2JzBh8MBUJVVn
         wxWjuPj179wUqcTNhGo4v7ePx3qkNaAZHWJ708JamFArVqTrNdXhm9DykU7KZqIA90RA
         R9fx0rrNTIfHVENpBrpgNzlkkc/J5Xwz/loJawclYFq8DHEWB/x+68hZyyyL+eHmVnM3
         CpJIjF5lQxw5cBBDidm7gv/UxSz+ekyWK/OK7iy/Bm0M4QA3vHjXxhQQzG/+BzZaFPA8
         1d+eJffhiLOxAtPbLSRe9suAULfaoqS9RVbKY1ytTy3PaPmq2NiF/Faw62f7x0FSZQxh
         SyOA==
X-Gm-Message-State: AOAM531JWD1KfLpSOZwdlNGaiNZ3zuGihpc0pI/KyaEnTn7+zuEYP+FP
        tQMz3U6WAsapyuQRtYasrCq2cuy54D00eg==
X-Google-Smtp-Source: ABdhPJzga0snvqqhabMrMb1GYaE9P70IQw0mFqh2Y8F+1nN0c5PVJEQNf6mkgxlQ/6SKai9ltVpOxA==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr8844805wmk.168.1590068728336;
        Thu, 21 May 2020 06:45:28 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id e29sm296309wra.7.2020.05.21.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 06:45:27 -0700 (PDT)
Date:   Thu, 21 May 2020 13:45:26 +0000
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
Subject: Re: [PATCH v8 01/14] media: platform: Improve subscribe event flow
 for bug fixing
Message-ID: <20200521134526.GA209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-2-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403094033.8288-2-xia.jiang@mediatek.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Xia,

On Fri, Apr 03, 2020 at 05:40:20PM +0800, Xia Jiang wrote:
> Let v4l2_ctrl_subscribe_event() do the job for other types except
> V4L2_EVENT_SOURCE_CHANGE.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v8: no changes
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
