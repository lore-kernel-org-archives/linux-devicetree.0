Return-Path: <SRS0=/AVO=NC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr70087.outbound.protection.outlook.com ([40.107.7.87]:7145
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727635AbeJVRfs (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Oct 2018 13:35:48 -0400
From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: RE: using interrupt controller dt-bindings macros in Non GPL dts
 files
Date: Mon, 22 Oct 2018 09:18:02 +0000
Message-ID: <HE1PR0402MB3323E108AF8810DEC38B7691F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
References: <HE1PR0402MB3323967BD6C0E11C738BFF38F1F40@HE1PR0402MB3323.eurprd04.prod.outlook.com>
 <20181022082906.GE7068@kroah.com>
In-Reply-To: <20181022082906.GE7068@kroah.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Varun Sethi <V.Sethi@nxp.com>, Udit Kumar <udit.kumar@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi Greg,

> -----Original Message-----
> From: Greg Kroah-Hartman [mailto:gregkh@linuxfoundation.org]
> Sent: Monday, October 22, 2018 1:59 PM
> To: Pankaj Bansal <pankaj.bansal@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Stephen Warren <swarren@nvidia.com>; Geert
> Uytterhoeven <geert+renesas@glider.be>; open list:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Varun Sethi
> <V.Sethi@nxp.com>; Udit Kumar <udit.kumar@nxp.com>; Leo Li
> <leoyang.li@nxp.com>
> Subject: Re: using interrupt controller dt-bindings macros in Non GPL dts=
 files
>=20
> On Mon, Oct 22, 2018 at 03:48:28AM +0000, Pankaj Bansal wrote:
> > Hi All,
> >
> > I have a query about include/dt-bindings/interrupt-controller/irq.h and
> include/dt-bindings/interrupt-controller/arm-gic.h files.
> > I would like to use these header files in NON-GPL (X11 Licensed) dts/dt=
si files,
> to use the macros defined in these header files in our dts/dtsi files.
> >
> >   1.  Does including the GPL header files for macros (NON executable co=
de) in
> NON-GPL files, causes the license of NON-GPL file to be contaminated with=
 GPL
> code?
>=20
> Why are you asking developers legal questions?  Would you ask us medical
> questions as well?  :)
>=20
> Seriously, go talk to your corporate lawyers, they know the answers to th=
is, it's
> not very complex.

My apologies. I will clear this question with our legal team.
Meanwhile, can you (or copyright owner of irq.h, arm-gic.h (don't know who)=
) answer my second question?

2. Would it be possible for the copyright owners of these header files to m=
ake these files dual licensed, so that we are able to use these files in ou=
r dts/dtsi files?

If some non-copyleft license can be added to these files, then I can happil=
y use these files in our dts/dtsi

>=20
> thanks,
>=20
> greg k-h
