Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F949C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 22:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60F0720705
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 22:38:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n+bPBIjW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgAaWi2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 17:38:28 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:47040 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbgAaWi2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 17:38:28 -0500
Received: by mail-ua1-f66.google.com with SMTP id l6so3166285uap.13
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 14:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A/QwXMv8QAmipbLMot4MaxUhNNvwb0UK1sNHG1c0AVY=;
        b=n+bPBIjWQxxmXcyNtF2EyFmopFozDQdpVp68Vj3mgGrFckg86ApNTNEWR0uFO0/7DG
         vyaxvdDQ9kAE++SLmKRA5v1t6u/ZjszK4NJAbdXgkmSgqli8p4OjpqQKtuJ6Scaf7brq
         ZmpnT/9SmPlPX8EFH7dJW+bzBbfm/BGo+QXbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A/QwXMv8QAmipbLMot4MaxUhNNvwb0UK1sNHG1c0AVY=;
        b=XYOtCq293bDoBWKur+dCJapnvlbp5NJi4PNOPmC464VekqRLGub4xd4pInFBE34M6z
         YWIE3Muj5J473rR74I9zT0tli02UVStp55ho1+E6cDyJ7JB2nKpXlay8ZutDoISG/G6w
         IoGba+twrEALOzKIZtepFQUZzETK76jZiGIeRPqaGnv+lj3J+xHxDaVkf2eSktVNgViM
         9ogRR1OnDAyh+g8z4ktOWoMo37nmW0uPiifiTkzh1dNkRvwgmUeS1EHuPWO4TcP98R7K
         HeDQuMD4Fl9PII2TH3FaaTP/k07jV3zSs/dSlMqle2NvaGuuEtxiEpY6QiXm12eqOHsd
         ru8w==
X-Gm-Message-State: APjAAAWOtFI9V5j/qKHWrWVV9EhHATlWwhNh8bQwrnGGXqzgng6ukK57
        J297gWzRm5phK34xmeIQzm+WVDtKNa8=
X-Google-Smtp-Source: APXvYqz7l3oJxsKHP6JhQKRO1+DUID5Xubay876dLEOhyrnc7hVxaPwr9oG0YTzLhmaLdHuFfDrWdQ==
X-Received: by 2002:ab0:14a2:: with SMTP id d31mr7934497uae.106.1580510307197;
        Fri, 31 Jan 2020 14:38:27 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id g140sm3145174vkf.18.2020.01.31.14.38.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 14:38:26 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id o200so2550480vke.4
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 14:38:25 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr7858217vke.40.1580510305500;
 Fri, 31 Jan 2020 14:38:25 -0800 (PST)
MIME-Version: 1.0
References: <1579774675-20235-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1579774675-20235-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 31 Jan 2020 14:38:14 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XnS893yXNcm6RKV_3Do5b8hR2=nj=Y03Ymw7fbU+Zwng@mail.gmail.com>
Message-ID: <CAD=FV=XnS893yXNcm6RKV_3Do5b8hR2=nj=Y03Ymw7fbU+Zwng@mail.gmail.com>
Subject: Re: [PATCH] msm:disp:dpu1: add UBWC support for display on SC7180
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        travitej@codeaurora.org, nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Jan 23, 2020 at 2:19 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Add UBWC global configuration for display on
> SC7180 target.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 58 +++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)

I didn't do any sort of review of this patch, but I can say that
without it the screen on my sc7180-based device is super glitchy and
when I add this patch in the glitchies are gone.  Thus:

Tested-by: Douglas Anderson <dianders@chromium.org>

...one note is that the subject of this patch seems a bit
non-standard.  I would have expected a tag more like "drm/msm/dpu:"
instead of "msm:disp:dpu1:".  Presumably if the maintainer cares when
landing he/she could fix that up, but something to think about for
future patches.

-Doug
