Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDD3C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 20:40:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA78D22B3F
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 20:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596228044;
	bh=RTy+2XZwxBBtR6OpdgP4IQ1CoZjL6q+d4+kQbUsnFGE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=N+PwHYXtpByd2fVc+hoB5WH/0am+di1yviZjjmYNIjHfVFVwVHWB2ygUUasKAYLyL
	 GHdPgnDQjS0hp/WZuXzGh6IXATyuwWDLsdF8jQsg6OhUpcyqjSu15NqhxmTAhI40sS
	 xipnviZ8Za/evafKCIrAZ37vfXMOGiNZoUSwuKlE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbgGaUko (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 16:40:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728305AbgGaUko (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 31 Jul 2020 16:40:44 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8537C22B3F
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596228043;
        bh=RTy+2XZwxBBtR6OpdgP4IQ1CoZjL6q+d4+kQbUsnFGE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VdaT9RtRdWwdgEFbvQoQNKk14fAokpsR1XCdAoiuDmD2hhHqMbFfLutIWyZFKEUFB
         K7KMksc/hmk3xdAY9f8HjZgF8No4e394fWAZPZpJYdDs6NildlYad1XxuZ5TM6p9P/
         hRomH/zmA0ZO16okR6O8mDJZUYSK+gyMokxvOoNc=
Received: by mail-ot1-f46.google.com with SMTP id t7so9817341otp.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 13:40:43 -0700 (PDT)
X-Gm-Message-State: AOAM530Ra7amXlGRs79VbBlrReu93zUCqclb36mn9hCjS8QpLhhscVRZ
        md+3OznudyX/fmQAV5XaNhVLyj/xygQXY6wv5w==
X-Google-Smtp-Source: ABdhPJw61vc9S0HXOWZY0VWOji6q8LSkuI6DAAQtR5sMccDxQDAtCepQV77emC6qXZ5H918o/5bicfepAXV9oH9o8aw=
X-Received: by 2002:a9d:3425:: with SMTP id v34mr522423otb.129.1596228042856;
 Fri, 31 Jul 2020 13:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200727100505.23908-1-ceggers@arri.de> <CAL_Jsq+jJFNQmxnXeA1HmBhM4aUH-qspdTCSRVvEfh0OVDF+DQ@mail.gmail.com>
 <797979108.27KzEp727H@n95hx1g2>
In-Reply-To: <797979108.27KzEp727H@n95hx1g2>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 31 Jul 2020 14:40:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK+Oj5AMDv5uvtQZZ6YMBzVKBPqvTfAsXEbjWvxqubQnQ@mail.gmail.com>
Message-ID: <CAL_JsqK+Oj5AMDv5uvtQZZ6YMBzVKBPqvTfAsXEbjWvxqubQnQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: at25: fix syntax error in example code
To:     Christian Eggers <ceggers@arri.de>
Cc:     devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jul 28, 2020 at 1:34 AM Christian Eggers <ceggers@arri.de> wrote:
>
> On Monday, 27 July 2020, 19:56:59 CEST, Rob Herring wrote:
> > On Mon, Jul 27, 2020 at 4:05 AM Christian Eggers <ceggers@arri.de> wrote:
> > > Add missing semicolon.
> > >
> > > Signed-off-by: Christian Eggers <ceggers@arri.de>
> > > ---
> > >
> > >  Documentation/devicetree/bindings/eeprom/at25.txt | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > At this point, I'd prefer to see this converted to schema instead of
> > trivial fixes. Then the tooling will catch these syntax errors.
> >
> While trying to convert the at25 binding to yaml, I ran into the following problem:
>
> > Required properties:
> > - compatible : Should be "<vendor>,<type>", and generic value "atmel,at25".
> >
> >   Example "<vendor>,<type>" values:
> >     "anvo,anv32e61w"
> >     "microchip,25lc040"
> >     "st,m95m02"
> >     "st,m95256"
>
> The current binding uses arbitrary values for the compatible string,
> only "atmel,at25" is really known by the driver. All other hardware related
> settings are provided as separate properties.
>
> When I specify
>
>   compatible:
>     enum:
>       - atmel,at25
>
> I get an error in dt_binding_check:
>
> Documentation/devicetree/bindings/eeprom/at25.example.dt.yaml: eeprom@0: compatible: Additional items are not allowed ('atmel,at25' was unexpected)
> Documentation/devicetree/bindings/eeprom/at25.example.dt.yaml: eeprom@0: compatible:0: 'st,m95256' is not one of ['atmel,at25']
> Documentation/devicetree/bindings/eeprom/at25.example.dt.yaml: eeprom@0: compatible: ['st,m95256', 'atmel,at25'] is too long
>
> How to handle this correctly?

You can do:

items:
  - {}
  - const: atmel,at25

But really, the possible compatible strings need to be listed out. See
at24.yaml as it had similar issues IIRC.

Rob
