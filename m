Return-Path: <SRS0=eLSC=OI=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 02/22] ARM: dts: r8a7744: Add I2C and IIC support
Date: Thu, 29 Nov 2018 13:52:12 +0000
Message-ID: 
 <OSBPR01MB2103391AD56CF562652049D8B8D20@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
 <1543319795-48325-3-git-send-email-biju.das@bp.renesas.com>
 <20181129134121.yiu3nrnpp7eatiqf@verge.net.au>
In-Reply-To: <20181129134121.yiu3nrnpp7eatiqf@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Simon & Geert,

Thanks for the feedback.

> -----Original Message-----
> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-
> owner@vger.kernel.org> On Behalf Of Simon Horman
> Sent: 29 November 2018 13:41
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> linux-renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>
> Subject: Re: [PATCH 02/22] ARM: dts: r8a7744: Add I2C and IIC support
>
> On Tue, Nov 27, 2018 at 11:56:15AM +0000, Biju Das wrote:
> > Add the I2C[0-5] and IIC[0,1,3] devices nodes to the R8A7744 device tre=
e.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a7744.dtsi | 141
> > ++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 139 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/r8a7744.dtsi
> > b/arch/arm/boot/dts/r8a7744.dtsi index 165c701..6505ebd 100644
> > --- a/arch/arm/boot/dts/r8a7744.dtsi
> > +++ b/arch/arm/boot/dts/r8a7744.dtsi
> > @@ -15,6 +15,18 @@
> >  #address-cells =3D <2>;
> >  #size-cells =3D <2>;
> >
> > +aliases {
> > +i2c0 =3D &i2c0;
> > +i2c1 =3D &i2c1;
> > +i2c2 =3D &i2c2;
> > +i2c3 =3D &i2c3;
> > +i2c4 =3D &i2c4;
> > +i2c5 =3D &i2c5;
> > +i2c6 =3D &iic0;
> > +i2c7 =3D &iic1;
> > +i2c8 =3D &iic3;
> > +};
> > +
>
> I believe we are moving away from adding aliases such as those above.
> Geert, can you comment on this?

I thought of removing this for the first instance.  But for  tools like i2c=
detect, it works on index.

Basically we need to work out index from device name, if we don't have alia=
ses.

Regards,
Biju

> Other than that this patch looks good to me.

> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
