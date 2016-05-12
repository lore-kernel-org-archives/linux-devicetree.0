Return-Path: <jon.mason@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <57341FCE.6050403@huawei.com>
References: <1463007369-13071-1-git-send-email-jonmason@broadcom.com>
	<57341FCE.6050403@huawei.com>
Date: Thu, 12 May 2016 10:46:56 -0400
Message-ID: <CAC3K-4qbkt3DCgd6qurNo3V+++x70bbFC--aunR0DbCTBvBNZg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: NS2: Add all of the UARTs
From: Jon Mason <jon.mason@broadcom.com>
Content-Type: multipart/alternative; boundary=047d7b41463ccfb51b0532a63a04
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--047d7b41463ccfb51b0532a63a04
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 2:16 AM, Kefeng Wang <wangkefeng.wang@huawei.com>
wrote:

>
>
> On 2016/5/12 6:56, Jon Mason wrote:
> > Add all of the UARTs present on NS2 and enable them in the SVK device
> > tree file.  Also, do some magic to make sure that uart3 is discovered as
> > ttyS0 (as that is the console UART).
> >
> > Signed-off-by: Jon Mason <jonmason@broadcom.com>
> > ---
> >  arch/arm64/boot/dts/broadcom/ns2-svk.dts | 16 ++++++++++++++++
> >  arch/arm64/boot/dts/broadcom/ns2.dtsi    | 30
> ++++++++++++++++++++++++++++++
> >  2 files changed, 46 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> > index 7cd3640..b062a44 100644
> > --- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> > +++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
> > @@ -40,10 +40,14 @@
> >
> >       aliases {
> >               serial0 = &uart3;
> > +             serial1 = &uart0;
> > +             serial2 = &uart1;
> > +             serial3 = &uart2;
> >       };
> >
> >       chosen {
> >               stdout-path = "serial0:115200n8";
> > +             bootargs = "earlycon=uart8250,mmio32,0x66130000";
>
> Hi Jon,
>
> I submit a patch[1], with it, we can use earlycon without option to enable
> early console
> for "snps,dw-apb-uart", could you help me to test it, thanks.
>

Adding your change and removing the line above does not cause earlycon to
work for me.  Is there any additional changes necessary for this to work?

Thanks,
Jon


>
> BRs,
> Kefeng
>
>
> [1] https://lkml.org/lkml/2016/5/11/34
>
> >       };
> >
> >       memory {
> > @@ -68,6 +72,18 @@
> >       status = "ok";
> >  };
> >
> > +&uart0 {
> > +     status = "ok";
> > +};
> > +
> > +&uart1 {
> > +     status = "ok";
> > +};
> > +
> > +&uart2 {
> > +     status = "ok";
> > +};
> > +
> >  &uart3 {
> >       status = "ok";
> >  };
> > diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi
> b/arch/arm64/boot/dts/broadcom/ns2.dtsi
> > index 788ed8f..c77a9e8 100644
> > --- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
> > +++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
> > @@ -357,6 +357,36 @@
> >                       status = "disabled";
> >               };
> >
> > +             uart0: serial@66100000 {
> > +                     compatible = "snps,dw-apb-uart";
> > +                     reg = <0x66100000 0x100>;
> > +                     interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&iprocslow>;
> > +                     reg-shift = <2>;
> > +                     reg-io-width = <4>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             uart1: serial@66110000 {
> > +                     compatible = "snps,dw-apb-uart";
> > +                     reg = <0x66110000 0x100>;
> > +                     interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&iprocslow>;
> > +                     reg-shift = <2>;
> > +                     reg-io-width = <4>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             uart2: serial@66120000 {
> > +                     compatible = "snps,dw-apb-uart";
> > +                     reg = <0x66120000 0x100>;
> > +                     interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&iprocslow>;
> > +                     reg-shift = <2>;
> > +                     reg-io-width = <4>;
> > +                     status = "disabled";
> > +             };
> > +
> >               uart3: serial@66130000 {
> >                       compatible = "snps,dw-apb-uart";
> >                       reg = <0x66130000 0x100>;
> >
>
>

--047d7b41463ccfb51b0532a63a04
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 12, 2016 at 2:16 AM, Kefeng Wang <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:wangkefeng.wang@huawei.com" target=3D"_blank">wangkefeng.wang=
@huawei.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D""><br>
<br>
On 2016/5/12 6:56, Jon Mason wrote:<br>
&gt; Add all of the UARTs present on NS2 and enable them in the SVK device<=
br>
&gt; tree file.=C2=A0 Also, do some magic to make sure that uart3 is discov=
ered as<br>
&gt; ttyS0 (as that is the console UART).<br>
&gt;<br>
&gt; Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jonmason@broadcom.com">=
jonmason@broadcom.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 16 ++++++++++++++++<b=
r>
&gt;=C2=A0 arch/arm64/boot/dts/broadcom/ns2.dtsi=C2=A0 =C2=A0 | 30 ++++++++=
++++++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 46 insertions(+)<br>
&gt;<br>
&gt; diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boo=
t/dts/broadcom/ns2-svk.dts<br>
&gt; index 7cd3640..b062a44 100644<br>
&gt; --- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts<br>
&gt; +++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts<br>
&gt; @@ -40,10 +40,14 @@<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0aliases {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial0 =3D &amp=
;uart3;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial1 =3D &amp;uart=
0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial2 =3D &amp;uart=
1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0serial3 =3D &amp;uart=
2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0chosen {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stdout-path =3D =
&quot;serial0:115200n8&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootargs =3D &quot;ea=
rlycon=3Duart8250,mmio32,0x66130000&quot;;<br>
<br>
</span>Hi Jon,<br>
<br>
I submit a patch[1], with it, we can use earlycon without option to enable =
early console<br>
for &quot;snps,dw-apb-uart&quot;, could you help me to test it, thanks.<br>=
</blockquote><div><br></div><div>Adding your change and removing the line a=
bove does not cause earlycon to work for me.=C2=A0 Is there any additional =
changes necessary for this to work?</div><div><br></div><div>Thanks,</div><=
div>Jon</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
BRs,<br>
Kefeng<br>
<br>
<br>
[1] <a href=3D"https://lkml.org/lkml/2016/5/11/34" rel=3D"noreferrer" targe=
t=3D"_blank">https://lkml.org/lkml/2016/5/11/34</a><br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memory {<br>
&gt; @@ -68,6 +72,18 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;ok&quot;;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +&amp;uart0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;ok&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;uart1 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;ok&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +&amp;uart2 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status =3D &quot;ok&quot;;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 &amp;uart3 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;ok&quot;;<br>
&gt;=C2=A0 };<br>
&gt; diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/d=
ts/broadcom/ns2.dtsi<br>
&gt; index 788ed8f..c77a9e8 100644<br>
&gt; --- a/arch/arm64/boot/dts/broadcom/ns2.dtsi<br>
&gt; +++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi<br>
&gt; @@ -357,6 +357,36 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uart0: serial@6610000=
0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;snps,dw-apb-uart&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg =3D &lt;0x66100000 0x100&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0interrupts =3D &lt;GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0clocks =3D &lt;&amp;iprocslow&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg-shift =3D &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg-io-width =3D &lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uart1: serial@6611000=
0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;snps,dw-apb-uart&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg =3D &lt;0x66110000 0x100&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0interrupts =3D &lt;GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0clocks =3D &lt;&amp;iprocslow&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg-shift =3D &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg-io-width =3D &lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uart2: serial@6612000=
0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;snps,dw-apb-uart&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg =3D &lt;0x66120000 0x100&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0interrupts =3D &lt;GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0clocks =3D &lt;&amp;iprocslow&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg-shift =3D &lt;2&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg-io-width =3D &lt;4&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0status =3D &quot;disabled&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uart3: serial@66=
130000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0compatible =3D &quot;snps,dw-apb-uart&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0reg =3D &lt;0x66130000 0x100&gt;;<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div></div>

--047d7b41463ccfb51b0532a63a04--
