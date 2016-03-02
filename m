From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 2/4] regulator: core: Add support for active-discharge
 configuration
Date: Wed, 2 Mar 2016 19:25:21 +0900
Message-ID: <20160302102521.GE18327@sirena.org.uk>
References: <1456902130-22406-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LoEz1ZW1dAUVDMY6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456902130-22406-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--LoEz1ZW1dAUVDMY6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 02, 2016 at 12:32:10PM +0530, Laxman Dewangan wrote:
> Add support to enable/disable active discharge of regulator via
> machine constraints. This configuration is done when setting
> machine constraint during regulator register and if regulator
> driver implemented the callback ops.

I'm missing patches 1, 3 and 4 here.  Please don't send patches numbered
as part of a series outside of the series, it makes things confusing.

--LoEz1ZW1dAUVDMY6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW1r9sAAoJECTWi3JdVIfQ+qsH/0/OMPtoIV9CGqeY7zImMqu8
dyeePur6TGGmHJHoGUMOcAuP4sjCXqo2M6Vw7ZwJgSqcYaGxfkE2JiLmvgXVsFOJ
EqRCqewG9gydkQUcKzJDBR0pcp0ayKjj5TATnL90IxFvMwlXhYge+OzN6VJX0hc9
rLGy8lqaflzBQJIjK9K+Gv5Jm8H0wI9VhG/yIrBSu4uxZMZx1lax72DaLKObraFE
pVaa4CgVCm6gKA26YS05q8UXXDvAWpHX4BcWQ3ckjdUdFet5UK3uzbIVnHUd88JQ
7H1gdkN7rWXj6XqlIazWWwOuw9cXCi+ZByl/50NCSwGKCUTE2B76tKaFx6/baIs=
=EonS
-----END PGP SIGNATURE-----

--LoEz1ZW1dAUVDMY6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
