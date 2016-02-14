Return-Path: <sergio.prado@e-labworks.com>
MIME-Version: 1.0
In-Reply-To: <20160212151620.GA25399@rob-hp-laptop>
References: <1455026836-12908-1-git-send-email-sergio.prado@e-labworks.com> <20160212151620.GA25399@rob-hp-laptop>
From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 14 Feb 2016 13:24:15 -0200
Message-ID: <CANu7NGvGsDmxb8SoH0FXCYQL9mTL2bN_DQaeD2veKXmMwxzmpA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: macb: add wake-on-lan support via magic packet
Content-Type: multipart/alternative; boundary=001a11428d3e662e0f052bbc7fe3
To: Rob Herring <robh@kernel.org>
Cc: pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, nicolas.ferre@atmel.com, davem@davemloft.net, gregory.clement@free-electrons.com, narmstrong@baylibre.com, michal.simek@xilinx.com, harini.katakam@xilinx.com, boris.brezillon@free-electrons.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--001a11428d3e662e0f052bbc7fe3
Content-Type: text/plain; charset=UTF-8

2016-02-12 13:16 GMT-02:00 Rob Herring <robh@kernel.org>:
>
> On Tue, Feb 09, 2016 at 12:07:16PM -0200, Sergio Prado wrote:
> > Tested on Acqua A5 SoM (http://www.acmesystems.it/acqua).
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> > ---
> >  Documentation/devicetree/bindings/net/macb.txt |  2 +
> >  drivers/net/ethernet/cadence/macb.c            | 67
+++++++++++++++++++++++---
> >  drivers/net/ethernet/cadence/macb.h            |  4 ++
> >  3 files changed, 67 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/macb.txt
b/Documentation/devicetree/bindings/net/macb.txt
> > index d2e243b1ec0e..c6b1cb5ffa87 100644
> > --- a/Documentation/devicetree/bindings/net/macb.txt
> > +++ b/Documentation/devicetree/bindings/net/macb.txt
> > @@ -25,6 +25,8 @@ Required properties:
> >
> >  Optional properties for PHY child node:
> >  - reset-gpios : Should specify the gpio for phy reset
> > +- cdns,magic-packet : If present, indicates that the hardware supports
waking
> > +  up via magic packet.
>
> Already have one vendor property like this (fsl). Make this a generic
> property.

Looks like David Miller already accepted the patch, so I will prepare
another one on top of it.

Thanks,

>
>
> Rob

--001a11428d3e662e0f052bbc7fe3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">2016-02-12 13:16 GMT-02:00 Rob Herring &lt;<a href=3D"mail=
to:robh@kernel.org">robh@kernel.org</a>&gt;:<br>&gt;<br>&gt; On Tue, Feb 09=
, 2016 at 12:07:16PM -0200, Sergio Prado wrote:<br>&gt; &gt; Tested on Acqu=
a A5 SoM (<a href=3D"http://www.acmesystems.it/acqua">http://www.acmesystem=
s.it/acqua</a>).<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Sergio Prado &lt;=
<a href=3D"mailto:sergio.prado@e-labworks.com">sergio.prado@e-labworks.com<=
/a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0Documentation/devicetree/bindin=
gs/net/macb.txt | =C2=A02 +<br>&gt; &gt; =C2=A0drivers/net/ethernet/cadence=
/macb.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 67 +++++++++++++++++++++=
++---<br>&gt; &gt; =C2=A0drivers/net/ethernet/cadence/macb.h =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 ++<br>&gt; &gt; =C2=A03 files changed,=
 67 insertions(+), 6 deletions(-)<br>&gt; &gt;<br>&gt; &gt; diff --git a/Do=
cumentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bin=
dings/net/macb.txt<br>&gt; &gt; index d2e243b1ec0e..c6b1cb5ffa87 100644<br>=
&gt; &gt; --- a/Documentation/devicetree/bindings/net/macb.txt<br>&gt; &gt;=
 +++ b/Documentation/devicetree/bindings/net/macb.txt<br>&gt; &gt; @@ -25,6=
 +25,8 @@ Required properties:<br>&gt; &gt;<br>&gt; &gt; =C2=A0Optional pro=
perties for PHY child node:<br>&gt; &gt; =C2=A0- reset-gpios : Should speci=
fy the gpio for phy reset<br>&gt; &gt; +- cdns,magic-packet : If present, i=
ndicates that the hardware supports waking<br>&gt; &gt; + =C2=A0up via magi=
c packet.<br>&gt;<br>&gt; Already have one vendor property like this (fsl).=
 Make this a generic<br>&gt; property.<div><br></div><div>Looks like David =
Miller already accepted the patch, so I will prepare another one on top of =
it.</div><div><br></div><div>Thanks,</div><div>=C2=A0</div><div>&gt;<br>&gt=
;<br>&gt; Rob</div></div>

--001a11428d3e662e0f052bbc7fe3--
