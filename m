Return-Path: <SRS0=ov7W=5P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEADC43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 18:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1915320714
	for <linux-devicetree@archiver.kernel.org>; Mon, 30 Mar 2020 18:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PF9JCctE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbgC3Szk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 30 Mar 2020 14:55:40 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46204 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgC3Szk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 30 Mar 2020 14:55:40 -0400
Received: by mail-vs1-f67.google.com with SMTP id z125so11752960vsb.13
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 11:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g1gheYJXxxb4j05ZqgCh1WDjANy6+6oZN8fr+WGCLZA=;
        b=PF9JCctEmZbycQHUREYCFpB93WZDn96lnP3Obqh6+qo2li0m+PomDclPw436h+k5nE
         HPlEJnAMbHLsbEzWSUiQzAE/czvmUKvzYnBU/0y75CHLnzbcOLHIgDqMclZpnP93bXel
         +PqZr9hZkasdPSR3g/8xLCfssCG0GE51W/VMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g1gheYJXxxb4j05ZqgCh1WDjANy6+6oZN8fr+WGCLZA=;
        b=NkIj6bFht+XSfjqsOdhNe4BbZIQIDa3P0oMrg0Z3JR43ZTpRNIAaV1OyVk+u7UQ2rm
         JhVZDNc//ypSNP/I/SkRbZodwvzk4UF2MudjVK7wp/+PdQTiaMN457ElOrORVv7pvanV
         /HOGPegGeku7Zvlbxvpzbg7gtnv364egcvlNAKBiac7zBEuaXRFVwyebNOxXXlo4ZCjY
         oEymatP4Y4a88ywhnflAlLkJJElS6/V7LP+VycAaaoFoAVj35nRHGxJIodF1Up4aZ+tc
         h6Gk6JPYuai8p/D0ZfgQeaGeb0tddKeYglqGDx+OKkVIqCQO2jsBq+BqmaFhZGEcQhln
         GhnA==
X-Gm-Message-State: AGi0PuYoKhyAIbJz7R0k2WjQ1UVSv9N7RK5MKr6Axq+ik+n041135E2I
        irNpc9uUW8U9zUZIfHJ/ULiDjNLcTA0=
X-Google-Smtp-Source: APiQypIl6jPYO5E/h1MkHyP8gnilOQnT9jEoCE2lU3nx1SvUrD/kq2gvy8yDrH37IRJFLtaM0b6UaQ==
X-Received: by 2002:a67:fad9:: with SMTP id g25mr5297104vsq.49.1585594538258;
        Mon, 30 Mar 2020 11:55:38 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id g1sm6318308uak.5.2020.03.30.11.55.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 11:55:37 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id o3so11789584vsd.4
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2020 11:55:37 -0700 (PDT)
X-Received: by 2002:a67:2c81:: with SMTP id s123mr9594577vss.198.1585594536858;
 Mon, 30 Mar 2020 11:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <1585559008-12705-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1585559008-12705-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 30 Mar 2020 11:55:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WcFahUm8jK+QTwx7BkCb3GTgKqFLP_pdqWBqN-zawrbw@mail.gmail.com>
Message-ID: <CAD=FV=WcFahUm8jK+QTwx7BkCb3GTgKqFLP_pdqWBqN-zawrbw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
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
        mkrishn@codeaurora.org, travitej@codeaurora.org,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Mar 30, 2020 at 2:04 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to manage runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>    _dpu_kms_disable_dpu (Rob Clark).
>
> Changes in v2:
>  - Avoid using suspend_late to reset the usagecount
>    as suspend_late might not be called during suspend
>    call failures (Doug).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 33 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c           |  4 ++++
>  drivers/gpu/drm/msm/msm_kms.h           |  2 ++
>  3 files changed, 39 insertions(+)

I am still 100% baffled by your patch and I never did quite understand
your response to my previous comments [1].  I think you're saying that
the problem you were facing is that if you call "suspend" but never
called "runtime_suspend" that the device stays active.  Is that right?
 If that's true, did you try something like this suggestion I made?

SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)


> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ce19f1d..2343cbd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -26,6 +26,7 @@
>  #include "dpu_encoder.h"
>  #include "dpu_plane.h"
>  #include "dpu_crtc.h"
> +#include "dsi.h"
>
>  #define CREATE_TRACE_POINTS
>  #include "dpu_trace.h"
> @@ -325,6 +326,37 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
>         pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>
> +static void _dpu_kms_disable_dpu(struct msm_kms *kms)
> +{
> +       struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +       struct drm_device *dev = dpu_kms->dev;
> +       struct msm_drm_private *priv = dev->dev_private;
> +       struct msm_dsi *dsi;
> +       int i;
> +
> +       dpu_kms_disable_commit(kms);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_put_sync(&dsi->pdev->dev);
> +       }
> +       pm_runtime_put_sync(dev->dev);
> +
> +       /* Increment the usagecount without triggering a resume */
> +       pm_runtime_get_noresume(dev->dev);
> +
> +       pm_runtime_get_noresume(&dpu_kms->pdev->dev);
> +
> +       for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +               if (!priv->dsi[i])
> +                       continue;
> +               dsi = priv->dsi[i];
> +               pm_runtime_get_noresume(&dsi->pdev->dev);
> +       }
> +}

My pm_runtime knowledge is pretty weak sometimes, but the above
function looks crazy.  Maybe it's just me not understanding, but can
you please summarize what you're trying to accomplish?

-Doug

[1] https://lore.kernel.org/r/114130f68c494f83303c51157e2c5bfa@codeaurora.org
