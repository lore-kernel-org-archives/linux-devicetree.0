From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun[47]i: Fix display backend 1 output to
 TCON0 remote endpoint
Date: Thu, 4 Jan 2018 14:27:52 +0100
Message-ID: <20180104132752.pcixtjugwfvlshpl@flea.lan>
References: <20180103163155.13975-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ghu4skuw4u3vrhsf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180103163155.13975-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ghu4skuw4u3vrhsf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 12:31:55AM +0800, Chen-Yu Tsai wrote:
> There is a copy-paste error in the display pipeline device tree graph.
> The remote endpoint of the display backend 1's output to TCON0 points
> to the wrong endpoint. This will result in the driver incorrectly
> parsing the relationship of the components.
>=20
> Reported-by: Andrea Venturi <ennesimamail.av-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Fixes: 0df4cf33a594 ("ARM: dts: sun4i: Add device nodes for display
> 		      pipelines")
> Fixes: 5b92b29bed45 ("ARM: dts: sun7i: Add device nodes for display
> 		      pipelines")
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ghu4skuw4u3vrhsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpOK9cACgkQ0rTAlCFN
r3RrCA//eh6mI0i0UY7f0XBj4vP/WevV5+BM6ETlNvYzsOFwTDtFcPDm2UACF6FZ
052ebofr0C6c4GHv1yr/6383h3lB1t45PNN96V38gwbPNAJF1osmfRY/4XHorBT1
DNY/mHJ/vy5hQjhOfxFrbnDGue93f8gBnyaG+jKw+npYAYg9hs/5a1IcEgHEbViI
dUsxqmjzDxFmbhxm6bpUl2ENqBUaCkxTCSluGLehVKoX0u6Tss+3LG/jttuCD4yk
k0rnKhXW7iqEYcDcOsefrF2n2Y88oZkqbo2P5tMyPV9Cgm/m/su4ZjAVLyNfl/kY
MjZvn9iMle2kEFOpnHWilV9UKh9pGM3qI0q4oUV4dCajB1CPgcWUPfPLX0MFqXug
DUN9gH5s1KzPTDwtubeZfDzX+FMy6h7LHzcWAPihJiy/F51HgpEtAtWVIfmevc1e
HUX+H36ml+jLBqlbX/SB3h1mRinr4vYqWs8HHtNsTeB0y9VA9cCdxkE6oXLJNmLU
b/mZ4tKCBv82QevXkAMOya2J5bjLAcx77v5dlJm8xlUEaueYtJe3oqpgZetXj2lo
RovRoQip9kvf/PkyeSLXW7CeKzOMypq/7MPs9wP0Y0lD7U6XKti41KyphdOAh16B
FaYCxgZeCIafupYuNoudvnBX5CRbQNiajB4GLqo/XegYK8g6F8M=
=e8fR
-----END PGP SIGNATURE-----

--ghu4skuw4u3vrhsf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
