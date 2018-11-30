Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:6314
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726512AbeK3X3w (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 30 Nov 2018 18:29:52 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 2/2] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M
 EVB
Date: Fri, 30 Nov 2018 12:20:37 +0000
Message-ID: <OSAPR01MB155353707920BFFEB7C4280E8AD30@OSAPR01MB1553.jpnprd01.prod.outlook.com>
References: <20181129130559.66732-1-chris.brandt@renesas.com>
 <20181129130559.66732-3-chris.brandt@renesas.com>
 <20181130115713.blmkvpa2vsdnqdt6@verge.net.au>
In-Reply-To: <20181130115713.blmkvpa2vsdnqdt6@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Friday, November 30, 2018, Simon Horman wrote:
> > +  - RZ/A2M Eval Board (RTK7921053S00000BE)
> > +    compatible =3D "renesas,rza2mevb", "renesas,r7s9210"
> >    - RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
> >      compatible =3D "renesas,rzn1d400-db", "renesas,r9a06g032"
> >    - Salvator-X (RTP0RC7795SIPB0010S)
>=20
> Pleas separate the change above into a separate patch.
> Such changes typically go upstream via a separate branch.

OK. Looking through the history log, I saw it different ways, so I was=20
not sure.


> I am wondering about the motivation for dual-licensing this file.
> It does not seem to be something Renesas has done before with
> upstream DT.
>=20
> I am also wondering if the dual licence, if it remains, can be
> described using SPDX.

A while back, I was reading/hearing about how board DT file do not have=20
to be GPL and the user should not have to be forced to make this GPL.=20
(Maybe at some ELC conference or on LWN or something)
So in our RZ/A BSP that I release to customers I would use this dual=20
license. You can see the exact same license in a number of dts files in=20
mainline.

Since there is no SPDX for this, I figure Rob might have some opinion on
the matter.
And, if I have to make it GLP for the mainline version, then I will just
replace the license when I release the customer BSP (since I wrote it,=20
I can do that). But, I would be nice to keep the BSP version as close to
mainline as I can.

Chris
