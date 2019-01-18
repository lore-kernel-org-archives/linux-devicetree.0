Return-Path: <SRS0=bH4M=P2=gmail.com=tmaimon77@kernel.org>
MIME-Version: 1.0
References: <20190109164343.164205-1-tmaimon77@gmail.com> <20190109164343.164205-2-tmaimon77@gmail.com>
 <CACPK8XebHzVAO2TX25N24S0Pgg_0xA=7GN3j0oXhSyD4LmL4=w@mail.gmail.com>
In-Reply-To: <CACPK8XebHzVAO2TX25N24S0Pgg_0xA=7GN3j0oXhSyD4LmL4=w@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 18 Jan 2019 17:18:43 +0200
Message-ID: <CAP6Zq1j=oPdVXZKBteBcaLVZcvoU7M6YbfGhSCaC44Ld9AQ9Ag@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-binding: iio: add NPCM ADC documentation
Content-Type: multipart/alternative; boundary="00000000000049a21e057fbcf02a"
To: Joel Stanley <joel@jms.id.au>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, Avi Fishman <avifishman70@gmail.com>, linux-iio@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--00000000000049a21e057fbcf02a
Content-Type: text/plain; charset="UTF-8"

Hi Joel,

Thanks for bringing this to my attention,

I think I will leave it the same way it is now because I will like to
develop the reset driver and to handle the NPCM7xx SOC resets.

Cheers,

Tomer



On Wed, 16 Jan 2019 at 01:21, Joel Stanley <joel@jms.id.au> wrote:

> On Thu, 10 Jan 2019 at 03:44, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> > +Required Node in the NPCM7xx BMC:
> > +An additional register is present in the NPCM7xx SOC which is
> > +assumed to be in the same device tree, with and marked as
> > +compatible with "nuvoton,npcm750-rst".
>
> Is there a reason you don't include a phandle to the reset node?
>
> I think doing that would make more sense.
>
> > +adc: adc@f000c000 {
> > +       compatible = "nuvoton,npcm750-adc";
> > +       reg = <0xf000c000 0x8>;
> > +       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> > +       clocks = <&clk NPCM7XX_CLK_ADC>;
> > +};
>
> > +
> > +rst: rst@f0801000 {
> > +       compatible = "nuvoton,npcm750-rst", "syscon",
> > +       "simple-mfd";
> > +       reg = <0xf0801000 0x6C>;
> > +};
>

--00000000000049a21e057fbcf02a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Joel,<div><br></div><div>Thanks for bringing this to my=
 attention,</div><div><br></div><div>I think I will leave it the same way i=
t is now because I will like to develop the reset driver and to handle the =
NPCM7xx SOC resets.</div><div><br></div><div>Cheers,</div><div><br></div><d=
iv>Tomer</div><div><br></div><div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr">On Wed, 16 Jan 2019 at 01:21, Joel Stanley &lt;<a hr=
ef=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Thu, 10 Jan 2019 at 03:44, To=
mer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=3D"_blank">tma=
imon77@gmail.com</a>&gt; wrote:<br>
<br>
&gt; +Required Node in the NPCM7xx BMC:<br>
&gt; +An additional register is present in the NPCM7xx SOC which is<br>
&gt; +assumed to be in the same device tree, with and marked as<br>
&gt; +compatible with &quot;nuvoton,npcm750-rst&quot;.<br>
<br>
Is there a reason you don&#39;t include a phandle to the reset node?<br>
<br>
I think doing that would make more sense.<br>
<br>
&gt; +adc: adc@f000c000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-adc&q=
uot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xf000c000 0x8&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;GIC_SPI 0 IRQ_TYPE_LEVE=
L_HIGH&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;clk NPCM7XX_CLK_ADC&gt=
;;<br>
&gt; +};<br>
<br>
&gt; +<br>
&gt; +rst: rst@f0801000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;nuvoton,npcm750-rst&q=
uot;, &quot;syscon&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;simple-mfd&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0xf0801000 0x6C&gt;;<br>
&gt; +};<br>
</blockquote></div>

--00000000000049a21e057fbcf02a--
