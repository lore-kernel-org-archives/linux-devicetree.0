Return-Path: <SRS0=jmSw=TX=sifive.com=sagar.kadam@kernel.org>
MIME-Version: 1.0
References: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
 <1558515574-11155-4-git-send-email-sagar.kadam@sifive.com> <20190522194529.GJ7281@lunn.ch>
In-Reply-To: <20190522194529.GJ7281@lunn.ch>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Thu, 23 May 2019 10:47:52 +0530
Message-ID: <CAARK3HmMVibudG2CFLBoMSAqnraXyirTL6CXYo1T_XJEuGJy7Q@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] i2c-ocores: sifive: add polling mode workaround
 for FU540-C000 SoC.
Content-Type: multipart/alternative; boundary="000000000000d322790589873467"
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, peter@korsgaard.com, Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Linux I2C <linux-i2c@vger.kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--000000000000d322790589873467
Content-Type: text/plain; charset="UTF-8"

On Thu, May 23, 2019 at 1:15 AM Andrew Lunn <andrew@lunn.ch> wrote:

> On Wed, May 22, 2019 at 02:29:34PM +0530, Sagar Shrikant Kadam wrote:
> > The i2c-ocore driver already has a polling mode interface.But it needs
> > a workaround for FU540 Chipset on HiFive unleashed board (RevA00).
> > There is an erratum in FU540 chip that prevents interrupt driven i2c
> > transfers from working, and also the I2C controller's interrupt bit
> > cannot be cleared if set, due to this the existing i2c polling mode
> > interface added in mainline earlier doesn't work, and CPU stall's
> > infinitely, when-ever i2c transfer is initiated.
> >
> > Ref:
> >       commit dd7dbf0eb090 ("i2c: ocores: refactor setup for polling")
> >
> > The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for
> > FU540-COOO SoC.
> >
> > The polling function identifies a SiFive device based on the device node
> > and enables the workaround.
> >
> > Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>

Thank you Andrew for reviewing the patch set.
Can you please let me know weather you or Peter will be pick up the patch
for v5.3 or they  should go in via some other tree?


>
>     Andrew
>

Thanks & Regards,
Sagar

--000000000000d322790589873467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 23, 2019 at 1:15 AM Andre=
w Lunn &lt;<a href=3D"mailto:andrew@lunn.ch">andrew@lunn.ch</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, May 22, =
2019 at 02:29:34PM +0530, Sagar Shrikant Kadam wrote:<br>
&gt; The i2c-ocore driver already has a polling mode interface.But it needs=
<br>
&gt; a workaround for FU540 Chipset on HiFive unleashed board (RevA00).<br>
&gt; There is an erratum in FU540 chip that prevents interrupt driven i2c<b=
r>
&gt; transfers from working, and also the I2C controller&#39;s interrupt bi=
t<br>
&gt; cannot be cleared if set, due to this the existing i2c polling mode<br=
>
&gt; interface added in mainline earlier doesn&#39;t work, and CPU stall&#3=
9;s<br>
&gt; infinitely, when-ever i2c transfer is initiated.<br>
&gt; <br>
&gt; Ref:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0commit dd7dbf0eb090 (&quot;i2c: ocores: refa=
ctor setup for polling&quot;)<br>
&gt; <br>
&gt; The workaround / fix under OCORES_FLAG_BROKEN_IRQ is particularly for<=
br>
&gt; FU540-COOO SoC.<br>
&gt; <br>
&gt; The polling function identifies a SiFive device based on the device no=
de<br>
&gt; and enables the workaround.<br>
&gt; <br>
&gt; Signed-off-by: Sagar Shrikant Kadam &lt;<a href=3D"mailto:sagar.kadam@=
sifive.com" target=3D"_blank">sagar.kadam@sifive.com</a>&gt;<br>
<br>
Reviewed-by: Andrew Lunn &lt;<a href=3D"mailto:andrew@lunn.ch" target=3D"_b=
lank">andrew@lunn.ch</a>&gt;<br></blockquote><div><br></div><div>Thank you =
Andrew for reviewing the patch set.=C2=A0</div><div>Can you please let me k=
now weather you or Peter will be pick up the patch for v5.3 or they=C2=A0=
=C2=A0should go in via some other tree?</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 Andrew<br></blockquote><div>=C2=A0</div><div>Thanks &amp; Reg=
ards,</div><div>Sagar</div></div></div>

--000000000000d322790589873467--
