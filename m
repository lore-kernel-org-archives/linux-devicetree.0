From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] regulator: pfuze100: add pfuze100 regulator driver
Date: Fri, 12 Jul 2013 15:40:37 +0100
Message-ID: <20130712144037.GJ24508@sirena.org.uk>
References: <1373604855-17714-1-git-send-email-b38343@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2179986935098560423=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373604855-17714-1-git-send-email-b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============2179986935098560423==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o9mtL5OVI48+DSkO"
Content-Disposition: inline


--o9mtL5OVI48+DSkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 12, 2013 at 12:54:15PM +0800, Robin Gong wrote:
> Add pfuze100 regulator driver.

This looks mostly good.  A few small issues below but nothing major.

> +enum pfuze_id {
> +	PFUZE_ID_PFUZE100,
> +	PFUZE_ID_INVALID,
> +};
> +struct pfuze_chip {

Missing blank line here - there are a few other small coding style
things, checkpatch should help.

> +static struct regulator_ops pfuze100_ldo_regulator_ops;
> +static struct regulator_ops pfuze100_fixed_regulator_ops;
> +static struct regulator_ops pfuze100_sw_regulator_ops;
> +static struct regulator_ops pfuze100_swb_regulator_ops;

Better to just reorder things so that no forward declaration is needed.

> +static const int pfuze100_swbst[] = {
> +	5000000, 5050000, 5100000, 5150000,
> +};

This looks like a linear map, the steps are all 50mV?

> +	num_regulators = pfuze_get_num_regulators_dt(&client->dev);
> +	if (num_regulators <= 0 && pdata)
> +		num_regulators = pdata->num_regulators;
> +	if (num_regulators <= 0) {
> +		dev_err(&client->dev, "no platform data,please add it!\n");
> +		ret = -EINVAL;
> +		return ret;

You should just register all the regulators rather than only registering
those that the user explicitly selects.  This allows users to inpect the
current configuration and simplifies the code - for example you don't
need to count the DT nodes and you can just have a simple array in the
platform data (see how wm831x does this for an example).

> +		/* SW2~SW4 high bit check and modify the voltage value table */
> +		if (i > PFUZE100_SW1C && i < PFUZE100_SWBST) {
> +			regmap_read(pfuze_chip->regmap, PFUZE100_SW2VOL +
> +					(i - PFUZE100_SW2) * 7, &val);
> +			if (val & 0x40) {
> +				pfuze100_regulators[id].desc.min_uV = 800000;
> +				pfuze100_regulators[id].desc.uV_step = 50000;
> +			}
> +		}

You should really be doing this on a copy of the regulators table rather
than on the table itself.

> +	for (i = 0; i < pfuze_chip->num_regulators; i++)
> +		regulator_unregister(pfuze_chip->regulators[i]);
> +	kfree(pfuze_chip);

Use devm_kzalloc().

--o9mtL5OVI48+DSkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJR4BViAAoJELSic+t+oim9vNEP/3batZMGIYpsUfgzHKX2XMB4
KP9X1TkR++c8/B2OLHO53kIRu9bAQZ+2uNZrwOogl4w1OQLAL0ziNeNBzIcs7BUe
zkAjrgkSveG3M6e/WBjx4fVxAnvfM5p3Ymy5stwxdnrUeX/G4pRB0eFBkXdtqbws
kouDTsZnFjLc4jMGu0ZJbFJYhGKX52D1FyjrmftRexvAt9VC812KQ0Ysl0L+Z1Il
JnKR90oKoFALvBIWHGSA7A0muo5M/l4c80ZSFeLjhvtYv1BE/ppPQdCZXk7UcOJo
PF9sxeijg+v87oUpOROGXHFgOXwhwLFBy5l/IIxHNuUPysPnYroK+UreYF+MrQiV
pQeZ5wtKnf0SRFXrUFqTQpDQsgnWcQj86GYkowPS9qUv2SBKspAdsZP0zgzCUSs4
9HjW1K/tZR3PK1xF29r5bC9FrQNIAXvBzvutlPvxTMMvwGBiDrFWLEbzXqBLLi1f
dC7UF82UNxlOmp/sj/iw+Uljg8VRFcY/k3f1VCNw1Jw+XjJPtjY/aVjYfc/w6soG
DK6Sh47/rEentR6HebUmlxr9hG0h6GGfgev1e32jynR8VLgxWBPoFBc3S8GJTB6Y
j4RNwPlgqy6RtRzEaG/UVihFr0CFmitsshbwFVUvBbRky/5QZNhXoj3Dd8OgZPQD
pMidxTcj1GUH6SI77353
=QY+C
-----END PGP SIGNATURE-----

--o9mtL5OVI48+DSkO--

--===============2179986935098560423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2179986935098560423==--
