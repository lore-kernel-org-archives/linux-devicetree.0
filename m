From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS files.
Date: Wed, 12 Feb 2014 19:32:52 +0800
Message-ID: <20140212113252.GE15434@pek-khao-d1.corp.ad.wrs.com>
References: <OF6F6A0029.3B20EF5B-ONCA257C7C.0071BFDA-CA257C7C.00732AD3@csc.com>
 <63AEBD99-AA87-4FD7-BBDA-0CE419959F14@kernel.crashing.org>
 <52FAA97F.4060600@gmail.com>
 <1392162080.6733.404.camel@snotra.buserror.net>
 <52FAB65C.4090201@gmail.com>
 <OF9BA019D5.46DA1E29-ONCA257C7D.000089EA-CA257C7D.00020333@csc.com>
 <20140212052816.GA15434@pek-khao-d1.corp.ad.wrs.com>
 <52FB3108.3000202@gmail.com>
 <20140212103153.GC15434@pek-khao-d1.corp.ad.wrs.com>
 <52FB5A56.2050402@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52FB5A56.2050402-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2014 at 12:26:14PM +0100, Sebastian Hesselbarth wrote:
> You can cook it down to:
>=20
> 	m =3D matches;
> 	/* Check against matches without compatible string */
> 	while (m->name[0] || m->type[0] || m->compatible[0]) {
> 		if (!m->compatible[0] && of_match_type_or_name(node, m)
> 			return m;
> 		m++;
> 	}

Will do.

Thanks,
Kevin

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS+1vkAAoJEJNY7TDerrFxuPAH/35IeHA5uhRgxvf6ivmqyALw
KocnO/HzKq55W94q57jrqMlflZFKUe0wBGeF33fdJZD7g1ugdQXDXSGESiMWjIUh
jW3KNq164Fz5DbU17lWMX66pOzOgKzCFlotmQJkOKWFTnPSUOU9HXf6Ff0RtRdRT
1xcotJKHFekTv8ug2VCmcQiU/k7b4SXBrS+7PDYoXWNtRHrOhYb020mzR75EIVe2
Cml9dU4YpXzlo/nOXWt5Fl++MgDQhClt95eZP8xIuXSu117OuC2RleBww55A8W+h
E+/V5dkso+dRB50U0xB0i2lyxzbBfUzpLT6nRKs09gTMRu3bgAcOqvIQYeVEmTo=
=qUn6
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
