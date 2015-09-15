From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: tps65023: add device tree support
Date: Tue, 15 Sep 2015 15:29:46 +0100
Message-ID: <20150915142946.GF11268@sirena.org.uk>
References: <1442324035-16414-1-git-send-email-thomas.elste@imms.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rWhLK7VZz0iBluhq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1442324035-16414-1-git-send-email-thomas.elste-cSCHQGRfioA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Elste <thomas.elste-cSCHQGRfioA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--rWhLK7VZz0iBluhq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2015 at 03:33:54PM +0200, Thomas Elste wrote:
> Hi all,
>=20
> the following patch adds device tree support for TPS6502[0,1,3]
> regulators. It is largely based on the DT code of the other TPS
> regulator drivers and a previous patch I found here:

Please don't send cover letters for single patches, if there is anything
useful either put it in the changelog or (if it's administrative stuff)
put it after the ---.

--rWhLK7VZz0iBluhq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV+CtZAAoJECTWi3JdVIfQeAsH/jiP1IKBoXso9jiZ2EMruCgh
mHFlqT84hHGIQKzfbAQPCWw982RmvAuFpDVp/34BKuSeO1uO64TJVbdrb6IdicNa
fGUnDE2Z7ezcnjkyNUitLh7Rnln/x5QYeBwwR1nxDJJInuxGbna9WGOzIVq5PR2S
D7XJUkB0SgwG+A39vUTovEKr/kRRHXJ5xzAjTmtCDXA7oUVRrxZaUYjNYFbf+Ik2
nTxDSLH3c3Rq7LalPh2FbcpaioWRyWKpvujEzXttZViJyR6aGOBKCpWXELJXPgR5
GxdIE4uilT3saNIk9J+rhRDr3K9aVxVoa4q65AVAA/hUHG4B5ozETt77ZS4nDUg=
=oj2i
-----END PGP SIGNATURE-----

--rWhLK7VZz0iBluhq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
