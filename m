From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] devicetree: sound: add binding for WM8974 codec
Date: Wed, 16 Dec 2015 13:44:11 +0000
Message-ID: <20151216134411.GM5727@sirena.org.uk>
References: <1450270975-17955-1-git-send-email-mans@mansr.com>
 <yw1xoadqeczx.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J055lv7UDsGihh+u"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <yw1xoadqeczx.fsf-OEaqT8BN2ezZK2NkWkPsZwC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--J055lv7UDsGihh+u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 16, 2015 at 01:31:30PM +0000, M=E5ns Rullg=E5rd wrote:

> This is the 1/1 you were missing.

I need the patch in a form I can apply.

> Am I the only one who is annoyed by scripts/get_maintainer.pl not
> returning all the addresses it should in cases like this?  Is there some
> trick I'm missing?

You can't blindly rely on get_maintainers, it's prone to both false
positives (CCing too many people, especially if you enable git matching
when it often starts spamming people who are just doing global cleanups)
and false negatives (if you don't enable git matching and it misses
people who care about a specific driver).

--J055lv7UDsGihh+u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWcWqqAAoJECTWi3JdVIfQXqYH/3HwKjjQioFWQNyotxgpNLx5
NoF1RJP2GMZW+jEbUwRqbN+mHTsjXvsSP1b9me6UEYdx0IwLS5hI8S8Qr/ko2Pp0
PI3bRFea0BCxju0DY1erANcrV7vNZEuWnKFwWD7MSCe23QcMycrU6XAGW5OjItgD
4Vqh7EfwGg5KWUWzCD52zb3+GkxFPrIVhyf4SqG6G/V/cF6Ftf6oswU/e5xszNaP
ZJXBhvZi4TzgVxngQ3d8uOzJCKld51KQig/WC2+GYWMm7KsBHUf2+z+SVsbTNt4s
EI31+k2NqVQ8rcm1C4fyCOWsAb6D7VnZndP1zjZIUQSl+envQniJClwweWLSrAk=
=t3cC
-----END PGP SIGNATURE-----

--J055lv7UDsGihh+u--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
