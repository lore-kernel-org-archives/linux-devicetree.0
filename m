From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 7/8] clk: lochnagar: Add support for the Cirrus Logic Lochnagar
Date: Fri, 21 Dec 2018 12:44:37 -0800
Message-ID: <154542507738.13075.5210584076841559233@swboyd.mtv.corp.google.com>
References: <20181120141631.18949-1-ckeepax@opensource.cirrus.com> <20181120141631.18949-7-ckeepax@opensource.cirrus.com> <154356443157.88331.15749597863624143993@swboyd.mtv.corp.google.com> <20181221135037.GH16508@imbe.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181221135037.GH16508@imbe.wolfsonmicro.main>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Charles Keepax (2018-12-21 05:50:37)
> On Thu, Nov 29, 2018 at 11:53:51PM -0800, Stephen Boyd wrote:
> > Quoting Charles Keepax (2018-11-20 06:16:30)
>=20
> > > +               break;
> > > +       default:
> > > +               dev_err(priv->dev, "Unknown Lochnagar type: %d\n", pr=
iv->type);
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       if (!priv->parents)
> > > +               return -ENOMEM;
> > > +
> > > +       for (i =3D 0; i < priv->nparents; i++) {
> > > +               j =3D of_property_match_string(np, "clock-names",
> > > +                                            priv->parents[i]);
> > > +               if (j >=3D 0)
> > > +                       priv->parents[i] =3D of_clk_get_parent_name(n=
p, j);
> >=20
> > Isn't this of_clk_parent_fill()? But there are holes or something?
> >=20
>=20
> I guess rather than a fill, this is perhaps more of a name and
> replace. I could make this a core function if you prefer? I think
> there are a couple of other drivers that could also use it,
> although might be worth doing that as a separate series rather
> than holding this one up.

No worries. I'm actively changing the parent_names design anyway so this
is fine.

>=20
>=20
> > > +static struct platform_driver lochnagar_clk_driver =3D {
> > > +       .driver =3D {
> > > +               .name =3D "lochnagar-clk",
> > > +               .of_match_table =3D of_match_ptr(lochnagar_of_match),
> >=20
> > I suspect of_match_ptr() makes the build complain about unused match
> > table when CONFIG_OF=3DN. Can you try building it that way?
> >=20
>=20
> The driver depends on the MFD which in turn depends on CONFIG_OF
> so that shouldn't be a problem.

Ok. Then it's really not needed and it's better to drop the usage of
of_match_ptr() then.

>=20
