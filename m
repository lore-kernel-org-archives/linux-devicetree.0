Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019CCC282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:15:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8363206F0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJJKmDKN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgAHQPV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:15:21 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:33010 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727428AbgAHQPV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:15:21 -0500
Received: by mail-io1-f65.google.com with SMTP id z8so3833949ioh.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pb8r0umTZ03Oj31eFFNkQ5/UFrrXui0/Z3wS1BX5zew=;
        b=XJJKmDKNgJiszihlF5iGiAOK+HqqJGmf4LOU8f59ExaA+7o0h/ESRDy0HDGkkOhnlr
         lpMBx+PIrHHbn8kzi6qaYd5+lYD5FCcaXLKYk9FmiNpnl0Hz5y/2o7/FQwXULQbDYrkS
         TnZR0Wm6qGrQ0FS+xMGvfU63ZgQB5ivnnuVrBk0Oo6NNOkp0g60gWiHOF1FpLDbgmAJH
         dC9sEzCNGzzNRJ90eR380/vyWSFTkPDD6h5pnA/dmRy/N7ljdAaxq3HWpMCb/cGtAht/
         LYmkrxdFNQ5xcwjovi3i8Z9vU+7CofshevW0bwvNuZuzAgbvRFZLWBgeHf27ZOZ6W0L2
         Gz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pb8r0umTZ03Oj31eFFNkQ5/UFrrXui0/Z3wS1BX5zew=;
        b=q5PkJuge0UhCUnPk1jLzEY63JOPIUfIxsxCq9QprqTFfy+M+PkXKvvimnAvntM72Cz
         21KZYHXZmIH1nUeuFf4PtfybOwDr//S3NW5qIGywm7i3RPjeQ9o/E8knxAihgsaC9Hpi
         CxDzTWMg27XiqEg9H5PvganCd7ZiOxsqZNiEJH9QYsT9d6m4DwuL1KrnfItWi0hS66l/
         JTFLDohVOAbWOIcU1VMcxLq9ahpVVvvn1/S/3yE8H/9Xz0+QjKjI9FTcZQocEQaUXsyg
         tL7hY2udGCArBfNXOeXhndMGkMIDJLEBUcG2PLGZNYLIPiIY6Gu0EI3Dfg4iUsVGynxm
         bhag==
X-Gm-Message-State: APjAAAW2mBIiSOs+683mxesmszYMNekbX0d7HDhJJXlp6hSH4q6YwGvW
        0in7Hw/Weh5MVKuTF8B/Xwg8X99ZOxXBlAuswbk=
X-Google-Smtp-Source: APXvYqwBQUtw0MQorbR0lrHuXwVhzfJaXjgtHT1rwgbOIKaW492cSkdBCSjEcHIKxc3FP9ADSIA6n1h0zWea3GEzrV0=
X-Received: by 2002:a6b:3a8a:: with SMTP id h132mr3767245ioa.207.1578500120234;
 Wed, 08 Jan 2020 08:15:20 -0800 (PST)
MIME-Version: 1.0
References: <CAA2QUqKK+XcR5oqpZPrMNnQmgk=BV7s05UR7Efc2kCcYUs8=2w@mail.gmail.com>
 <CAL_JsqLgMJty+EgzEV-AfyWM7mKzWyB0X4ohxk5FUksMLcSL3w@mail.gmail.com> <1578465928.29698.21.camel@mtkswgap22>
In-Reply-To: <1578465928.29698.21.camel@mtkswgap22>
From:   Daniele Alessandrelli <daniele.alessandrelli@gmail.com>
Date:   Wed, 8 Jan 2020 16:15:08 +0000
Message-ID: <CAA2QUq+b4R=s1v-XU0y+R3PmFWXAXtFEAnU4pSW-0KAzRrzLFA@mail.gmail.com>
Subject: Re: [RFC] MAX_RESERVED_REGIONS hard-coded value
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob, Miles,

Thank you both for your replies.

On Wed, Jan 8, 2020 at 6:45 AM Miles Chen <miles.chen@mediatek.com> wrote:
>
> Hi,
>
> On Tue, 2020-01-07 at 15:13 -0600, Rob Herring wrote:
> > On Mon, Jan 6, 2020 at 12:05 PM Daniele Alessandrelli
> > <daniele.alessandrelli@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > I'm using a Device Tree with more then 32 reserved memory regions and
> > > I'm seeing the following error while booting the Kernel:
> > > [    0.000000] OF: reserved mem: not enough space all defined regions.
> >
> > How many do you have? Is that DT available somewhere?

Unfortunately, the DT is not publicly available yet. Anyway, I
currently have 41 reserved memory regions.

> >
> > > My understanding is that this is due to the hard-coded value of
> > > MAX_RESERVED_REGIONS in drivers/of/of_reserved_mem.c
> > >
> > > Googling around, I found this old discussion [1] in which Miles
> > > suggests to add a CONFIG_MAX_OF_RESERVED_REGIONS kconfig option to
> > > configure MAX_RESERVED_REGIONS. Rob replied to Miles' email saying
> > > that he would prefer MAX_RESERVED_REGIONS to be dynamic. However,
> > > later in the thread, it looks like making MAX_RESERVED_REGIONS dynamic
> > > poses some implementation issues [2]. At that point the discussion
> > > seemed to have stopped.
> >
> > Not sure what the problem was as there's no code, but I'd guess the
> > array alloc and populating have to be done later (perhaps in
> > unflattening).
>
> I missed my draft patch.
>
> From what I recall, the problem I had that time is that
> early_init_fdt_scan_reserved_mem() is called before paging_init(). So I
> cannot allocate accessible memory in early_init_fdt_scan_reserved_mem().
>
> For example: aarch64 setup_arch()
> setup_arch()
> {
>     memblock_init(); /* early_init_fdt_scan_reserved_mem() is called */
>     paging_init(); /* map memory */
> }
>
> >
> > > Is there any chance for the patch proposed by Miles to be reconsidered?
> >
> > A kconfig option would still be my 3rd choice after dynamically
> > allocating the array or just growing the fixed array size.

I'm happy with just growing the fixed array size, but just out of
curiosity, why do you prefer it to the kconfig option?

>
> Not sure how many of reserve memory regions Daniele has. In my case,
> we grow the MAX_RESERVED_REGIONS to 64 (3x used) and we are still trying
> to suppress the amount of reserved memory to fit
> MAX_RESERVED_REGIONS=32.

64 would be a safe value for my case as well.

We are also trying to reduce the amount of memory regions, but it's
unlikely we will manage to stay below 32 :/

Regards,
Daniele

>
>
>
> thanks,
> Miles
> >
> > Rob
>
