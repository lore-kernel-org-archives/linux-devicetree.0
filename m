From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] regulator: Add support for S2MPA01 regulator
Date: Wed, 8 Jan 2014 12:30:02 +0000
Message-ID: <20140108123002.GY31886@sirena.org.uk>
References: <1389162390-4582-1-git-send-email-sachin.kamat@linaro.org>
 <1389162390-4582-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pt/BdA48mw0ySYRj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389162390-4582-2-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Pt/BdA48mw0ySYRj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 08, 2014 at 11:56:29AM +0530, Sachin Kamat wrote:

> +	if (!iodev->dev->of_node) {
> +		if (pdata) {
> +			goto common_reg;
> +		} else {
> +			dev_err(pdev->dev.parent,
> +				"Platform data or DT node not supplied\n");
> +			return -ENODEV;
> +		}
> +	}

The driver shouldn't need these to probe, it should be able to start in
read only mode with no configuration.

> +static int __init s2mpa01_pmic_init(void)
> +{
> +	return platform_driver_register(&s2mpa01_pmic_driver);
> +}
> +subsys_initcall(s2mpa01_pmic_init);

module_platform_driver().

--Pt/BdA48mw0ySYRj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzUTGAAoJELSic+t+oim9F7oQAIMU9mZu44894P1CKlL/x3io
1kRJBv20T76gg/CIge4Y9m0Bq7I3ztbUT+Muv/tmfUZZ3E5nPLgePZXYEFhkxjRD
jEdKkRVUJ4LkQkbakU9cT1nVikBRcbNgC/AWvFZwUlQCZXTcKZNfKrcv/ml1Lk4n
5hbvN2W4LGYJjIqE/PQaMI/yMPkBvt8fBqQSwxQqJ/Uibqw172VUCBrzdkV9GcTG
6hPy5bDC43Ws/ZHQNKgzouAw+5/i04EdJ8c7cNzGmXUVVScXV5kN5zMpTf2bb+bY
e8TWRsqMTTRZSgdyVk0V/4z3Q3+z48GXVA50TLcsZ5+AGWSebHcPHUkLqhzXArEJ
mF7ApjFtvklhiL1c+yVBHEC8Oj1Rx4gSkgc6QvuWdFdfnh38GuTwiDsBRvLSpSu0
/wuTen3PEHw3C5wU+62rMmS/ktJBt4Xmn/cW6OsvnF+zsc1zhT3j63j6fbUzJS8d
Y8d31RcjZxgawnHtlhp3VINiDwGGE4xKA+l8nZ5PzZZftCo+x7qP2/DjK8ebk4pP
Lq+4IdInRXyF8F3k078kLm2xEk6y+mLrDGHOJM24nOV5SzmjDrQgkFrbK4gGLWr9
BvsPfW1lgtpV/gkf9uYngpbcFd/H6qwVKJGXM/jSB7T/W/rs1SnRw9RuBdQgATnX
2c0mzd7NP5Mm/aLc9N/Y
=31zK
-----END PGP SIGNATURE-----

--Pt/BdA48mw0ySYRj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
