From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] of: reimplement the matching method for
 __of_match_node()
Date: Wed, 19 Feb 2014 11:09:47 +0800
Message-ID: <20140219030947.GA14031@pek-khao-d1.corp.ad.wrs.com>
References: <1392710250-29913-1-git-send-email-haokexin@gmail.com>
 <1392710250-29913-3-git-send-email-haokexin@gmail.com>
 <20140218222918.392D4C40517@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140218222918.392D4C40517-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2014 at 10:29:18PM +0000, Grant Likely wrote:
> On Tue, 18 Feb 2014 15:57:30 +0800, Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > In the current implementation of __of_match_node(), it will compare
> > each given match entry against all the node's compatible strings
> > with of_device_is_compatible().
> >=20
> > To achieve multiple compatible strings per node with ordering from
> > specific to generic, this requires given matches to be ordered from
> > specific to generic. For most of the drivers this is not true and
> > also an alphabetical ordering is more sane there.
> >=20
> > Therefore, we define a following priority order for the match, and
> > then scan all the entries to find the best match.
> >   1. specific compatible && type && name
> >   2. specific compatible && type
> >   3. specific compatible && name
> >   4. specific compatible
> >   5. general compatible && type && name
> >   6. general compatible && type
> >   7. general compatible && name
> >   8. general compatible
> >   9. type && name
> >   10. type
> >   11. name
> >=20
> > This is based on some pseudo-codes provided by Grant Likely.
>=20
> The patch looks good, but I wasn't confident applying it directly
> without some validation, so I've written a test case for this function.
> I'll resend the series to the list and cc you. Unfortunately I've found
> one case that is failing on the test cases, but I'm too tired to debug
> it now. Maybe you'd like to take a look. The test case may very well be
> wrong.

The test case looks great. Actually there is a bug in this patch. I will ma=
ke
new spin to fix it.

Thanks,
Kevin

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTBCB7AAoJEJNY7TDerrFxtgMIAIGsIbDQtUvlVbR8rzZ+GGF9
jFd9NMWd1S7dvbxsu6vca7iGTkq0APYRIfteKAMduKwVLpKYvCSczdxlIKppc6DI
wnzGQltd09g2cUnZcjqCWpKGPaC0BLClTg9Kn3BF+ijEdgS2LNlb0Yvr1FOAGDhg
U+Q29oqZGSdUCXaWzG5OrLnn0R4F/jtoQrQi7sWxfKJT21su95TPuCF3Scytr+tM
kif8netRImbjHhuiODRxX+zIruEDBwJf99PDDTLEe19iMWS4oMmPdq/0Q8RphL3U
O7UkTbfvSNYJTW9/0lIaMm9ZwM/vna4AMqY5ahkS+ydBLjn8BX3pCpjYsyYVqmM=
=kixq
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
