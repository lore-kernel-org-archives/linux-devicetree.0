From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 4/7] regulator: axp20x: reset probe data
 before each probe
Date: Tue, 17 Jun 2014 22:44:49 +0200
Message-ID: <20140617204449.GD19730@lukather>
References: <1402990723-28138-1-git-send-email-boris.brezillon@free-electrons.com>
 <1402990723-28138-5-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBUGRQKOQKGQE32NLPHQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402990723-28138-5-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2014 at 09:38:40AM +0200, Boris BREZILLON wrote:
> The init_data and of_node fields of the axp2xx_matches tables are filled
> at each device probe by the axp20x_regulator_parse_dt function (which then
> calls the of_regulator_match function).
> This means we can probe a new device and consider data initialized during
> the probe of another device as valid.
>=20
> Reset init_data and of_node field to NULL before each probe in order to
> avoid this kind of issue.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/regulator/axp20x-regulator.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp=
20x-regulator.c
> index 7a30f49..d42bf6d 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -324,6 +324,15 @@ static int axp20x_regulator_probe(struct platform_de=
vice *pdev)
>  		nregulators =3D AXP20X_REG_ID_MAX;
>  	}
> =20
> +	/*
> +	 * Reset matches table (this table might have been modified by a
> +	 * previous AXP2xx device probe).
> +	 */
> +	for (i =3D 0; i < nmatches; i++) {
> +		matches[i].init_data =3D NULL;
> +		matches[i].of_node =3D NULL;
> +	}
> +

That looks rather hackish, especially since we've never been in such a
case yet, since we have a single PMIC in our system.

Can't you just use memzero here?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJToKjBAAoJEBx+YmzsjxAgaE0QALRZXOtHAcI0agtdQEWQzDxM
u6FH4Losb5rSuPwzGpY5cOphisdfGJnkY3nVpD/IDSXrMXRLDxwjv2VBHYPbU5ai
+pvlyLX3GKyUpW4wHP3jl0rcY2y7rW9ofenKEekKAfoXKCFDOC/oqaT1vT1MpQRA
TDUir/JiosdSkLZ2wPOI5BuQGgCiw7YSSbBzuXRZKCYOUEHjWoLfKqy8pbQL2SKF
7HoDr5ll7ZrYzjQQz0qS8vW6Jjw11CAqMWh84lEkeP7nh7Jf0AeyCSEZjMsmAWdf
ojEA4DAVtg9D4334fgWCjj654riQ2+pd/R06fqjB/04Nu5/ZxWqB4gXNf+VPTomU
tvdWYU9W6fz2p28xg96x2uM3Nq9IX/l2GLWTpnyUX4CVL0pdL/q6vuH2D/1Bps8c
vRvp7EEDEXVkvJgCNODi8B5B34KCyV8B05L/QraJG/nit5utanwtZi4sG6hfIwWR
Aep/WgrHjhPkwkPM7wMmJm9VEWlGmdQO1/N8F3xrq9Rq+yje6sjBVBqbefo2osnj
eDDm5XVAVdsLlgGayseN1tDzGGjkdIbVESJ14dqlUUheinaAJ+JSAEXRpaXXBOS7
CfX2gVFw4Js4mwbuCvLZfjJS0+YjCNdxtHi0Rb5OVMDy2iLhCYIlZt29TE7LgMem
4xB2t2tKtJQHaFrAqCjR
=D+Cb
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
