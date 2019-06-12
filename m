Return-Path: <SRS0=5lcI=UL=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Date: Wed, 12 Jun 2019 11:02:11 +0000
Message-ID: 
 <TY1PR01MB1770B85D549CD20C963620E6C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
 <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612101516.xrlvqw7cls7eiv4u@ninjato>
In-Reply-To: <20190612101516.xrlvqw7cls7eiv4u@ninjato>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Chris Paterson" <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

Hello Wolfram,

Thank you for your feedback!

> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: 12 June 2019 11:15
> Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
>=20
>=20
> > File arch/arm64/boot/dts/renesas/hihope-common.dtsi contains common
> > definitions for the mother boards for both flavours (including the
> > eMMC). My understanding is that R-Car M3-N does support HS400, hence
> > the need for the property here.
>=20
> I won't be super strict here, yet I think it is more elegant to add the
> HS400 properties to the board DTS files, not the dtsi. I mean we could
> add them to the SoC dtsi otherwise.

We will give both approaches a shot in due time, once the relevant HW
will be available, but I do wonder why we need to make a distinction in the=
 DT
when we have a quirk in the driver (the real problem is that HS400 doesn't =
work
only on some revisions of the RZ/G2M chip, do we need to create different .=
dtsi for
different revisions of the same SoC? Or perhaps different versions of the s=
ame board
dts?)? We could simply put a comment in the DT once we add the compatibilit=
y of the
eMMC with HS400, something like:
"HS400 won't work on RZ/G2M rev=3D1.2"
and let the driver handle the difference between revisions of the SoC, this=
 would keep
things as compact as they possibly can be, as well as simplify design and m=
aintenance.

I hope this helps.

Thanks,
Fab
