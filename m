Return-Path: <rayj00@yahoo.com>
Message-ID: <541560.66600.bm@smtp229.mail.bf1.yahoo.com>
MIME-Version: 1.0
From: Ray <rayj00@yahoo.com>
Subject: RE: [PATCH v2 6/6] devicetree: bindings: Document Renesas JPEG
 Processing Unit.
Date: Mon, 25 Aug 2014 20:17:25 -0400
Content-Type: multipart/alternative;
	boundary="_5C923B82-25D2-4CD1-B979-6C4F08B7BE0C_"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Hans Verkuil <hans.verkuil@cisco.com>, Linux-sh list <linux-sh@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--_5C923B82-25D2-4CD1-B979-6C4F08B7BE0C_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Get me off this flocking mail list.  The unsubscribe email method is not wo=
rking...=20

-----Original Message-----
From: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Sent: =E2=80=8E8/=E2=80=8E25/=E2=80=8E2014 8:04 PM
To: "Simon Horman" <horms@verge.net.au>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>; "Mikhail Ulyanov" <mikhail=
.ulyanov@cogentembedded.com>; "Magnus Damm" <magnus.damm@gmail.com>; "Mauro=
 Carvalho Chehab" <m.chehab@samsung.com>; "Rob Herring" <robh+dt@kernel.org=
>; "Grant Likely" <grant.likely@linaro.org>; "Mark Rutland" <mark.rutland@a=
rm.com>; "Ian Campbell" <ijc+devicetree@hellion.org.uk>; "Hans Verkuil" <ha=
ns.verkuil@cisco.com>; "Linux-sh list" <linux-sh@vger.kernel.org>; "Linux M=
edia Mailing List" <linux-media@vger.kernel.org>; "devicetree@vger.kernel.o=
rg" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] devicetree: bindings: Document Renesas JPEG Pro=
cessing Unit.

Hi Simon,

On Tuesday 26 August 2014 08:57:20 Simon Horman wrote:
> On Mon, Aug 25, 2014 at 02:59:46PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Aug 25, 2014 at 2:35 PM, Mikhail Ulyanov wrote:
> > >
> > > +  - compatible: should containg one of the following:
> > > +                       - "renesas,jpu-r8a7790" for R-Car H2
> > > +                       - "renesas,jpu-r8a7791" for R-Car M2
> > > +                       - "renesas,jpu-gen2" for R-Car second generat=
ion
> >=20
> > Isn't "renesas,jpu-gen2" meant as a fallback?
> >=20
> > I.e. the DTS should have one of '7790 and '7791, AND the gen2 fallback,
> > so we can make the driver match against '7790 and '7791 is we find
> > out about an incompatibility.
>=20
> Is there a document that clearly states that there is such a thing
> as jpu-gen2 in hardware? If not I would prefer not to add a binding for i=
t.

How about going the other way around and requesting that document ?

--=20
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe linux-media" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

