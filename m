From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v6] usb: gadget: Add UDC driver for Aeroflex Gaisler
 GRUSBDC
Date: Mon, 23 Dec 2013 14:40:21 -0600
Message-ID: <20131223204021.GD15101@saruman.home>
References: <1387830349-12241-1-git-send-email-andreas@gaisler.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387830349-12241-1-git-send-email-andreas@gaisler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Larsson <andreas@gaisler.com>
Cc: Felipe Balbi <balbi@ti.com>, Robert Baldyga <r.baldyga@samsung.com>, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 23, 2013 at 09:25:49PM +0100, Andreas Larsson wrote:
> @@ -216,6 +216,13 @@ config USB_FOTG210_UDC
>  	   Say "y" to link the driver statically, or "m" to build a
>  	   dynamically linked module called "fotg210_udc".
> =20
> +config USB_GR_UDC
> +       tristate "Aeroflex Gaisler GRUSBDC USB Peripheral Controller Driv=
er"
> +       depends on OF && HAS_DMA

I applied to my testing/next branch after removing OF dependency since
OF provides empty stubs. I checked that it builds cleanly in x86 and
ARM.

--=20
balbi

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSuJ+1AAoJEIaOsuA1yqREti8P/jbbGVHE2kNhO2qkPYaJ+5MS
D77ABMlWbcQb+C7DI5C1JBMbwSAoKNoqWssD8+QoUv09bBMYvTMhxh5qRhZScrdA
CFM+JQCe6Gr3/nG3/z2uCpb0NntkfSE7fU91ua5y4QGke7iJ3IARsc7i94xyr0gK
xcs6LrtRfpeWwZadheLPto9a9DoaYot1mUGdJBuaar0y/yasNebyoFRYPxGee8u+
rIqBsx428Wz/tK3oOPERVkHChQ2LLqLM6ggMxAyEBS5PZ4mQ/7pkper/koEV595M
uqaKzRSoIWvE7YRq8uF57fVYjqKIdyKEYc8H0u9ip/6XekFFJQhDHizmZLd3hVxo
6V1yHmlOJsEQNPLkvc+719x7zn7z2hQPf/a1AP7K2k0HYlm0/0WluE3O0h3U7FYs
bGO1eRF6hx7juaAtgqkPZkfWFUvOV2iVn9n2cAtWNt6K6zHRC0tQ1qpzTAHPIPNi
Gw+2cfREarWYPt2dn2o+MHH9EuErpIiawTElXYl+gqAWunjq2WCBmjP51PbiXxTP
sJVGDMPo0Rw26xCtjdDYaPN++wo8kI8/HE7xgqQ1H7byTRaQuVxcfBrU2n6Gw5tG
p0NP9r+8zPnbyEXmsO9hRY3FDVAjuQU+qUfyRxwdlf+6vrS4uaN1Jtk0+mXmEk3G
2juHacgMeW6lq/ZMgvD2
=4RMt
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
