From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 09/13] drm/sun4i: hdmi: Add support for controller
 hardware variants
Date: Tue, 26 Sep 2017 12:01:50 +0200
Message-ID: <20170926100150.5rgmraenrriekhna@flea>
References: <20170926065919.24446-1-wens@csie.org>
 <20170926065919.24446-10-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vn4jicumbtbjskss"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170926065919.24446-10-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vn4jicumbtbjskss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 06:59:15AM +0000, Chen-Yu Tsai wrote:
> The HDMI controller found in earlier Allwinner SoCs have slight
> differences between the A10, A10s, and the A31:
>=20
>   - Need different initial values for the PLL related registers
>=20
>   - Different behavior of the DDC and TMDS clocks
>=20
>   - Different register layout for the DDC portion
>=20
>   - Separate DDC parent clock on the A31
>=20
>   - Explicit reset control
>=20
> For the A31, the HDMI TMDS clock has a different value offset for
> the divider. The HDMI DDC block is different from the one in the
> other SoCs. As far as the DDC clock goes, it has no pre-divider,
> as it is clocked from a slower parent clock, not the TMDS clock.
> The divider offset from the register value is different. And the
> clock control register is at a different offset.
>=20
> A new variant data structure is created to store pointers to the
> above functions, structures, and the different initial values.
> Another flag notates whether there is a separate DDC parent clock.
> If not, the TMDS clock is passed to the DDC clock create function,
> as before.
>=20
> Regmap fields are used to deal with the different register layout
> of the DDC block.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vn4jicumbtbjskss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyiWOAAoJEBx+YmzsjxAgPMcQAKhJka5rdrFFsuwE4TzuM/uL
01lg0F08m96IHLjmQoZit6Wopz6E1ABGLdkjEG1TFAXZU+bvBi19xC4X6K6MUaIj
HhR5cZOauwQBliHkOR3Z9Wzxfzu9Z7zO+c76DAqvyaWgSR3DYM3Vs/jE6hQCj5Nb
H6G6tHV9M9Jh0holZYsewec6x87N8X3IVkqm/lF/MMN4UbJDLviu9bhcUaN4Sp73
xfsp3cQ7E7WIQW3cQa/prQXn9IaLBoXAAblzlyxY3KZPYYyrTSPal7o4BghT7inb
glS1evTlnXZNE0W9azkVkwnm41fXnJH/JBWa4dQtVAenzp6SlHt8lBDHk6VGcgal
qcxLEb4CawFkmC0nQSwEoBAEmUhiReqLn9IdZ6MNQMzEL7pZPa9wnQ9676xaYHyV
FGROBVHTOKyjpFRfbyNMp2UeRMoba4E7QNTykBuwyaRTSza1l/7dcaaKMs1cbWkH
iHWCT9q0nNmWCjFiW2vMeOKpEy12chiDy9j0S9T4hkARnha2GEINTLy9Ly2m5b40
nbprpEAbz6T4wdrP5KIGNmiiYU+dhCWBMxYaiYGCYM2CGdhgnGLl/OcxwKngF0ya
yd8w/tjgydVppc9mNouf96dG/ZSdh1JHjFeCRiUN3i1HQ5qP8H44yCSEV0vcXtlS
ZK17qJzwTsub7bSeN9Zb
=JMgp
-----END PGP SIGNATURE-----

--vn4jicumbtbjskss--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
