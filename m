Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4801C33CAF
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 00:57:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7C2220748
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 00:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="LCUsaS5g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732786AbgAQA5t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 19:57:49 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:34147 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387484AbgAQA5o (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jan 2020 19:57:44 -0500
Received: by mail-il1-f195.google.com with SMTP id s15so19959779iln.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jan 2020 16:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mu/pNuS/FahWpK5OpV2jIoZhFJwqyLEItDAbCnL8HQk=;
        b=LCUsaS5g4PPDTy9O4qGRxrisdep17HNjeETndzOWv5yxZOS+j2Xu+LeeAqMogg8iaW
         cLVTi7aOyerVIelFKy5lA6kgXDwkDXk+aKF7KioY00mjzEUBY+vgbM4dOX92JYvHtqKf
         rTGpaIqfgjyKbAd5fMyIjyNJgGLdHGHa2vHBAo8Uxvz3G8K44fvHUfy+sup9AtiWDwOb
         TfuUowM2t/0AUnc8xO5xlRGz5yBdTcoZBDBlZeVublMSPRYaOEHQP49P73Ct2DTTzKfk
         5Jr7pA3cQq/UhEABQSeT532qQEo1QmxWQFBSjU3Oe4T02soaCuQkAkwADCe5TfcsDj0Z
         I2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mu/pNuS/FahWpK5OpV2jIoZhFJwqyLEItDAbCnL8HQk=;
        b=c/FH+QWKX8TJgG8ejB3ygl7fMaMbxA7yRzd3B1Y+GEmwC2usjZZPHICEQyJUcV6bro
         sjY8BiOtCcXSZsyMpwpxezmLGI6RAD8KpqGj/GBigvwWe5QY8tvt2pLKYS+yXeogNcSg
         RxpUYyYe6Xf7rN5H18NOrmqTYr0TqvYpmQkmKr9gIYyDy7HmZU4m7xsealrOwOEqOlM7
         WHcqFbrkU0WRvPGYJtEY7pwbylJyzbtV2j8CkeOfVwUpbz9JeYncSeJuKJEU4OFvqy/C
         zhskRM4O8CeKQc93LJxbDimnaLxYJP2VYq8y2bx/flH0x4xjktDsD9LoN3D8RKnxqiZS
         bcOw==
X-Gm-Message-State: APjAAAVXT73UVQ/5t+j9ZG69zkChglIfNukPtlb3RKoUbRlN4ZajWWpN
        nMJ83rj03JglgM8z5WHOwCxBuyl0uivJ2dLAW1WnnQ==
X-Google-Smtp-Source: APXvYqw/CkNe0hxSpvYSyP+wzmWexXT7AUfno1y7RoiK65BXmWWA+WUuANcefhLNvisDdntfyHqLzezUq0I053z6qP4=
X-Received: by 2002:a92:afc5:: with SMTP id v66mr909656ill.123.1579222663852;
 Thu, 16 Jan 2020 16:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20200110063755.19804-1-zhang.lyra@gmail.com> <20200110063755.19804-3-zhang.lyra@gmail.com>
 <CAOesGMjNkVpTOhSrLUKjNZnKFk55DTgg29QzVBEFVh3Z=Ra+cQ@mail.gmail.com>
 <CAAfSe-tx+S_tc1y0c5wobQy2xygNr01b3LOqQ4FQtHoDNhHNeA@mail.gmail.com> <CAOesGMhNxkyAYMeHSRAuxzR51-5eHZ278LLVYe-3jaS7EKa-jw@mail.gmail.com>
In-Reply-To: <CAOesGMhNxkyAYMeHSRAuxzR51-5eHZ278LLVYe-3jaS7EKa-jw@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 16 Jan 2020 16:57:32 -0800
Message-ID: <CAOesGMi=1uKK=rCyD+d5yTE3O+HpNXTntNghLaWXt86z+GaKhg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: Add Unisoc's SC9863A SoC support
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jan 16, 2020 at 4:56 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Sun, Jan 12, 2020 at 5:44 PM Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> >
> > On Sat, 11 Jan 2020 at 01:41, Olof Johansson <olof@lixom.net> wrote:
> > >
> > > Hi,
> > >
> > > On Thu, Jan 9, 2020 at 10:38 PM Chunyan Zhang <zhang.lyra@gmail.com> wrote:
> > > >
> > > > From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > > >
> > > > Add basic DT to support Unisoc's SC9863A, with this patch,
> > > > the board sp9863a-1h10 can run into console.
> > > >
> > > > Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> > >
> > > You reposting a patch that we have already applied, and there's also
> > > no changelog for it in the description.
> >
> > Oh, I have to explain a bit.
> >
> > I was expecting an email which inform me that the patch was got merged.
> > That's the reason I resent this patchset.
>
> Ah, yes -- me too. This was a combination of two things:
>
> 1) The patch was originally sent to arm@kernel.org, not soc@kernel.org
> 2) I bounced it to there to apply it using PatchWork
>
> ... but, it seems that the bot won't reply to patches that have been
> bounced, only those who were originally sent there.
>
> In this case, I should have made a manual reply -- I've gotten too
> used to the bot and relied on it doing it.
>
> > About the changelog, this new patchset actually had a cover-letter[1]
> > in which I documented a little changes (which was not important now).
>
> Not sure why, but I seem to have missed it. Maybe because it was 3
> patches on v5, and I didn't notice that one was now a cover letter.
> Anyway, all good.
>
> I'll also apply 1/2 shortly.

I'm ahead of myself, it's already applied as well.


-Olof