--_5C923B82-25D2-4CD1-B979-6C4F08B7BE0C_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<HTML><HEAD>
<META content=3D"text/html; charset=3Dutf-8" http-equiv=3DContent-Type></HE=
AD>
<BODY>
<DIV>
<DIV style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-serif">Get me off =
this flocking mail list.&nbsp; The unsubscribe email method is not working.=
.. </DIV></DIV>
<DIV dir=3Dltr>
<HR>
<SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-serif; FONT-WEIGH=
T: bold">From: </SPAN><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,=
sans-serif"><A href=3D"mailto:laurent.pinchart@ideasonboard.com">Laurent Pi=
nchart</A></SPAN><BR><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,s=
ans-serif; FONT-WEIGHT: bold">Sent: </SPAN><SPAN style=3D"FONT-SIZE: 11pt; =
FONT-FAMILY: Calibri,sans-serif">=E2=80=8E8/=E2=80=8E25/=E2=80=8E2014 8:04 =
PM</SPAN><BR><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-seri=
f; FONT-WEIGHT: bold">To: </SPAN><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMIL=
Y: Calibri,sans-serif"><A href=3D"mailto:horms@verge.net.au">Simon Horman</=
A></SPAN><BR><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-seri=
f; FONT-WEIGHT: bold">Cc: </SPAN><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMIL=
Y: Calibri,sans-serif"><A href=3D"mailto:geert@linux-m68k.org">Geert Uytter=
hoeven</A>; <A href=3D"mailto:mikhail.ulyanov@cogentembedded.com">Mikhail U=
lyanov</A>; <A href=3D"mailto:magnus.damm@gmail.com">Magnus Damm</A>; <A hr=
ef=3D"mailto:m.chehab@samsung.com">Mauro Carvalho Chehab</A>; <A href=3D"ma=
ilto:robh+dt@kernel.org">Rob Herring</A>; <A href=3D"mailto:grant.likely@li=
naro.org">Grant Likely</A>; <A href=3D"mailto:mark.rutland@arm.com">Mark Ru=
tland</A>; <A href=3D"mailto:ijc+devicetree@hellion.org.uk">Ian Campbell</A=
>; <A href=3D"mailto:hans.verkuil@cisco.com">Hans Verkuil</A>; <A href=3D"m=
ailto:linux-sh@vger.kernel.org">Linux-sh list</A>; <A href=3D"mailto:linux-=
media@vger.kernel.org">Linux Media Mailing List</A>; <A href=3D"mailto:devi=
cetree@vger.kernel.org">devicetree@vger.kernel.org</A></SPAN><BR><SPAN styl=
e=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-serif; FONT-WEIGHT: bold">S=
ubject: </SPAN><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-se=
rif">Re: [PATCH v2 6/6] devicetree: bindings: Document Renesas JPEG Process=
ing Unit.</SPAN><BR><BR></DIV>Hi Simon,<BR><BR>On Tuesday 26 August 2014 08=
:57:20 Simon Horman wrote:<BR>&gt; On Mon, Aug 25, 2014 at 02:59:46PM +0200=
, Geert Uytterhoeven wrote:<BR>&gt; &gt; On Mon, Aug 25, 2014 at 2:35 PM, M=
ikhail Ulyanov wrote:<BR>&gt; &gt; &gt;<BR>&gt; &gt; &gt; +&nbsp; - compati=
ble: should containg one of the following:<BR>&gt; &gt; &gt; +&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - "renesas,jpu-r8a7790" for R-=
Car H2<BR>&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; - "renesas,jpu-r8a7791" for R-Car M2<BR>&gt; &gt; &gt; +&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - "renesas,jpu-gen2" for R-=
Car second generation<BR>&gt; &gt; <BR>&gt; &gt; Isn't "renesas,jpu-gen2" m=
eant as a fallback?<BR>&gt; &gt; <BR>&gt; &gt; I.e. the DTS should have one=
 of '7790 and '7791, AND the gen2 fallback,<BR>&gt; &gt; so we can make the=
 driver match against '7790 and '7791 is we find<BR>&gt; &gt; out about an =
incompatibility.<BR>&gt; <BR>&gt; Is there a document that clearly states t=
hat there is such a thing<BR>&gt; as jpu-gen2 in hardware? If not I would p=
refer not to add a binding for it.<BR><BR>How about going the other way aro=
und and requesting that document ?<BR><BR>-- <BR>Regards,<BR><BR>Laurent Pi=
nchart<BR><BR>--<BR>To unsubscribe from this list: send the line "unsubscri=
be linux-media" in<BR>the body of a message to majordomo@vger.kernel.org<BR=
>More majordomo info at&nbsp; http://vger.kernel.org/majordomo-info.html<BR=
></BODY></HTML>=

--_5C923B82-25D2-4CD1-B979-6C4F08B7BE0C_--
