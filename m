From: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] powerpc/sequoia: fix NAND partitions not to overlap
Date: Thu, 18 May 2017 11:48:13 +0200
Message-ID: <20170518094813.GA12038@amd>
References: <20170402100535.GA18340@amd>
 <20170517120613.GA583@amd>
 <20170517143717.ad818a2282378fc7a38af1ff@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170517143717.ad818a2282378fc7a38af1ff-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: sr-ynQEQJNshbs@public.gmane.org, jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Andrew Morton <akpm-3NddpPZAyC0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2017-05-17 14:37:17, Andrew Morton wrote:
> On Wed, 17 May 2017 14:06:13 +0200 Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org> wrote:
>=20
> > On Sun 2017-04-02 12:05:36, Pavel Machek wrote:
> > > Fix overlapping NAND partitions.
> > >=20
> > > Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> >=20
> > Ping? Two partitions at same place are bad news...
>=20
> Please expand on "bad news"?  What are the runtime effects of this
> change?  Decisions about which kernel(s) to patch depend on this info.

Well... two partitions at same place. If you use one, you will corrupt
information on the other one.

OTOH this moves partition around (so that they don't overlap) so it is
probably not stable candidate.

I guess this is not huge issue; people using these boards probably
have custom dts changes, anyway...

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlkdbd0ACgkQMOfwapXb+vKSwgCdEH0np4PeA0yHxMf1KJy8HJ7I
fE8AoKN4cfbkO+bYmOOzY/msQyboWBPW
=p+oE
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
