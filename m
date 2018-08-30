Return-Path: <SRS0=QYpu=LN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:35473 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727626AbeH3MGs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Aug 2018 08:06:48 -0400
MIME-Version: 1.0
References: <20180827162139.76196-1-chris.brandt@renesas.com> <20180829005228.GA5407@bogus>
In-Reply-To: <20180829005228.GA5407@bogus>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Aug 2018 10:05:40 +0200
Message-ID: <CAMuHMdWcvWDeSpewRDG=vAV+zsTO48a6kXTCL+34H_+Rnt0ung@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

On Wed, Aug 29, 2018 at 2:52 AM Rob Herring <robh@kernel.org> wrote:
> On Mon, Aug 27, 2018 at 11:21:39AM -0500, Chris Brandt wrote:
> > Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
> > Standby.
> >
> > The Module Standby HW in the RZ/A series is very close to R-Car HW, except
> > for how the registers are laid out.
> > The MSTP registers are only 8-bits wide, there is no status registers
> > (MSTPST), and the register offsets are a little different. Since the RZ/A
> > hardware manuals refer to these registers as the Standby Control Registers,
> > we'll use that name to distinguish the RZ/A type for the R-Car type.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---
>
> > +++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> > @@ -0,0 +1,192 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
>
>
> > +++ b/include/dt-bindings/clock/r7s9210-cpg-mssr.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: GPL-2.0+
>
> The proper identifier is GPL-2.0-or-later

Documentation/process/license-rules.rst disagrees.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
