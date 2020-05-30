Return-Path: <SRS0=koE9=7M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239A2C433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 May 2020 12:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 088CE2074A
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 May 2020 12:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728769AbgE3MbJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 May 2020 08:31:09 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37668 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgE3MbJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 May 2020 08:31:09 -0400
Received: by mail-oi1-f194.google.com with SMTP id m67so5097605oif.4
        for <devicetree@vger.kernel.org>; Sat, 30 May 2020 05:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yjFj/CwRe2cbSh/2iYpiyDSMzmGN4sI3eotoVDmNjck=;
        b=HqGvnVKxLB2Pbi6pSyarkqsHJtK9nRr87OW0UElToGUhJxJJi1ZMqdSNwpReAsqoLR
         Z20z99Qg25ZwEtuX9I0v8s9S8fu+cFxJ2z3htZ/+JzPGARX5xO3D5h2G3KF+PziHKN9g
         uYp4KP5X+R4u8+FMw7JYSwulDODMA0acbiyanBq0gVGc1NV0muc66nFvBYtmd74GowBe
         taR51YrdgvVLt+iLvApPneWJscEUBmTYA3uKfZssCDIUcD3qQFqdV4/W3Ob6QZmc0Gdh
         j9UZxwJHv3NP3VOgp07DMluQlP6HQiv1UUYlNWyVrmpPJUh2ERxXquzvpcsdxpVUMVEC
         JU0A==
X-Gm-Message-State: AOAM530XYDQyYf3HY9tyVE9+fHQFM1Ua0CxXDh1s2u2vEzZcs6dHb+WI
        GtlamcFLmquIBosrrdcAJjinHe7SgN5ER37zHi0=
X-Google-Smtp-Source: ABdhPJyofJHT5n2WaUNoWjw4AZ8MmtsHCSag28dEzmKj3KzHFU8Jkr5fW3wrlvhfE2jD2I3uqL39FoM89pCa/H59zMI=
X-Received: by 2002:a05:6808:1:: with SMTP id u1mr9241828oic.54.1590841867060;
 Sat, 30 May 2020 05:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200528132323.30288-1-geert+renesas@glider.be>
 <CAL_JsqJOPd2txkz298Rs12N+keJNYg2_qjCc-3vDwtL5iNXZmA@mail.gmail.com>
 <CAMuHMdU-FKoO+8cM2FOZRvENTuCEK02C=Si-bUiNCVrrp10qBA@mail.gmail.com> <CAL_Jsq+goALPsbhQ=Euh7fUupfC1gXO+AZXR=Obm9G_zMN7q4A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+goALPsbhQ=Euh7fUupfC1gXO+AZXR=Obm9G_zMN7q4A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 30 May 2020 14:30:55 +0200
Message-ID: <CAMuHMdVU4UnZCDoO842YQ0_q+CvRJ7+a_vf68ck95PCN6Zt4jg@mail.gmail.com>
Subject: Re: [PATCH dt-schema] Fix interrupt controllers with interrupt-map
To:     Rob Herring <robh+dt@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob,

Cc Rasmus

On Fri, May 29, 2020 at 11:44 PM Rob Herring <robh+dt@kernel.org> wrote:
> On Fri, May 29, 2020 at 10:02 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Fri, May 29, 2020 at 5:54 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > On Thu, May 28, 2020 at 7:23 AM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > When an interrupt controller has an "interrupt-map" property, an "is
> > > > valid under each of" error is triggered.
> > > >
> > > > Fix this by allowing "interrupt-controller" and "interrupt-map" to
> > > > coexist, in both the interrrupts meta-schema and the
> > > > interrupt-controller schema.
> > >
> > > But both should not be present. If 'interrupt-controller' is present,
> >
> > Why not?
>
> Well, maybe I'm wrong. If you have more than just transparent
> remapping (i.e. mask/unmask/clear), then perhaps both are appropriate
> because you want get the irq domain for the first irq parent.

Indeed, that's the case for rza1-irqc.

> > > the Linux irq parsing code will ignore 'interrupt-map'. Seems like
> > > that's backwards, but this parsing code is older than dirt and we'd
> > > probably break some 1990s machine changing it.
> >
> > That's fine.  rza1_irqc_parse_map() parses the interrupt-map itself,
> > to map from downstream to upstream interrupts.
>
> You shouldn't really be parsing interrupt-map yourself. The code there

Of course I had tried that before[1];

|    I also considered extracting the parsing code in of_irq_parse_raw() in a
|    new public helper function:
|
|        int of_irq_parse_map(struct device_node **ipar, u32 *addrsize,
|                             u32 *intsize, const __be32 **match_array,
|                             struct of_phandle_args *out_irq);
|
|    However, that API is a bit ugly due to many output parameters
|    (of_irq_parse_raw() needs to iterate the interrupt hierarchy).
|    In addition, it's less efficient for irq-renesas-rza1.c, as the
|    interrupt-map must be parsed 8 times.

Or is there a better way?

In the mean time, drivers/irqchip/irq-ls-extirq.c has landed, which was
mimiced after irq-renesas-rza1.c.

> doesn't account for #address-cells which can be a factor for
> interrupt-map. dtc is gaining some checks for 'interrupt-map', so
> let's hope you have it right.

The driver code indeed doesn't account for #address-cells, but the
binding says it must be zero anyway.

[1] "[PATCH v4 2/2] irqchip: Add Renesas RZ/A1 Interrupt Controller driver"
    http://lore.kernel.org/r/20190527121711.5138-3-geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
