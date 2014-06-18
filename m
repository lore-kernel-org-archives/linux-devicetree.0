From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: CPU revision IDs
Date: Wed, 18 Jun 2014 10:07:48 +0200
Message-ID: <20140618080748.GF19730@lukather>
References: <CAKON4OwNULPeQFHwRhRfri86yexMvvKfrw_dthim4_oPWvMD3g@mail.gmail.com>
 <4285095.l6sVUI20tQ@wuerfel>
 <CAKON4OxzJ7UoKnMgf+sckksjG-rx8NG1tUvPj2qaHNsda0j3jQ@mail.gmail.com>
 <5045739.TmqqIG2CDG@wuerfel>
 <CAKON4Ox+tCgiu6N988ds7ED2KbECw=60Y6BRqV_2UcM+vshw4Q@mail.gmail.com>
 <20140613132022.GJ3448@lukather>
 <CAKON4OxZLaL9sJFPjnUhec_LMZKGvGXrKyUjW-whHzY6byVUxw@mail.gmail.com>
 <20140613135817.GK3448@lukather>
 <CAKON4Oz44X7G+yM2R-XX_D_6FV4ekWiOKY2t_p0Y3+gUXJ17iw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKON4Oz44X7G+yM2R-XX_D_6FV4ekWiOKY2t_p0Y3+gUXJ17iw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2014 at 10:37:37AM -0400, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> >> Then I end up with code in the machine file like this...
> >>
> >> find SOC revision
> >> if revision =3D=3D A
> >>     fix up codec and i2s driver compatible
> >> if revision =3D=3D B
> >>     fix up HDMI compatible
> >> if revision =3D=3D C
> >>     fix up whatever
> >> I've seen chips with revision levels of J
> >>
> >> Why do you want this knowledge in the machine file? Why not just add
> >> the test for SOC revision inside the device driver?
> >
> > Because it's going to be a mess anyway. No matter if it's in the
> > driver or the machine code. So at least, that way, we're having it
> > centralized and isolated from the driver's code.
>=20
> The mess is always going to be in the driver code. You are just
> changing the the string the driver code selects on...
>=20
> if (of_machine_is_compatible("allwinner,sun7i-codec-rev-a")) {
>       fix bug
> }
>=20
> if (of_machine_is_compatible("allwinner,sun7i-a20a")) {
>       fix bug
> }

What? Hmmm, nope. Look at how we're doing this for the i2c driver
(drivers/i2c/busses/i2c-mv64xxx.c).

> The mess is not required in the machine file.  Init time code can
> always modify the machine compatible string like this with no side
> effects. It would add 'a'-'j' as appropriate for the CPU.
>=20
> Code changes this:
>  compatible =3D "cubietech,cubietruck", "allwinner,sun7i-a20"
> to:
>  compatible =3D "cubietech,cubietruck",  "allwinner,sun7i-a20-a",
> "allwinner,sun7i-a20"

Again, this is the machine compatible, and this is orthogonal to the
issue. You should have a different compatible string for the *codec*.

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJToUjUAAoJEBx+YmzsjxAgT3UQAJT7AFJsWwPZV3uIXAe3NgRV
JT2fVG0SM2WQAg9L7QeANO+iqA3pTtDFrbmtj9JgCKd6sY8ebKuPyiIuWRVVoZDQ
ak79jnL/C+BeWBMVVhx1iryFg7UgPITLqDzs65dgabdZpfs6q314qLCOVCvPt3aU
LGDhXMHrf6DAjCsjV+WAVBpcRqeDQ/+zr4GwMX1nKzem8yu0yJGnOWSXtxkoGlHE
rMTa7NYsJru5ODRQh3yGVS7sRcgGT7HYmTtabABkxv2+g0BVLZQYuhvotDTv/TCg
Zz5qlhmqYSRyLVpGjSwSue4IvyhbLajaICUihJ9za0Hai5N+R9N0R78v0wXCziQO
+XjjjbSXhLoWj8iqzSjaGDKKCCj5HmPzeX3am7HwhHEe/qW8VczEo79ksAG/kyT6
ZFAqtI1+7hYmhZaCbetAUgqjofqx3J1rQHpYKpmk0H93fR/8vy2rGp9z334n50p6
1DpA46HjOGfB7tBd9o1ebYMAPL6SUMylphjHbp/Iz04+ptxOn7jfMWnWGxjBSDB5
IKY8RsoKENXHKMt6r16yfcvtlWGmPqEC3gXOG+JkL8L624dazlI32o2NKLSy6/Kn
SCh/a6K2xX41s+224MWte851y6REoeywHcBivikFL3cJO7oAzNnDAMnA0X/nAlR+
lUrGz+zpgddpoTtIkpXX
=an7G
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
