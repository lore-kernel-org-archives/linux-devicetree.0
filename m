From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [Patch v9] driver/clk/clk-si5338: Add common clock framework driver for si5338
Date: Thu, 06 Jun 2019 11:05:07 -0700
Message-ID: <20190606180508.1A76F20868@mail.kernel.org>
References: <1472247978-29312-1-git-send-email-york.sun@nxp.com> <96cb1e730ea5afd651d4c79f20f365df5fe8a29b.camel@upb.ro>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <96cb1e730ea5afd651d4c79f20f365df5fe8a29b.camel@upb.ro>
Sender: linux-kernel-owner@vger.kernel.org
To: Radu Nicolae Pirea <radu_nicolae.pirea@upb.ro>, York Sun <york.sun@nxp.com>, linux-clk@vger.kernel.org
Cc: York Sun <yorksun@freescale.com>, Mike Turquette <mturquette@baylibre.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Andrey Filippov <andrey@elphel.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Radu Nicolae Pirea (2019-05-31 07:06:03)
> > +     remove_common_factor(&rate[1]);
> > +     dev_dbg(&drvdata->client->dev,
> > +             "PLL output frequency: %llu+%llu/%llu Hz\n",
> > +             rate[0], rate[1], rate[2]);
> > +
> > +     return rate[0];
> > +}
> > +
> > +static long si5338_pll_round_rate(struct clk_hw *hw, unsigned long
> > rate,
> > +                               unsigned long *parent_rate)
> > +{
> I think is a designs problem in clock subsystem.
> Description of the function round_rate is this.
>=20
> @round_rate: Given a target rate as input, returns the closest rate
> actually supported by the clock. The parent rate is an input/output
> parameter.
>=20
> If given rate is unsigned long and the return value is long, we have a
> problem. Return value can be an error value but can also be a 32 bit
> frequency value that can be huge enoguh to set MSB bit and if MSB bit
> is set, the return value is a negative value and will be considered
> error code.
>=20
> In drivers/clk/clk.c, in function clk_core_determine_round_nolock, on
> line 1199 is this sequence of code that checks if the value returned by
> round_rate function is negative:
>=20
>          } else if (core->ops->round_rate) {
>                  rate =3D core->ops->round_rate(core->hw, req->rate,
>                                               &req->best_parent_rate);
>                  if (rate < 0)
>                          return rate;
>=20
> In drivers/clk/clk.c, in function clk_calc_new_rates, on line 1780, is
> the next sequence of code that checks if
> clk_core_determine_round_nolock returns a negative value:
>=20
>                  ret =3D clk_core_determine_round_nolock(core, &req);
>                  if (ret < 0)
>                           return NULL;
>=20
> and... if function clk_calc_new_rates returns NULL, in function
> clk_core_set_rate_nolock from drivers/clk/clk.c, on line 2023, is the
> next sequence of code that evaluates NULL, returned by
> clk_calc_new_rates as -EINVAL
>=20
>          top =3D clk_calc_new_rates(core, req_rate);
>          if (!top)
>                  return -EINVAL;
>=20
> So... si5338_pll_round_rate can return 32 bit values like 2500000000 Hz
> who have MSB bit set and are interpreted as error codes.
>=20
> Have someone a suggestion to fix this issue?
>=20

Can you use the determine_rate clk op? It won't work for rounding
outside of the framework though so things like clk_round_rate() still
fail.
