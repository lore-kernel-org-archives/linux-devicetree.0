From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/5] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Mon, 29 Oct 2018 12:57:29 +0000
Message-ID: <20181029125729.GW2103@sirena.org.uk>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-2-ckeepax@opensource.cirrus.com>
 <20181025074459.GF4939@dell>
 <20181025082621.GD16508@imbe.wolfsonmicro.main>
 <b2f85f45-cbe9-5a27-e9e8-ad28f2bd9bd6@opensource.cirrus.com>
 <20181025114205.GC4870@dell>
 <33ea391c-aa6e-2709-6faf-4905e84229e4@opensource.cirrus.com>
 <20181026080051.GK4870@dell>
 <20181026203223.GC27137@sirena.org.uk>
 <20181029110439.GS4870@dell>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eV9cGEf2bJwTs/8b"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181029110439.GS4870@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--eV9cGEf2bJwTs/8b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 29, 2018 at 11:04:39AM +0000, Lee Jones wrote:
> On Fri, 26 Oct 2018, Mark Brown wrote:

> > There's no *requirement* to provide the data even if you're using the
> > cache (and the cache support is entirely optional), there's just costs
> > to not providing it in terms of what features you can get from the
> > regmap API and the performance of the system.  Not every device is going
> > to be bothered by those costs, many devices don't provide all of the
> > data they could.

> So what do we do in the case where, due to the size of the device, the
> amount of lines required by these tables go from crazy to grotesque?

My recommendation when the tables get in the way of the rest of the
driver is to move them into a separate file that contains only tables,
these get big but they're sitting in a separate file that only contains
big data tables so they're fairly simple to look at (and generate or
whatever) and people working on the active code don't need to look at
them.

> > That doesn't work, we need to know both if the register has a default
> > value and what that value is - there's no great value in only supplying
> > the defaults for registers with non-zero values.

> All registers have a default value.  Why can't we assume that if a
> register is writable and a default value was omitted then the default
> is zero?

There are volatile registers which can't be part of the cache as the
hardware might change the state, and we have things like device
identification registers which are fixed but which we want to read from
the device.  This second set of registers can usually be modelled quite
happily as volatile registers though, we don't tend to read them often.

There's also registers where the user just didn't tell us what's going
on, either through oversight or because there's some code that touches
undocumented test registers at runtime for quirk reasons using a read,
modify write cycle.  We could try to insist that the device drivers
always provide a default or mark things as volatile but that's likely to
be an uphill struggle and more error prone.

> Ah wait!  As I was typing the above, I just had a thought.  We don't
> actually provide a list of writable registers do we?  Only a the
> ability to verify if one is writable (presumably) before a write.

> That's frustrating!

You can provide the writability information either with the function or
with data.  The tables code doesn't currently scale very well to large,
sparse register maps but that could in theory be optimized.  Few devices
bother providing distinct writability information as it's not often an
issue.

--eV9cGEf2bJwTs/8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvXA7YACgkQJNaLcl1U
h9CxeQf/W/V27ESuSoJs3wMr5mCJ3gVVxZd4wQ3AdCL4pMP2+epl+aQnWUQNHwY5
PKJ2DINsrzAvtNq0fSdHVIzaRI4pEwftPxWdQvMOiGompOv3n0LMR9npUkdHEkOY
dlLL5pgmWyTlesYy9FJ0d0JKUg1Y1Dwpl0mkP5zqmUpXdLAYBWITE8pQiRzCgmXQ
ME8NjY92OdQQfuZqoIOkckO/PZa58z2VJzWpRWnCEmzsyPh2YcyWe+SFga0+9F2Z
2iO1mGcTa50Xh5ACebTjOCFClG9swwnkVaOAwOGfEkl7Z3KbK4+b1ctGFECCM9vy
pntQ6p9rm6cjs47nPc/thANV2xLGJA==
=rOR1
-----END PGP SIGNATURE-----

--eV9cGEf2bJwTs/8b--
