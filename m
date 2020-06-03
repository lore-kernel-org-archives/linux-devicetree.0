Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F55C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48F69207D5
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 17:19:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpBNNn1R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgFCRTQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 13:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgFCRTP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 13:19:15 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EB9C08C5C0
        for <devicetree@vger.kernel.org>; Wed,  3 Jun 2020 10:19:13 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id z13so1836767vsn.10
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2020 10:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ff63mj6a29+ItWvrgCDVujeIfevYiCvvZYeCkBG8APA=;
        b=hpBNNn1RGbO+Ln98NFNNziez0y6q3GCACz4BwjSNi8QwbeRM3auXfUZ4PuBndmZMtR
         FwIoedrazWPNVVqcbQPZhmLGZQVMTTWOoa55G/+gxZQt0Gw2sLN7pkPW7liiOT7eVcGg
         jKksksB+KgJN2RjOFuyCOxF/Er9jeWnc3vproVfrCmBFdG+vpiy4KoBeVdCXfIbu2efx
         yYxFwZC1Hn1dv4Xca11Ch3eLZr+04Z/VkhXDmGLwoxgB1PWeESdHlI5okC5dM1pVWFbV
         YxBEKmQbo0WHS+O4BHk7ib5LH/bmvCV0KdJLK7lZByXS7k6bjf9pXFEYz99C9UOhCV8q
         HOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ff63mj6a29+ItWvrgCDVujeIfevYiCvvZYeCkBG8APA=;
        b=k+k9LDtbqdd9ZVCGb5jR/iK2X4YAsdqHi+kKDIrIDGZggqpn51a1DMzaDhNjA9KdQJ
         imMMKK/7NmFBgg2DY0eIRQixw8IvPRIogxzd6131WMWSu/xdgeVuckvmIsrYby7/aAAv
         tZ0Z6LdELmSzBzcSYj+Y5iJJelT8MQ+hVxDVm6X9oRQ5iuynJDTdDYZvK+7IQhtVt4eX
         dt9LrGhsb3S0i+Ul0fPV2gRWfZRNqZVyv5Sv6R4HC1JMwbxyyQhWu65gLGTb6vS7ntuz
         QVGregeMr0sxZO5BCVwvckfJe3aB4iUMcizfPfmpdyN3FrvdMAi6Ryj8jJQmWr1kfofL
         PXZw==
X-Gm-Message-State: AOAM531ZCoG03SHmOgaUhsqQfz5J8KRNPktqhW/oOiewEV/i2MBCnPvP
        2q8FPjUlIV8pg8aps5nVdyUGWiEZBZQ2SfX6vWI=
X-Google-Smtp-Source: ABdhPJxTyGYAvsmDCB5KurPMSwg0CppmfkQMT2uh74r/zjyku5qzVF+XDYaVbwmJEFDJsmAhMbKuIRsrwLfXhJH+rwc=
X-Received: by 2002:a05:6102:22ec:: with SMTP id b12mr398177vsh.138.1591204753050;
 Wed, 03 Jun 2020 10:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
 <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com> <20200602205653.GC56418@ravnborg.org>
In-Reply-To: <20200602205653.GC56418@ravnborg.org>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 3 Jun 2020 18:15:51 +0100
Message-ID: <CACvgo52fdrjp_-Q-mB1AYtNuKcQ722mvTOFsjWaXc139rjD58Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for KOE TX26D202VM0BWA panel
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Liu Ying <victor.liu@nxp.com>,
        devicetree <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 2 Jun 2020 at 21:57, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Emil.
>
> On Tue, Jun 02, 2020 at 01:46:19PM +0100, Emil Velikov wrote:
> > On Tue, 2 Jun 2020 at 08:17, Liu Ying <victor.liu@nxp.com> wrote:
> > >
> > > This patch adds support for Kaohsiung Opto-Electronics Inc.
> > > 10.1" TX26D202VM0BWA WUXGA(1920x1200) TFT LCD panel with LVDS interface.
> > > The panel has dual LVDS channels.
> > >
> > > My panel is manufactured by US Micro Products(USMP).  There is a tag at
> > > the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
> > > and it's made by KOE in Taiwan.
> > >
> > > The panel spec from USMP can be found at:
> > > https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf
> > >
> > > The below panel spec from KOE is basically the same to the one from USMP.
> > > However, the panel type 'TX26D202VM0BAA' is a little bit different.
> > > It looks that the two types of panel are compatible with each other.
> > > http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf
> > >
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > > index b6ecd15..7c222ec 100644
> > > --- a/drivers/gpu/drm/panel/panel-simple.c
> > > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > > @@ -2200,6 +2200,37 @@ static const struct panel_desc koe_tx14d24vm1bpa = {
> > >         },
> > >  };
> > >
> > > +static const struct display_timing koe_tx26d202vm0bwa_timing = {
> > > +       .pixelclock = { 151820000, 156720000, 159780000 },
> > > +       .hactive = { 1920, 1920, 1920 },
> > > +       .hfront_porch = { 105, 130, 142 },
> > > +       .hback_porch = { 45, 70, 82 },
> > > +       .hsync_len = { 30, 30, 30 },
> > > +       .vactive = { 1200, 1200, 1200},
> > > +       .vfront_porch = { 3, 5, 10 },
> > > +       .vback_porch = { 2, 5, 10 },
> > > +       .vsync_len = { 5, 5, 5 },
> > > +};
> > > +
> > > +static const struct panel_desc koe_tx26d202vm0bwa = {
> > > +       .timings = &koe_tx26d202vm0bwa_timing,
> > > +       .num_timings = 1,
> > > +       .bpc = 8,
> > > +       .size = {
> > > +               .width = 217,
> > > +               .height = 136,
> > > +       },
> > > +       .delay = {
> > > +               .prepare = 1000,
> > > +               .enable = 1000,
> > > +               .unprepare = 1000,
> > > +               .disable = 1000,
> > Ouch 1s for each delay is huge. Nevertheless it matches the specs so,
> > the series is:
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> >
> > Sam, Thierry I assume you'll merge the series. Let me know if I should
> > pick it up.
> I am quite busy with non-linux stuff these days so fine if you can pick
> them up. I like that simple panel patches are processed fast.
>
> I expect to have some hours for linux work friday or saturday, but no
> promises...
>
Don't worry - once the DT maintainers ack 1/2, I'll merge the series.

-Emil
