Return-Path: <SRS0=r956=TB=collins.com=adam.michaelis@kernel.org>
MIME-Version: 1.0
References: <CALMrGWVQbtNcmAP1npqRZ2REqVyWmxYNHG_64PnTOLsEf45fow@mail.gmail.com>
In-Reply-To: <CALMrGWVQbtNcmAP1npqRZ2REqVyWmxYNHG_64PnTOLsEf45fow@mail.gmail.com>
From: Adam Michaelis <adam.michaelis@collins.com>
Date: Wed, 1 May 2019 14:16:04 -0500
Message-ID: <CALMrGWUEKHwGMpkjsSXtiOnLmigyvoEfmiFqCdXDDqT2Ng6wtA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: iio: ad7949: Add adi,reference-select
Content-Type: multipart/alternative; boundary="000000000000f3b7530587d859fd"
To: lars@metafoo.de, michael.hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, charles-antoine.couret@essensium.com, devicetree@vger.kernel.org
Cc: Brandon Maier <brandon.maier@rockwellcollins.com>, Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
List-ID: <devicetree@vger.kernel.org>

--000000000000f3b7530587d859fd
Content-Type: text/plain; charset="UTF-8"

Forgot the device tree groups.

On Wed, May 1, 2019 at 2:12 PM Adam Michaelis <
adam.michaelis@rockwellcollins.com> wrote:

> From d228a1a119e33aff91f481fb8ab301a027b5a4ac Mon Sep 17 00:00:00 2001
> From: Adam Michaelis <adam.michaelis@rockwellcollins.com>
> Date: Thu, 25 Apr 2019 15:22:00 -0500
> Subject: [PATCH 2/6] dt-bindings: iio: ad7949: Add adi,reference-select
>
> Adding optional parameter to AD7949 to specify the source for the
> reference voltage signal. Default value is maintaned with option '6' to
> match previous version of driver.
>
> Signed-off-by: Adam Michaelis <adam.michaelis@rockwellcollins.com>
> ---
>  .../devicetree/bindings/iio/adc/ad7949.txt         | 22
> ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/ad7949.txt
> b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
> index c7f5057356b1..14ee9a2cb2a5 100644
> --- a/Documentation/devicetree/bindings/iio/adc/ad7949.txt
> +++ b/Documentation/devicetree/bindings/iio/adc/ad7949.txt
> @@ -6,11 +6,29 @@ Required properties:
>   * "adi,ad7682"
>   * "adi,ad7689"
>   - reg: spi chip select number for the device
> - - vref-supply: The regulator supply for ADC reference voltage
>
> -Example:
> +Optional properties:
> + - adi,reference-select: Select the reference voltage source to use
> + when converting the input voltages. Valid values are:
> +   0: Internal 2.5V reference; temperature sensor enabled
> +   1: Internal 4.096V reference; temperature sensor enabled
> +   2: External reference, temperature sensor enabled, no buffer
> +   3: External reference, temperature sensor enabled, buffer enabled
> +   6: External reference, temperature sensor disabled, no buffer
> +   7: External reference, temperature sensor disabled, buffer enabled
> + - vref-supply: The regulator supply for ADC reference voltage. Required
> + if external reference selected by 'adi,reference-select'.
> +
> +Examples:
>  adc@0 {
>   compatible = "adi,ad7949";
>   reg = <0>;
> + adi,reference-select = <2>;
>   vref-supply = <&vdd_supply>;
>  };
> +
> +adc@0 {
> + compatible = "adi,ad7949";
> + reg = <0>;
> + adi,reference-select = <0>;
> +};
> --
> 1.9.1
>
>

-- 

*Adam Michaelis *| Sr Software Engineer | Comm Engineering | Mission Systems

*COLLINS AEROSPACE*

400 Collins Road, Cedar Rapids, IA 52498 U.S.A.

*Tel:* +1 319 295 4102

*adam.michaelis@collins.com <adam.michaelis@collins.com>* |
*collinsaerospace.com
<http://collinsaerospace.com>*



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated companies.
If you are not the intended recipient, please 1) Do not disclose, copy,
distribute or use this message or its contents. 2) Advise the sender by
return email. 3) Delete all copies (including all attachments) from your
computer. Your cooperation is greatly appreciated.

--000000000000f3b7530587d859fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Forgot the device tree groups.</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 1, 2019 at 2:12 =
PM Adam Michaelis &lt;<a href=3D"mailto:adam.michaelis@rockwellcollins.com"=
>adam.michaelis@rockwellcollins.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>F=
rom d228a1a119e33aff91f481fb8ab301a027b5a4ac Mon Sep 17 00:00:00 2001</div>=
<div>From: Adam Michaelis &lt;<a href=3D"mailto:adam.michaelis@rockwellcoll=
ins.com" target=3D"_blank">adam.michaelis@rockwellcollins.com</a>&gt;</div>=
<div>Date: Thu, 25 Apr 2019 15:22:00 -0500</div><div>Subject: [PATCH 2/6] d=
t-bindings: iio: ad7949: Add adi,reference-select</div><div><br></div><div>=
Adding optional parameter to AD7949 to specify the source for the</div><div=
>reference voltage signal. Default value is maintaned with option &#39;6&#3=
9; to</div><div>match previous version of driver.</div><div><br></div><div>=
Signed-off-by: Adam Michaelis &lt;<a href=3D"mailto:adam.michaelis@rockwell=
collins.com" target=3D"_blank">adam.michaelis@rockwellcollins.com</a>&gt;</=
div><div>---</div><div>=C2=A0.../devicetree/bindings/iio/adc/ad7949.txt=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 ++++++++++++++++++++--</div><div>=C2=A0=
1 file changed, 20 insertions(+), 2 deletions(-)</div><div><br></div><div>d=
iff --git a/Documentation/devicetree/bindings/iio/adc/ad7949.txt b/Document=
ation/devicetree/bindings/iio/adc/ad7949.txt</div><div>index c7f5057356b1..=
14ee9a2cb2a5 100644</div><div>--- a/Documentation/devicetree/bindings/iio/a=
dc/ad7949.txt</div><div>+++ b/Documentation/devicetree/bindings/iio/adc/ad7=
949.txt</div><div>@@ -6,11 +6,29 @@ Required properties:</div><div>=C2=A0<s=
pan style=3D"white-space:pre-wrap">	</span>* &quot;adi,ad7682&quot;</div><d=
iv>=C2=A0<span style=3D"white-space:pre-wrap">	</span>* &quot;adi,ad7689&qu=
ot;</div><div>=C2=A0 - reg: spi chip select number for the device</div><div=
>- - vref-supply: The regulator supply for ADC reference voltage</div><div>=
=C2=A0</div><div>-Example:</div><div>+Optional properties:</div><div>+ - ad=
i,reference-select: Select the reference voltage source to use</div><div>+ =
when converting the input voltages. Valid values are:</div><div>+=C2=A0 =C2=
=A00: Internal 2.5V reference; temperature sensor enabled</div><div>+=C2=A0=
 =C2=A01: Internal 4.096V reference; temperature sensor enabled</div><div>+=
