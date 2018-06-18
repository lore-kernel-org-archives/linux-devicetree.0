Return-Path: <SRS0=kL7t=JE=gmail.com=mazziesaccount@kernel.org>
MIME-Version: 1.0
References: <cover.1529067662.git.matti.vaittinen@fi.rohmeurope.com> <69915265bbff5c729bcd4ffd4ffdba8d24582068.1529067662.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <69915265bbff5c729bcd4ffd4ffdba8d24582068.1529067662.git.matti.vaittinen@fi.rohmeurope.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Mon, 18 Jun 2018 17:10:11 +0300
Message-ID: <CANhJrGOhGJLtL5Gm6JS++YPis0pSdEDSKNb4CiQ7igYqR4K46g@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] clk: bd71837: Add driver for BD71837 PMIC clock
Content-Type: multipart/alternative; boundary="0000000000005f1ce1056eeb2072"
To: "Vaittinen, Matti" <matti.vaittinen@fi.rohmeurope.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, arnd@arndb.de, dmitry.torokhov@gmail.com, sre@kernel.org, chenjh@rock-chips.com, andrew.smirnov@gmail.com, linus.walleij@linaro.org, kstewart@linuxfoundation.org, heiko@sntech.de, gregkh@linuxfoundation.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-ID: <devicetree@vger.kernel.org>

--0000000000005f1ce1056eeb2072
Content-Type: text/plain; charset="UTF-8"

> +       c = devm_kzalloc(&pdev->dev, sizeof(*c), GFP_KERNEL);
> +               return -ENOMEM;
> +
>

> Please ignore this patch. I have merge errors here like dropping the if
> here. I'll send new one at least for clk tomorrow.


Br. Matti Vaittinen

--0000000000005f1ce1056eeb2072
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr">=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D devm_kzalloc(&amp;pdev-&gt;dev, sizeof(*c=
), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br></blockquote><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Please ignore this patch. I have merge errors here like dr=
opping the if here. I&#39;ll send new one at least for clk tomorrow.</block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Br. Matti V=
aittinen=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto"></div></div>

--0000000000005f1ce1056eeb2072--
