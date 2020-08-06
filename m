Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6387CC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 23:03:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B3CF221E2
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 23:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qz+Tzz7b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgHFXDk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 19:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgHFXDi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 19:03:38 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B17C061575
        for <devicetree@vger.kernel.org>; Thu,  6 Aug 2020 16:03:38 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y6so154071plt.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2020 16:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=0gDnN//bxk4XCQG+5+85qQKDntN2R3o5FFO9hcqipr4=;
        b=Qz+Tzz7bYWSKTO2D5D1zgMNC/JGFqIwqPZZilBd/61zHOwvpLorhkmc7e7VEaUMNzu
         LnaRmb/RxkNitmzslzS10MrXEJp5npQp/zZZeMPjlconFW4iWIkykeZ/wB04ja2fGUB3
         6OJdfKhct7H5dJi16+7wGmBn1PO/p/GPHw/Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=0gDnN//bxk4XCQG+5+85qQKDntN2R3o5FFO9hcqipr4=;
        b=peha9xL+s5MxtzperDLQ6u0aKbb/3i8OFLRIYsB5s65goZCebMOJc596CAKDcTInqR
         BRetBDMC0JOmQaOX46tWsa9E6/aj6qRedCldlGvL6JpqLQlUB/9a6N4mNbmICL5mzIKV
         E3xd8qeSjUNgo4TAwJ33R9Fi7VdcqMPxB2qpKJxCE+3gfdu+M2OrcZqE8t1vicQYxt8c
         AgKsU7gGFkVnF5HbKpYrcOSVSrRYNl/DWYcI0zoJpDWW/+CHvEEnTsGmt28HfUc94qG7
         GooPKzWED6irzwwUq96exp1BAOY7NhwCvRhOVvW2ILbOAvyys81ALYlYbEGbJrYD3QVn
         rX/A==
X-Gm-Message-State: AOAM533cd0NULZ1lfQFTsacvj/ktQNOm+h/4GtxB71pik3i9p/3971WT
        qh38UmLLqb0z9FWLXTsnJqkDnA==
X-Google-Smtp-Source: ABdhPJxheayUk8uIULBY6NewH6D0OhojLErEsa5goOKcKVPS5xWNRVsItvYP7z12DSkLAXSq9aVcRA==
X-Received: by 2002:a17:902:7405:: with SMTP id g5mr9862707pll.173.1596755017579;
        Thu, 06 Aug 2020 16:03:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id j16sm8166331pgb.33.2020.08.06.16.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 16:03:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAL_JsqJou=yHsyQB+TUvwbNHDh81g7Lm7oWJfavYmPuYtxhREQ@mail.gmail.com>
References: <20200731164853.3020946-1-campello@chromium.org> <20200731104555.v3.1.I0925046377211b8b6f06764857f03b4ab592bddb@changeid> <20200801160639.1410944e@archlinux> <159648122347.1360974.1094560524092762187@swboyd.mtv.corp.google.com> <CAL_JsqLs99Q7o32mqZROQSLuaf-_6vVg_wSVbpMr0u3eD9LVEw@mail.gmail.com> <20200806191451.3ce5ec57@archlinux> <CAL_JsqJou=yHsyQB+TUvwbNHDh81g7Lm7oWJfavYmPuYtxhREQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: iio: Add bindings for sx9310 sensor
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Daniel Campello <campello@chromium.org>,
        LKML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Douglas Anderson <dianders@chromium.org>, open list:
        IIO SUBSYSTEM AND DRIVERS <linux-iio@vger.kernel.org>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Thu, 06 Aug 2020 16:03:35 -0700
Message-ID: <159675501533.1360974.12010874193333451805@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rob Herring (2020-08-06 15:12:34)
> On Thu, Aug 6, 2020 at 12:14 PM Jonathan Cameron <jic23@kernel.org> wrote:
> >
> > On Mon, 3 Aug 2020 20:01:06 -0600
> > Rob Herring <robh+dt@kernel.org> wrote:
> >
> > > On Mon, Aug 3, 2020 at 1:00 PM Stephen Boyd <swboyd@chromium.org> wro=
te:
> > > >
> > > > This is mostly a decision for Rob to make, but I would make it requ=
ired
> > > > because the device is always an io channel provider. It may be that=
 it
> > > > isn't providing anything in the DT to something else in the DT but =
it is
> > > > providing this information somewhere so always having to spell that=
 out
> > > > is simple and doesn't hurt.
> > >
> > > I agree. If the user is split in a board file or overlay, we don't
> > > want to have to be adding it to the provider at that time.
> >
> > That is perhaps a reasonable view point for devices with channels that
> > are likely to be used by consumer drivers, but in this particular case =
we
> > are talking about a proximity sensor.  So far I don't think we
> > have any consumer drivers for this type of sensor (I might have forgott=
en
> > one of course!)
>=20
> Indeed, I didn't consider whether it made sense in the first place. So
> should it just not be specified at all in this case? I can't really
> picture what the usecase for a consumer node would be.
>=20

I was thinking that a WiFi DT node may directly grab the channel from
this device and use this for SAR power changes. That would avoid going
all the way to userspace to figure out that something is close proximity
and then tell WiFi to reduce power.
