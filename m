From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 06/12] regulator: axp20x: prepare support for multiple
 AXP chip families
Date: Tue, 10 Mar 2015 20:05:57 +0000
Message-ID: <20150310200557.GJ28806@sirena.org.uk>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-7-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ft0o2zvssPbUStej"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425988764-23618-7-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Ft0o2zvssPbUStej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 07:59:17PM +0800, Chen-Yu Tsai wrote:
> From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Rework the AXP20X_ macros and probe function to support the several chip
> families, so that each family can define it's own set of regulators.

Wait, no - sorry.  I'd missed the defines being added earlier on.
Instead:

Reviewed-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--Ft0o2zvssPbUStej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU/06lAAoJECTWi3JdVIfQ3fIH/1b/GmGvdDDGbXgFbrXm/Nhb
MuKQHesQOIXJvCJIK/+OGJvqU1OE4FPixnMsXHneddix3TQOUpouuNWUHKNGKmNV
K1R558gWC95yKZp4ehQQlEt5Cfj7k39f9xfiv6pjneJkDNGoBfO4fNi9HE4H6NA2
IUqeMQ2w1SvOQ+kjVQtx6sjHajqthdFOZkqldCxIEzZf1DYMMdwNaPpyOWSIlN7R
bH45f6YPRmUhBU55iW7EAIQS3fiXGz34BLX5q1yL5icugWlv1+GJqkN8veiIRFIi
hoeE1eRFQfQcGd6gk3EbmEsqlAr1ve+a2RPmDSTx+Zs3GYkC+2AC7+xC3yB/dUY=
=nAJ7
-----END PGP SIGNATURE-----

--Ft0o2zvssPbUStej--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
