Return-Path: <SRS0=5lcI=UL=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Date: Wed, 12 Jun 2019 10:03:16 +0000
Message-ID: 
 <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
In-Reply-To: <20190612094524.GA2153@kunai>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Chris Paterson" <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

Hello Wolfram,

Thank you for the feedback!

> From: Wolfram Sang <wsa@the-dreams.de>
> Sent: 12 June 2019 10:45
> Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
>=20
>=20
> > I was thinking about sending a follow-up patch to list hs400 here
> > after Wolfram's patch appears in a RC, would that be okay with you?
>=20
> Do we need that? The *board* does not handle HS400, so why add the
> property?

The SoC the design currently comes with doesn't handle HS400, but they may =
replace that
in the future with one that is based off R-Car M3-W version 3.0 (which does=
 support HS400).
Also, the HiHope will come in two flavours, the HiHope RZ/G2M (the flavour =
we are currently
adding support for), and the HiHope RZ/G2N (sporting an RZ/G2N, which is ba=
sed off R-Car M3-N).
File arch/arm64/boot/dts/renesas/hihope-common.dtsi contains common definit=
ions for the
mother boards for both flavours (including the eMMC). My understanding is t=
hat R-Car M3-N does
support HS400, hence the need for the property here.

Thanks,
Fab

>=20
> Similar setting would be an I2C device which can do 400kHz but the board
> layout doesn't allow for such speeds, so we are limited to 100kHz.
>=20
> Or?
