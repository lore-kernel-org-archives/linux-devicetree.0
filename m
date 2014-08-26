Return-Path: <rayj00@yahoo.com>
Message-ID: <32490.78673.bm@smtp221.mail.bf1.yahoo.com>
MIME-Version: 1.0
From: Ray <rayj00@yahoo.com>
Subject: RE: [PATCH v2 6/6] devicetree: bindings: Document Renesas
 JPEGProcessing Unit.
Date: Mon, 25 Aug 2014 20:09:43 -0400
Content-Type: multipart/alternative;
	boundary="_971D57AF-294C-43A0-BCF7-8D07198398A3_"
To: Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Linux-sh list <linux-sh@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--_971D57AF-294C-43A0-BCF7-8D07198398A3_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Get me the fuck off this list!!! The unsubscribe email does not work!!!!!!

-----Original Message-----
From: "Simon Horman" <horms@verge.net.au>
Sent: =E2=80=8E8/=E2=80=8E25/=E2=80=8E2014 7:57 PM
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Mikhail Ulyanov" <mikhail.ulyanov@cogentembedded.com>; "Magnus Damm" <=
magnus.damm@gmail.com>; "Mauro Carvalho Chehab" <m.chehab@samsung.com>; "Ro=
b Herring" <robh+dt@kernel.org>; "Grant Likely" <grant.likely@linaro.org>; =
"Mark Rutland" <mark.rutland@arm.com>; "Ian Campbell" <ijc+devicetree@helli=
on.org.uk>; "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>; "Hans V=
erkuil" <hans.verkuil@cisco.com>; "Linux-sh list" <linux-sh@vger.kernel.org=
>; "Linux Media Mailing List" <linux-media@vger.kernel.org>; "devicetree@vg=
er.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] devicetree: bindings: Document Renesas JPEGProc=
essing Unit.

On Mon, Aug 25, 2014 at 02:59:46PM +0200, Geert Uytterhoeven wrote:
> Hi Mikhail,
>=20
> On Mon, Aug 25, 2014 at 2:35 PM, Mikhail Ulyanov
> <mikhail.ulyanov@cogentembedded.com> wrote:
> > +  - compatible: should containg one of the following:
> > +                       - "renesas,jpu-r8a7790" for R-Car H2
> > +                       - "renesas,jpu-r8a7791" for R-Car M2
> > +                       - "renesas,jpu-gen2" for R-Car second generatio=
n
>=20
> Isn't "renesas,jpu-gen2" meant as a fallback?
>=20
> I.e. the DTS should have one of '7790 and '7791, AND the gen2 fallback,
> so we can make the driver match against '7790 and '7791 is we find
> out about an incompatibility.

Is there a document that clearly states that there is such a thing
as jpu-gen2 in hardware? If not I would prefer not to add a binding for it.
--
To unsubscribe from this list: send the line "unsubscribe linux-media" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

--_971D57AF-294C-43A0-BCF7-8D07198398A3_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<HTML><HEAD>
<META content=3D"text/html; charset=3Dutf-8" http-equiv=3DContent-Type></HE=
AD>
<BODY>
<DIV>
<DIV style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-serif">Get me the =
fuck off this list!!! The unsubscribe email does not work!!!!!!</DIV></DIV>
<DIV dir=3Dltr>
<HR>
<SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-serif; FONT-WEIGH=
T: bold">From: </SPAN><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,=
sans-serif"><A href=3D"mailto:horms@verge.net.au">Simon Horman</A></SPAN><B=
R><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-serif; FONT-WEI=
GHT: bold">Sent: </SPAN><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibr=
i,sans-serif">=E2=80=8E8/=E2=80=8E25/=E2=80=8E2014 7:57 PM</SPAN><BR><SPAN =
style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-serif; FONT-WEIGHT: bol=
d">To: </SPAN><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-ser=
if"><A href=3D"mailto:geert@linux-m68k.org">Geert Uytterhoeven</A></SPAN><B=
R><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-serif; FONT-WEI=
GHT: bold">Cc: </SPAN><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,=
sans-serif"><A href=3D"mailto:mikhail.ulyanov@cogentembedded.com">Mikhail U=
lyanov</A>; <A href=3D"mailto:magnus.damm@gmail.com">Magnus Damm</A>; <A hr=
ef=3D"mailto:m.chehab@samsung.com">Mauro Carvalho Chehab</A>; <A href=3D"ma=
ilto:robh+dt@kernel.org">Rob Herring</A>; <A href=3D"mailto:grant.likely@li=
naro.org">Grant Likely</A>; <A href=3D"mailto:mark.rutland@arm.com">Mark Ru=
tland</A>; <A href=3D"mailto:ijc+devicetree@hellion.org.uk">Ian Campbell</A=
>; <A href=3D"mailto:laurent.pinchart@ideasonboard.com">Laurent Pinchart</A=
>; <A href=3D"mailto:hans.verkuil@cisco.com">Hans Verkuil</A>; <A href=3D"m=
ailto:linux-sh@vger.kernel.org">Linux-sh list</A>; <A href=3D"mailto:linux-=
media@vger.kernel.org">Linux Media Mailing List</A>; <A href=3D"mailto:devi=
cetree@vger.kernel.org">devicetree@vger.kernel.org</A></SPAN><BR><SPAN styl=
e=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-serif; FONT-WEIGHT: bold">S=
ubject: </SPAN><SPAN style=3D"FONT-SIZE: 11pt; FONT-FAMILY: Calibri,sans-se=
rif">Re: [PATCH v2 6/6] devicetree: bindings: Document Renesas JPEGProcessi=
ng Unit.</SPAN><BR><BR></DIV>On Mon, Aug 25, 2014 at 02:59:46PM +0200, Geer=
t Uytterhoeven wrote:<BR>&gt; Hi Mikhail,<BR>&gt; <BR>&gt; On Mon, Aug 25, =
2014 at 2:35 PM, Mikhail Ulyanov<BR>&gt; &lt;mikhail.ulyanov@cogentembedded=
.com&gt; wrote:<BR>&gt; &gt; +&nbsp; - compatible: should containg one of t=
he following:<BR>&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; - "renesas,jpu-r8a7790" for R-Car H2<BR>&gt; &gt; +&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - "renesas,jpu-r8a7791" for R-=
Car M2<BR>&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; - "renesas,jpu-gen2" for R-Car second generation<BR>&gt; <BR>&gt; Isn't=
 "renesas,jpu-gen2" meant as a fallback?<BR>&gt; <BR>&gt; I.e. the DTS shou=
ld have one of '7790 and '7791, AND the gen2 fallback,<BR>&gt; so we can ma=
ke the driver match against '7790 and '7791 is we find<BR>&gt; out about an=
 incompatibility.<BR><BR>Is there a document that clearly states that there=
 is such a thing<BR>as jpu-gen2 in hardware? If not I would prefer not to a=
dd a binding for it.<BR>--<BR>To unsubscribe from this list: send the line =
"unsubscribe linux-media" in<BR>the body of a message to majordomo@vger.ker=
nel.org<BR>More majordomo info at&nbsp; http://vger.kernel.org/majordomo-in=
fo.html<BR></BODY></HTML>=

--_971D57AF-294C-43A0-BCF7-8D07198398A3_--
