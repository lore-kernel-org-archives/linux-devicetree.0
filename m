From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: regulator: pwm-regulator: fix example syntax
Date: Wed, 19 Jul 2017 11:56:52 +0100
Message-ID: <20170719105652.xuulgoucyr2xprru@sirena.org.uk>
References: <20170717131823.19687-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xbihr7j3uxd665uj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170717131823.19687-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xbihr7j3uxd665uj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 17, 2017 at 03:18:23PM +0200, Martin Blumenstingl wrote:
> The "Continuous Voltage" example specifies a pwm-dutycycle-range.
> However, an equal sign is missing between the property name and value.
> Fix this to allow copy and paste from the documentation when writing an
> own .dts file with a pwm-regulator.

Please submit patches using subject lines reflecting the style for the
subsystem.  This makes it easier for people to identify relevant
patches.  Look at what existing commits in the area you're changing are
doing and make sure your subject lines visually resemble what they're
doing.

--xbihr7j3uxd665uj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllvOvMACgkQJNaLcl1U
h9Acngf+KSv4aqgslGO4aUfHS1+mWdAd2j/L9qfpuT7iO/HZQhOK14Hd0IWOEYhR
jVIdD8LDSTK/sdz7HpgvXX93DzMAkre+uRK7og8m4eP9xU1IvfF1JgRkXb7RHVBq
PjpbYsKvYsYReQ4YkE12WUsuHYAmhEArWvWLX/Q/Be7Gwd3Xw+iNN8ghl9Kg4xCp
W1o/Z1N/FaEo3makpI4JpEGfYOR2iS15mYLjC1hl/qdKdXSgnOtkLC54mr0d0cK4
+TdIc2Pe5gQsq0nY/E8lCRugwY5UKHGCAqnGHYPNvrWUXgoTnAQw+cjy1sJFlcMs
167xela9lmPpMK1phOo7NG5dYoaZJQ==
=JA7F
-----END PGP SIGNATURE-----

--xbihr7j3uxd665uj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
