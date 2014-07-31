From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: initial clock driver for TWL6030
Date: Thu, 31 Jul 2014 12:05:31 +0100
Message-ID: <20140731110531.GH17528@sirena.org.uk>
References: <1406728949-7560-1-git-send-email-sassmann@kpanic.de>
 <1406728949-7560-3-git-send-email-sassmann@kpanic.de>
 <20140730175033.GA17528@sirena.org.uk>
 <53DA12BF.1060008@kpanic.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Jf2Crv+FloeSoWi"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53DA12BF.1060008-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, peter.ujfalusi-l0cyMroinI0@public.gmane.org, t-kristo-l0cyMroinI0@public.gmane.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4Jf2Crv+FloeSoWi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 31, 2014 at 11:56:15AM +0200, Stefan Assmann wrote:
> On 30.07.2014 19:50, Mark Brown wrote:
> > On Wed, Jul 30, 2014 at 04:02:29PM +0200, Stefan Assmann wrote:

> >> +static int twl6030_clk32kg_is_prepared(struct clk_hw *hw)
> >> +{
> >> +	struct twl6030_desc *desc = to_twl6030_desc(hw);
> >> +
> >> +	return desc->enabled;
> >> +}

> > Why not just check the register map - can't the register be cached?  If
> > that's not possible a comment would be good.

> I just took atl_clk_is_enabled() as template. If you say it's better
> to read the value, that can be arranged.

It might be worth doing this if you have to go to hardware to check the
status, if you can read a cache then just using the register is less
error prone.

> >> +	else
> >> +		clk_prepare(clk);

> > Why is the clock driver defaulting to enabling the clock, and if it
> > needs to shouldn't it be doing a prepere_enable() even if the enable
> > happens not to do anything to the hardware?  Otherwise child clocks
> > might get confused.

> Mike advised me to convert the functions from enable/disable to
> prepare/unprepare because i2c transactions may sleep. That's what I did.
> The code no longer enables the clock and just prepares it. So IIUC the
> call to clk_prepare() should be fine.

That's not going to help consumers of the clock, you do need to move the
operations to prepare() but users shouldn't need to know what happens in
prepare() and what happens in enable().

You've also not addressed the comment about defaulting to enabling the
clock in the first place.

--4Jf2Crv+FloeSoWi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2iL4AAoJELSic+t+oim9cSAP/j64P9MCJo35nfY0qpRh8Rgp
LY8THIUJDsYA1C9p8tAJm1IIv0JE8+d+nuf6JW27NocHoef/8NFKiJSP0UisqmJ/
QX09QFWPe/6J6YiXNTIvBOzDYGNhqs2tHtGbOEFxxTia9bz28x0FwhD8t4mATcbx
zmlRWX7HrcbJG/Webfsl4xicIaAWKvqqg5H+CHkN41J9LzPHbFQTKVXHlcQp2w8I
uA7ihsbUQQI/1lpC2yKtMpJQHQaKGzIX9NGD7Kgbw2Gp/gBbC28q2hvdptttPwXZ
oDcepDghXuoLngECnHw0pK/S6wYe2tqhxTFMVi8v8BkKXGUq+56JVzkIVaYLUIg8
/c5rTf+QA0DZVhz8xTdk/vzv7ese1bmHBZBNwiVuDBj3Xz/ePi70RhZnFTkd0Vd7
v3c5vbeaw72q4KEEn6iSqc9YB2maDwYLNMCS74CGcxO+hUE4sp8qFypZS4/isVxh
IlTaEdHFwxnqMr5KwYS48PvbhgtHtntYhAN34J+8NTExnroQsPsO4PRFXzTx0kFz
B4LNkgJcjL18T5YDQlx9zMBggdRIRpu55WN/ZUicUuFv+mCOpgEEMYio36/Jnp7x
4c/3VE5B9lD2Y0JeV/pKbYc8qfRWk7xPzwW+S0qFz/vggsNBhT7+6UlmJMAHWNT+
/03x2akegwCNyhqo5LDM
=hQxp
-----END PGP SIGNATURE-----

--4Jf2Crv+FloeSoWi--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
