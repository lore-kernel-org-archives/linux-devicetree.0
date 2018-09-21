Return-Path: <SRS0=oGub=MD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42935 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbeIUNCm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Sep 2018 09:02:42 -0400
Date: Fri, 21 Sep 2018 09:15:00 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] ARM: dts: r8a77470: Add APMU node and second CPU core
Message-ID: <20180921071459.uui2tv47lnountuf@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770F47F0A5C7B8C4F55B44FC01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <TY1PR01MB1770A0F466B1CAFE68CD7C0CC01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <TY1PR01MB17703699454A72F7923F467AC01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio, Hi Geert,

On Wed, Sep 19, 2018 at 10:21:13AM +0000, Fabrizio Castro wrote:
> Hello Geert,
> 
> Thank you for your feedback.
> 
> > Subject: Re: [PATCH 2/2] ARM: dts: r8a77470: Add APMU node and second CPU core
> >
> > Perhaps "ARM: dts: r8a77470: Add SMP support"?
> 
> Your proposal is with me, Simon do you want me to send a v2 for this?

Thanks, I have applied this for v4.20 with the updated subject
and Geert's review tag.

> >
> > On Mon, Sep 17, 2018 at 10:44 AM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > Add DT node for the Advanced Power Management Unit (APMU), add the
> > > second CPU core, and use "renesas,apmu" as "enable-method".
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

...

On Wed, Sep 19, 2018 at 10:24:00AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback.
> 
> > Subject: Re: [PATCH 2/2] ARM: dts: r8a77470: Add APMU node and second CPU core
> >
> > On Mon, Sep 17, 2018 at 10:53:16AM +0200, Geert Uytterhoeven wrote:
> > > Perhaps "ARM: dts: r8a77470: Add SMP support"?
> > >
> > > On Mon, Sep 17, 2018 at 10:44 AM Fabrizio Castro
> > > <fabrizio.castro@bp.renesas.com> wrote:
> > > > Add DT node for the Advanced Power Management Unit (APMU), add the
> > > > second CPU core, and use "renesas,apmu" as "enable-method".
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I would like to ask to what extent this has been tested with respect to
> > CPU hotplug, suspend to RAM, and combinations thereof.
> 
> Both CPU hotplug and STR were tested on their own and combined, I haven't encountered any issue so far.

On Wed, Sep 19, 2018 at 10:32:24AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback.
> 
> > Subject: Re: [PATCH 2/2] ARM: dts: r8a77470: Add APMU node and second CPU core
> >
> > On Wed, Sep 19, 2018 at 10:25:42AM +0200, Simon Horman wrote:
> > > On Mon, Sep 17, 2018 at 10:53:16AM +0200, Geert Uytterhoeven wrote:
> > > > Perhaps "ARM: dts: r8a77470: Add SMP support"?
> > > >
> > > > On Mon, Sep 17, 2018 at 10:44 AM Fabrizio Castro
> > > > <fabrizio.castro@bp.renesas.com> wrote:
> > > > > Add DT node for the Advanced Power Management Unit (APMU), add the
> > > > > second CPU core, and use "renesas,apmu" as "enable-method".
> > > > >
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > I would like to ask to what extent this has been tested with respect to
> > > CPU hotplug, suspend to RAM, and combinations thereof.
> >
> > And any details of firmware, bootloader, ... version stacks where this is
> > supported.
> 
> iW-RainboW-G23S SPI_LOADER(DDR3) V1.00 2016.03.25
> U-Boot 2013.01.01-gaa28b1d-dirty (Feb 01 2018 - 22:55:39)
> 
> # cat /sys/devices/soc0/revision
> ES2.0
> 
> I hope this helps.

Thanks for your follow-up on the testing and environment,
it does indeed help to give me confidence when applying this patch.


...
