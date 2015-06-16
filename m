Return-Path: <me@kylehuey.com>
MIME-Version: 1.0
In-Reply-To: <20150616091619.GA17817@leverpostej>
References: <1434393968-1105-1-git-send-email-khuey@kylehuey.com>
	<20150616091619.GA17817@leverpostej>
Date: Tue, 16 Jun 2015 14:29:51 -0700
Message-ID: <CAP045ArZzj3Bda7J97VgZ10Xo79MwYGUs3=L5Qb9e-pRWiusSw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: tegra124: pmu support
From: Kyle Huey <me@kylehuey.com>
Content-Type: multipart/alternative; boundary=047d7bd75ba24663900518a94610
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Kyle Huey <khuey@kylehuey.com>
List-ID: <devicetree@vger.kernel.org>

--047d7bd75ba24663900518a94610
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 16, 2015 at 2:16 AM, Mark Rutland <mark.rutland@arm.com> wrote:

> On Mon, Jun 15, 2015 at 07:46:08PM +0100, Kyle Huey wrote:
> > This patch modifies the device tree for tegra124 based devices to enable
> the Cortex A15 PMU.  The interrupt numbers are taken from NVIDIA TRM
> DP-06905-001_v03p.  This patch was tested on a Jetson TK1.
> >
> > Signed-off-by: Kyle Huey <khuey@kylehuey.com>
> > ---
> >  arch/arm/boot/dts/tegra124.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/tegra124.dtsi
> b/arch/arm/boot/dts/tegra124.dtsi
> > index 4be06c6..d966d4e 100644
> > --- a/arch/arm/boot/dts/tegra124.dtsi
> > +++ b/arch/arm/boot/dts/tegra124.dtsi
> > @@ -906,16 +906,24 @@
> >
> >               cpu@3 {
> >                       device_type = "cpu";
> >                       compatible = "arm,cortex-a15";
> >                       reg = <3>;
> >               };
> >       };
> >
> > +     pmu {
> > +             compatible = "arm,cortex-a15-pmu";
> > +             interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> > +     };
>
> As these are SPIs, you should fill in the interrupt-affinity property
> (see Documentation/devicetree/bindings/arm/pmu.txt). That'll avoid
> potential problems with CPU renumbering, and prevent the kernel from
> complaining at boot time.
>
> Otherwise, this looks fine.
>
> Thanks,
> Mark.
>

Thanks for the review.  I just sent a v3 with this addressed.

- Kyle

--047d7bd75ba24663900518a94610
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Jun 16, 2015 at 2:16 AM, Mark Rutland <span dir=3D"ltr">&lt;<a href=3D"=
mailto:mark.rutland@arm.com" target=3D"_blank">mark.rutland@arm.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, J=
un 15, 2015 at 07:46:08PM +0100, Kyle Huey wrote:<br>
&gt; This patch modifies the device tree for tegra124 based devices to enab=
le the Cortex A15 PMU.=C2=A0 The interrupt numbers are taken from NVIDIA TR=
M DP-06905-001_v03p.=C2=A0 This patch was tested on a Jetson TK1.<br>
&gt;<br>
&gt; Signed-off-by: Kyle Huey &lt;<a href=3D"mailto:khuey@kylehuey.com">khu=
ey@kylehuey.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm/boot/dts/tegra124.dtsi | 8 ++++++++<br>
&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra=
124.dtsi<br>
&gt; index 4be06c6..d966d4e 100644<br>
&gt; --- a/arch/arm/boot/dts/tegra124.dtsi<br>
&gt; +++ b/arch/arm/boot/dts/tegra124.dtsi<br>
&gt; @@ -906,16 +906,24 @@<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu@3 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0device_type =3D &quot;cpu&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0compatible =3D &quot;arm,cortex-a15&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0reg =3D &lt;3&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pmu {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;=
arm,cortex-a15-pmu&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GI=
C_SPI 144 IRQ_TYPE_LEVEL_HIGH&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &lt;GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &lt;GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH&gt;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &lt;GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
<br>
</span>As these are SPIs, you should fill in the interrupt-affinity propert=
y<br>
(see Documentation/devicetree/bindings/arm/pmu.txt). That&#39;ll avoid<br>
potential problems with CPU renumbering, and prevent the kernel from<br>
complaining at boot time.<br>
<br>
Otherwise, this looks fine.<br>
<br>
Thanks,<br>
Mark.<br></blockquote><div><br></div><div>Thanks for the review.=C2=A0 I ju=
st sent a v3 with this addressed.<br><br></div><div>- Kyle <br></div></div>=
<br></div></div>

--047d7bd75ba24663900518a94610--
