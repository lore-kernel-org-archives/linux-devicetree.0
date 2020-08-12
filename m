Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D237EC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 07:30:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC275204EC
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 07:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zdy95b1k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgHLHac (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 03:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbgHLHab (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Aug 2020 03:30:31 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65176C06174A
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 00:30:31 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b11so617438lfe.10
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2020 00:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5FdXAIZx+ZP41PS8ejWt0zp2dMev1+Pg53fxOJb49go=;
        b=zdy95b1kTPcTbrYCuGrt2C7Mi8xpkU0SHcP3cHovIvD8Rf8PcG/9Y4VLbg39S9gweq
         FxEP/lmv6XHHGIgWcfar5m/IGWRMciwaw2f62Xezz5t/KZZ1tU9gOdsRk2p+FOQ+vKUb
         9P2pGawIOuIANgF0+HWyVLwfTgOpI31SsDgCWY0rjzD1XpQ6R2NmtxWpnDO3JGXpcUaw
         2MXLfuQl5U7csaDC7/5zEvjZX+YywjdEWnPa+z7gF5q4zFjRxTGoJM4huW5c6humymcO
         r4BbIxlPHUQOk9R+nJdV4AAUKhqpeiHazJbNaf+Atp+blNAiOqI2RwVZ8M47yqPt7YQy
         NT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5FdXAIZx+ZP41PS8ejWt0zp2dMev1+Pg53fxOJb49go=;
        b=h/+XHIQuqASn40IvlGk/L6Upq+Kz0124TSCgJINJdCTy3FENZINvwtJpUC4C/9n4+2
         dbaOWHYW1lFMNW9FNWqGNAgn6sRMvVrbBklWHlw8AKpvUtoTv27xTokSW+T/rbSYUvlD
         xL4+hJnrw/4zXNsd4VieE90liS6sPS6Gt2uLSpxKWbwcDs76o6BOl+P2g4r9Ps43tLz7
         GfFg1s5H6N4oqSjvspvHc6aIuJ8XH28eGjIXRCZS6vePyb6OPTdz2VxTMidMvMp7pWpN
         LYUqdElnYlVkJ+vvKvciAvgeKbeY+5WvBS2fuMfUvs/tt76Pk4J4Jjp7Dipl6dm0VjND
         DoQg==
X-Gm-Message-State: AOAM530p3JzUFalJIKWO+EGpJGE55lFCPPrmhwgwqvFCFUpVZS/yhNtg
        K2O/bLSEtcrgo2w0BMmGBLT5TokhuNk8jgi0RM5uLQ==
X-Google-Smtp-Source: ABdhPJz4sufS9uL7t6Eocg+3nINh6YsIEewzxgjPWMWJmSeXpCf0IVIfT6TSWwDe2md+cFp4whCdIXttT1Jknix5buY=
X-Received: by 2002:a19:cb53:: with SMTP id b80mr5027209lfg.77.1597217428378;
 Wed, 12 Aug 2020 00:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200720203506.3883129-1-linus.walleij@linaro.org> <20200721112841.jxocq26yxhwy3gag@holly.lan>
In-Reply-To: <20200721112841.jxocq26yxhwy3gag@holly.lan>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Aug 2020 09:30:17 +0200
Message-ID: <CACRpkdZF5i8e100UG5aM_WmMRXvfugjB8KOr+AzXVnMJxJhkvA@mail.gmail.com>
Subject: Re: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253 bindings
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 21, 2020 at 1:28 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:

> I'm a bit sceptical of having a max-brightness in the DT and a driver
> defined lookup table in the driver itself. That doesn't make a whole lot
> of sense to me since the maximum brightness here is basically relies on
> knowing what scale the Linux driver has opted to implement in its tables.

That's a good point.

> I think there are two options here.
>
> 1. Throw away the brightness table in the driver and expose the hardware
>    steps directly (maybe using allowing properties such as
>    max-brightness = 24 if the top 8 values cannot be distinguished
>    visually).

I think I will opt for this. It makes most sense given how we use the
device tree to restrict maximum brightness, and that is definitely
related to the hardware max brightness.

Thanks Daniel!
Linus Walleij
