From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH 8/9] ARM: dts: iwg22d-sodimm: Sound DMA support via SRC on
 DTS
Date: Thu, 21 Dec 2017 11:01:28 +0000
Message-ID: <KL1PR06MB17023E4E4DE156A8ADB88411B80D0@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1513800125-53213-1-git-send-email-biju.das@bp.renesas.com>
 <1513800125-53213-9-git-send-email-biju.das@bp.renesas.com>
 <20171221104443.rk6prrib4gdi7qyz@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171221104443.rk6prrib4gdi7qyz@verge.net.au>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

> -----Original Message-----
> From: Simon Horman [mailto:horms@verge.net.au]
> Sent: 21 December 2017 10:45
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Magnus Damm <magnus.damm@gmail.com>;
> Chris Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; devicetree@vger.kernel.org; linux-renes=
as-
> soc@vger.kernel.org
> Subject: Re: [PATCH 8/9] ARM: dts: iwg22d-sodimm: Sound DMA support via
> SRC on DTS
>
> On Wed, Dec 20, 2017 at 08:02:04PM +0000, Biju Das wrote:
> > DMA transfer to/from SRC
> >
> >      DMA      DMApp
> > [MEM] -> [SRC] -> [SSIU] -> [SSI]
> >
> >      DMA      DMApp
> > [MEM] <- [SRC] <- [SSIU] <- [SSI]
> >
> > Current sound driver is supporting SSI/SRC random connection.
> > So, this patch is trying
> > SSI3 -> SRC3
> > SSI4 <- SRC4
>
> I am curious to know why the selection here differs from that present in
> iwg20d-q7-common. Is it an arbitrary decision?
>
> Likewise for other uses of ssi*, src* and dvc* in this patchset.

For ssi*,  on this board, SSI3/4 interface is connected to Audio In/Out.

For src*,  the original bsp from iwave is using src3/src4, also it is arbit=
rary as per the data sheet.

For dvc*,  Again it is arbitrary as per the data sheet.

> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > index 0f880c1..2cac57c 100644
> > --- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > +++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
> > @@ -183,8 +183,8 @@
> >
> >  rcar_sound,dai {
> >  dai0 {
> > -playback =3D <&ssi3>;
> > -capture =3D <&ssi4>;
> > +playback =3D <&ssi3 &src3>;
> > +capture =3D <&ssi4 &src4>;
> >  };
> >  };
> >  };
> > --
> > 1.9.1
> >


[https://www2.renesas.eu/media/email/unicef_2017.jpg]

This Christmas, instead of sending out cards, Renesas Electronics Europe ha=
ve decided to support Unicef with a donation. For further details click her=
e<https://www.unicef.org/> to find out about the valuable work they do, hel=
ping children all over the world.
We would like to take this opportunity to wish you a Merry Christmas and a =
prosperous New Year.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
