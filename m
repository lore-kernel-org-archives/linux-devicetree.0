From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] of: search the best compatible match first in
 __of_match_node()
Date: Tue, 18 Feb 2014 13:41:45 +0800
Message-ID: <20140218054145.GD10028@pek-khao-d1.corp.ad.wrs.com>
References: <1392355366-1445-1-git-send-email-haokexin@gmail.com>
 <1392355366-1445-3-git-send-email-haokexin@gmail.com>
 <20140217175834.62ED6C403C8@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZJcv+A0YCCLh2VIg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140217175834.62ED6C403C8-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ZJcv+A0YCCLh2VIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2014 at 05:58:34PM +0000, Grant Likely wrote:
> This seems wrong also. The compatible order should be checked for even
> when m->name or m->type are set.  You actually need to score the entries
> to do this properly. The pseudo-code should look like this:
>=20
> uint best_score =3D ~0;
> of_device_id *best_match =3D NULL;
> for_each(matches) {
> 	uint score =3D ~0;
> 	for_each_compatible(index) {
> 		if (match->compatible =3D=3D compatible[index])
> 			score =3D index * 10;
> 	}
>=20
> 	/* Matching name is a bit better than not */
> 	if (match->name =3D=3D node->name)
> 		score--;
>=20
> 	/* Matching type is better than matching name */
> 	/* (but matching both is even better than that */
> 	if (match->type =3D=3D node->type)
> 		score -=3D 2;
>=20
> 	if (score < best_score)
> 		best_match =3D match;
> }
> return best_match;
>=20
> This is actually very similar to the original code. It is an easy
> modification. This is very similar to how the of_fdt_is_compatible()
> function works.

I like this idea and will make a new patch based on this.

Thanks,
Kevin
>=20
> g.

--ZJcv+A0YCCLh2VIg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTAvKZAAoJEJNY7TDerrFx2QwH/im1TUhMORxD3cW861eZjPi1
+fgtodcxwYf15R6dmU0Pc5pNpt7sLaD0rqbuwYFKbaaBS5+uXIK44HT3nGGgT0ZB
AO0Cel2X0KPuTtyFAlDgT4PNDlyMNV9xPgJ/zq2afNZKdHkZpeWdBwNgCWDcNRUt
PvXLn+6a8mNG34yrSSSGHqQpVKgA/8OOEJOoMs/aQP5bhugivH1D7tcg9/TxWIpL
l2EkB/+iD+5v5OnWAm/SECiyEHxBPt7wOCxBeMAAesDVmC/ghKJ+s6qQKbn22+FZ
NL+wcbhT032ZxmIYTx79oncv8I+A3Nx495djFpryq0RBf3eiylZ37KvwcTVmO5k=
=cRcK
-----END PGP SIGNATURE-----

--ZJcv+A0YCCLh2VIg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
