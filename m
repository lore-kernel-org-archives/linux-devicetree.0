Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C41C43215
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 05:35:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96DA02075C
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 05:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orG7A/Ag"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbfK0FfY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 27 Nov 2019 00:35:24 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35484 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfK0FfY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 27 Nov 2019 00:35:24 -0500
Received: by mail-ed1-f67.google.com with SMTP id f8so3337188edv.2;
        Tue, 26 Nov 2019 21:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=49Oa8wYum3/ZSF68b6FEDAYGeeDj1B7QQTfs5X12P5o=;
        b=orG7A/Ag4Mpz194IxVqBueUmwn4kcBrVHzZgSJ1Ge8qVVvCffnV7hSLi39OuHvPBWq
         5ECqbBft5gcDI7jRMhhdbklzC7Q20ek16p74SljfvnVM0pRLFa0LYwP5d2F98xfdS2BS
         eOlS5WXgMWStnv0CDrBHQOmZbOdnY81OgeQDtxqwzOTtvycIlqOm1dkgBa6xMZ5QDU3a
         63GeMux9odh+61DP5cmXh73oH6n2gA8aFMnTlXFIOKRhZ3JQg6QyI1Sea6MacTn813Bl
         BOjWQlQGraKo9jkwyV7qEgq/BEcbObhGOTBvYAxMj4yrg1cArNCMiAJZoB8XB60Xebva
         G1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=49Oa8wYum3/ZSF68b6FEDAYGeeDj1B7QQTfs5X12P5o=;
        b=dyk4vPDYNRSaKfUDVlisngitbSZZjVojgO9bvmNifkMoChrRvThNQod4dTqj0B3lFz
         aBDfC/rxiXxHl7gRiFJFgjT+ADTzuR4AfuOhX2O42AxEvfryeeVCoBOrsERv4MrWt4dp
         71FhA59fCHwJuJtd03EXzbPmwqdyk3ZCjfJBaXCmMI1v0Q6TJpjXxzsmXYcH8qkjdUGK
         kErdWXf37q0GerxHE63qHM1LVFrIi4OhwGN5Fx9+wFujPr5Fu3etD8EYdWAdAcXgoB3x
         bFoITrVGFjgY7HKbeoset00iJf2m0ZJghnfFMUND+Ki959KQPR+Ka2qmCgggVcJ8LmLz
         tMyA==
X-Gm-Message-State: APjAAAUF4OHGZPT13SG7lh09wKPgXybT1QltjrZozw/5D1zfydEdTZ0d
        r2EecnOdw/ee8kLwGvaEJtt8JBzrWaUenDcIY5c=
X-Google-Smtp-Source: APXvYqwQ8AbGM+kwuh2SxRqlpxfz20rbamxx7D0GEgKxBjcYRfCoJeN0AJA3JWgCFCweR06OFu5kduxXacMMGLAhPMI=
X-Received: by 2002:a50:a2e5:: with SMTP id 92mr30508816edm.195.1574832922697;
 Tue, 26 Nov 2019 21:35:22 -0800 (PST)
MIME-Version: 1.0
References: <1573820552-21164-1-git-send-email-shubhrajyoti.datta@gmail.com> <20191126180932.3A04620727@mail.kernel.org>
In-Reply-To: <20191126180932.3A04620727@mail.kernel.org>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Wed, 27 Nov 2019 11:05:11 +0530
Message-ID: <CAKfKVtEkffpzPHX1=fm1gBEz=3wRKmjqc5bdj054Ubj+SB+a=Q@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] clk: clock-wizard: Move the clockwizard to clk
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 26, 2019 at 11:39 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting shubhrajyoti.datta@gmail.com (2019-11-15 04:22:31)
> > From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> >
> > Move the clocking wizard driver from staging to clk.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> > this is moving the drivers/staging/clocking-wizard to clk
> > v2:
> > Added the makefile  and kconfig
> >
> >  drivers/clk/Kconfig                 |   6 +
> >  drivers/clk/Makefile                |   1 +
> >  drivers/clk/clk-xlnx-clock-wizard.c | 335 ++++++++++++++++++++++++++++++++++++
>
> Where is the deletion of the file from staging? Has the TODO file in
> staging been resolved?
I was trying to address the  set rate and the reconfig and will post
patches for the
fractional part.

As part of that discussion[1]
Greg suggested to move the code out of the staging.

[1] https://spinics.net/lists/linux-driver-devel/msg117326.html




>Please Cc Soren and Greg on these patches. Also
> include a cover letter and convince us _why_ we should review these
> patches in the commit text. Stating what the patch is doing, i.e.
> "moving code around", is not helpful.
Sure will do.


>
