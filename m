From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv2 6/8] regulator: isl9305: deprecate use of isl in
 compatible string for isil
Date: Mon, 22 Dec 2014 17:51:24 +0000
Message-ID: <20141222175124.GC17800@sirena.org.uk>
References: <cover.1418763328.git.arno@natisbad.org>
 <50335b337738057806dbe5f3171dedd6f84b9eda.1418763328.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9uNR01GrImESOVvg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50335b337738057806dbe5f3171dedd6f84b9eda.1418763328.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--9uNR01GrImESOVvg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2014 at 10:20:50PM +0100, Arnaud Ebalard wrote:
>=20
> "isil" and "isl" prefixes are used at various locations inside the kernel
> to reference Intersil corporation. This patch is part of a series fixing
> those locations were "isl" is used in compatible strings to use the now
> expected "isil" prefix instead (NASDAQ symbol for Intersil and most used
> version). The old compatible string is kept for backward compatibility.

Applied, thanks.

--9uNR01GrImESOVvg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUmFocAAoJECTWi3JdVIfQ9+sH/3UNfx+Ow0qg68ryusz3wNYu
BnYH6RMEDAz2s+wiyu8TC2gJ4/5g717dWx+opLX50CYfNWNmaOKpIPY1NLGseJW5
bTtxF/9LyubfaLzJjXYid9DJHEYoNbQnjEmYcDemgHHqxpcLie30NVwgqonZ1nGm
6epBihEPk3blM2PK68zYtfp7Ts9KVfICOtb9xI5xEakkrbVR4gb+81AWCFLn6yki
y8VvkNKiB1KGZwosNIu+Bq0CjES6cWAYYXD2rMaPKE8TX/L6eGc9bnFnrf3vBy8e
mKeXy+RNxtamXieRqgC4siI6u4UO+A3Snd/KnEMJed1s8wD/5I6wlett9AdXamU=
=cwnx
-----END PGP SIGNATURE-----

--9uNR01GrImESOVvg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
