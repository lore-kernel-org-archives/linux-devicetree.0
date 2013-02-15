From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Added license header to dtc/libfdt/fdt.h and libfdt_env.h
Date: Fri, 15 Feb 2013 14:40:28 +1100
Message-ID: <20130215034028.GE29108@truffula.fritz.box>
References: <1360773121-25880-1-git-send-email-jsobota@ti.com>
 <20130213233255.GU4948@truffula.fritz.box>
 <20130214183936.e82dbf45c5708f8084de2d62@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1287895320249652684=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130214183936.e82dbf45c5708f8084de2d62-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Justin Sobota <jsobota-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1287895320249652684==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MZf7D3rAEoQgPanC"
Content-Disposition: inline


--MZf7D3rAEoQgPanC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 14, 2013 at 06:39:36PM -0600, Kim Phillips wrote:
> On Thu, 14 Feb 2013 10:32:56 +1100
> David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>=20
> > On Wed, Feb 13, 2013 at 11:32:01AM -0500, Justin Sobota wrote:
> > > This commit adds a license header to fdt.h and libfdt_env.h because
> > > the license was omitted
> >=20
> > So, having a quick look at the git blame for both these files, it
> > looks like Kim Phillips (CCed) also touched them substantially.
> >=20
> > Kim, did you want to supply an additional copyright line for these file=
s?
>=20
> sure, it'd be:
>=20
> Copyright 2012 Kim Phillips, Freescale Semiconductor.
>=20
> I can spin a patch on top of this one, or - wait...
>=20
> > > Signed-off-by: Justin Sobota <jsobota-l0cyMroinI0@public.gmane.org>
> > > ---
> > >  libfdt/fdt.h        |   50 +++++++++++++++++++++++++++++++++++++++++=
+++++++++
> > >  libfdt/libfdt_env.h |   50 +++++++++++++++++++++++++++++++++++++++++=
+++++++++
> > >  2 files changed, 100 insertions(+)
> > >  mode change 100644 =3D> 100755 libfdt/fdt.h
> > >  mode change 100644 =3D> 100755 libfdt/libfdt_env.h
>=20
> ...what's up with making them executable?

Good point, didn't notice that.  I'm guessing an accidental transition
through a FAT filing system.

> So I'm assuming this patch is going to be respun to not include the
> mode changes, in which case please add the above copyright line
> under David's.
>=20
> Thanks,
>=20
> Kim
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MZf7D3rAEoQgPanC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEdriwACgkQaILKxv3ab8ZfXwCfTlG3WnwMRAApvAKkCvimVA3R
yvwAn0HBl2wDqIb8rNtohHYwEmeed689
=aZQy
-----END PGP SIGNATURE-----

--MZf7D3rAEoQgPanC--

--===============1287895320249652684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1287895320249652684==--
