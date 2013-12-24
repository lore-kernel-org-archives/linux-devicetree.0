From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 0/3] Extend dtc with data type handling
Date: Tue, 24 Dec 2013 22:57:16 +1100
Message-ID: <20131224115716.GG12407@voom.fritz.box>
References: <1386953352-25402-1-git-send-email-t.figa@samsung.com>
 <20131223120814.GE12407@voom.fritz.box>
 <2257946.KY9lGl9U4o@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j2AXaZ4YhVcLc+PQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2257946.KY9lGl9U4o@amdc1227>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--j2AXaZ4YhVcLc+PQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2013 at 08:00:54PM +0100, Tomasz Figa wrote:
> On Monday 23 of December 2013 23:08:14 David Gibson wrote:
> > On Fri, Dec 13, 2013 at 05:49:09PM +0100, Tomasz Figa wrote:
> > > This series intends to extend dtc with appropriate infrastructure
> > > to handle property data types. First, dtc is modified to preserve
> > > type information when parsing DTS. Then type guessing is implemented
> > > for flat and fs trees where type data is not available. After that,
> > > DTS generation code is modified to use only type information when
> > > printing property data.
> >=20
> > Hrm.  I think this is completely backwards to the right approach.
> >=20
> > For dt checking what we want is a schema.  That can specify datatypes
> > amongst other constraints, but in the end you can check the actual
> > bytes of the DT against the constraints imposed by the schema,
> > regardless of how those bytes are presented to the checker.
>=20
> Those constraints are usually types, so you need a way to extract them
> from source DTS.

You really don't.

Consumers of the dt intepret it without type information, because they
know what's supposed to be there.  Likewise if we know the schema, we
can check whether the dt data fits it without having to have it
annotated with type information from another source.

> > By adding type information to the in-flight tree you're checking not
> > the actual content of the DT, but how you've chosen to express that
> > information in DTS format.
> >=20
> > More concretely, we should be able to schema-check trees in binary
> > format, not just source.  With these patches that will fail if -I dtb
> > makes the wrong type guesses.
>=20
> I'm not quite sure what do you want to check in binary format, where
> properties are just strings of bytes. All you can check is whether there
> is enough bytes or possibly some value constraints on particular parts
> of it, but not types.

You can check that if a consumer interprets the dt bytes according to
the schema, it will get sane data - and that's exactly what matters.

If a schema specifies a string followed by a 32-bit integer, that
implies constraints on the bytes, and that's what matters to a dt
consumer.  So we might expect:
	prop =3D "abc", <0xabcdef00>;
But:
	prop =3D <0x61626300>, "\xab\xcd\xef";

will still be interpreted correctly by the consumer, even though the
"type" information is wrong.

However:
	prop =3D "a\0b", <0xabcdef00>;

will NOT be parsed correctly by the consumer, even though the "type"
information is correct.

> IMHO what we primarily need is source validation. Of course using schemas,
> but that's already decided.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--j2AXaZ4YhVcLc+PQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJSuXacAAoJEGw4ysog2bOSaZQP/0h2OSX4Gqcfznpi8vK8DlOs
LtDjSPzEW62vZf2Ty1TlUExtSzRY86YycvDa1vVQlrKjqeelE2TjEH+8KDYcCJcv
BQcu2kRNSWmg7RMPV19W9uHFkhbsBxFleqLp2pR/GhPBKIFAjJff27A6722pizzK
I/LesZddBw7evg7X7Ms1HQ/JaWdvUGPUP7Y/vFe1yV5Vu+WK7S7ZZ08Gly0BJr4J
adlmuef+Xui94Sl2RMng7pmvZl9Vr9K+LGf4Xsic9kho0aJ5uFh5BDX6MhDaEMYs
8PiG0ozQCGBwwHeopWrBvUP90GtEypw/zLg/90hjdKayy7YJ2t1l3m/7HN3xVLjw
I68xzJZtQY4dXOM2zqDOQOquJCRZdMGBsOKE2zvFL8T9P6LJl74q6iPtn7/EYYkL
Z/OUZosPh0ooO5X2uR22Ox/mAmrKxUO8lcIx/CcK3/Mtqhr3wgyvzKf+PRj7lPp8
NMkWTVIgntcE805N5muz/VhNon5XBliZCAO/hsCdSfq7K40YFYxMX6LZmCRi0GtM
Ya7kCiwMgiGmqP/5G0bx6F4oe97zIB6YM3aJpqarBXgr0t+hZTaZ93sfkmmXirRw
lehrW2yJDE28GH7cakp6zt5K6lD+ZDO8oigsxWNRl8GoToJfVo1cK9xf7XC/ziaI
FRXUCeWJBLXNdoGR+MO4
=nHjt
-----END PGP SIGNATURE-----

--j2AXaZ4YhVcLc+PQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
