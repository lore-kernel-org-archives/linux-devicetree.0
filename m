Return-Path: <SRS0=2e0x=5J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E891C41621
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 14:35:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 260F02080C
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 14:35:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YiMsSpud"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbgCXOff (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Mar 2020 10:35:35 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46566 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727507AbgCXOff (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 24 Mar 2020 10:35:35 -0400
Received: by mail-vs1-f65.google.com with SMTP id z125so11199435vsb.13
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2020 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vHxRlatObgRvnysxTZAZ7i5pl1JSDT2R3bHKmGhkgUE=;
        b=YiMsSpudpT6FxZHxA6De/saSAHGXK7VlyDXtpNtN9hNzxOPelBBcnUkk9LPz8Mz4Ir
         KztvWvGmrqbAk7jwUQE14sSAWV4hf05oN5i6odmjR/cou/29qpALc9peKPyrjgXDkrAc
         oq6V4L/S8pZ9LSBWm00J5so+SUpk1hSQ8Va+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHxRlatObgRvnysxTZAZ7i5pl1JSDT2R3bHKmGhkgUE=;
        b=VMz5ntOEmgVre6+05aJX9lbDWP7NCIGI/kYGbRkvOtwuzL+zoCtxL5eAyrDOxHr8FJ
         3CFNYZx90FN6/947Ivxb8G4CPkSlAzkT179fjXCsys74cKF6diR+xmLvvo+XNYtPr7Dv
         wFfH8U207PRFFSOXSjxeQaGwWR7tPRtMSA9iNeQR1H5H+oa4E6bWUC6VdXHoGlKuanCW
         sv0uqM0OjydA6rosVN7cIYOR1eKpmSjnx71huweXPwCwkX2c0BgY3eWoA5njBB+MqDw/
         N5tfn9XHldFKSGWbqrliy2t6Wat2Xl7OJXr2bsFYH+OssLUERODyMOLXTR+JucfEL2T1
         gMLQ==
X-Gm-Message-State: ANhLgQ1LEw3kDFDUk/NMDRZhyvALTK+3XwXXJ4frJZ3Inl5nArz6loab
        2f5gkkv/rXO8uErgr2pCZ7Z54ryLyaY=
X-Google-Smtp-Source: ADFU+vu9iKAuvdlts7qQhDSy2h8qtsaJSw7mEXlEYbgUdtOyN9dodGEH8ZEjBAKjsfS6nQwZj1czvA==
X-Received: by 2002:a67:b001:: with SMTP id z1mr20452422vse.82.1585060533214;
        Tue, 24 Mar 2020 07:35:33 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id g1sm10503897uak.5.2020.03.24.07.35.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 07:35:32 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id r47so6338897uad.11
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2020 07:35:32 -0700 (PDT)
X-Received: by 2002:a9f:300a:: with SMTP id h10mr18039835uab.91.1585060531555;
 Tue, 24 Mar 2020 07:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Mar 2020 07:35:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
Message-ID: <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
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

On Sun, Mar 22, 2020 at 11:14 PM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
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
>      _dpu_kms_disable_dpu (Rob Clark).

I'm wondering what happened with my feedback on v1, AKA:

https://lore.kernel.org/r/CAD=FV=VxzEV40g+ieuEN+7o=34+wM8MHO8o7T5zA1Yosx7SVWg@mail.gmail.com

Maybe you didn't see it?  ...or if you or Rob think I'm way off base
(always possible) then please tell me so.

Thanks!

-Doug
