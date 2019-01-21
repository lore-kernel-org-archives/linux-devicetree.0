Return-Path: <SRS0=chu1=P5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410131.outbound.protection.outlook.com ([40.107.141.131]:20653
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725879AbfAURRM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Jan 2019 12:17:12 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/5] media: dt-bindings: media: rcar-csi2: Add r8a774a1
 support
Date: Mon, 21 Jan 2019 17:17:05 +0000
Message-ID: <TY1PR01MB1770CFD7B98C8376C0E6712BC09F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1536589878-26218-1-git-send-email-biju.das@bp.renesas.com>
 <1536589878-26218-2-git-send-email-biju.das@bp.renesas.com>
 <TY1PR01MB177032BB126E89F93C43558EC0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB177032BB126E89F93C43558EC0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Biju Das <biju.das@bp.renesas.com>, =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hello Mauro,

This is a gentle reminder.

Thanks,
Fab

> From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vg=
er.kernel.org> On Behalf Of Fabrizio Castro
> Sent: 08 November 2018 14:19
> Subject: RE: [PATCH 1/5] media: dt-bindings: media: rcar-csi2: Add r8a774=
a1 support
>
> Hello Mauro,
>
> Does this patch look ok to you?
>
> Thanks,
> Fab
>
> > From: Biju Das <biju.das@bp.renesas.com>
> > Sent: 10 September 2018 15:31
> > Subject: [PATCH 1/5] media: dt-bindings: media: rcar-csi2: Add r8a774a1=
 support
> >
> > Document RZ/G2M (R8A774A1) SoC bindings.
> >
> > The RZ/G2M SoC is similar to R-Car M3-W (R8A7796).
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 5 +++-=
-
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.=
txt
> > b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > index 2d385b6..12fe685 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > +++ b/Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt
> > @@ -2,12 +2,13 @@ Renesas R-Car MIPI CSI-2
> >  ------------------------
> >
> >  The R-Car CSI-2 receiver device provides MIPI CSI-2 capabilities for t=
he
> > -Renesas R-Car family of devices. It is used in conjunction with the
> > -R-Car VIN module, which provides the video capture capabilities.
> > +Renesas R-Car Gen3 and RZ/G2 family of devices. It is used in conjunct=
ion
> > +with the R-Car VIN module, which provides the video capture capabiliti=
es.
> >
> >  Mandatory properties
> >  --------------------
> >   - compatible: Must be one or more of the following
> > +   - "renesas,r8a774a1-csi2" for the R8A774A1 device.
> >     - "renesas,r8a7795-csi2" for the R8A7795 device.
> >     - "renesas,r8a7796-csi2" for the R8A7796 device.
> >     - "renesas,r8a77965-csi2" for the R8A77965 device.
> > --
> > 2.7.4
>
>
>
>
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End,=
 Buckinghamshire, SL8 5FH, UK. Registered in England &
> Wales under Registered No. 04586709.



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
