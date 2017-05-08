Return-Path: <SRS0=3zco=4O=google.com=brendanhiggins@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170424181818.2754-5-brendanhiggins@google.com>
References: <20170424181818.2754-1-brendanhiggins@google.com> <20170424181818.2754-5-brendanhiggins@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 8 May 2017 16:28:44 -0700
Message-ID: <CAFd5g47VGa=wqeyg5tFjB5xD=YsTuP27hLN3-ZM62MJD8dCP_Q@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] i2c: aspeed: added driver for Aspeed I2C
Content-Type: multipart/alternative; boundary=001a1141047aa5568c054f0b9953
To: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brendan Higgins <brendanhiggins@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>
List-ID: <devicetree@vger.kernel.org>

--001a1141047aa5568c054f0b9953
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=E2=80=8BI would like to release another version this week or next week, an=
d I
think that we are pretty closed to having something we can apply, but
before I do that, I want to get something resolved:

+static int __aspeed_i2c_init(struct aspeed_i2c_bus *bus,
> +                            struct platform_device *pdev)
> +{
> +       int ret;
> +
> +       /* Disable everything. */
> +       writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +
> +       ret =3D __aspeed_i2c_init_clk(bus, pdev);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Enable Master Mode */
> +       writel(readl(bus->base + ASPEED_I2C_FUN_CTRL_REG) |
> +              ASPEED_I2CD_MASTER_EN |
> +              /* TODO: provide device tree option for multi-master mode.
> */


I am curious what everyone thinks about this. It seemed that, earlier on,
people did not like me disabling multi-master mode, but I think that it
would make bus recovery not work as well. Given that, I think it makes the
most sense to provide a device tree option either to enable multi-master
support or disable it. Thoughts?


>
> +              ASPEED_I2CD_MULTI_MASTER_DIS,
> +              bus->base + ASPEED_I2C_FUN_CTRL_REG);
> +
> +       /* Set interrupt generation of I2C controller */
> +       writel(ASPEED_I2CD_INTR_ALL, bus->base + ASPEED_I2C_INTR_CTRL_REG=
);
> +
> +       return 0;
> +}

--001a1141047aa5568c054f0b9953
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>=E2=80=8BI would like to release another version this =
week or next week, and I think that we are pretty closed to having somethin=
g we can apply, but before I do that, I want to get something resolved:<br>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span styl=
e=3D"font-size:12.8px">+static int __aspeed_i2c_init(struct aspeed_i2c_bus =
*bus,</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px"=
>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct platform_device *pdev)</span><br style=3D"f=
ont-size:12.8px"><span style=3D"font-size:12.8px">+{</span><br style=3D"fon=
t-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=
=A0int ret;</span><br style=3D"font-size:12.8px"><span style=3D"font-size:1=
2.8px">+</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8=
px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Disable everything. */</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0writel(0, bus-&gt;base + ASPEED_I2C_FUN_CTRL_REG);</span><br styl=
e=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D __aspeed_i2c_init_clk(bus, pdev);</span><br style=3D"font=
-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0=
if (ret &lt; 0)</span><br style=3D"font-size:12.8px"><span style=3D"font-si=
ze:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r=
et;</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=
</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* Enable Master Mode */</span><br style=3D"font-si=
ze:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0wri=
tel(readl(bus-&gt;base + ASPEED_I2C_FUN_CTRL_REG) |</span><br style=3D"font=
-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ASPEED_I2CD_MASTER_EN |</span><br style=3D"font-size:=
12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 /* TODO: provide device tree option for multi-master mode=
. */</span></blockquote><div><br></div><div>I am curious what everyone thin=
ks about this. It seemed that, earlier on, people did not like me disabling=
 multi-master mode, but I think that it would make bus recovery not work as=
 well. Given that, I think it makes the most sense to provide a device tree=
 option either to enable multi-master support or disable it. Thoughts?</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br sty=
le=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASPEED_I2CD_MULTI_MASTER_DIS,</span><br sty=
le=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bus-&gt;base + ASPEED_I2C_FUN_CTRL_REG);</s=
pan><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+</span=
><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* Set interrupt generation of=C2=A0</span><span class=
=3D"gmail-il" style=3D"font-size:12.8px">I2C</span><span style=3D"font-size=
:12.8px">=C2=A0controller */</span><br style=3D"font-size:12.8px"><span sty=
le=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(ASPEED_I2CD_INTR=
_ALL, bus-&gt;base + ASPEED_I2C_INTR_CTRL_REG);</span><br style=3D"font-siz=
e:12.8px"><span style=3D"font-size:12.8px">+</span><br style=3D"font-size:1=
2.8px"><span style=3D"font-size:12.8px">+=C2=A0 =C2=A0 =C2=A0 =C2=A0return =
0;</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+}=
</span></blockquote></div>

--001a1141047aa5568c054f0b9953--
