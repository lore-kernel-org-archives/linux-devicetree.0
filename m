From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 02/12] pinctrl: Add core pinctrl support for Aspeed SoCs
Date: Fri, 12 Aug 2016 10:03:42 +0930
Message-ID: <1470962022.27272.68.camel@aj.id.au>
References: <1468994313-13538-1-git-send-email-andrew@aj.id.au>
	 <1468994313-13538-3-git-send-email-andrew@aj.id.au>
	 <CACRpkdZ0p+jNHBV1AqhVWQ2Q8RRrHVfsAz3XU3_+f6My22=Zxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-eA8rsKfy4PTc3eRZnGBI"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ0p+jNHBV1AqhVWQ2Q8RRrHVfsAz3XU3_+f6My22=Zxg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--=-eA8rsKfy4PTc3eRZnGBI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2016-08-11 at 10:41 +0200, Linus Walleij wrote:
> On Wed, Jul 20, 2016 at 7:58 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> >=20
> > --- a/arch/arm/mach-aspeed/Kconfig
> > +++ b/arch/arm/mach-aspeed/Kconfig
> > @@ -5,6 +5,7 @@ menuconfig ARCH_ASPEED
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select WATCHDOG
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select ASPEED_WATCHDOG
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select MOXART_TIMER
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0select PINCTRL
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Say Y here =
if you want to run your kernel on an ASpeed BMC SoC.
> This needs to be a separate patch sent to the ARM SoC tree.
> I don't like to merge patches to other subsystems if it can be
> avoided.

Okay, I'll split it out.

>=20
> >=20
> > +static inline void aspeed_sig_desc_print_val(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0const struct aspeed_sig_desc *desc, bool enable, u32 r=
v)
> > +{
> > +#if defined(CONFIG_DEBUG_PINCTRL)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_debug("SCU%x[0x%08x]=3D0x=
%x, got 0x%x from 0x%08x\n", desc->reg,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0desc->=
mask, enable ? desc->enable : desc->disable,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(rv & =
desc->mask) >> __ffs(desc->mask), rv);
> > +#endif
> > +}
> You can just use pr_debug(). CONFIG_DEBUG_PINCTRL enables
> DEBUG_KERNEL which activates debug prints so this is a truism.

Right, I will clean that up.

>=20
> >=20
> > +static bool aspeed_sig_desc_eval(const struct aspeed_sig_desc *desc,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0bool enabled, struct regmap *map)
> > +static bool aspeed_sig_expr_eval(const struct aspeed_sig_expr *expr,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0bool enabled, struct regmap *map)
> These need kerneldoc too, they are kind of hard to understand.

Will do.

>=20
> >=20
> > +static bool aspeed_gpio_in_exprs(const struct aspeed_sig_expr **exprs)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!exprs)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return false;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while (*exprs) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (strncmp((*exprs)->signal, "GPIO", 4) =3D=3D 0)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return=
 true;
> This looks a bit fragile and hard to debug. Do you have some better
> idea of how to do this but not resort to string comparison?

Yes, this is a little unfortunate. GPIO is not always a pin's lowest
priority function (e.g. the RGMII/RMII pins), so this makes the GPIO
case like any other mux function: We need to know when to stop
iterating the arrays when disabling mux functions of higher priority.
The alternative is probably to introduce another field to struct
aspeed_sig_expr and set that as necessary, but that feels redundant if
we keep to a consistent naming for the GPIOs.

Would it be acceptable to document that requirement? Maybe that's just
punting on the problem because it doesn't make it any less difficult to
debug. However, the failure case is already tested in
aspeed_gpio_request_enable() (where all aspeed_gpio_in_exprs() calls
fail for a pin) and to make it easier to debug I can dev_warn() at that
point.

I will do both of the above as part of a v2 unless you are really keen
for an alternative.

>=20
> Apart from that it looks pretty alright, complex but such is life
> with complex hardware.

Mmm, yes. I keep hoping for a day when someone else points out that it
actually has a simple solution so I stop dreading the explanation of
the implementation's mechanics to others.

Anyway, thanks for the review!

Andrew

>=20
> Yours,
> Linus Walleij
--=-eA8rsKfy4PTc3eRZnGBI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXrRlmAAoJEJ0dnzgO5LT51SUP/jNZdYzIxKrVcTN4U0NvRbxl
Nsl80gpwCFMbZdKKnawm4LXkb+qApkuXu3S3N/MxzKPRADUHxr+84mwXGGUNJP31
Kkm/sKNHTyKDezcKZ8xuNCvUdeA8GlrbxsLmOR2SXJjqI9rMe7tkMxeAIeWk9whP
gAQ9YVt2iv1im6kmTRArxRFIXlrnHLk96iIoFIaB0J9KeQYejx0ktAQs8KC7ySLB
bmLSCi5A29/H9qHm68PMWGuUXslI9LUKUHgRw5Qur2DCdfBRIBRmW+v9yaOWyUfu
XK/RYodbfwjJEPl6PFrgNrGNnckzbajpnHcPfBX2DoidTOEreZI6jnsUZuueuHrB
QVl//6YFr1jPJhlS6sTTGa5uM0IHiQ6fyIQWrOrwlnbjdoRJxAlcsCPQP4OhvEuW
RVPOurBapkTfOp495GHCWTvZbJCNLFXRO9hbbmTwStypllMZGolbGWOo6I7YgrMU
0wrzptGtadHrSpsjpgdhic05M7XJ6pEaEWdHM/rRdDAd5R3via3LlpGPVdXm0kpK
RA9OFUrypO1Ms7JuRv1hbR8snVBZimSth4e4nYj99Wy0qXEFx36oIQdf3c0nP5dh
qejO2hxcc/M36t4E8OTTSTkKrEc7SNOJR4YVAGsScICifoGMa/ATj2FwidV9RSyE
mA+D/8g4l7I+qAhTUzvC
=8M/u
-----END PGP SIGNATURE-----

--=-eA8rsKfy4PTc3eRZnGBI--

