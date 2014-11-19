From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v7 7/9] regulator: sky81452: Modify Device Tree
 structure
Date: Wed, 19 Nov 2014 10:14:20 +0000
Message-ID: <20141119101420.GX22111@sirena.org.uk>
References: <1416213190-20935-1-git-send-email-jack.yoo@skyworksinc.com>
 <1416213190-20935-8-git-send-email-jack.yoo@skyworksinc.com>
 <20141117141836.GA2722@sirena.org.uk>
 <20141118080451.GA3319@jack-ThinkPad-T520>
 <20141118112056.GA14734@sirena.org.uk>
 <20141119073954.GA3665@jack-ThinkPad-T520>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3rzwkXnKuCXxoL5m"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141119073954.GA3665@jack-ThinkPad-T520>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--3rzwkXnKuCXxoL5m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2014 at 04:39:54PM +0900, Gyungoh Yoo wrote:

> If of_match and regulators_node are assigned, don't I need to
> call of_regulator_match()? Does regulator_register() call it internally?
> So can I write code like below?
>=20
> static const struct regulator_desc sky81452_reg =3D {
> 	.name =3D "LOUT",
> 	.of_match =3D of_match_ptr("lout"),
> 	.regulators_node =3D of_match_ptr("regulator"),
> 	.ops =3D &sky81452_reg_ops,
> 	...
> };

> 	config.regmap =3D dev_get_drvdata(dev->parent);
>=20
> 	rdev =3D devm_regulator_register(dev, &sky81452_reg, &config);

Yes, exactly.

--3rzwkXnKuCXxoL5m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUbG17AAoJECTWi3JdVIfQRMMH+wQ4CWnx0TsuIabIPrnoNu0b
yImmel5gWDXfT8TXYI5wSrYwFC+eQOFNjq91xNnwZAMFrFmgq0nO8NBPBm5gJSCB
aOtnm/fvZ275QmnEPMgd9W/Sl1GYDo2Araqsv1FT4NpxUXbOIy7YMBfBJtFwX06L
T5xHr21x/9RbdwT4++Z8UHYn4x+rY2TZk9MIIc/WN4wxALGhoEzIxgztlRiulvUY
jTtBKXhwB3JrPisWOIegMZs3zO25E3c0p+23288QQlgi6IwnzHnzdGJZ+rqkrdHn
TmFyqTZxy4QZADlrZ8L/neBxfoOtFwPyrfB5zD9asWDtaBsSz+Fjx6j9f8iQ/kY=
=xZVg
-----END PGP SIGNATURE-----

--3rzwkXnKuCXxoL5m--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
