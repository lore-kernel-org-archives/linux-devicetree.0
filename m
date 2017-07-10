From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH v 1/2] ARM: dts: r8a7743: Add Ethernet AVB support
Date: Mon, 10 Jul 2017 09:17:57 +0000
Message-ID: <KL1PR06MB1702D5E5580D12BCA41D9B3AB8A90@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1499433165-62475-1-git-send-email-biju.das@bp.renesas.com>
 <1499433165-62475-2-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWsM_FBJ46=U69XptqpyC2cJYx_cqczaHBNq2nxZr68GQ@mail.gmail.com>
 <20170710082350.GB13680@verge.net.au> <20170710083643.GG13680@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170710083643.GG13680-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

Thanks for the review.

Regards,
Biju

> -----Original Message-----
> From: Simon Horman [mailto:horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org]
> Sent: 10 July 2017 09:37
> To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; Sergei Shtylyov
> <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>; Magnus Damm
> <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>; Biju Das
> <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>; Linux-Renesas <linux-renesas-
> soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>; Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH v 1/2] ARM: dts: r8a7743: Add Ethernet AVB support
>
> On Mon, Jul 10, 2017 at 10:23:51AM +0200, Simon Horman wrote:
> > On Mon, Jul 10, 2017 at 09:54:40AM +0200, Geert Uytterhoeven wrote:
> > > Hi Biju,
> > >
> > > On Fri, Jul 7, 2017 at 3:12 PM, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org> wr=
ote:
> > > > Add Ethernet AVB support for r8a7743 SoC.
> > > >
> > > > Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > > > Reviewed-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> > >
> > > With the minor nit below fixed:
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> > >
> > > > --- a/arch/arm/boot/dts/r8a7743.dtsi
> > > > +++ b/arch/arm/boot/dts/r8a7743.dtsi
> > > > @@ -605,6 +605,19 @@
> > > >                         #size-cells =3D <0>;
> > > >                         status =3D "disabled";
> > > >                 };
> > > > +
> > > > +               avb: ethernet@e6800000 {
> > > > +                       compatible =3D "renesas,etheravb-r8a7743",
> >
> > I do not see a patch to add "renesas,etheravb-r8a7743" to
> > Documentation/devicetree/bindings/net/renesas,ravb.txt
> >
> > If you haven't already done so please post a patch to add this once
> > net-next re-opens.
>
> I now see "ravb: Document binding for r8a7743 SoC"

I will send the patch with Rob's comments.
> >
> > > > +                                    "renesas,etheravb-rcar-gen2";
> > > > +                       reg =3D <0 0xe6800000 0 0x800>, <0 0xee0e80=
00 0 0x4000>;
> > > > +                       interrupts =3D <0 163 IRQ_TYPE_LEVEL_HIGH>;
> > >
> > > s/0/GIC_SPI/
> >
> > Thanks, I have applied this patch with the minor update above.

Thanks Simon.




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
