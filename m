From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH V3 3/4] clk: imx: Add support for i.MX8MN clock driver
Date: Tue, 25 Jun 2019 15:34:56 -0700
Message-ID: <20190625223457.1FCBF205ED@mail.kernel.org>
References: <20190604015928.23157-1-Anson.Huang@nxp.com> <20190604015928.23157-3-Anson.Huang@nxp.com> <20190606162543.EFFB820645@mail.kernel.org> <DB3PR0402MB391625A0B3D838CE88C53E33F5100@DB3PR0402MB3916.eurprd04.prod.outlook.com> <20190607180039.611C7208C0@mail.kernel.org> <DB3PR0402MB391678C245944942EA2A7F62F5110@DB3PR0402MB3916.eurprd04.prod.outlook.com> <20190610151425.D8139207E0@mail.kernel.org> <DB3PR0402MB3916F7F7D7CA801F5C0D0610F5ED0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916F7F7D7CA801F5C0D0610F5ED0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "festevam@gmail.com" <festevam@gmail.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2019-06-10 19:06:22)
> > >
> > > Sorry, I am still a little confused, all the clock
> > > register(clk_register()) are via each different clock types like
> > > imx_clk_gate4/imx_clk_pll14xx, if using clk_hw_register, means we need
> > > to re-write the clock driver using different clk register method, that
> > > will make the driver completely different from i.mx8mq/i.mx8mm, they
> > > are actually same series of SoC as i.mx8mn, it will introduce many
> > confusion, is my understanding correct? And is it OK to just keep what =
it is
> > and make them all aligned?
> > >
> >=20
> > Ok, the problem I'm trying to point out is that clk registrations need =
to be
> > undone, i.e. clk_unregister() needs to be called, when the driver fails=
 to
> > probe. devm_*() is one way to do this, but if you have other ways of
> > removing all the registered clks then that works too. Makes sense?
>=20
> Yes, it makes sense. Do you think it is OK to add an imx_unregister_clock=
s() API, then
> call it in every place of returning failure in .probe function? If yes, I=
 will add it and also
> fix it in i.MX8MQ driver which uses platform driver model but does NOT ha=
ndle this case.=20
>=20
>         base =3D devm_platform_ioremap_resource(pdev, 0);
> -       if (WARN_ON(IS_ERR(base)))
> -               return PTR_ERR(base);
> +       if (WARN_ON(IS_ERR(base))) {
> +               ret =3D PTR_ERR(base);
> +               goto unregister_clks;
> +       }
>=20
>                 pr_err("failed to register clks for i.MX8MN\n");
> -               return -EINVAL;
> +               goto unregister_clks;
>         }
>=20
>         return 0;
> +
> +unregister_clks:
> +       imx_unregister_clocks(clks, ARRAY_SIZE(clks));
> +
> +       return ret;
>=20
> +void imx_unregister_clocks(struct clk *clks[], unsigned int count)
> +{
> +       unsigned i;
> +
> +       for (i =3D 0; i < count; i++)
> +               clk_unregister(clks[i]);
> +}
> +
>=20

Yes, looks better.
