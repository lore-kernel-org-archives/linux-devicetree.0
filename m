From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/3] ARM: sun8i: a83t: Add support for I2S and I2C
Date: Fri, 15 Dec 2017 15:43:07 +0100
Message-ID: <20171215144307.t7fyb3fzc7rqwthr@flea.lan>
References: <20171214042350.29469-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vsamr53qqb6ui4zm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171214042350.29469-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vsamr53qqb6ui4zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 12:23:47PM +0800, Chen-Yu Tsai wrote:
> Hi everyone,
>=20
> This is v2 of my A83T I2S and I2C support series.
>=20
> Changes since v1:
>=20
>   - Dropped ASoC patch that was merged
>   - Added SoC-specific compatible strings for I2C controllers
>   - Added Maxime's Acked-by
>=20
> This series adds support for I2S and I2C on the Allwinner A83T SoC.
> The I2S controllers are similar to the ones found on the A31. However
> the TX FIFO and interrupt status registers were swapped around. This
> seems to be a recurring theme for the audio related hardware blocks.
>=20
> Patch 1 adds device nodes and default pinmux settings for the I2S
> controllers.
>=20
> Patch 2 adds device nodes and default pinmux settings for the I2C
> controllers.

Applied both, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vsamr53qqb6ui4zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloz33cACgkQ0rTAlCFN
r3T+pxAAiJHTL8nduMU58qUP0Mci/S0qrvxPO+Fn+B5I/HD73YuZMVvHMUCrs1WX
voKmJ1YREqnSxa4gOiARGkXIE30GQOjJ5rwiI5c/zRXe5talVA/szEppbNsLNFeG
w2WpRMXzKZtXUC+Whxs+KnSgzdwLP1/QWoIolipUiGIXT6hGBlKpyQcuY9JM67MR
jQ6a9lwTnufk6RZTUHPULPeEOusip3aOT0XSBC3BEvgGYxdEz+kh8pbLDDmB4VxE
SsxJ5PrauqPUWWqtNIAhmVSfUGJ+7hJMfkhxKvZYfuCVed2oWBmI8tbCFQU5Pl4f
horPZ+nqUOz3w/D8ZJ95ResodjHPcdJdYGj5ak1Pz+kK+Ti484tE9AiXe6VXNJsw
5oWTwWm8g/XpMaiXvyTUMqVuUpVwecOK3gA4Z2eAO6jghsQjIUqcSukazDA1TeOk
jqFI8fDUjB9acZutBws2Rhy+g2BzYE3Rj5gCj/ybQDAPE2GbfVDuj7pKg66hOmKT
KM/Puqu/Rz9jWKxeTUPArmlIIZkGicKW7ih54XKhINF6CGl6/dBLua9mJI9NmS4+
jc5hP8v5qmnytg7SlJ5TBcAs2/4f6VlOY1S1PSxokCVWtxeqeR2swxobhIhh9jl6
666UztbkdaihTcbZUCStFjz0sulMvgMSFVfYg8+VZfBT7bIRl38=
=R/z7
-----END PGP SIGNATURE-----

--vsamr53qqb6ui4zm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
