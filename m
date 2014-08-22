Return-Path: <f.fainelli@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5a7b6f57-b6c0-4fb3-af0d-d403277c0207@BN1AFFO11FD045.protection.gbl>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
 <1408550219-19825-3-git-send-email-soren.brinkmann@xilinx.com> <5a7b6f57-b6c0-4fb3-af0d-d403277c0207@BN1AFFO11FD045.protection.gbl>
From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 22 Aug 2014 13:42:05 -0700
Message-ID: <CAGVrzcYBXNi+=Px3HVw9rVPF-PGApOU_tYiXWu1hbjJnqhAi4g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: zynq: DT: Add Ethernet phys
Content-Type: multipart/alternative; boundary=089e013cbb8a2bb2cf05013de152
To: Michal Simek <michal.simek@xilinx.com>
Cc: Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Soren Brinkmann <soren.brinkmann@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--089e013cbb8a2bb2cf05013de152
Content-Type: text/plain; charset=UTF-8

On Aug 21, 2014 3:42 AM, "Michal Simek" <michal.simek@xilinx.com> wrote:
>
> On 08/20/2014 05:56 PM, Soren Brinkmann wrote:
> > Add missing Ethernet phys to Zynq DTs.
> >
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> >  arch/arm/boot/dts/zynq-zc702.dts | 6 ++++++
> >  arch/arm/boot/dts/zynq-zc706.dts | 6 ++++++
> >  arch/arm/boot/dts/zynq-zed.dts   | 6 ++++++
> >  3 files changed, 18 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/zynq-zc702.dts
b/arch/arm/boot/dts/zynq-zc702.dts
> > index 30bcfe20f0bc..fa810505ab8f 100644
> > --- a/arch/arm/boot/dts/zynq-zc702.dts
> > +++ b/arch/arm/boot/dts/zynq-zc702.dts
> > @@ -36,6 +36,12 @@
> >  &gem0 {
> >       status = "okay";
> >       phy-mode = "rgmii-id";
> > +     phy-handle = <&ethernet_phy>;
> > +
> > +     ethernet_phy: ethernet-phy@7 {
> > +             compatible = "marvell,88e1116r",
"ethernet-phy-ieee802.3-c22";
>
> c22 is completely unused by the kernel and also c22 is default option
anyway.

Which does not preclude you from following the binding defined in phy.txt,
and that binding mandates a valid compatible property.

> Any advantage to have c22 specified here?

We need to differentiate a clause 22 only PHY from a clause 45 compatible
PHY.

Soren's changes are good and are the recommended way to do it.

>
> Thanks,
> Michal
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

--089e013cbb8a2bb2cf05013de152
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p dir=3D"ltr">On Aug 21, 2014 3:42 AM, &quot;Michal Simek=
&quot; &lt;<a href=3D"mailto:michal.simek@xilinx.com" target=3D"_blank">mic=
hal.simek@xilinx.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 08/20/2014 05:56 PM, Soren Brinkmann wrote:<br>
&gt; &gt; Add missing Ethernet phys to Zynq DTs.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Soren Brinkmann &lt;<a href=3D"mailto:soren.brinkm=
ann@xilinx.com" target=3D"_blank">soren.brinkmann@xilinx.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 arch/arm/boot/dts/zynq-zc702.dts | 6 ++++++<br>
&gt; &gt;=C2=A0 arch/arm/boot/dts/zynq-zc706.dts | 6 ++++++<br>
&gt; &gt;=C2=A0 arch/arm/boot/dts/zynq-zed.dts=C2=A0 =C2=A0| 6 ++++++<br>
&gt; &gt;=C2=A0 3 files changed, 18 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts=
/zynq-zc702.dts<br>
&gt; &gt; index 30bcfe20f0bc..fa810505ab8f 100644<br>
&gt; &gt; --- a/arch/arm/boot/dts/zynq-zc702.dts<br>
&gt; &gt; +++ b/arch/arm/boot/dts/zynq-zc702.dts<br>
&gt; &gt; @@ -36,6 +36,12 @@<br>
&gt; &gt;=C2=A0 &amp;gem0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0phy-mode =3D &quot;rgmii-id&quot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0phy-handle =3D &lt;&amp;ethernet_phy&gt;;<br=
>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ethernet_phy: ethernet-phy@7 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &=
quot;marvell,88e1116r&quot;, &quot;ethernet-phy-ieee802.3-c22&quot;;<br>
&gt;<br>
&gt; c22 is completely unused by the kernel and also c22 is default option =
anyway.</p>
<p dir=3D"ltr">Which does not preclude you from following the binding defin=
ed in phy.txt, and that binding mandates a valid compatible property.<br></=
p>
<p dir=3D"ltr">&gt; Any advantage to have c22 specified here?</p>
<p dir=3D"ltr">We need to differentiate a clause 22 only PHY from a clause =
45 compatible PHY.</p>
<p dir=3D"ltr">Soren&#39;s changes are good and are the recommended way to =
do it.</p>
<p dir=3D"ltr">&gt;<br>
&gt; Thanks,<br>
&gt; Michal<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; linux-arm-kernel mailing list<br>
&gt; <a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"_bla=
nk">linux-arm-kernel@lists.infradead.org</a><br>
&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kerne=
l" target=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-=
kernel</a><br>
&gt;</p>
</div>

--089e013cbb8a2bb2cf05013de152--
