From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS files.
Date: Wed, 12 Feb 2014 18:35:50 +0800
Message-ID: <20140212103550.GD15434@pek-khao-d1.corp.ad.wrs.com>
References: <20140210110342.GA15806@visitor2.iram.es>
 <alpine.LRH.2.00.1402101056410.10318@ra8135-ec1.am.freescale.net>
 <20140211072606.GA26514@visitor2.iram.es>
 <OF6F6A0029.3B20EF5B-ONCA257C7C.0071BFDA-CA257C7C.00732AD3@csc.com>
 <63AEBD99-AA87-4FD7-BBDA-0CE419959F14@kernel.crashing.org>
 <52FAA97F.4060600@gmail.com>
 <1392162080.6733.404.camel@snotra.buserror.net>
 <52FAB65C.4090201@gmail.com>
 <OF9BA019D5.46DA1E29-ONCA257C7D.000089EA-CA257C7D.00020333@csc.com>
 <52FB2FF4.6060905@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52FB2FF4.6060905-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2014 at 09:25:24AM +0100, Sebastian Hesselbarth wrote:
>=20
> Hmm, I did a mistake in the patch:
>=20
> -	while (m->name[0] || m->type[0]) {
> +	while (m->compatible[0] || m->name[0] || m->type[0]) {
>=20
> for the second added match. Otherwise, the matches are not
> evaluated down to the sentinel but the loop quits on the first
> match table entry without .name and .type set.

But this is still not right. We also need to skip the matches with
=2Ecompatible here.

Thanks,
Kevin
>=20
> Sebastian
> _______________________________________________
> Linuxppc-dev mailing list
> Linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/linuxppc-dev

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS+06GAAoJEJNY7TDerrFxQ9gH/0kQo3Akx7eMFjbTFJnrd/GE
RT+6ldyMnjjHmAbCSjkW0YbaueFzwmEEdHDijP6FZ5MeOyV7oFV5u4+cdPRfS+U/
sDI83YGysi/lAHEmSIoggzoEo9LK4XsOQ8nHabgwOlj55Ib7pHNWorQIXNeafYaj
feYWEbgoSUNK1McpRVWnKurRodn6VznF4/mKVltQ7+1dRqyucAJRlCMcEldGVxSV
Xpo9cAM91pNhNCbMK5g7Cq7ij4yf1XPlUPkJt8gGUX2/0JIQGMqUHc5oEr8o+UwG
t9qU0cInr/p2PSbelTz6aZpPtjGVOttqwMLQWLdDh/avmv6S/dSyqYx/JqPkCes=
=cpaF
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
