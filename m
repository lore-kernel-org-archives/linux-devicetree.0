From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] regulator: fixed: add support for gpio power switches
Date: Fri, 16 Dec 2016 18:12:45 +0000
Message-ID: <20161216181245.274imcqn5irfqseq@sirena.org.uk>
References: <1481903550-3582-1-git-send-email-bgolaszewski@baylibre.com>
 <1481903550-3582-4-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="orgrmsuxr2d35bvt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1481903550-3582-4-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--orgrmsuxr2d35bvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 16, 2016 at 04:52:30PM +0100, Bartosz Golaszewski wrote:

> The difference between a regular fixed regulator and a GPIO power load
> switch is the fact that the latter may be controlled from user space.

This is not something I would understand or expect from the naming here.
I would expect the difference between a regulator and a switch to be
that the switch does no regulation, such things are fairly common in
system design for example as part of the logic that switches between the
different input power supplies available to the system to provide the
root system power rail.

--orgrmsuxr2d35bvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhULpwACgkQJNaLcl1U
h9AnWwf/XX5h03CDR4edqlk3mhAIljuoQQTtyfkCJN+eRLOVsgVrkLnp9Lz8KaEW
Qk9iIvTCeRtPySnGlV3+gi0eqhu9ko6BBj1zWtfJXRwSTwD1/4IAAMBLScHXPHMR
Vw3B4jc+SZugiawCoRCRKlBjmPAZTmtE2zV7qxbKJBH05tDOvP9CaOH+uTSaO7z/
RnobzeludzQsqJcRQ59vwBzaukW7pFaMs11ITONJUdU8pOaKp78rcA/I5lJVuEZs
Kgbm36AjUNXqyPDhrNzai/IECvYkeSpOtQ1Pw83S3MhF+t0yHc7A5myaPSveVp15
i2gt9p0KP5rNJhSefIVr7PM+hajcXw==
=I63a
-----END PGP SIGNATURE-----

--orgrmsuxr2d35bvt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
