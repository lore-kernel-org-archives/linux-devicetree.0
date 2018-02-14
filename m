From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: stout: Initial r8a7790 Stout board support
Date: Wed, 14 Feb 2018 09:52:50 +0100
Message-ID: <20180214085250.54r363tkjmswwgwl@katana>
References: <20180213232948.31521-1-marek.vasut+renesas@gmail.com>
 <20180214060547.bf6upib2mbgoexas@katana>
 <CAMuHMdUYDWXF9uSzsYEOeOVysQKRSFhJ+bLbPhwFbMs-qBjbcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yzxdr67xvityphxv"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUYDWXF9uSzsYEOeOVysQKRSFhJ+bLbPhwFbMs-qBjbcA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--yzxdr67xvityphxv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> The other R-Car Gen2 boards use 115200 bps for U-Boot and Linux, but some
> other value (38400?) for the SPI loader that loads U-Boot.

Yes, mostly correct. I am quite sure I have one board which has non-115200
for U-Boot. I am not at home currently, so I can't check now.

> What about U-Boot commit f40574e2d78c96a3 ("Kconfig: Migrate CONFIG_BAUDRATE"),
> which says all R-Car Gen2 boards use 38400, before and after?

Don't like, too slow. Can we change it upstream with the reasoning that
it is a) faster and b) BSP-compatible?

Regards,

   Wolfram


--yzxdr67xvityphxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqD+NwACgkQFA3kzBSg
KbZoKQ/+I3ebmBHzdTLYS6IcsvgjJIvo5qru8nCqs7DzwBZxO3A4PGe9yiRIiL0z
rX6QRBnI2ZrNemYLeAjLMilZJLLZyR5efUJttxzwRujC0jh3yfy5Iq0WhzrN/MXs
m8Ny8kiJG8ISi/Sp/LqpFvqSEvS6N9UB6RbpNOI7zvxIhXdKIJsy9l7fRyyTkAcG
GGxOtJ3OglwdEbrc468axctFBoU1JnZEXznBRogj/rYbGPfL4dGdM491KHnChoFc
dCdcdJ/Qqlixiif9vEesOP5dgASIkm+PL1mvZ6VWplZTg4P/DIvihX6Hn5CbHe2q
MeqVl7prpyGUES7N9iBFFhO3fZ+yJteksWhLgijBLtLS4nMXA9YaMI+JOHeOJqCr
cXzSuC4uT2xZ/zU7JbxTSOvnPuvsSdnMwLEeOVoIvAirTnj9wDPtSvrnZFs5IyRw
Ch18opV558YXVJrKa/tRA17I5LV6/7iPr3Z9jbEdqVh87A5GilsDTP7CYpIAWH/n
gd2yf8kr+se9SWLIg6MjMtIzoyNkAg9mGbC8pbi/lnZ3cpemoUvQ1DGVPglBSkOo
4t3vBjEczwtLHu0xROsRmk9ABeNO7c74Udc1GHlFfTBnqyYnw0aM+fsNSonClbMm
aqEHUXcBXsN0Rb00fRsRr0Kbp1B1IqXFbeLJKewlZi10alAsMOg=
=aKXs
-----END PGP SIGNATURE-----

--yzxdr67xvityphxv--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
