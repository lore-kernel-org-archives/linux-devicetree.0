Return-Path: <SRS0=Jl/7=PR=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20181224164755.286932-1-tmaimon77@gmail.com> <20181224164755.286932-2-tmaimon77@gmail.com>
 <20190103211447.GA4618@bogus>
In-Reply-To: <20190103211447.GA4618@bogus>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 9 Jan 2019 18:48:59 +0200
Message-ID: <CAP6Zq1g4=81zGF-1JNcK9xzJsZ5hfTAcYQK=xCkPR6sYw_jRKQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: iio: add NPCM ADC documentation
Content-Type: multipart/alternative; boundary="00000000000065478e057f0926cf"
To: Rob Herring <robh@kernel.org>
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, linux-iio@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--00000000000065478e057f0926cf
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 3 Jan 2019 at 23:14, Rob Herring <robh@kernel.org> wrote:

> On Mon, Dec 24, 2018 at 06:47:54PM +0200, Tomer Maimon wrote:
> > Added device tree binding documentation for Nuvoton BMC
> > NPCM Analog-to-Digital Converter(ADC).
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../bindings/iio/adc/nuvoton,npcm-adc.txt          | 35
> ++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> >
> > diff --git
> a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> > new file mode 100644
> > index 000000000000..6f0843d837cc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt
> > @@ -0,0 +1,35 @@
> > +Nuvoton NPCM Analog to Digital Converter (ADC)
> > +
> > +The NPCM ADC is a 10-bit converter for eight channel inputs.
> > +
> > +Required properties:
> > +- compatible : "nuvoton,npcm750-adc" for the NPCM7XX BMC.
> > +- reg                        : specifies physical base address and size
> of the registers.
> > +- interrupts : Contain the ADC interrupt with flags for falling edge.
> > +
> > +Optional properties:
> > +- clocks             : phandle of ADC reference clock, in case the
> clock is not
> > +                               added the ADC will use the default ADC
> sample rate.
> > +- vref-supply        : The regulator supply ADC reference voltage, in
> case the
> > +                               vref-supply is not added the ADC will
> use internal voltage
> > +                               reference.
> > +
> > +Required Node in the NPCM7xx BMC:
> > +An additional register is present in the NPCM7xx SOC which is
> > +assumed to be in the same device tree, with and marked as
> > +compatible with "nuvoton,npcm750-rst".
> > +
> > +Example:
> > +
> > +adc: adc@f000c000 {
> > +     compatible = "nuvoton,npcm750-adc";
> > +     reg = <0xf000c000 0x8>;
> > +     interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > +     clocks = <&clk NPCM7XX_CLK_ADC>;
> > +};
> > +
> > +rst: rst@f0801000 {
>
> Why is this node here?
>
example for the reset node that required when using NPCM7xx SOC.
(Required Node in the NPCM7xx BMC:
An additional register is present in the NPCM7xx SOC which is
assumed to be in the same device tree, with and marked as
compatible with "nuvoton,npcm750-rst")

>
> > +     compatible = "nuvoton,npcm750-rst", "syscon",
> > +     "simple-mfd";
> > +     reg = <0xf0801000 0x6C>;
> > +};
> > --
> > 2.14.1
> >
>

Thanks,

Tomer

--00000000000065478e057f0926cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div>Hi Rob,<div><br></div><div><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">On Thu, 3 Jan 2019 at 23:14, Rob Herrin=
g &lt;<a href=3D"mailto:robh@kernel.org">robh@kernel.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Dec 24, 201=
8 at 06:47:54PM +0200, Tomer Maimon wrote:<br>
&gt; Added device tree binding documentation for Nuvoton BMC<br>
&gt; NPCM Analog-to-Digital Converter(ADC).<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/iio/adc/nuvoton,npcm-adc.txt=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 35 ++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 35 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/iio/adc/nuv=
oton,npcm-adc.txt<br>
&gt; <br>
&gt; diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-ad=
c.txt b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..6f0843d837cc<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,npcm-adc.txt<b=
r>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +Nuvoton NPCM Analog to Digital Converter (ADC)<br>
&gt; +<br>
&gt; +The NPCM ADC is a 10-bit converter for eight channel inputs.<br>
&gt; +<br>
&gt; +Required properties:<br>
&gt; +- compatible : &quot;nuvoton,npcm750-adc&quot; for the NPCM7XX BMC.<b=
r>
&gt; +- reg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 : specifies physical base address and size of the regi=
sters.<br>
&gt; +- interrupts : Contain the ADC interrupt with flags for falling edge.=
<br>
&gt; +<br>
&gt; +Optional properties:<br>
&gt; +- clocks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: phandle of =
ADC reference clock, in case the clock is not<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0added the ADC will use the defaul=
t ADC sample rate.<br>
&gt; +- vref-supply=C2=A0 =C2=A0 =C2=A0 =C2=A0 : The regulator supply ADC r=
eference voltage, in case the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vref-supply is not added the ADC =
will use internal voltage<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reference.<br>
&gt; +<br>
&gt; +Required Node in the NPCM7xx BMC:<br>
&gt; +An additional register is present in the NPCM7xx SOC which is<br>
&gt; +assumed to be in the same device tree, with and marked as<br>
&gt; +compatible with &quot;nuvoton,npcm750-rst&quot;.<br>
&gt; +<br>
&gt; +Example:<br>
&gt; +<br>
&gt; +adc: adc@f000c000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-adc&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xf000c000 0x8&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH&=
gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;clk NPCM7XX_CLK_ADC&gt;;<br>
&gt; +};<br>
&gt; +<br>
&gt; +rst: rst@f0801000 {<br>
<br>
Why is this node here?<br></blockquote><div>example for the reset node that=
 required when using NPCM7xx SOC.</div><div>(Required Node in the NPCM7xx B=
MC:</div>An additional register is present in the NPCM7xx SOC which is<br>a=
ssumed to be in the same device tree, with and marked as<br>compatible with=
 &quot;nuvoton,npcm750-rst&quot;)<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-rst&quot;, &=
quot;syscon&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;simple-mfd&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xf0801000 0x6C&gt;;<br>
&gt; +};<br>
&gt; -- <br>
&gt; 2.14.1<br>
&gt; <br></blockquote><div><br></div><div>Thanks,</div><div><br></div><div>=
Tomer=C2=A0</div></div></div></div>

--00000000000065478e057f0926cf--
