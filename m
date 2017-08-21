From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH  2/3] ARM: dts: iwg20m: Enable SDHI0 controller
Date: Mon, 21 Aug 2017 08:31:24 +0000
Message-ID: <KL1PR06MB1702AC0B4C40F48A80505B74B8870@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1502711389-16040-1-git-send-email-biju.das@bp.renesas.com>
 <1502711389-16040-3-git-send-email-biju.das@bp.renesas.com>
 <20170821082842.GB2418@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170821082842.GB2418@katana>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Wolfram Sang [mailto:wsa@the-dreams.de]
> Sent: 21 August 2017 09:29
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Simon Horman <horms@verge.net.au>; Magnus
> Damm <magnus.damm@gmail.com>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Wolfram Sang <wsa+renesas@sang-
> engineering.com>; devicetree@vger.kernel.org; linux-renesas-
> soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 2/3] ARM: dts: iwg20m: Enable SDHI0 controller
>
> > +
> > +&sdhi0 {
> > +pinctrl-0 =3D <&sdhi0_pins>;
> > +pinctrl-names =3D "default";
> > +
> > +vmmc-supply =3D <&reg_3p3v>;
> > +vqmmc-supply =3D <&reg_3p3v>;
> > +cd-gpios =3D <&gpio7 11 GPIO_ACTIVE_LOW>;
> > +status =3D "okay";
> > +};
>
> Just to make sure: No 1.8V and UHS support (SDR50/104)? Or is this to be
> tested and added later?

Thanks. The current hardware doesn't support 1.8V switching for SDHI0. Ther=
e is a plan to
add this in future board varient, at that time we will add UHS support.







Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
