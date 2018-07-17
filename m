Return-Path: <SRS0=TLnP=KB=gmail.com=mazziesaccount@kernel.org>
MIME-Version: 1.0
References: <cover.1530800707.git.matti.vaittinen@fi.rohmeurope.com>
 <e737bb13d17b75ea5e55f59005ef3181d428e704.1530800707.git.matti.vaittinen@fi.rohmeurope.com>
 <20180712130013.GJ4641@dell>
In-Reply-To: <20180712130013.GJ4641@dell>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Tue, 17 Jul 2018 10:12:21 +0300
Message-ID: <CANhJrGPfQS-TMwU4sPe85R7q94-0=9DNv7MH35N4hcLx8jin=Q@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] mfd: bd71837: mfd driver for ROHM BD71837 PMIC
Content-Type: multipart/alternative; boundary="00000000000084414b05712cac1b"
To: Lee Jones <lee.jones@linaro.org>
Cc: "Vaittinen, Matti" <matti.vaittinen@fi.rohmeurope.com>, Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org, sboyd@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, arnd@arndb.de, dmitry.torokhov@gmail.com, sre@kernel.org, chenjh@rock-chips.com, andrew.smirnov@gmail.com, linus.walleij@linaro.org, kstewart@linuxfoundation.org, heiko@sntech.de, gregkh@linuxfoundation.org, eballetbo@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-ID: <devicetree@vger.kernel.org>

--00000000000084414b05712cac1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

to 12. hein=C3=A4k. 2018 klo 16.00 Lee Jones <lee.jones@linaro.org> kirjoit=
ti:

> On Thu, 05 Jul 2018, Matti Vaittinen wrote:
>
> > ROHM BD71837 PMIC MFD driver providing interrupts and support
> > for three subsystems:
> > - clk
> > - Regulators
> > - input/power-key
> >
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> >  drivers/mfd/Kconfig              |  13 ++
> >  drivers/mfd/Makefile             |   1 +
> >  drivers/mfd/rohm-bd718x7.c       | 198 +++++++++++++++++++++++
> >  include/linux/mfd/rohm-bd718x7.h | 333
> +++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 545 insertions(+)
> >  create mode 100644 drivers/mfd/rohm-bd718x7.c
> >  create mode 100644 include/linux/mfd/rohm-bd718x7.h
>
> Just a few nits.  See below.
>


I'll address the comments when I am back from my holiday trip after a week
or two.

Best regards
Matti Vaittinen

--00000000000084414b05712cac1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
to 12. hein=C3=A4k. 2018 klo 16.00 Lee Jones &lt;<a href=3D"mailto:lee.jone=
s@linaro.org">lee.jones@linaro.org</a>&gt; kirjoitti:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Thu, 05 Jul 2018, Matti Vaittinen wrote:<br>
<br>
&gt; ROHM BD71837 PMIC MFD driver providing interrupts and support<br>
&gt; for three subsystems:<br>
&gt; - clk<br>
&gt; - Regulators<br>
&gt; - input/power-key<br>
&gt; <br>
&gt; Signed-off-by: Matti Vaittinen &lt;<a href=3D"mailto:matti.vaittinen@f=
i.rohmeurope.com" target=3D"_blank" rel=3D"noreferrer">matti.vaittinen@fi.r=
ohmeurope.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/mfd/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 13 ++<br>
&gt;=C2=A0 drivers/mfd/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/mfd/rohm-bd718x7.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 198 +++++=
++++++++++++++++++<br>
&gt;=C2=A0 include/linux/mfd/rohm-bd718x7.h | 333 +++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 4 files changed, 545 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/mfd/rohm-bd718x7.c<br>
&gt;=C2=A0 create mode 100644 include/linux/mfd/rohm-bd718x7.h<br>
<br>
Just a few nits.=C2=A0 See below.<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll addre=
ss the comments when I am back from my holiday trip after a week or two.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards</div><div dir=
=3D"auto">Matti Vaittinen=C2=A0</div></div>

--00000000000084414b05712cac1b--
