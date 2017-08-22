Return-Path: <SRS0=PKUA=7Y=gmail.com=s.abhisit@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170822073645.rd6wn3gyhbe5fbbo@dell>
References: <1503383171-15515-1-git-send-email-s.abhisit@gmail.com> <20170822073645.rd6wn3gyhbe5fbbo@dell>
From: Abhisit Sangjan <s.abhisit@gmail.com>
Date: Tue, 22 Aug 2017 21:27:34 +0700
Message-ID: <CAMV_pUamRJfu0phQHq5kzjSHDUOku9js7RKPhrVM9_5uM8Y0hg@mail.gmail.com>
Subject: Re: [PATCH] mfd: Add support for TI LMP92001
Content-Type: multipart/alternative; boundary="f403043882b484bb3605575865dc"
To: Lee Jones <lee.jones@linaro.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, jmondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, knaack.h@gmx.de, lars@metafoo.de, fabrice.gasnier@st.com, robh@kernel.org, Akinobu Mita <akinobu.mita@gmail.com>, marek.vasut+renesas@gmail.com, jacopo+renesas@jmondi.org, mike.looijmans@topic.nl, peda@axentia.se, =?UTF-8?Q?Jean=2DFran=C3=A7ois_Dagenais?= <jeff.dagenais@gmail.com>, linux-iio@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--f403043882b484bb3605575865dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee Jones - Thank you, I will do.

On Tue, Aug 22, 2017 at 2:36 PM, Lee Jones <lee.jones@linaro.org> wrote:

> On Tue, 22 Aug 2017, s.abhisit@gmail.com wrote:
>
> > From: Abhisit Sangjan <s.abhisit@gmail.com>
> >
> > TI LMP92001 Analog System Monitor and Controller
> >
> > 8-bit GPIOs.
> > 12 DACs with 12-bit resolution.
> > The GPIOs and DACs are shared port function with Cy function pin to
> > take control the pin suddenly from external hardware.
> > DAC's referance voltage selectable for Internal/External.
> >
> > 16 + 1 ADCs with 12-bit resolution.
> > Built-in internal Temperature Sensor on channel 17.
> > Windows Comparator Function is supported on channel 1-3 and 9-11 for
> > monitoring with interrupt signal (pending to implement for interrupt).
> > ADC's referance voltage selectable for Internal/External.
> >
> > Signed-off-by: Abhisit Sangjan <s.abhisit@gmail.com>
> > ---
> >  Documentation/ABI/testing/sysfs-bus-iio-lmp920001  |  92 ++++
> >  .../devicetree/bindings/gpio/gpio-lmp92001.txt     |  22 +
> >  .../bindings/iio/adc/ti-lmp92001-adc.txt           |  21 +
> >  .../bindings/iio/dac/ti-lmp92001-dac.txt           |  35 ++
> >  drivers/gpio/Kconfig                               |   7 +
> >  drivers/gpio/Makefile                              |   1 +
> >  drivers/gpio/gpio-lmp92001.c                       | 209 +++++++++
> >  drivers/iio/adc/Kconfig                            |  10 +
> >  drivers/iio/adc/Makefile                           |   1 +
> >  drivers/iio/adc/lmp92001-adc.c                     | 500
> +++++++++++++++++++++
> >  drivers/iio/dac/Kconfig                            |   9 +
> >  drivers/iio/dac/Makefile                           |   1 +
> >  drivers/iio/dac/lmp92001-dac.c                     | 390
> ++++++++++++++++
> >  drivers/mfd/Kconfig                                |  12 +
> >  drivers/mfd/Makefile                               |   4 +
> >  drivers/mfd/lmp92001-core.c                        | 308 +++++++++++++
> >  drivers/mfd/lmp92001-debug.c                       |  67 +++
> >  drivers/mfd/lmp92001-i2c.c                         | 215 +++++++++
> >  include/linux/mfd/lmp92001/core.h                  | 119 +++++
> >  include/linux/mfd/lmp92001/debug.h                 |  28 ++
>
> You need to split this up into a patch-set containing smaller
> bite-sized patches.  Each should contain the smallest (reasonable)
> change set, split up by subsystem and again by functionality.
>
> --
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
>

