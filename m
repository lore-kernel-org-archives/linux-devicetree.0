Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1983AC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 20:52:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E76E820829
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 20:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CBoJ2b24"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbgG3UwF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 16:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgG3UwE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 16:52:04 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697B6C061574
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 13:52:04 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a14so26132154wra.5
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 13:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sNQBhS7/TXLnuBaPJWGWRsQsFBSRrqawtzX8JhhIouk=;
        b=CBoJ2b24vgzFcivcALEjMgSA99rMeCMANwn1Vt2DLSpjaKdWZszhgXW8MtjGenxbMJ
         BOPMYPR8mlZnVuwZctaGzWvqUTpjCUuXAHK/cmcLrrWh5tW4Z9gxLVXIeQa1on6qNiYj
         0XxDW1OM66WUEghPc4g4AJ6FxEV7dlZVNSOMR2c9X1C7PSkG4I/qF9f9r04lgNSkozLO
         gunC+ioLtfWhVHr1J8k9Xw68bEkYpxCr0A5+T6fbQdtY3uW3ya833H0mrlscYyViUVxS
         +zsheqI2fMX6LgzTmxQBL5N81TODqu1N6ai0Ph2K52KaNQaum0kYO4ytk6ckfoQx0QWU
         Bacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sNQBhS7/TXLnuBaPJWGWRsQsFBSRrqawtzX8JhhIouk=;
        b=K1pQtDPcqTgweGXSxKAn6/PiaKJc2BitouBjLKqCyqhWT0HBhAW3qKzZC/EVOfFhgS
         GRQyK0qm+n1RKEsmMFOTiMCDndHeH6esgmeZJAPA0Ee2q/lqNN6VUnV+XwL4Jnwh4RBQ
         ic0tNjIgZvg1aXw2lFQfVy88Ju1drfVYhYTOr4Pwe9Vjxw5zmSkikhh0Al0xpS0Q7vep
         EtN9tINCe94PvDoCEM5dYo3hWC2ohZuDHnCsak4vaN38a0auKjHeWrqYktsVNSlFUP1N
         E8BrKR+BRQ8mxRhuAaIx6kis1yrQpjBGiIuh4f19/SLK8Kijqq2p+XbSVAKbc6sTX/qL
         QgEA==
X-Gm-Message-State: AOAM532NSiin9b+7nTH+5o+ELt3HVEvfGQjsP+INoBF8GiXcOT8lS54l
        I9gxQKx9A2B06uC0CRJn0kFV13UyfTC0iK4nmISD6w==
X-Google-Smtp-Source: ABdhPJxDgRl/9ZgCFmOaT5JPiqE/grxj5wZw4lSsGR7jhPrRnIbadzcC+0YX7MIInKKf4u/DcAuREV5aPKnCYc60CVI=
X-Received: by 2002:adf:a19e:: with SMTP id u30mr460027wru.274.1596142322855;
 Thu, 30 Jul 2020 13:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <1596116336-23147-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1596116336-23147-1-git-send-email-kalyan_t@codeaurora.org>
From:   Kristian Kristensen <hoegsberg@google.com>
Date:   Thu, 30 Jul 2020 13:51:51 -0700
Message-ID: <CAOPc6T=+Yx=+QzOr+6f3SXZXPqE-FTKkis4a+pODnGM5pxyTVQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: Fix scale params in plane validation
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        hoegsberg <hoegsberg@chromium.org>,
        Doug Anderson <dianders@chromium.org>, mkrishn@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 30, 2020 at 6:39 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Plane validation uses an API drm_calc_scale which will
> return src/dst value as a scale ratio.
>
> when viewing the range on a scale the values should fall in as
>
> Upscale ratio < Unity scale < Downscale ratio for src/dst formula
>
> Fix the min and max scale ratios to suit the API accordingly.
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 6379fe1..e46dcb9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -946,9 +946,9 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                 crtc_state = drm_atomic_get_new_crtc_state(state->state,
>                                                            state->crtc);
>
> -       min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxdwnscale);
> +       min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
>         ret = drm_atomic_helper_check_plane_state(state, crtc_state, min_scale,
> -                                         pdpu->pipe_sblk->maxupscale << 16,
> +                                         pdpu->pipe_sblk->maxdwnscale << 16,
>                                           true, true);
>         if (ret) {
>                 DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);

Right, I can see how the drm convention of scaling factor being from
dest to src (ie 2x scaling up src to dst is as scale factor of 0.5).
Thanks for fixing this,

Tested-by: Kristian H. Kristensen <hoegsberg@google.com>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> --
> 1.9.1
>
