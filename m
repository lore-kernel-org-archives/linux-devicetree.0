Return-Path: <SRS0=gcol=OB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410092.outbound.protection.outlook.com ([40.107.141.92]:17376
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387669AbeKVUKg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 22 Nov 2018 15:10:36 -0500
From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH  1/4] dt-bindings: rtc: pcf85363: Document pcf85263
 real-time clock
Date: Thu, 22 Nov 2018 09:31:51 +0000
Message-ID: <OSBPR01MB2103DCC6527012134BC86784B8DB0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1542626108-61344-1-git-send-email-biju.das@bp.renesas.com>
 <1542626108-61344-2-git-send-email-biju.das@bp.renesas.com>
 <20181121100452.f4vyzuol2r6bozza@verge.net.au>
 <20181121100937.7savcuxtlxzjm6ld@verge.net.au>
In-Reply-To: <20181121100937.7savcuxtlxzjm6ld@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hello Simon,

Thanks for the feedback.

> -----Original Message-----
> From: Simon Horman <horms@verge.net.au>
> Sent: 21 November 2018 10:10
> To: Biju Das <biju.das@bp.renesas.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Rob Herring <robh+dt@kernel.org>;
> Mark Rutland <mark.rutland@arm.com>; linux-rtc@vger.kernel.org;
> devicetree@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: Re: [PATCH 1/4] dt-bindings: rtc: pcf85363: Document pcf85263 re=
al-
> time clock
>
> On Wed, Nov 21, 2018 at 11:04:52AM +0100, Simon Horman wrote:
> > On Mon, Nov 19, 2018 at 11:15:05AM +0000, Biju Das wrote:
> > > This patch adds binding for NXP pcf85263 real-time clock. pcf85263
> > > rtc is compatible with pcf85363 rtc except that pcf85363 has 64
> > > bytes additional RAM.
> >
> > How about this:
> >
> > This patch adds binding for the NXP pcf85263 real-time clock.
> >
> > The pcf85263 RTC is compatible with the pcf85363 RTC. The difference
> > between the parts is except that the pcf85363 has 64 bytes more RAM.
>
> The pcf85263 anRTC is compatible with the pcf85363 RTC.
>
> The difference between the pcf85263 and pcf85363 RTS is that the latter h=
as
> 64 bytes more RAM. This renders them incompatible from a DT point of view=
.

Will send V2 with the below changes.

This patch adds binding for the NXP pcf85263 real-time clock.

The pcf85263 RTC is compatible with the pcf85363 RTC. The difference
between the parts is except that the pcf85363 has 64 bytes more RAM.

The pcf85263 RTC is compatible with the pcf85363 RTC.

The difference between the pcf85263 and pcf85363 RTC is that the latter has
64 bytes more RAM. This renders them incompatible from a DT point of view.


Regards,
Biju
> >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/rtc/pcf85363.txt | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > index 76fdabc..94adc1c 100644
> > > --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> > > @@ -1,8 +1,8 @@
> > > -NXP PCF85363 Real Time Clock
> > > +NXP PCF85263/PCF85363 Real Time Clock
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > >
> > >  Required properties:
> > > -- compatible: Should contain "nxp,pcf85363".
> > > +- compatible: Should contain "nxp,pcf85263" or "nxp,pcf85363".
> > >  - reg: I2C address for chip.
> > >
> > >  Optional properties:
> > > --
> > > 2.7.4
> > >
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
