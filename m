From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: case sensitivity for devicetree node names
Date: Tue, 14 Jun 2016 11:10:21 +1000
Message-ID: <20160614011021.GD4882@voom.fritz.box>
References: <575B1D84.2010703@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <575B1D84.2010703-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 10, 2016 at 01:05:24PM -0700, Frank Rowand wrote:
> I had assumed that devicetree node names were case sensitive. But a recent
> email thread asserted that they were not, which made me curious.
>=20
> dtc treats node names as case sensitive:
>=20
> $ cat test_node_case_1.dts
>=20
> /dts-v1/;
>=20
> / {
> 	node-x {
> 		prop_a =3D < 1 >;
> 	};
> };
>=20
> / {
> 	node-X {
> 		prop_a =3D < 2 >;
> 	};
> };
>=20
> $ cat test_node_case_2.dts
>=20
> /dts-v1/;
>=20
> / {
> 	node-x {
> 		prop_a =3D < 1 >;
> 	};
> };
>=20
> / {
> 	node-x {
> 		prop_a =3D < 2 >;
> 	};
> };
>=20
> $ dtc -O dts test_node_case_1.dts
> /dts-v1/;
>=20
> / {
>=20
> 	node-x {
> 		prop_a =3D <0x1>;
> 	};
>=20
> 	node-X {
> 		prop_a =3D <0x2>;
> 	};
> };
>=20
> $ dtc -O dts test_node_case_2.dts
> /dts-v1/;
>=20
> / {
>=20
> 	node-x {
> 		prop_a =3D <0x2>;
> 	};
> };
>=20
>=20
> But the Linux kernel source code defines of_node_cmp() as:
>=20
>   include/linux/of.h:
>=20
>   /* Default string compare functions, Allow arch asm/prom.h to override =
*/
>   #if !defined(of_compat_cmp)
>   #define of_node_cmp(s1, s2) strcasecmp((s1), (s2))
>=20
> arch/sparc/include/asm/prom.h uses strcmp() instead of strcasecmp().
>=20
> Examples of using of_node_cmp() to check for a node name can be found,
> for example, of_find_node_by_name().
>=20
> Is case insensitivity for node names a bug in the Linux kernel, or desired
> for some reason?

Hmm.. a bit embarrassingly, I've never really thought about this in
all the years I've been doing dtc - I also pretty much just assumed
it was case-sensitive.

I haven't been able to find something in IEEE 1275 definitively saying
one way or the other - it's not exactly easy to search for since
"case" gives you hundreds or thousands of irrelevant hits of the form
"in the case of blah".

I do recall that there was a semantic difference between vendor
prefixes in uppercase (they were supposed to be stock tickers) and
those in lowercase (those were freeform).  That suggests that property
names at least were expected to be case sensitive.

Here's my inclination for how to treat this in dtc for the time being:
    1) Leave the bulk of dtc case sensitive, as now
    2) Add a new check which will generate an error if there are node
       names which differ only in case.

Any objections to that plan?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXX1l9AAoJEGw4ysog2bOSwa4QALuF+bdJQNsxbMpKWb7KLEaf
VPzYgUjzZ3KIqUseh3qHbkyLi5Y5E7hiZkLM+sLPbvR4kL8C4o2w7q9NwxNJdZQT
GQjRJR+zvppVQimZ8waSO8bdYDQCl9NXz+2ry4g1TBE8/SpCUqhnTQFquUWo1E9d
klSfY0WCI6/BlvzALexJySatzRKIZFL7nuVV4xfP4n98KRje8cgZvwGsW80llPKr
DhFZKaeb6ancO3cc0uiklUdTOAnSvKwWUn0LzehyjNfMVtmUaJ5uVWuEdOcqqQch
jh3MfLKE4SsZ8GBbDf5tEOb1RgHGGfe/fjg6vM/bdhe8le7s/L8cL/N26GZ9F5xw
2arvVD0Rs/NJ3WpfaTlM/Fywt/tWciwO+RXDUxAmffTjQ4QBF9KMpesFf7IyFya4
LTozcxIR9inS1H1v7W81X7pPDoqGQvAxzRwrCYBkVGHn6r71wkfgL8Dm8ALKFOLR
+CrPUtW7lvS55rriS4bXkj7xzDfdOBOcYs/f6twCfE43b2WKHPqoATNoEnkbQSnr
AVE8X2V+PYX5tUjaTITy3aNKK7SWWbSjfMWeDqUnsNolXdFpkMV9NcY7u9Tno/D8
RUWeJPDHJr8Q952Mz7FiE+AfL3f0pg797rFNRNUJVL2fn0QDhF6npw/DgOHSz0T9
I5hUgVxKo4UgC1HpeuBc
=CLZK
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
