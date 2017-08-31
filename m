From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH ] ARM: dts: iwg22d-sodimm: Add Ethernet AVB support
Date: Thu, 31 Aug 2017 09:24:25 +0000
Message-ID: <KL1PR06MB170280A3D466C9B35AF73939B89D0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1504106234-41450-1-git-send-email-biju.das@bp.renesas.com>
 <20170831084534.GF29946@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170831084534.GF29946-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Simon Horman [mailto:horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org]
> Sent: 31 August 2017 09:46
> To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland
> <mark.rutland-5wv7dgnIgG8@public.gmane.org>; Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>;
> Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>; Chris Paterson
> <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-renesas-
> soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH ] ARM: dts: iwg22d-sodimm: Add Ethernet AVB support
>
> On Wed, Aug 30, 2017 at 04:17:14PM +0100, Biju Das wrote:
> > Define the iWave RainboW-G22D board dependent part of the Ethernet AVB
> > device node.
> >
> > On some older versions of the platform (before R4.0) the phy address
> > may be 1 or 3. The address is fixed to 3 for R4.0 onwards (which will
> > be the first mainstream release), hence using 3 in the dts.
> >
> > Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > Signed-off-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> > ---
> > This patch is tested against renesas-dev tag 20170830-v4.13-rc7
> >
> >  arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 26
> > ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > index 442a5cb..aac84c6 100644
> > --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > @@ -17,9 +17,11 @@
> >
> >  aliases {
> >  serial0 =3D &scif4;
> > +ethernet0 =3D &avb;
> >  };
> >
> >  chosen {
> > +bootargs =3D "ignore_loglevel rw root=3D/dev/nfs ip=3Ddhcp";
> >  stdout-path =3D "serial0:115200n8";
> >  };
> >  };
> > @@ -29,6 +31,11 @@
> >  groups =3D "scif4_data_b";
> >  function =3D "scif4";
> >  };
> > +
> > +avb_pins: avb {
> > +groups =3D "avb_mdio", "avb_gmii";
> > +function =3D "avb";
> > +};
> >  };
> >
> >  &scif4 {
> > @@ -37,3 +44,22 @@
> >
> >  status =3D "okay";
> >  };
> > +
> > +&avb {
> > +pinctrl-0 =3D <&avb_pins>;
> > +pinctrl-names =3D "default";
> > +
> > +phy-handle =3D <&phy3>;
> > +phy-mode =3D "gmii";
> > +renesas,no-ether-link;
> > +status =3D "okay";
> > +
> > +phy3: ethernet-phy@3 {
> > +/*
> > + * On some older versions of the platform (before R4.0) the phy
> address
> > + * may be 1 or 3. The address is fixed to 3 for R4.0 onwards.
> > + */
> > +reg =3D <3>;
> > +micrel,led-mode =3D <1>;
>
> Does the phy have an interrupt?

The current board doesn't support interrupt . But there is a plan to suppor=
t
this in future board variants through (GPIO3_28).

> > +};
> > +};
> > --
> > 1.9.1
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
