Return-Path: <SRS0=WAAy=MB=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 2/2] ARM: dts: r8a77470: Add APMU node and second CPU core
Date: Wed, 19 Sep 2018 10:24:00 +0000
Message-ID: 
 <TY1PR01MB1770A0F466B1CAFE68CD7C0CC01C0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1537173850-5310-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537173850-5310-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVmwevtcjHyKcY5Y0pXFOQhAGeyhdSqF4PGJzVt5C2XMA@mail.gmail.com>
 <20180919082541.q6izcnj5pigp2fdz@verge.net.au>
In-Reply-To: <20180919082541.q6izcnj5pigp2fdz@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Geert Uytterhoeven" <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Thank you for your feedback.

> Subject: Re: [PATCH 2/2] ARM: dts: r8a77470: Add APMU node and second CPU=
 core
>
> On Mon, Sep 17, 2018 at 10:53:16AM +0200, Geert Uytterhoeven wrote:
> > Perhaps "ARM: dts: r8a77470: Add SMP support"?
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
>
> I would like to ask to what extent this has been tested with respect to
> CPU hotplug, suspend to RAM, and combinations thereof.

Both CPU hotplug and STR were tested on their own and combined, I haven't e=
ncountered any issue so far.

Thanks,
Fab




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
