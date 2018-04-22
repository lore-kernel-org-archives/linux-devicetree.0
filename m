Return-Path: <SRS0=1SUd=HL=solid-run.com=jon@kernel.org>
MIME-Version: 1.0
References: <20180422142151.17910-1-contact@paulk.fr> <20180422143911.GB16141@n2100.armlinux.org.uk>
In-Reply-To: <20180422143911.GB16141@n2100.armlinux.org.uk>
From: Jon Nettleton <jon@solid-run.com>
Date: Sun, 22 Apr 2018 15:02:17 +0000
Message-ID: <CABdtJHuE05ea1EPSR916vSEz6gtCirLF77c_PW2N2ofGnzN-bw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-cubox-i: Move card-detect GPIO to 1.5
 SOM devices only
Content-Type: multipart/alternative; boundary="000000000000a91109056a7135be"
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Paul Kocialkowski <contact@paulk.fr>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000a91109056a7135be
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 22, 2018 at 4:39 PM Russell King - ARM Linux <
linux@armlinux.org.uk> wrote:

> On Sun, Apr 22, 2018 at 04:21:51PM +0200, Paul Kocialkowski wrote:
> > The Solid-Run CuBox-i lower board used in the first generation of
> > CuBox-i devices feature a hinged micro SD card slot, that does not have
> > card-detect capability. Since the card-detect GPIO was specified in the
> > common cubox-i dtsi, it is moved to each device using the 1.5 SOM and is
> > thus removed from the imx6q-cubox-i dts.
>
> This seems incorrect.
>
> The 1.5 SOM is a relatively recent thing, and I have one of the first
> Cubox-i's that were produced which is not hinged, and does not have a
> 1.5 SOM.  There is _no_ correlation between the 1.5 SOM and the SD
> card slot.
>
> Talking to folk at SolidRun, we're all confused about your assertions.
>
> We're also confused about "hinged micro SD card slot" - Cubox-i's
> come with either a push-push slot or a static (push-in, pull-out) slot.
> (Prototypes were the latter.)
>
> Maybe someone's modified yours?
>
>
>
Regardless of the physical mechanics of the device, the CD-GPIO is a
mechanism of the carrier and not the SOM. I have one of the few Cubox-i's
that have been physically modified to work with the rev 1.5 som and have no
issues (the heat spreader needs additional cutouts).  Now if you are still
using the old 2013 u-boot then there is possibly confusion between the eMMC
and SDHC slots which can cause strangeness.  Please use the 2018.01 branch
on our github and that will handle this properly.

This is not a device-tree nor kernel issue, so NAK.

-Jon

--000000000000a91109056a7135be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Sun, Apr 22=
, 2018 at 4:39 PM Russell King - ARM Linux &lt;<a href=3D"mailto:linux@arml=
inux.org.uk">linux@armlinux.org.uk</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On Sun, Apr 22, 2018 at 04:21:51PM +0200, Paul Kocialkowski =
wrote:<br>
&gt; The Solid-Run CuBox-i lower board used in the first generation of<br>
&gt; CuBox-i devices feature a hinged micro SD card slot, that does not hav=
e<br>
&gt; card-detect capability. Since the card-detect GPIO was specified in th=
e<br>
&gt; common cubox-i dtsi, it is moved to each device using the 1.5 SOM and =
is<br>
&gt; thus removed from the imx6q-cubox-i dts.<br>
<br>
This seems incorrect.<br>
<br>
The 1.5 SOM is a relatively recent thing, and I have one of the first<br>
Cubox-i&#39;s that were produced which is not hinged, and does not have a<b=
r>
1.5 SOM.=C2=A0 There is _no_ correlation between the 1.5 SOM and the SD<br>
card slot.<br>
<br>
Talking to folk at SolidRun, we&#39;re all confused about your assertions.<=
br>
<br>
We&#39;re also confused about &quot;hinged micro SD card slot&quot; - Cubox=
-i&#39;s<br>
come with either a push-push slot or a static (push-in, pull-out) slot.<br>
(Prototypes were the latter.)<br>
<br>
Maybe someone&#39;s modified yours?<br>
<br><br></blockquote><div><br></div><div>Regardless of the physical mechani=
cs of the device, the CD-GPIO is a mechanism of the carrier and not the SOM=
. I have one of the few Cubox-i&#39;s that have been physically modified to=
 work with the rev 1.5 som and have no issues (the heat spreader needs addi=
tional cutouts).=C2=A0 Now if you are still using the old 2013 u-boot then =
there is possibly confusion between the eMMC and SDHC slots which can cause=
 strangeness.=C2=A0 Please use the 2018.01 branch on our github and that wi=
ll handle this properly.</div><div><br></div><div>This is not a device-tree=
 nor kernel issue, so NAK.</div><div><br></div><div>-Jon</div></div></div>

--000000000000a91109056a7135be--
