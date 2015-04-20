From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] regulator: max8973: make default/unset dvs gpio as
 invalid gpio
Date: Mon, 20 Apr 2015 22:15:14 +0100
Message-ID: <20150420211514.GO14892@sirena.org.uk>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com>
 <1429534457-15515-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aIbcA3MSwnGacr4f"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429534457-15515-3-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--aIbcA3MSwnGacr4f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2015 at 06:24:16PM +0530, Laxman Dewangan wrote:
> If platform data has dvs-gpio value 0 as default/unset then
> make this as invalid gpio so that function gpio_is_valid()
> can return false on this case.

OK, so this handles the problem with the first patch - it should have
been the first patch to help with review.

--aIbcA3MSwnGacr4f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVNWxhAAoJECTWi3JdVIfQce4H/ibL1Tg3Svc0U1wkQAPS69WP
Rj5luDIgJbeuzozqpTcXUAiDyz4wX4FoCTwH8toMYTohplNSkQcPm0HY1KOiUVNS
PVVL6G+4Vg9cZyaeoU8qzy1F7TrJWTO0D4QppuHzpFJQHnAe9Xk8Ex9SszPvnI+j
aq5KIEckfrmFq2s2fcX8klBW/sEJFA2ch/JIDD0ihLondOO0K9UPoplZepL665ML
xOSXQa+sJgghgyJPfaMCTYAtIlNkgzx5/GBtx2zS8XT6UOsMq6z520Qi7MvDht4R
uU69lIWEnw+4eclJLigJVxTEVJ2lCjC11QAlZi7WW0zMnEzr3sS5mDV/FDRqTz8=
=MAqy
-----END PGP SIGNATURE-----

--aIbcA3MSwnGacr4f--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
