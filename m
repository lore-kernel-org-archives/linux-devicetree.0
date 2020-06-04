Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FA5C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 20:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2832D2067B
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 20:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ctMItyku"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbgFDUeV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 16:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729073AbgFDUeV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 16:34:21 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC80FC08C5C1
        for <devicetree@vger.kernel.org>; Thu,  4 Jun 2020 13:34:20 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id s192so1693347vkh.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 13:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QccmPOAwdRsqU+gseuKb7TceQ37JHCZ0c4E7yU4KiQA=;
        b=ctMItykuizT2FjCtlj3c7yeA8hejo1Eu0YvNGbgfHWNvUAZmSu1iqvjTuxpl6Rm/XM
         /bOQT4clHDMwkaa7CQpWJ+/aULE1pYzv7SNXe1g+1d4Jvdus2Zf/u2kDn//UPtypAuEw
         ce+XSToUwc8hZkd4Z5GjQqIAIMzFGI0iD70BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QccmPOAwdRsqU+gseuKb7TceQ37JHCZ0c4E7yU4KiQA=;
        b=J+gSVDRt883qmhDf/JWnf2vjJgd/zgyBC4BBqsV6gSpSeP3iJYyK/ZxyAvWYMi+4E7
         yUHJ9EgwoJK4J0NQzS2QbhNmfJBQmS8ABuN7zjjILqc9iQJKe7LPeKbcRd/deN8DQcui
         3/diOqOHuikxLIG/B8P+1BfzQItQ67TP03NbhT3zdh4e1qFDZ37PrbaxvpueDqVRNGCA
         39lFSTpglS2QZ1IUoDy78QuVX06uYQBvIKKQ1AdPeMY8dZZGPcrJbS36CFgzCnqZR4OO
         24gap573PSpT3rtohwaD7LIS0mdrqFdqeO55piiiY5exGAVpVtbDwtF1icas0g9MfDcN
         V9dw==
X-Gm-Message-State: AOAM533u/ZCzjo92TCtpK/aTtOQ1aFLq+uiHFxlrxRk3buDu11Wr2lYV
        eA2RqCVSgC8KCfFKnF704+pSUsTCWC8=
X-Google-Smtp-Source: ABdhPJxCGMQTwbESfry/b+Yno+MkBRxwz+ayG/C3TlS6wXyfvcF6M1YU1Xwx5PZxcMFhjYQYCNjR8Q==
X-Received: by 2002:a1f:2d58:: with SMTP id t85mr3192291vkt.100.1591302859393;
        Thu, 04 Jun 2020 13:34:19 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id r128sm843193vkf.48.2020.06.04.13.34.17
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 13:34:18 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id k13so4314554vsm.13
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 13:34:17 -0700 (PDT)
X-Received: by 2002:a67:8881:: with SMTP id k123mr5087675vsd.198.1591302857244;
 Thu, 04 Jun 2020 13:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <1591276775-13949-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1591276775-13949-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 4 Jun 2020 13:34:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V7ce7EGqJh6aga4yH3NqdgXMHBe=EOONtcd2LFDX75_A@mail.gmail.com>
Message-ID: <CAD=FV=V7ce7EGqJh6aga4yH3NqdgXMHBe=EOONtcd2LFDX75_A@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dpu: ensure device suspend happens during PM sleep
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

On Thu, Jun 4, 2020 at 6:20 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> -#ifdef CONFIG_PM
> -static int msm_runtime_suspend(struct device *dev)
> +#ifdef CONFIG_PM_SLEEP
> +static int msm_pm_suspend(struct device *dev)
>  {
> -       struct drm_device *ddev = dev_get_drvdata(dev);
> -       struct msm_drm_private *priv = ddev->dev_private;
> -       struct msm_mdss *mdss = priv->mdss;
>

nit: remove blank line at the start of this function

>  static const struct dev_pm_ops msm_pm_ops = {
>         SET_SYSTEM_SLEEP_PM_OPS(msm_pm_suspend, msm_pm_resume)
>         SET_RUNTIME_PM_OPS(msm_runtime_suspend, msm_runtime_resume, NULL)
> +       .prepare = msm_pm_prepare,
> +       .complete = msm_pm_complete,

Presumably you will get a compile failure if someone compiles without
CONFIG_PM_SLEEP since msm_pm_prepare() and msm_pm_complete() won't be
defined but you refer to them unconditionally.  Probably the best
solution is to just add "__maybe_unused" to your prepare/complete
function and then always define them.


I can't say I've thought through every corner case but at least this
change no longer raises alarm bells in my mind when I look at it.  ;-)
 If it works for you and nobody else has objections then it seems good
enough and we can always make more improvements later.  Feel free to
add my Reviewed-by tag when my nit is fixed and you make sure it
compiles even if CONFIG_PM_SLEEP isn't defined.

-Doug
