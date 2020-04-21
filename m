Return-Path: <SRS0=UCWN=6F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A5FC2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 09:39:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FED7206E9
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 09:39:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wNADBHYf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgDUJjY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 05:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725920AbgDUJjY (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 21 Apr 2020 05:39:24 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0112FC061A0F
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 02:39:24 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id u203so3154906vkb.11
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 02:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J6xX4UX3gD4CgRlcECeL2t8r4Bb9qOAjl08Y9GivdCk=;
        b=wNADBHYfBqrmYLagYMXhvkFyUT8BxHFDmwzkIw/FRVt1EftHXgipIT5yJYjq9ocehu
         GrZB6OVK67pjdwBAL3ZpBnNYXCYFWesoXkeoHo0e+Ys2ree61WWYf4q1s6aM2pRu8zzE
         AejCt13Zo1guyVsMD5GmA9rvmocxaeUAi4sNkPEfOLyZk1Y2qbJjkD6tKDgzsKIF5CWZ
         bLLAKSp0UWZJvyvTPaV6DLqfwXjGE7lCNhM1KyduORgSrcceVXJfhY1vVq4+4BSaq4zN
         YVaXK4yTyH5sWOKbHxJKYqWhedO0PsZU5jTNO2D9GxGo88EZ/BqFQXR4VHF3pC6Bn3an
         zNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J6xX4UX3gD4CgRlcECeL2t8r4Bb9qOAjl08Y9GivdCk=;
        b=q4PkuPUPH0QlQPzyPag5kd8nIHbgR0f1O6pVSGUlwEwmslwuMLl4Ln1vrMhA9hkSVn
         40nDMQPsD3df37H2OZVAc8z/2Gm5abGIu8OcUkQsa3uJxmWHvMQmHIUGcEHa88BavpjQ
         tRd3eud+hJ8ks4d3PyMIYs6TAY01VYie1OpXvfsj9zJrPgyF9bBAfEj6gXmaPC5MfZdh
         TRZBVg/l/9c4WECj9ldvs3abopekonaZlV9vDUYlLAwIVKQqg5aeb+cFIK7T8kFIou57
         VFQTuHAexjqSdZuFg7HTL7nCs4W49qO+A6JsiMBN51JiFjYXvQDof3DcGf/scQA2LZSm
         VSCg==
X-Gm-Message-State: AGi0PuadAVUrl9EAMsBc2kzJa0iF+zdtbz+Q0BP6l0Afosr6vl+jiS22
        bW5yFsBJmSm7bNl0cWdPauyuUVr/Sfzk3fPiw5a6VQ==
X-Google-Smtp-Source: APiQypLnPZE96uN80G6KHYHQ5XnaUSopJzzVTgfYzGF7mgcTRi/zaOA8wN0KNmuIrTuTzZyPCglj01kkbBVX93uXS2o=
X-Received: by 2002:a1f:31cf:: with SMTP id x198mr4295427vkx.101.1587461963161;
 Tue, 21 Apr 2020 02:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200420161831.5043-1-ludovic.barre@st.com> <CAPDyKFqC3fdnQ9CMYhS-=5MiCET=r5Az2S5oFoA2v1gdDeGO3w@mail.gmail.com>
In-Reply-To: <CAPDyKFqC3fdnQ9CMYhS-=5MiCET=r5Az2S5oFoA2v1gdDeGO3w@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 21 Apr 2020 11:38:47 +0200
Message-ID: <CAPDyKFrHcoVd=GKPB70gOFE8STOnTJrJbcZzE_DEgFWh1Vhszg@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci_sdmmc: fix power on issue due to pwr_reg initialization
To:     Ludovic Barre <ludovic.barre@st.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 21 Apr 2020 at 11:25, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Mon, 20 Apr 2020 at 18:18, Ludovic Barre <ludovic.barre@st.com> wrote:
> >
> > This patch fix a power-on issue, and avoid to retry the power sequence.
> >
> > In power off sequence: sdmmc must set pwr_reg in "power-cycle" state
> > (value 0x2), to prevent the card from being supplied through the signal
> > lines (all the lines are driven low).
> >
> > In power on sequence: when the power is stable, sdmmc must set pwr_reg
> > in "power-off" state (value 0x0) to drive all signal to high before to
> > set "power-on".
>
> Just a question to gain further understanding.
>
> Let's assume that the controller is a power-on state, because it's
> been initialized by the boot loader. When the mmc core then starts the
> power-on sequence (not doing a power-off first), would $subject patch
> then cause the
> MMCIPOWER to remain as is, or is it going to be overwritten?
>
> I am a little worried that we may start to rely on boot loader
> conditions, which isn't really what we want either...
>
> >
> > To avoid writing the same value to the power register several times, this
> > register is cached by the pwr_reg variable. At probe pwr_reg is initialized
> > to 0 by kzalloc of mmc_alloc_host.
> >
> > Like pwr_reg value is 0 at probing, the power on sequence fail because
> > the "power-off" state is not writes (value 0x0) and the lines
> > remain drive to low.
> >
> > This patch initializes "pwr_reg" variable with power register value.
> > This it done in sdmmc variant init to not disturb default mmci behavior.
> >
> > Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>
> Besides the comment, the code and the approach seems reasonable to me.

Another related question. I just realized why you probably haven't set
.pwrreg_nopower for the variant_stm32_sdmmc and variant_stm32_sdmmcv2.

I guess it's because you need a slightly different way to restore the
context of MMCIPOWER register at ->runtime_resume(), rather than just
re-writing it with the saved register values. Is this something that
you are looking into as well?

[...]

Kind regards
Uffe
