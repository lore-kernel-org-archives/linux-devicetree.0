Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009BDC2BB85
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 09:10:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA2E3206D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 09:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZPv3eEX6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437410AbgDNJK1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 05:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729495AbgDNJKY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 05:10:24 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AB8C0A3BD0
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 02:10:23 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id l14so4661866ljj.5
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2020 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M+ORA61JbRVDaQSCwE9FhkFMr1p49JXPpYfNVNyx3Ow=;
        b=ZPv3eEX6C3HPmbooP/CpPahgkxzzO6CDBHqnibn+1tWgDUOWHcb94l7xApqV+0Sbv3
         vMsPix4PAjLUuy1ac7d1NFpXh/IZjkNcMsn/5VHlppmaspFO2T7DZ7siQ/zUYTFmx0Qg
         0vfrkPEJBApyOOs+gbxtM6+n9mFnV3uRv2zzxUpZPahKDfjojioCjIYpzSR0H5DVlNiU
         x9m3OKXnoQqT5nNz+HhkIxOOxObrUFtGKQQtTPMaLBuCq6Phz2u9z0F+aVG4k7I4mxOd
         282W8w/iZeOEcAjKsATfKww+r4x7/lSNVa047amYdd5oq/Ox/L/jt2xaWeMqpRcJrKg2
         af0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M+ORA61JbRVDaQSCwE9FhkFMr1p49JXPpYfNVNyx3Ow=;
        b=rgYUTaxxhv8KNC4gehg0jn0NYK/YP3uQLXG//mA3ckzYBFRs8nvDgdMgVo/H5Nc7YZ
         7jssvXG/WZoC/7mIlVDiRpFAOALcvczgaht8N6hTvOja0UE47t14meJBq90HRSNkmn5b
         1pZkjwHBSqm+6v7C+Wj9rOzsPHVDjj6gZjy8cFvynpBcLpS4JSUzn/KfLKV+CMGWlhou
         Am6B7AD8nbtTvP9nEfUISwAFDJAB/8w2vxCAVPbCtMGJXvjlrVW5ZuUgQ6pBB1wX/htB
         je//zx7DEaocj1I45BF1kjM/b7e5pS8qkn/Oi/uQl97RA85Woe0VJCOkK4AwaO5x9QWw
         6OkQ==
X-Gm-Message-State: AGi0PuZEmstbtiiR2tLZTJ0jq8PdzmK78r6TqunCFs0OBvNxB1Jh/79I
        rani5WweE//UCKapO7fvefhJq8COgzCFOOqhQTJKqESu
X-Google-Smtp-Source: APiQypIu6AB8A6nxgTYyE6QM6UM/zp1yzu4LI3Ub8eCzt+Jns7NvUPOwqWoV2yyiJcgymwxK3n0uUCNDbu92MhRfPKA=
X-Received: by 2002:a05:651c:28a:: with SMTP id b10mr13373358ljo.223.1586855422326;
 Tue, 14 Apr 2020 02:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200405173252.67614-1-stephan@gerhold.net>
In-Reply-To: <20200405173252.67614-1-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Apr 2020 11:10:11 +0200
Message-ID: <CACRpkdZkr=T+gvBMcv4dQaKN2H528kaCz9nqMTAg2GHeQeRXsA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: ux500: samsung-golden: Add proximity sensor
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, Apr 5, 2020 at 7:34 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> samsung-golden has the same sharp,gp2ap002s00f proximity sensor
> that is also used in samsung-skomer.
>
> A driver was added for it in
> commit 97d642e23037 ("iio: light: Add a driver for Sharp GP2AP002x00F").
>
> Now that it was merged we can add an entry for it in the device tree
> for samsung-golden.
>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Patch applied!

Yours,
Linus Walleij
