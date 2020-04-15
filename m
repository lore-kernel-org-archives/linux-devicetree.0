Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6026EC2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 10:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F88720737
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 10:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yinSAq1k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896540AbgDOKoN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 06:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2896461AbgDOKW4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 06:22:56 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B671BC061A0F
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 03:22:19 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id u12so268853uau.10
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+P0Ra3iC/JXSowntxHaRgfUwGs3p9lTv27KqV4QmgY=;
        b=yinSAq1kT6zD1vFtfLDkhnd/jpN7wrG7ODN60H5IZPf26eivm1z8qbVdevmvj+nESI
         nZkUgiclMtRXxn8wlxgMLJhloymD845hPfK9pL/KcGtTJb0d7fX7pwCexJD3h/XqUIDL
         sC/Ecllg7bxMZ/zKYj0/8EIP26LBpFsV6haHjrJ3Q3Wp+5i/wRyQy3VDQCRyWiOgGpqs
         sRYyedAtNXFE1+Eible6YMxvgiuvsJKYaaAL+7utOJgKAFToCINEIuZ/ipArRi5R5Fct
         mAEz5wpBzbacQFz5hqldM4DaVLpl7apIeSSYMb8dIUylxnJOl2KZru1sz0LMGiN1gTvH
         3Vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+P0Ra3iC/JXSowntxHaRgfUwGs3p9lTv27KqV4QmgY=;
        b=ZePjzF17atOO7QuZFSRVxg348dE3241lpsreGrEPm6aXnStITK8ThwE0h4vG6qlShh
         cdTgSno4iypXtcBkjuVgp9R0q2f0SxQW07vHoErqa7NSGZngNqWABhy4xYH+ORqBdY2h
         AhdCiRRZUgn2N9u5Ncw4lRob0qJob4c/QQ7drs2eciQ9c9d21E1d4BivqKOONcMfDXo0
         G3BVOqS7VR41pJWyzzok5kYqjjFdi6ijfkw1Fz4NteVH6JrslW7L6x5d0t6dPHOYGKV7
         suks5s03I7iBGJYLIF0bXOSSeLTjXuNcHis2DX6y9TTPaO/hSWsUjjYkSNNjZv5iiEJ7
         9DHQ==
X-Gm-Message-State: AGi0PuaqsNFHkqJEckao6jN/AGDhET3GijAeBLWJbOoPdRosXcTUoNhA
        oGjiqJPoFsuUmS+nZ2aych1JXf0XyZYwtHSxWm5ErA==
X-Google-Smtp-Source: APiQypKTK11CweNuCLZHuiNsUqScKK2+NgaXl+En6sRY3fEfxKIbqcGPVRHGTngyxhLH42mRakinkb9pbXES1T/eR+k=
X-Received: by 2002:ab0:6204:: with SMTP id m4mr3886872uao.15.1586946138827;
 Wed, 15 Apr 2020 03:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <1586195015-128992-1-git-send-email-manish.narani@xilinx.com>
In-Reply-To: <1586195015-128992-1-git-send-email-manish.narani@xilinx.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 15 Apr 2020 12:21:42 +0200
Message-ID: <CAPDyKFqXYTh_+J=tnTTsK0Q1tj6f77hmnnh60Skw=WYwCCY9iQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add support for Xilinx Versal SDHCI in Arasan driver
To:     Manish Narani <manish.narani@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 6 Apr 2020 at 19:43, Manish Narani <manish.narani@xilinx.com> wrote:
>
> This patch series includes:
>  -> Document the Xilinx Versal SD controller
>  -> Add support for Versal SD Tap Delays
>  -> Reorganizing the clock operations handling
>  -> Resolve kernel-doc warnings
>
> Changes in v2:
>         - Addressed review comments given in v1
>         - Changed clock operation handling for better modularity.
>         - Changed comments to fix kernel-doc warnings
>
> Changes in v3:
>         - Addressed review comments from v2
>         - Move platform related structure before doing clock related changes
>         - Rename sdhci_arasan_data to avoid confusion with another struct name
>
> Manish Narani (6):
>   dt-bindings: mmc: arasan: Document 'xlnx,versal-8.9a' controller
>   sdhci: arasan: Add support for Versal Tap Delays
>   mmc: sdhci-of-arasan: Rename sdhci_arasan_data to avoid confusion
>   mmc: sdhci-of-arasan: Rearrange the platform data structs for
>     modularity
>   mmc: sdhci-of-arasan: Modify clock operations handling
>   mmc: sdhci-of-arasan: Fix kernel-doc warnings
>
>  .../devicetree/bindings/mmc/arasan,sdhci.txt       |  15 +
>  drivers/mmc/host/sdhci-of-arasan.c                 | 473 +++++++++++++++------
>  2 files changed, 361 insertions(+), 127 deletions(-)
>
> --
> 2.1.1
>

Applied for next, by managing some conflicts for patch4, thanks!

Note that, unless there is a "fix" part of the series, there is no
need to ping during the merge window.

Kind regards
Uffe
