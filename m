From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] libfdt: Add fdt_path_offset_namelen()
Date: Fri, 13 Mar 2015 16:43:50 +1100
Message-ID: <20150313054350.GA11132@voom.redhat.com>
References: <1425654758-2575-1-git-send-email-peter@hurleysoftware.com>
 <20150310001711.GB30335@voom.fritz.box>
 <54FEF600.50402@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54FEF600.50402-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 09:47:44AM -0400, Peter Hurley wrote:
> Hi David,
>=20
> On 03/09/2015 08:17 PM, David Gibson wrote:
> > On Fri, Mar 06, 2015 at 10:12:38AM -0500, Peter Hurley wrote:
> >> Properties may contain path names which are not NUL-terminated.
> >> For example, the 'stdout-path' property allows the form 'path:options',
> >> where the ':' character terminates the path specifier.
> >>
> >> Allow these path names to be used in-place for path descending;
> >> add fdt_path_offset_namelen(), which limits the path name to 'namelen'
> >> characters.
> >>
> >> Reimplement fdt_path_offset() as a trivial wrapper.
> >>
> >> Signed-off-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
> >=20
> > I think this function is a good idea, however I would like to see a
> > testcase for it.
>=20
> Sure, I can do that.
>=20
> I assume you mean a path name with non-NUL termination because
> the fdt_path_offset() tests are already exercising the
> fdt_path_offset_name() implementation.

Yes, I mean the non-\0-terminated case.  Or more specifically still,
making sure that if you call fdt_path_offset_namelen() on a portion of
a longer path, it correctly gives you the offset for only the partial
path.

That said, there may be some other edge cases that could do with
testing too, if you have time.  In particular I'm thinking of paths
where there are repeated '/' character, and paths ending with one or
more '/' characters.

> Is there a readme somewhere regarding the test matrix (ie.,
> which dts files go with which tests)?

I'm afraid not, apart from the test runner script itself.  I'm not
sure quite what information you're after here.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVAnkWAAoJEGw4ysog2bOSufwQAMdpjSRomRVrG1a1EK4uWBac
wW7z2WHDqUe3hK3+5jsdzV1GwyW3acmgFBoy7CJglRj2Q8GsiHDO1pVkKTt7Oeu/
TsA3hd3MC0tK48FxIg3YHj1y6kvHafTiyhdqj2uCnXYsYvYpkU0zEYrkdDf3VqYz
VxqmasavBe5DK3dQYGtZr8aP79X35kFzbw786dhRTB42CpC/q6ZoK4JSWJ4L3qt1
QvhgW0Kf8uBk7g6rz5fPn2IqRYL4hkxPkiaJPiJdSk0rdHvyhSlvrA7qaV60U51G
p07AOeZQTvhY4GBlEmzN9Q6bZfZg1dR53UHpGN7TzxaPrv4Ux9uwxqn0icWxJO2h
ec8cDZYAzr9d3qGlQZ9dOph3W93jqMWwu4FYKVLi+CJVvOjdjh7uOSif2ieG3isg
va0QP9yJGyksPvpdbd25jUTHfMs32n1tiY16Mw3QhjMT/oG1tXVWkJM9tyAmFDwS
1qk/bOGrJHmh46XokD53hjbaNnpAMp8Ti6ccbBY4giWVULQJrCsWsawDpSM2l7aF
dIpi9p7QU3wOdbGMZoM3Pq/qUKar/HpsTh7slO+3MMajZm5E5x1eoLsZIWE1rCSp
4qiEnXgmiwuXK8mMjSZeZgeVqR7z4sUukbOB14mle5gBfnJQErGagtRPLb+YEoim
pO5U8bB9FikCIFAVnSVe
=ZEIX
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
