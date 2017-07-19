From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] bus: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 08:22:00 +0200
Message-ID: <20170719062200.aixn34tcmxy3h6dl@flea>
References: <20170718214339.7774-11-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="npxhuceqcjearxql"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170718214339.7774-11-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--npxhuceqcjearxql
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2017 at 04:42:51PM -0500, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> ---
>  drivers/bus/arm-cci.c   | 12 ++++++------
>  drivers/bus/imx-weim.c  |  8 ++++----
>  drivers/bus/sunxi-rsb.c | 22 +++++++++++-----------

for sunxi-rsb:
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--npxhuceqcjearxql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbvqIAAoJEBx+YmzsjxAgK8IP+wfN8RMSp5hHH2oERRpMy5Eu
BfvpxezZq3D5F/Wgnv2EsY0tZpjqDDNHuNUinjeXLyeht9ALU+zzb7vzeHuDbqQh
lEf/PoJf8yvAPSwaNuz32lQeYVPnzYAKamlrH258wFbtI8uAtpKG72aSqsKV5GtJ
1adhMPGYeUdSrWNVg8sK5EdZxLnORzuhfkKAmdNunv8Xeco8dmxf1daA5omRc9EP
aFoe2F9XAe4DWN2bcR6pGP6zB3mf9YsfOkbgC9V9yVKG0n4ibzkEHW3t7gQnsk60
K6IJgewSFGHdkXhvNMN9jSoXBh7jtUG+jo6glsxVi+N0WJI+i5MDw91ezSnhHV67
BeGMa2cCBJ2m8p9NwRAUwsPSLz5VSMBQMVSrv4dDi4OMgzY6jjPTQxkgDfx2vLjz
0E895jkT+EGVPSf+jy7OjkWEPFPrqboqbvsR+fc+lVM6kgd7rcwharsb0W+0CnTb
l9hcSvR8d9mxTPVMYrOki9KeIIF+zASpZvyysbatoWGU/8RsP1scF0wljNq4qakH
OGZrZGJFNDKOFD324wFKHyTDcforQNw55iScZKuf/bxYJug5RdnIoF9CGZMdSJ6y
wSNtNNG3SKa6V2Cb+MrHNmOrcKhabzVjdNxx3HYmiSzLK76QyhlBsZKRtKjzA47R
gogoAWPO+UlDSFnV4qTl
=UqVh
-----END PGP SIGNATURE-----

--npxhuceqcjearxql--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
