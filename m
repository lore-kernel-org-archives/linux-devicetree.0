Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA6BC3F68F
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 23:11:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95C252467B
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 23:11:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MExhXoMf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgA0XLs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 18:11:48 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:40222 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbgA0XLs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 18:11:48 -0500
Received: by mail-ua1-f66.google.com with SMTP id z24so4142972uam.7
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 15:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DFyx78bNfJdYMQzj2ScVwGzqFx4mrb1379eblt0uZNc=;
        b=MExhXoMfg02P9/yakWtP+xXn+J78PWEh1A07lSTu8IFkOejgP+WOYPIyheYzf6eLtu
         J5w7nBlZfZxOCI3mxIChwse1+GITAFMvG477NTCPRAtYItZNJPE/8YIQu60aTd4kzXzQ
         3/X5Fge0czKgktZJYTIKeA4OhcprssE8bc1Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DFyx78bNfJdYMQzj2ScVwGzqFx4mrb1379eblt0uZNc=;
        b=aT0eNy/TvQ9h2hNwQfp6s/ClojJniJ5aHMtMKWh3Ca1xPeFfPg3uCmjVd+pbPmoR5c
         etB1SBPY52U/7dCWzR9AfJgV5h5zi5tk5eCCI6TtJ+tOGEKcUAjkcM9q/GUDYUaPIk0l
         fW+wQ71JqXiETvHoM46J8F3CGgGh6dLhwjKlE4C68n89oSvtcZCuNf/QS/RPWX5mZ9b1
         oGS2fswuQZqlZgJoSEmjNG/7rlMXkifCmnvyekXRPe5y5f5A/LFnoZWQOH4YMqEXLor2
         Sp2A02BV58m3MXMCTgrDvH14qyON8TBlFfA5pLJ2T7OU0SiDAjLA7/F6MHBAmxYHNWmI
         XiAA==
X-Gm-Message-State: APjAAAXpMv7ecs9mcseMDY69/R8+bVUvk2Ush+rNsoHOEIzzO495JN38
        ubnt2/F0AnJmh75xo4cDjaov3uUSkFY=
X-Google-Smtp-Source: APXvYqw+Qop6knDGM8g10GxKkAtIkkg47VFEaH0kNhbJqKi0WXXmGEtMotA2B5xAtQ8vINxF51teYw==
X-Received: by 2002:ab0:704b:: with SMTP id v11mr11679636ual.36.1580166706255;
        Mon, 27 Jan 2020 15:11:46 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id l193sm4726882vki.42.2020.01.27.15.11.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2020 15:11:45 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id y184so3093590vkc.11
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 15:11:45 -0800 (PST)
X-Received: by 2002:ac5:c807:: with SMTP id y7mr5333526vkl.92.1580166704728;
 Mon, 27 Jan 2020 15:11:44 -0800 (PST)
MIME-Version: 1.0
References: <1577435867-32254-1-git-send-email-tdas@codeaurora.org> <CAD=FV=X4gW3cpFPTL7KmocP1z7fK1fSRjg7BYjA7D_Uu7p5gnQ@mail.gmail.com>
In-Reply-To: <CAD=FV=X4gW3cpFPTL7KmocP1z7fK1fSRjg7BYjA7D_Uu7p5gnQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Jan 2020 15:11:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UGSN8YRtbEsbHOF6DRvi5=hUTeV+Aam4QKKVL99L4uBA@mail.gmail.com>
Message-ID: <CAD=FV=UGSN8YRtbEsbHOF6DRvi5=hUTeV+Aam4QKKVL99L4uBA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sc7180: Add clock controller nodes
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, Jan 22, 2020 at 4:46 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Dec 27, 2019 at 12:38 AM Taniya Das <tdas@codeaurora.org> wrote:
> >
> > Add the display, video & graphics clock controller nodes supported on
> > SC7180.
> >
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
>
> Can you add these to your patch?
>
> #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
>
> ...otherwise the first user of each of the clocks will need to add the
> #include and depending on what order patches landed things can get
> weird.  I think it's cleaner to assume that there will soon be a user
> and proactively add the #includes.
>
> NOTE: at least one user of your patch can be found at
> <https://lore.kernel.org/r/1579621928-18619-1-git-send-email-harigovi@codeaurora.org>.
> They don't add the #includes which means they don't compile atop your
> patch.

Breadcrumbs that I addressed my own feedback because I wanted to
include Taniya's patch atop my series.  See:

https://lore.kernel.org/r/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid

-Doug
