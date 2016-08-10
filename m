From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: Add LTC3676 support
Date: Wed, 10 Aug 2016 12:41:40 +0100
Message-ID: <20160810114140.GJ9347@sirena.org.uk>
References: <1470785767-4426-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x+WOirvrtTKur1pg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470785767-4426-1-git-send-email-tharvey@gateworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tim Harvey <tharvey@gateworks.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jaffer Kapasi <jkapasi@linear.com>
List-Id: devicetree@vger.kernel.org


--x+WOirvrtTKur1pg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 09, 2016 at 04:36:07PM -0700, Tim Harvey wrote:

Mostly looks good but quite a few issues with not using framework
features here, a lot of the code can be factored out into the core:

> +	/* DVB reference select is bit5 of DVBA reg */
> +	mask = 1 << 5;
> +
> +	if (mode != REGULATOR_MODE_STANDBY)
> +		bit = mask;	/* Select DVBB */

This will silently treat any mode other than standby identically which
is buggy, it should reject any mode not supported.

> +/* LDO1 always on fixed 0.8V-3.3V via scalar via R1/R2 feeback res */
> +static struct regulator_ops ltc3676_fixed_standby_regulator_ops = {
> +};

Remove this, it's pointless.

> +	node = of_get_child_by_name(dev->of_node, "regulators");
> +	if (!node) {
> +		dev_err(dev, "regulators node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = of_regulator_match(dev, node, ltc3676_matches,
> +				 ARRAY_SIZE(ltc3676_matches));

Use the core support for parsing regulators from OF, don't open code it.

> +	/* parse feedback voltage deviders: LDO3 doesn't have them */
> +	for (i = 0; i < LTC3676_NUM_REGULATORS; i++) {
> +		struct ltc3676_regulator *desc = &ltc3676->regulator_descs[i];
> +		struct device_node *np = ltc3676_matches[i].of_node;
> +		u32 vdiv[2];

There's a callback for parsing additional properties out of the
subnodes, of_parse_cb.

> +static bool ltc3676_readable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +		case LTC3676_IRQSTAT:
> +		case LTC3676_BUCK1:

Please follow the kernel coding style.

> +	dev_dbg(dev, "irq%d irqstat=0x%02x\n", irq, irqstat);
> +	if (irqstat & LTC3676_IRQSTAT_THERMAL_WARN) {
> +		dev_info(dev, "Over-temperature Warning\n");

dev_warn()

> +static void ltc3676_apply_fb_voltage_divider(struct ltc3676_regulator *rdesc)
> +{
> +	struct regulator_desc *desc = &rdesc->desc;
> +
> +	if (!rdesc->r1 || !rdesc->r2)
> +		return;

This is a bug if we ever get here, we should be complaining loudly.

--x+WOirvrtTKur1pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXqxLzAAoJECTWi3JdVIfQ+l0H/0HVjqOkjKZ61huB/RKMA946
keijEZ5GTsnCuWRVrY0w0DHt3TxU8A1Jv9BlDyAwQhl6p6QSNqmZArByArkbUNEB
Uqgkko6K+g+a5LlKR4ucaRec/Z9svLZfaOaeWAdkEvrKhq8958lB8mFBYIYI+zqY
KpV11bhePdI3ziLGEorocpA1D58gMaglt3TAX4/NrH9sV21sMONzRX17bYxMjRv/
UEfcBllGibmRhkby1tEBMF/QLi5p7//Sd6JH6kjK2LkYjB1+j1Sg/v5tFHgnh0mu
QhA9FH7PXX7xVsdXJM+IX5UOLFQix46a7qJWvO9oMK5/5e2h8foOsNHqQOZG3CA=
=Zqv3
-----END PGP SIGNATURE-----

--x+WOirvrtTKur1pg--
