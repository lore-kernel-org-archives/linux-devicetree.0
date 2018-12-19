Return-Path: <SRS0=NxzU=O4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:44643 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729412AbeLSOWg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Dec 2018 09:22:36 -0500
MIME-Version: 1.0
References: <20181217144324.99422-1-chris.brandt@renesas.com>
 <20181217144324.99422-2-chris.brandt@renesas.com> <20181218150551.GA15519@bogus>
 <CAL_JsqKqWG39zXa1iBmNvgjzsUhX29q0wkqXy5juKdwXV9_JWA@mail.gmail.com>
In-Reply-To: <CAL_JsqKqWG39zXa1iBmNvgjzsUhX29q0wkqXy5juKdwXV9_JWA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Dec 2018 15:22:23 +0100
Message-ID: <CAMuHMdV8w+WXUkF-eUu0BkX_bAWL8-12DyJoHZRmD0jUvSZRcg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: r7s9210: Initial SoC device tree
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On Wed, Dec 19, 2018 at 3:07 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, Dec 18, 2018 at 9:05 AM Rob Herring <robh@kernel.org> wrote:
> > On Mon, Dec 17, 2018 at 09:43:23AM -0500, Chris Brandt wrote:
> > > Basic support for the RZ/A2 (R7S9210) SoC.
> > >
> > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > > ---
>
> > > +     gic: interrupt-controller@e8221000 {
> > > +             compatible = "arm,gic-400";
> >
> > Kind of strange that a single core A9 uses an external GIC rather than
> > the built-in one.
>
> Still have this question on v4. It should be "arm,cortex-a9-gic" if
> the A9 built-in GIC is used.

The GIC in RZ/A2 is documented to be a GIC-400.  Apparently the A9 GIC does
not have enough interrupt sources to serve all RZ/A2 peripherals.

Note that several Renesas A9 SoCs use a PL390.

https://lore.kernel.org/lkml/20150429125703.GB11757@leverpostej/
has a patch to print the GIC variant ID at runtime, to be 100% sure.

0x0000043b = arm,pl390
0x0102043b = arm,cortex-a9-gic
0x0200043b = arm,gic-400

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
