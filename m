From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH  2/2] ARM: dts: iwg20d-q7-dbcm-ca: Add HDMI video output
Date: Mon, 23 Oct 2017 17:38:23 +0000
Message-ID: <TY1PR06MB08953FFCD8624B3217A479E0C0460@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1508319227-19679-1-git-send-email-biju.das@bp.renesas.com>
 <1508319227-19679-3-git-send-email-biju.das@bp.renesas.com>
 <2315907.0FoaqPrOEJ@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <2315907.0FoaqPrOEJ@avalon>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <Chris.Paterson2@renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Laurent,

> >
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

Will send a v2 to fix this.

Thanks,
Fab

>
> The rest looks good to me. With this fixed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
