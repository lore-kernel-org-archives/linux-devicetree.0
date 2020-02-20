Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C7E4C761A1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 05:48:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6528424672
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 05:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dj/PTuGc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgBTFsr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 00:48:47 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44080 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgBTFsq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Feb 2020 00:48:46 -0500
Received: by mail-ot1-f65.google.com with SMTP id h9so2549297otj.11
        for <devicetree@vger.kernel.org>; Wed, 19 Feb 2020 21:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b0F6mdIbbyqJ8pmrP/z43Dyul8vyOpgKKbRJlBxceSI=;
        b=Dj/PTuGcX5bvKKNndi7kNoL5fDDrnj8sA5ecSWCgXS5spldvi9f+HfbQiZk1BZ4Q27
         BqVHTzq3Jf/QSqAp8/o6T1qrNhMFBsPsukftmAY6VAtLwds2AtYb1zdRi6JHsHzMHyPP
         pUeCmkvyJt0aPlrTsOCCPfW0xGxsF4RZiM+L5AoVWG7xz6Ool8zSOAEy72MrFFrFIr8J
         /9s8GKi1Vt8QkHBdpOr3i0EPmG2GCBqdRJDwC0d/9CboaJyQi3o230tDWy1i3vTVABT7
         gZBTcuyBl/po1AuNmHZazbR6K82R+/fFvOvgzIIUHoJyr4xEwtTxTQAY2J2XDOKzxFfx
         qP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b0F6mdIbbyqJ8pmrP/z43Dyul8vyOpgKKbRJlBxceSI=;
        b=t0F6yONjMp7ggqizNiQ0OK6UHLfRQH7iQcqb7H47pLlmrOXnuVjSFW2u5dsrJNNJX6
         PDO0fl8T0ZHZE8znSsTKmjzDO0EwyKMhLcVQ6X6vpMeGnUONHYJ26qLg2Tsypv8TLFpx
         d+t/p602E/T4QMTT+XN/AAAfNLlE0hMtATL9OGgeGceJ7E/JK86PDTkj+2vsihnPRZOI
         CsIRyL3cwig05dndBNKHwr4w809vdTQWF4s8RUsC4kMP2ekZxLLm2vXYbprQFqbDODGP
         06nQOt0Z5RhnHhUM8aHyw0HRjraY7roTvt42KxEdkPe1uB5klaHL/D0mYHFp8h7nuiiX
         gnlA==
X-Gm-Message-State: APjAAAW0KKjfhd7Gc+i/VEemyPnjZBPYMiZiKaYraalenSdx77t2BTFd
        BqpAvLk/2kLjwIwLpyQMej4Lcxvm68/S9rg8n3ee/Q==
X-Google-Smtp-Source: APXvYqzKncDhV3hzHRxI4jFA2zFrFbfgTQzje+xro87W+aJ9SnJ1h1RBfXJLiqq06+0n0Lm5UwlHJjEcfTJS0vOnrPs=
X-Received: by 2002:a9d:7d93:: with SMTP id j19mr23329830otn.102.1582177725955;
 Wed, 19 Feb 2020 21:48:45 -0800 (PST)
MIME-Version: 1.0
References: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 19 Feb 2020 21:48:34 -0800
Message-ID: <CALAqxLUzCN=xuF1Kx0Op_E0zMXK7PbHqynPu6TDozTMRrAuxkw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] msm/gpu/a6xx: use the DMA-API for GMU memory allocations
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        lkml <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Feb 19, 2020 at 1:33 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> When CONFIG_INIT_ON_ALLOC_DEFAULT_ON the GMU memory allocator runs afoul of
> cache coherency issues because it is mapped as write-combine without clearing
> the cache after it was zeroed.
>
> Rather than duplicate the hacky workaround we use in the GEM allocator for the
> same reason it turns out that we don't need to have a bespoke memory allocator
> for the GMU anyway. It uses a flat, global address space and there are only
> two relatively minor allocations anyway. In short, this is essentially what the
> DMA API was created for so replace a bunch of memory management code with two
> calls to allocate and free DMA memory and we're fine.
>
> The only wrinkle is that the memory allocations need to be in a very specific
> location in the GMU virtual address space so in order to get the iova allocator
> to do the right thing we need to specify the dma-ranges property in the device
> tree for the GMU node. Since we've not yet converted the GMU bindings over to
> YAML two patches quickly turn into four but at the end of it we have at least
> one bindings file converted to YAML and 99 less lines of code to worry about.
>
> Jordan Crouse (4):
>   dt-bindings: display: msm: Convert GMU bindings to YAML
>   dt-bindings: display: msm: Add required dma-range property
>   arm64: dts: sdm845: Set the virtual address range for GMU allocations
>   drm/msm/a6xx: Use the DMA API for GMU memory objects

Awesome! Thanks so much for the quick turnaround on this! This set
resolves the crashes I was seeing with
CONFIG_INIT_ON_ALLOC_DEFAULT_ON.

Tested-by: John Stultz <john.stultz@linaro.org>

thanks again!
-john
