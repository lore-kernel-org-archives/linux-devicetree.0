Return-Path: <SRS0=PUW6=PM=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from du
 node
Date: Fri, 4 Jan 2019 10:02:02 +0000
Message-ID: 
 <OSBPR01MB2103D40FC38C4A75476EBC39B88E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1544000815-28069-1-git-send-email-biju.das@bp.renesas.com>
 <1544000815-28069-5-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdW+qVJxu0fjC+j8w-neHU8FOHmJqRbHAtp1JvKYJ+RrXQ@mail.gmail.com>
 <OSBPR01MB2103C5C4C2A5B276E80D047AB88D0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190104090517.bi5et5osmyxmfrwb@verge.net.au>
In-Reply-To: <20190104090517.bi5et5osmyxmfrwb@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Linux-Renesas" <linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

Thanks for the feedback.

> Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder from
> du node
>
> On Thu, Jan 03, 2019 at 02:34:39PM +0000, Biju Das wrote:
> > Hi Geert,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v2 4/5] ARM: dts: r8a7743: Remove LVDS encoder
> > > from du node
> > >
> > > Hi Biju,
> > >
> > > On Wed, Dec 5, 2018 at 10:15 AM Biju Das <biju.das@bp.renesas.com>
> > > wrote:
> > > > The internal LVDS encoder now has DT bindings separate from the DU.
> > > > So remove it from du node.
> > > >
> > > > Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to
> > > > bridge driver")
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > ---
> > > > V1-->V2
> > > >         * Removed LVDS encoder definition from DU node.
> > >
> > > Shouldn't you add a new node for the LVDS encoder?
> >
> > Yes for Soc Dtsi , I will add the new node for LVDS encoder.
>
> Can I clarify that I should wait for a fresh revision of this and the fol=
lowing
> patch?

My original plan was to submit LVDS encoder patch as separate one.

But now we are agreeing for adding  LVDS encoder node as part of the fix (F=
ixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driv=
er")
So I will send V3 with this change.

Regards,
Biju
> > > > ---
> > > >  arch/arm/boot/dts/r8a7743.dtsi | 9 +++------
> > > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/r8a7743.dtsi
> > > > b/arch/arm/boot/dts/r8a7743.dtsi index 3cc33f7..3ad1efc 100644
> > > > --- a/arch/arm/boot/dts/r8a7743.dtsi
> > > > +++ b/arch/arm/boot/dts/r8a7743.dtsi
> > > > @@ -1681,15 +1681,12 @@
> > > >
> > > >                 du: display@feb00000 {
> > > >                         compatible =3D "renesas,du-r8a7743";
> > > > -                       reg =3D <0 0xfeb00000 0 0x40000>,
> > > > -                             <0 0xfeb90000 0 0x1c>;
> > > > -                       reg-names =3D "du", "lvds.0";
> > > > +                       reg =3D <0 0xfeb00000 0 0x40000>;
> > > >                         interrupts =3D <GIC_SPI 256 IRQ_TYPE_LEVEL_=
HIGH>,
> > > >                                      <GIC_SPI 268 IRQ_TYPE_LEVEL_HI=
GH>;
> > > >                         clocks =3D <&cpg CPG_MOD 724>,
> > > > -                                <&cpg CPG_MOD 723>,
> > > > -                                <&cpg CPG_MOD 726>;
> > > > -                       clock-names =3D "du.0", "du.1", "lvds.0";
> > > > +                                <&cpg CPG_MOD 723>;
> > > > +                       clock-names =3D "du.0", "du.1";
> > > >                         status =3D "disabled";
> > > >
> > > >                         ports {
> > >
> > > Gr{oetje,eeting}s,
> > >
> > >                         Geert
> > >
> > > --
> > > Geert Uytterhoeven -- There's lots of Linux beyond ia32 --
> > > geert@linux- m68k.org
> > >
> > > In personal conversations with technical people, I call myself a
> > > hacker. But when I'm talking to journalists I just say "programmer" o=
r
> something like that.
> > >                                 -- Linus Torvalds
> >
> >
> >
> > Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne
> End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under
> Registered No. 04586709.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