--f403043882b484bb3605575865dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lee Jones - Thank you, I will do.<div><br></div><div><d=
iv class=3D"gmail_extra"><div class=3D"gmail_quote">On Tue, Aug 22, 2017 at=
 2:36 PM, Lee Jones <span dir=3D"ltr">&lt;<a href=3D"mailto:lee.jones@linar=
o.org" target=3D"_blank">lee.jones@linaro.org</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Tue, =
22 Aug 2017, <a href=3D"mailto:s.abhisit@gmail.com">s.abhisit@gmail.com</a>=
 wrote:<br>
<br>
&gt; From: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.com">s.abh=
isit@gmail.com</a>&gt;<br>
&gt;<br>
&gt; TI LMP92001 Analog System Monitor and Controller<br>
&gt;<br>
&gt; 8-bit GPIOs.<br>
&gt; 12 DACs with 12-bit resolution.<br>
&gt; The GPIOs and DACs are shared port function with Cy function pin to<br=
>
&gt; take control the pin suddenly from external hardware.<br>
&gt; DAC&#39;s referance voltage selectable for Internal/External.<br>
&gt;<br>
&gt; 16 + 1 ADCs with 12-bit resolution.<br>
&gt; Built-in internal Temperature Sensor on channel 17.<br>
&gt; Windows Comparator Function is supported on channel 1-3 and 9-11 for<b=
r>
&gt; monitoring with interrupt signal (pending to implement for interrupt).=
<br>
&gt; ADC&#39;s referance voltage selectable for Internal/External.<br>
&gt;<br>
&gt; Signed-off-by: Abhisit Sangjan &lt;<a href=3D"mailto:s.abhisit@gmail.c=
om">s.abhisit@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/ABI/testing/<wbr>sysfs-bus-iio-lmp920001=C2=A0 |=
=C2=A0 92 ++++<br>
&gt;=C2=A0 .../devicetree/bindings/gpio/<wbr>gpio-lmp92001.txt=C2=A0 =C2=A0=
 =C2=A0|=C2=A0 22 +<br>
&gt;=C2=A0 .../bindings/iio/adc/ti-<wbr>lmp92001-adc.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 +<br>
&gt;=C2=A0 .../bindings/iio/dac/ti-<wbr>lmp92001-dac.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 35 ++<br>
&gt;=C2=A0 drivers/gpio/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A07 +<br>
&gt;=C2=A0 drivers/gpio/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 drivers/gpio/gpio-lmp92001.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 209 +++++++++<br>
&gt;=C2=A0 drivers/iio/adc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br>
&gt;=C2=A0 drivers/iio/adc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
&gt;=C2=A0 drivers/iio/adc/lmp92001-adc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 500 +++++++++++++++++++++<br>
&gt;=C2=A0 drivers/iio/dac/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<=
br>
&gt;=C2=A0 drivers/iio/dac/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
&gt;=C2=A0 drivers/iio/dac/lmp92001-dac.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 390 ++++++++++++++++<br>
&gt;=C2=A0 drivers/mfd/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
12 +<br>
&gt;=C2=A0 drivers/mfd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A04 +<br>
&gt;=C2=A0 drivers/mfd/lmp92001-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 308 +++++++++++++<br>
&gt;=C2=A0 drivers/mfd/lmp92001-debug.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 67 +++<br>
&gt;=C2=A0 drivers/mfd/lmp92001-i2c.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 215 +++++++++<br>
&gt;=C2=A0 include/linux/mfd/lmp92001/<wbr>core.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 119 +++++<br>
&gt;=C2=A0 include/linux/mfd/lmp92001/<wbr>debug.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 28 ++<br>
<br>
</div></div>You need to split this up into a patch-set containing smaller<b=
r>
bite-sized patches.=C2=A0 Each should contain the smallest (reasonable)<br>
change set, split up by subsystem and again by functionality.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Lee Jones<br>
Linaro STMicroelectronics Landing Team Lead<br>
Linaro.org =E2=94=82 Open source software for ARM SoCs<br>
Follow Linaro: Facebook | Twitter | Blog<br>
</font></span></blockquote></div><br></div></div></div>

--f403043882b484bb3605575865dc--