=C2=A0 =C2=A02: External reference, temperature sensor enabled, no buffer</=
div><div>+=C2=A0 =C2=A03: External reference, temperature sensor enabled, b=
uffer enabled</div><div>+=C2=A0 =C2=A06: External reference, temperature se=
nsor disabled, no buffer</div><div>+=C2=A0 =C2=A07: External reference, tem=
perature sensor disabled, buffer enabled</div><div>+ - vref-supply: The reg=
ulator supply for ADC reference voltage. Required</div><div>+ if external r=
eference selected by &#39;adi,reference-select&#39;.</div><div>+</div><div>=
+Examples:</div><div>=C2=A0adc@0 {</div><div>=C2=A0<span style=3D"white-spa=
ce:pre-wrap">	</span>compatible =3D &quot;adi,ad7949&quot;;</div><div>=C2=
=A0<span style=3D"white-space:pre-wrap">	</span>reg =3D &lt;0&gt;;</div><di=
v>+<span style=3D"white-space:pre-wrap">	</span>adi,reference-select =3D &l=
t;2&gt;;</div><div>=C2=A0<span style=3D"white-space:pre-wrap">	</span>vref-=
supply =3D &lt;&amp;vdd_supply&gt;;</div><div>=C2=A0};</div><div>+</div><di=
v>+adc@0 {</div><div>+<span style=3D"white-space:pre-wrap">	</span>compatib=
le =3D &quot;adi,ad7949&quot;;</div><div>+<span style=3D"white-space:pre-wr=
ap">	</span>reg =3D &lt;0&gt;;</div><div>+<span style=3D"white-space:pre-wr=
ap">	</span>adi,reference-select =3D &lt;0&gt;;</div><div>+};</div><div>--=
=C2=A0</div><div>1.9.1</div><div><br></div></div></div>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=
=3D"ltr"><p class=3D"MsoNormal" style=3D"margin-bottom:0.0001pt;line-height=
:normal"><b><span style=3D"font-family:Arial,sans-serif">Adam Michaelis=C2=
=A0</span></b><span style=3D"font-family:Arial,sans-serif">| Sr Software En=
gineer | Comm
Engineering | Mission Systems<b><span></span></b></span></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:0.0001pt;line-height:normal">=
<b><span style=3D"font-family:Arial,sans-serif">COLLINS AEROSPACE<span></sp=
an></span></b></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:0.0001pt;line-height:normal">=
<span style=3D"font-size:10pt;font-family:Arial,sans-serif">400
Collins Road, Cedar Rapids, IA 52498 U.S.A.<span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:0.0001pt;line-height:normal">=
<b><span style=3D"font-size:10pt;font-family:Arial,sans-serif">Tel:</span><=
/b><span style=3D"font-size:10pt;font-family:Arial,sans-serif"> +1 319 295 =
4102<span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:0.0001pt;line-height:normal">=
<u><span style=3D"font-size:10pt;font-family:Arial,sans-serif;color:rgb(91,=
155,213)"><a href=3D"mailto:adam.michaelis@collins.com" target=3D"_blank">a=
dam.michaelis@collins.com</a></span></u><span style=3D"font-size:10pt;font-=
family:Arial,sans-serif;color:rgb(91,155,213)"> </span><span style=3D"font-=
size:10pt;font-family:Arial,sans-serif">| <u><span style=3D"color:rgb(91,15=
5,213)"><a href=3D"http://collinsaerospace.com" target=3D"_blank">collinsae=
rospace.com</a></span></u><span></span></span></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:0.0001pt;line-height:normal">=
<span style=3D"font-size:8pt;font-family:Arial,sans-serif"><span>=C2=A0</sp=
an></span></p>

<p class=3D"MsoNormal" style=3D"margin-bottom:0.0001pt;line-height:normal">=
<span style=3D"font-size:8pt;font-family:Arial,sans-serif">CONFIDENTIALITY
WARNING: This message may contain proprietary and/or privileged information=
 of
Collins Aerospace and its affiliated companies. If you are not the intended=
 recipient,
please 1) Do not disclose, copy, distribute or use this message or its
contents. 2) Advise the sender by return email. 3) Delete all copies (inclu=
ding
all attachments) from your computer. Your cooperation is greatly appreciate=
d.<span></span></span></p></div></div></div></div></div>

--000000000000f3b7530587d859fd--
