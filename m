Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CBCC33CB7
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 16:08:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABDE8214D8
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 16:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cCCXrbR6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729277AbgAaQI2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 11:08:28 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:35629 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729297AbgAaQI2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 11:08:28 -0500
Received: by mail-vs1-f67.google.com with SMTP id x123so4698757vsc.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 08:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4xPLoiaUgyd94a+bWIqEdjSO+/pm7JzzixTlR76nC4k=;
        b=cCCXrbR60CBlDAGSpmvFYrjjyE1DVVDlZhNhjXqkIlKpR2BcoPRCHGrUSSTCDfRqDk
         72D2LUsRS4KoF3mrsLr5JyigXGZ9EsF0j5WPA+OZLvWstHHFS/ADUWF2H+JRsfTpY1YT
         ZYDGjjQ7IrKGRYG64lWiFl0zCmZnBnqC4m0/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4xPLoiaUgyd94a+bWIqEdjSO+/pm7JzzixTlR76nC4k=;
        b=tEiOgC8b+tWwzjEzZtRh/oaFBrUVyRnx7By8uf3YbHDnJzixs1MptY1Atfw6JXJB1T
         Lx2WG3HqOGeL4D4wbEUBqCnaa0vCkHMcF+eZ/2yezrNYf3/ypfHbrOQIahFL4mxA/sF4
         IbFnTali/bLoiwKH60OvfuKaWWAZTYWtvKe1MTyUyMkcM0YUqkSHVvBxujmGYVQBzXaV
         WVN17bQBD+ydPpi+a4+G3F7/MvyPoA6NEfSSa7LESSjvkbJqAnXGvPEHoe0twxlpiweg
         90DzT20ek6y4qjB4kNlIIWDhCbh5EYEPhBB/Facn62SyDv+PVrzAFCLXe8YI/KdWtI1S
         0xqg==
X-Gm-Message-State: APjAAAXkdQlfBZ3SySR9AzmHQFCrj3Jn3WuIhNDI5YOWPRrENyonMxRD
        HACUArw19hmOPGU/aMHqbDyQA01t+zw=
X-Google-Smtp-Source: APXvYqyV+xGj7dHdkljkLCRt19LFF0nFtDOjUD6oFFBtHQGYsgrsoan6HXhPYDl4yLNsXySbyCn/wA==
X-Received: by 2002:a67:fbcb:: with SMTP id o11mr7053201vsr.109.1580486905551;
        Fri, 31 Jan 2020 08:08:25 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id i65sm2680560vkb.1.2020.01.31.08.08.24
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 08:08:24 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id p191so2208339vkf.8
        for <devicetree@vger.kernel.org>; Fri, 31 Jan 2020 08:08:24 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr6709266vke.40.1580486903706;
 Fri, 31 Jan 2020 08:08:23 -0800 (PST)
MIME-Version: 1.0
References: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com> <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
In-Reply-To: <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 31 Jan 2020 08:08:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
Message-ID: <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Fri, Jan 31, 2020 at 4:16 AM <smasetty@codeaurora.org> wrote:
>
> >> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000
> >> 0 0x10000>,
> >> +                               <0 0x0b490000 0 0x10000>;
> >> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> >> +                       interrupts = <GIC_SPI 304
> >> IRQ_TYPE_LEVEL_HIGH>,
> >> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       interrupt-names = "hfi", "gmu";
> >> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> >> +                              <&gpucc GPU_CC_CXO_CLK>,
> >> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> >> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> >> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
> >> +                       power-domains = <&gpucc CX_GDSC>;
> >
> > Bindings claim that you need both CX and GC.  Is sc7180 somehow
> > different?  Bindings also claim that you should be providing
> > power-domain-names.
> No this is still needed, We need the GX power domain for GPU recovery
> use cases where the shutdown was not successful.

This almost sounds as if the bindings should mark the GX power domain
as optional?  The driver can function without it but doesn't get all
the features?  As the binding is written right now I think it is
"invalid" to not specify a a GX power domain and once the yaml
conversion is done then it will even be flagged as an error.  That's
going to make it harder to land the your patch...

> I am working the Taniya
> to get the dependencies sorted out to bring this change in. This should
> be
> okay for the time being.

What breaks today if you add in the GX power domain here?

Oh, I see.  It's not even provided by the 'gpucc-sc7180.c' file.  What
happens if you do this for now:

  power-domains = <&gpucc CX_GDSC>, <0>;
  power-domain-names = "cx", "gx";

That seems to be the trendy thing to do if a phandle to something is
"required" but the code isn't ready for it.

-Doug
