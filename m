From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/7] spi: pl022: attempt to get sspclk by name
Date: Wed, 12 Feb 2014 15:13:49 +0000
Message-ID: <20140212151349.GR28112@sirena.org.uk>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com>
 <201402111508.06267.arnd@arndb.de>
 <20140212103329.GC21992@e106331-lin.cambridge.arm.com>
 <201402121221.51233.arnd@arndb.de>
 <20140212114740.GE21992@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BouVgDkIlpb7X6Bk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140212114740.GE21992-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--BouVgDkIlpb7X6Bk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2014 at 11:47:40AM +0000, Mark Rutland wrote:

> I assume that for the non-dt case it's possible to name clock inputs to
> a device without the clock being associated with the name globally? If
> so we could get rid of the index usage entirely in this case.

Yes, using clk_add_alias().

--BouVgDkIlpb7X6Bk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+4+qAAoJELSic+t+oim9hV0P/jf9sJszo/ILX1oan8MJoC1G
AymPKzv7LEsV72IUsR5H795g+IVhcxTuKYEI6Pw/HsmEmtjUiQgwSoD6invjWR1i
68f79NFGkN4ah/EdVXqs0vyKC4Md/agfRHfOfSHDxo3X9G/E2MCZMMVSvkqE8GSJ
aKbWcL9Attq5VAUKpm3aiVZTCaAIcQRRDrRw0A5FycM7ldSIzRoTpDjb/IUi9opC
Y4Bsp2zQrZrZAPiBz/alfDvxVHGhOkL7NUfpg96nYP19sdTMF5w+TseQGLjGZtbk
uEdZgrvBj60R625Med9h89ULaTSaxSV90wBCspVqo9wz1TLLFT2gz7rlJKzBiBqE
TzJsEehpO2sbb4ttFQXRXTuQJCUhWGDaRcj9litGPGpf3P8/69SChK4UpD6QxIcZ
r0/sYOTRSRcHmf/jg/w7NtTUx2RmwiGeyci3MShDLudqQOQuLQ3MZOgvWROaiGG3
ogJZ+4sl0UxSAH1dUVk9Ig+hYKL8syAtj9bbHGL6/U0IeJVCjUuyKC97kQaYpt9F
Fg8T9hDwRaJf61KA1G/va/g97t2uwiHGN+VNDisq88iXRjbdhRYywd5Yv7Pv688A
D9qKgUObZI94xx11seX5MuSTJTGnLKBLC1+vfXRfypahTOyMBKTpFSPgEncO5YtO
rj9hRZlWaq7KBK8VI3kU
=WZOS
-----END PGP SIGNATURE-----

--BouVgDkIlpb7X6Bk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
