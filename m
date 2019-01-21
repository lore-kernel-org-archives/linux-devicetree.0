Return-Path: <SRS0=chu1=P5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:46539
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725879AbfAURTG (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Jan 2019 12:19:06 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 3/5] media: dt-bindings: media: rcar_vin: Add r8a774a1
 support
Date: Mon, 21 Jan 2019 17:19:02 +0000
Message-ID: <TY1PR01MB1770D20B930232D643AF25D5C09F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1536589878-26218-1-git-send-email-biju.das@bp.renesas.com>
 <1536589878-26218-4-git-send-email-biju.das@bp.renesas.com>
 <TY1PR01MB1770D5713E00E0DB8A3060A5C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770D5713E00E0DB8A3060A5C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das@bp.renesas.com>, =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello Mauro,

This is a gentle reminder.

Thanks,
Fab

> From: Fabrizio Castro
> Sent: 08 November 2018 14:26
> Subject: RE: [PATCH 3/5] media: dt-bindings: media: rcar_vin: Add r8a774a=
1 support
>
> Hello Mauro,
>
> Does this patch look ok to you?
>
> Thanks,
> Fab
>
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@=
vger.kernel.org> On Behalf Of Biju Das
> > Sent: 10 September 2018 15:31
> > Subject: [PATCH 3/5] media: dt-bindings: media: rcar_vin: Add r8a774a1 =
support
> >
> > Document RZ/G2M (R8A774A1) SoC bindings.
> >
> > The RZ/G2M SoC is similar to R-Car M3-W (R8A7796).
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/media/rcar_vin.txt | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Doc=
umentation/devicetree/bindings/media/rcar_vin.txt
> > index 2f42005..8c81689 100644
> > --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> > +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> > @@ -12,6 +12,7 @@ on Gen3 platforms to a CSI-2 receiver.
> >   - compatible: Must be one or more of the following
> >     - "renesas,vin-r8a7743" for the R8A7743 device
> >     - "renesas,vin-r8a7745" for the R8A7745 device
> > +   - "renesas,vin-r8a774a1" for the R8A774A1 device
> >     - "renesas,vin-r8a7778" for the R8A7778 device
> >     - "renesas,vin-r8a7779" for the R8A7779 device
> >     - "renesas,vin-r8a7790" for the R8A7790 device
> > @@ -58,9 +59,9 @@ The per-board settings Gen2 platforms:
> >      - data-enable-active: polarity of CLKENB signal, see [1] for
> >        description. Default is active high.
> >
> > -The per-board settings Gen3 platforms:
> > +The per-board settings Gen3 and RZ/G2 platforms:
> >
> > -Gen3 platforms can support both a single connected parallel input sour=
ce
> > +Gen3 and RZ/G2 platforms can support both a single connected parallel =
input source
> >  from external SoC pins (port@0) and/or multiple parallel input sources
> >  from local SoC CSI-2 receivers (port@1) depending on SoC.
> >
> > --
> > 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
