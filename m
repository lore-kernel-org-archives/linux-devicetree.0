Return-Path: <SRS0=1QM3=RH=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
Date: Mon, 4 Mar 2019 10:10:49 +0000
Message-ID: 
 <TY1PR01MB1770F48284CA48C991052263C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1551438256-22065-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWNqFkSRnX9kGGFOCMTEHguQtsD=JfqLaHUpB=kgETPWA@mail.gmail.com>
 <20190304095856.uqqwhw46oueb2vtf@verge.net.au>
In-Reply-To: <20190304095856.uqqwhw46oueb2vtf@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, Chris Paterson" <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Thank you for your feedback!

> From: Simon Horman <horms@verge.net.au>
> Sent: 04 March 2019 09:59
> To: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Rob Herring <robh+d=
t@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> Magnus Damm <magnus.damm@gmail.com>; Linux-Renesas <linux-renesas-soc@vge=
r.kernel.org>; open list:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Chris Paters=
on <Chris.Paterson2@renesas.com>; Biju Das
> <biju.das@bp.renesas.com>
> Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
>=20
> On Fri, Mar 01, 2019 at 02:38:53PM +0100, Geert Uytterhoeven wrote:
> > On Fri, Mar 1, 2019 at 12:04 PM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > The CANFD implementation on the RZ/G2E (a.k.a. r8a774c0) is
> > > identical to the one found on the r8a77990.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Thanks, applied.

The patch that adds R8A774C0_CLK_CANFD (https://patchwork.kernel.org/patch/=
10766867/)
Isn't in a release candidate just yet, therefore I was expecting this patch=
 to be deferred to
to when R8A774C0_CLK_CANFD is finally available, similarly to:
https://www.spinics.net/lists/netdev/msg547320.html

Was I wrong?

Thanks,
Fab
