From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH  2/2] ARM: dts: iwg20d-q7-dbcm-ca: Add HDMI video output
Date: Wed, 18 Oct 2017 13:21:56 +0000
Message-ID: <KL1PR06MB1702073B7CD3385150B5407CB84D0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1508319227-19679-1-git-send-email-biju.das@bp.renesas.com>
 <1508319227-19679-3-git-send-email-biju.das@bp.renesas.com>
 <2315907.0FoaqPrOEJ@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2315907.0FoaqPrOEJ@avalon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laurent,

> On Wednesday, 18 October 2017 12:33:47 EEST Biju Das wrote:
> > From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> >
> > Although there is a HDMI connector on the q7 carrier board it is not
> > connected to the RZ/G1M SoC. One must use the HDMI connector on the
> > camera daughter board.
> >
> > This patch adds support for this connector.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > Reviewed-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi | 75
> > +++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> > b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi index 31fab5f..45b8167
> > 100644
> > --- a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> > +++ b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> > +&i2c5 {
> > +status =3D "okay";
> > +clock-frequency =3D <400000>;
> > +
> > +cec_clock: cec-clock {
> > +compatible =3D "fixed-clock";
> > +#clock-cells =3D <0>;
> > +clock-frequency =3D <12000000>;
> > +};
>
> I assume this describes a fixed clock generator that is not I2C-controlle=
d.
> The node should thus not be a child of the i2c5 bus node, but should be m=
oved
> to the root node of the DT.

Thanks, We will send a v2 with above changes.

> The rest looks good to me. With this fixed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
>
> However I can't find arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi in linux-ne=
xt.
> Which tree would you like to get this series merged through ?

Currently it is in renesas devel branch (https://git.kernel.org/pub/scm/lin=
ux/kernel/git/horms/renesas.git).
It will be merged with linux-next in coming weeks.

Regards,
Biju





Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
