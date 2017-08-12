Return-Path: <SRS0=ENjE=7O=gmail.com=andyshrk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170812140116.pjcswhe5mylns7x4@ninjato>
References: <1502422578-30611-1-git-send-email-andy.yan@rock-chips.com>
 <1502422753-30725-1-git-send-email-andy.yan@rock-chips.com> <20170812140116.pjcswhe5mylns7x4@ninjato>
From: Andy Yan <andyshrk@gmail.com>
Date: Sat, 12 Aug 2017 22:30:10 +0800
Message-ID: <CANbgqATBQ3-V=Z8MLmw2jtQwiF0LMgoakGe+wLypzwF3EJF++A@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] i2c: rk3x: add support for rv1108
Content-Type: multipart/alternative; boundary="94eb2c1a23645f469b05568f4412"
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, robh+dt@kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c1a23645f469b05568f4412
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram:

2017-08-12 22:01 GMT+08:00 Wolfram Sang <wsa@the-dreams.de>:

> Hi,
>
> > +static const struct rk3x_i2c_soc_data rv1108_soc_data =3D {
> > +     .grf_offset =3D -1,
> > +     .calc_timings =3D rk3x_i2c_v1_calc_timings,
> > +};
> > +
>
> I don't care super much, but why don't you reuse rk3399_soc_data()?
> Or even use the rk3399 compatible as fallback value?
>
>
Actually, there is one I2C controller(I2C2) has a different feature with
all the other rockchip soc.The I2C2 is not used on my current board. But I
plan to add this feature later=E3=80=82 So I give RV1108 a new compatible s=
tring
here=E3=80=82

Kind regards,
>
>    Wolfram
>
>

--94eb2c1a23645f469b05568f4412
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Wolfram:<div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">2017-08-12 22:01 GMT+08:00 Wolfram Sang <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:wsa@the-dreams.de" target=3D"_blank">wsa@the-dreams.de</a>&=
gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<span class=3D""><br>
&gt; +static const struct rk3x_i2c_soc_data rv1108_soc_data =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.grf_offset =3D -1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.calc_timings =3D rk3x_i2c_v1_calc_timings,<br>
&gt; +};<br>
&gt; +<br>
<br>
</span>I don&#39;t care super much, but why don&#39;t you reuse rk3399_soc_=
data()?<br>
Or even use the rk3399 compatible as fallback value?<br>
<br></blockquote><div><br></div><div>Actually, there is one I2C controller(=
I2C2) has a different feature with all the other rockchip soc.The I2C2 is n=
ot used on my current board. But I plan to add this feature later=E3=80=82 =
So I give RV1108 a new compatible string here=E3=80=82=C2=A0</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
Kind regards,<br>
<br>
=C2=A0 =C2=A0Wolfram<br>
<br>
</blockquote></div><br></div></div>

--94eb2c1a23645f469b05568f4412--
