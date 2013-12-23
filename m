From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] Extend dtc with data type handling
Date: Mon, 23 Dec 2013 23:08:14 +1100
Message-ID: <20131223120814.GE12407@voom.fritz.box>
References: <1386953352-25402-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386953352-25402-1-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 05:49:09PM +0100, Tomasz Figa wrote:
> This series intends to extend dtc with appropriate infrastructure
> to handle property data types. First, dtc is modified to preserve
> type information when parsing DTS. Then type guessing is implemented
> for flat and fs trees where type data is not available. After that,
> DTS generation code is modified to use only type information when
> printing property data.

Hrm.  I think this is completely backwards to the right approach.

For dt checking what we want is a schema.  That can specify datatypes
amongst other constraints, but in the end you can check the actual
bytes of the DT against the constraints imposed by the schema,
regardless of how those bytes are presented to the checker.

By adding type information to the in-flight tree you're checking not
the actual content of the DT, but how you've chosen to express that
information in DTS format.

More concretely, we should be able to schema-check trees in binary
format, not just source.  With these patches that will fail if -I dtb
makes the wrong type guesses.

> Effect of this is the ability to implement checks for data types
> of properties. Also, as a side effect, it's now possible to do
> almost 1:1 dts <=3D> dts passes (not very useful, but shows that
> things are working well).
>=20
> Tomasz Figa (3):
>   dtc: Keep type information from DTS
>   dtc: Inject guessed type information in case of flat and fs trees
>   dtc: Use type information when printing tree source
>=20
>  data.c       |  62 +++++++++++++++++++++++-
>  dtc-parser.y |  47 ++++++++++++++-----
>  dtc.h        |  12 +++++
>  flattree.c   |   2 +-
>  fstree.c     |   6 ++-
>  livetree.c   |  16 +++++--
>  treesource.c | 150 +++++++++++++++++++++++++++++++++--------------------=
------
>  7 files changed, 209 insertions(+), 86 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSuCeuAAoJEGw4ysog2bOSXC0P/3L51X8d1sxhE9vVcHHT8Ql6
SeTcG8aM3c1JIXKHR/MjN3qfSUnCu4GqhlTAAuQ66H6rAiJe8DWRANry2xNUTBfB
CSSOq9DPcNhDVsc5FuBm3tXj+mQM32flSJ6GFrzE7S+p1xEtEL9vWaIHD07b2zVe
vtYr481kD/zjp3NQxSDdYZuKTq/6k9s7S5RWqtFXWu9cY9CUBv5wCKn5tISpFVyx
lrZxutjTVflG3kPAVx01lUxpCP24PiJwa/cq36qnqI5CDgzQpQ4gjqwol4qj/MQA
mwHuQUrOcDDt9eL0PNLvCRv8W77cS7jcXYVYYH9p0tRrjJs2IcFMuqCy7MwNayGQ
AIAzbd5s3oyl1QuwhnMdkCaRlbgmSznP3TBZtG2OSBQjMYJxgCUBDNKXJjmKacZ6
zwE8GrElcgs4kDrwZvJYBZGvvnO7yG0ZeAIlWW4EJhEZUcUcRteKYJWzcgW7a5Gt
NGCq4KrStSpjfYkBQvPxSBSDkc7yfACSxuVl8wVLW//f5uUOLvQHt4PkmTeFy0IC
MzlDVIYLhbOHN4LsVItDbxLKdqbWDpxYE++rJQQfeK1reJ/R1mnOkTGgN4l2GRm9
vHBs+X+OMDZbCEtcI+uFttBcl5TVZHiVVem232G7kqtBWQJSZhqd3kWnweOxSddZ
s7V3TVEnUvnBsIxnfj2h
=ICpH
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
