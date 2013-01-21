From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 1/5] treewide: include libfdt_env.h before fdt.h
Date: Mon, 21 Jan 2013 11:17:49 +1100
Message-ID: <20130121001749.GA24829@truffula.fritz.box>
References: <20130116175904.47ee25bd2596f28796698759@freescale.com>
 <1358382963.18317.17@snotra>
 <20130117115456.71a38e3275230cdbb175bfe4@freescale.com>
 <50F843CD.1030309@cideas.com>
 <20130117235048.GF26321@truffula.fritz.box>
 <50F93932.60700@cideas.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8482167025633690990=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50F93932.60700-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Gerald Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============8482167025633690990==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 06:59:46AM -0500, Gerald Van Baren wrote:
> On 01/17/2013 06:50 PM, David Gibson wrote:
> > On Thu, Jan 17, 2013 at 01:32:45PM -0500, Jerry Van Baren wrote:
> >> Hi Scott, Kim, David,
>=20
> [snip]
>=20
> >> libfdt_env.h is where Kim typedef'ed fdt16_t, fdt32_t, fdt64_t
> >>=20
> >> I suspect the original intent was to have <libfdt.h> be the file=20
> >> that people #included.  For whatever reason, most includes are=20
> >> (picking on fdt_ro.c arbitrarily): 51 #include "libfdt_env.h" 53
> >> #include <fdt.h> 54 #include <libfdt.h> Since libfdt.h #includes
> >> fdt.h and libfdt_env.h, lines 51 and 53 (above) are redundant.
> >> It sorts out OK in dtc because libfdt_env.h includes stdint.h and
> >> defines fdt*_t, but it messes me up in u-boot where (currently)
> >> libfdt_env.h does *not* include stdint.h...
> >=20
> > Ok, so, the uboot libfdt_env.h should be fixed to define uintXX_t
> > and fdtXX_t (either by including stdint or my other means).  The
> > purpose of libfdt_env.h is to define the things that libfdt
> > requires, and those types are (now) such a requirement.
>=20
> I like the move, but have not done it (yet).  I made a trial patch
> (see below) that uses libfdt.h as the interface and cleans out the
> (now redundant) other *fdt*.h includes.  If this is in the right
> direction, I'll move the fdtXX_t typedefs and formally submit it.
>=20
> The test suite has one failure, but it fails with or without my changes.
>=20
> $ make check | grep FAIL
> fdtget-runtest.sh 77 121 66 111 97 114 100 78 97 109 101 0 77 121 66
> 111 97 114 100 70 97 109 105 108 121 78 97 109 101 0
> label01.dts.fdtget.test.dtb / compatible:	FAIL Results differ from
> expected
> *                FAIL:	1
>=20
> ********** TEST SUMMARY
> *     Total testcases:	1443
> *                PASS:	1442
> *                FAIL:	1
> *   Bad configuration:	0
> * Strange test result:	0
> **********

Yeah, Jon and I are aware of that recently introduced bug.  I've had
other projects to attend to and haven't had a chance to fix it yet.
It's basically a testsuite bug though, so it should be harmless.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlD8iS0ACgkQaILKxv3ab8Zs6wCgk5Dih2joxPgTbdIxwQaOj2OK
p1MAoIFun+G0B/V8IImghphhW61D8zdK
=3SRd
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

--===============8482167025633690990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8482167025633690990==--
