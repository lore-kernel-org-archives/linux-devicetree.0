From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: ux500: switch SSP/SPI clock name to "SSPCLK"
Date: Tue, 25 Feb 2014 13:45:46 +0900
Message-ID: <20140225044546.GY25940@sirena.org.uk>
References: <1393246613-16197-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AUktWYIGnQAUTSPC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393246613-16197-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--AUktWYIGnQAUTSPC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 24, 2014 at 01:56:53PM +0100, Linus Walleij wrote:
> As noted in recent discussions the name of the core clock for
> the PL022 derived SPI blocks is erroneously named in the
> Ux500 device trees. The kernel doesn't currently use the name,
> but may do so soon so let use rename all these clocks in
> accordance with the name given in the PL022 TRM (ARM DDI 0194G).

Reviewed-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--AUktWYIGnQAUTSPC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTDB/3AAoJELSic+t+oim9bCIP/ixRX6R4G+yZpxeJY5uyl6pe
dnV7vWuAgeJzAgZCR9ntMe8RC9+Tm4iYd4oMk6nKHUmzMQAxWF/DG60VULtnGkKi
DwYaNEibgjinsjH9sfrIv6icZxEOystkptrXa2QN0h5HbGfMm+0iLI3GJdTzRY1A
25gv2KQkwVSboVSsHQjG4Fmbyx0C6iuWqQX0enyrn+MrbLIImRCkrBhBs3g2Cpz2
ip61R+ytjcGDJH41Ez/2Pq+H3Sa2gG1tVbntKJp2tJnQmVOi6AA89ICOJq6Zwywo
lfG+0B/e13j5hy20nFsggERVUFgYFi/psodmInpFR4ZyNblTdsj8MSPGghodS4C2
3VbVGmxjD/3ACLq2pygtRuK/Hg5lHIJ8ggiz2lLlSpBThlc361P4/MzkIAQ7FhXN
8WrvyGFIrGGTjav1ZwygH1EaYMBIxVd5bEPkIEefM+rOWa5XFvHtE8ZaEHFtPMYy
DQZxwRtGIa1qWpYHawaBNMVHZfOFgTxKwAfiTA392ToPLyb/qVxTW6Y6hZMzUcu7
KASZc88+sY0TDPdWPr+K0mxq5o75ihsx+yDtN7JUZkZ1VuWWwB4bcTm+lgnbKDDa
8MJTwlk05eWjVUFgeIP/DDyzxI/Xn8beCJ7Slp8MLcVJYBwR5Q+fdHtmtxx2Ixxf
7JSjAdl6rGqS0PGP30mg
=WHyC
-----END PGP SIGNATURE-----

--AUktWYIGnQAUTSPC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
