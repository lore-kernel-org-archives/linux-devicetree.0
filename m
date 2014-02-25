From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: u300: switch SSP/SPI clock name to "SSPCLK"
Date: Tue, 25 Feb 2014 13:46:15 +0900
Message-ID: <20140225044615.GZ25940@sirena.org.uk>
References: <1393246638-16236-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b1v6sQlvMa/Wgwt0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393246638-16236-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--b1v6sQlvMa/Wgwt0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 24, 2014 at 01:57:18PM +0100, Linus Walleij wrote:
> As noted in recent discussions the name of the core clock for
> the PL022 derived SPI blocks is erroneously named in the
> U300 device tree. The kernel doesn't currently use the name,
> but may do so soon so let use rename all these clocks in
> accordance with the name given in the PL022 TRM (ARM DDI 0194G).

Reviewed-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--b1v6sQlvMa/Wgwt0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTDCAUAAoJELSic+t+oim9PsEP/iB5UFTIpbwT+kkA6Xu0MiM6
lw6RElC4DrOAkVyc09tAMSBb47Dd2qvYJwz5ZxnntKikcOS9ib2tBrMXRaCzGi/+
Y6o12NZeyvZmR/dHcpbQ1tvzV089gpMC1lUelMi2HAK8l1p50FCra7taz83S3Qc3
c2JLRp1Wmg4SUSZgyst3G90mjL7aHVndiW5pvpqKPkeEWxZvz6+4vo7om5B/DwJ4
pZAGF4fZmSEVwbA3z0IqodlFDuc+dU/P30bAltgK6CGONis1duVeUdgeOsqtHmze
lzu5iMPc9k+0vuLtEf23T7H0YqszW/NLkhAQTpZe+zo1Imags3lNVVtJOgiZkB2l
SC1vfcqCStbQHk8RUBZoMDXUAjgch0iFCWvE/ddOabxu5D5PrT6ZzFZ9IuxtXX6B
dqzgyu0obr7O4fWxp0qrI+QU6pO29LcpPrfSJdzhPhlGzZR7T1VRuTC4NkmMQwrS
APNa3YU/IWymYcbvawG1PG20+d8i646raJN0u0lxTAaLxu+vTIuVydOBIlPmC1Al
4j95EJ3CELENpZk/awKRw+jgIYg1gQg7v2S6WDxqJfYi/kxjXR49jTXgyujxYi+z
9yjuS+ynzt9RPQketIWrLXd4+7LG5Q/W1eagfOSoiqEDmhN/shdf4qSTeB59kDvF
mT5XnQmYyf1MDVFLKhT5
=7gpg
-----END PGP SIGNATURE-----

--b1v6sQlvMa/Wgwt0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
