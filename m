From: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] powerpc/sequoia: fix NAND partitions not to overlap
Date: Fri, 19 May 2017 13:18:37 +0200
Message-ID: <20170519111837.GB3940@amd>
References: <20170402100535.GA18340@amd>
 <20170517120613.GA583@amd>
 <20170517143717.ad818a2282378fc7a38af1ff@linux-foundation.org>
 <20170518094813.GA12038@amd>
 <87efvl75ts.fsf@concordia.ellerman.id.au>
 <87zie95fiq.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87zie95fiq.fsf-W0DJWXSxmBNbyGPkN3NxC2scP1bn1w/D@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, Andrew Morton <akpm-3NddpPZAyC0@public.gmane.org>, jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> > > Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> >>> >=20
> >>> > Ping? Two partitions at same place are bad news...
> >>>=20
> >>> Please expand on "bad news"?  What are the runtime effects of this
> >>> change?  Decisions about which kernel(s) to patch depend on this info.
> >>
> >> Well... two partitions at same place. If you use one, you will corrupt
> >> information on the other one.
> >>
> >> OTOH this moves partition around (so that they don't overlap) so it is
> >> probably not stable candidate.
> >>
> >> I guess this is not huge issue; people using these boards probably
> >> have custom dts changes, anyway...
> >
> > Or no one's even using it anymore.
> >
> > I can take this via powerpc, I won't mark it for stable etc.
>=20
> It became:
>=20
>     Author:     Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
>=20
>     powerpc/sequoia: Fix NAND partitions not to overlap
>    =20
>     Currently the DTS defines two partitions at the same addresses, if you
>     use one, you will corrupt information on the other one. Fix it by
>     shifting the second partition.
>    =20
>     Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>     [mpe: Reconstruct change log from email thread]
>     Signed-off-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
>=20
>=20
> Minor nit, your From: address doesn't match your Signed-off-by: address,
> which trips my "check patch is signed-off-by author" script. I can
> just ignore it, but I think it's preferable if they match.

Sorry about that (I have automatic scripts changing From:). It is
still me, but I guess denx should get the credit here, so you can use.

Signed-off-by: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>

Thanks,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlke1I0ACgkQMOfwapXb+vKlowCeIg/maTYewrDWFy3K3nNMIqAZ
crQAn2Ex/X+jLSb/b5PyYZYXS8O4fyae
=9dWT
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
