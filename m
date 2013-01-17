From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 1/5] treewide: include libfdt_env.h before fdt.h
Date: Fri, 18 Jan 2013 10:50:48 +1100
Message-ID: <20130117235048.GF26321@truffula.fritz.box>
References: <20130116175904.47ee25bd2596f28796698759@freescale.com>
 <1358382963.18317.17@snotra>
 <20130117115456.71a38e3275230cdbb175bfe4@freescale.com>
 <50F843CD.1030309@cideas.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6019633198883085318=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50F843CD.1030309-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
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
To: Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============6019633198883085318==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kbCYTQG2MZjuOjyn"
Content-Disposition: inline


--kbCYTQG2MZjuOjyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 01:32:45PM -0500, Jerry Van Baren wrote:
> Hi Scott, Kim, David,
>=20
> On 01/17/2013 12:54 PM, Kim Phillips wrote:
> >On Wed, 16 Jan 2013 18:36:03 -0600
> >Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> >
> >>On 01/16/2013 05:59:04 PM, Kim Phillips wrote:
> >>>and, if including libfdt.h which includes libfdt_env.h in
> >>>the correct order, don't include fdt.h before libfdt.h.
> >>>
> >>>this is needed to get the fdt type definitions set from
> >>>the project environment before fdt.h uses them.
> >>>
> >>>Signed-off-by: Kim Phillips <kim.phillips-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >>>Cc: Jerry Van Baren <gvb.uboot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>
> >>Maybe fdt.h should include libfdt_env.h?
> >>
> >>Or just always use libfdt.h as the public header.
> >
> >Was just following along the same lines as the dtc commits 38ad79d3
> >"dtc/tests: don't include fdt.h prior to libfdt.h" and 20b866a7
> >"dtc/fdtdump: include libfdt_env.h prior to fdt.h", acked by David
> >G.  I don't know why some only include fdt.h.
> >
> >devicetree-discuss/David: is there a prescribed way to go here?
> >Change all fdt.h includers to just always include libfdt.h instead
> >of libfdt_env.h prior to fdt.h?
>=20
> I started applying Kim's "sparse" patches to the u-boot source and
> ran into this issue pretty hard.
>=20
> In u-boot, there is an added complexity that the "tools" (host-based
> u-boot support tools) support flattened device trees, but explicitly
> include the u-boot version of libfdt declarations so they don't fall
> out of sync if the host has a non-compatible libfdt version.  Having
> them out of sync would be a *horrible* situation to sort out -
> everything would build OK but nothing would work right, probably
> with no useful diagnostic information.  This originated in 2008, so
> life may be better nowadays.  Or maybe not.
>=20
> I would be in favor of explicitly including all the *fdt* headers in
> the sources.  Alternately, Scott's suggestion of just including
> libfdt.h as the public header seems good, but I'm pretty sure it
> will mess me up with the explicit #including in the host-based
> "tools" build, leaving us with nasty work-arounds or a risk of hard
> to identify incompatible host vs. u-boot fdt versions.
>=20
> Who Includes Who
>=20
> fdt.h - no includes
>=20
> fdt_support.h - (u-boot only file)
>   29 #include <fdt.h>
>=20
> libfdt.h
>   54 #include <libfdt_env.h>
>   55 #include <fdt.h>
>=20
> libfdt_env.h
>  - u-boot version is minimal, uses pre-existing macros for byte swapping
>  - dtc version implements byte swapping, includes:
>    4 #include <stddef.h>
>    5 #include <stdint.h>
>    6 #include <string.h>
>=20
> libfdt_env.h is where Kim typedef'ed fdt16_t, fdt32_t, fdt64_t
>=20
> I suspect the original intent was to have <libfdt.h> be the file
> that people #included.  For whatever reason, most includes are
> (picking on fdt_ro.c arbitrarily):
>   51 #include "libfdt_env.h"
>   53 #include <fdt.h>
>   54 #include <libfdt.h>
> Since libfdt.h #includes fdt.h and libfdt_env.h, lines 51 and 53
> (above) are redundant.  It sorts out OK in dtc because libfdt_env.h
> includes stdint.h and defines fdt*_t, but it messes me up in u-boot
> where (currently) libfdt_env.h does *not* include stdint.h...

Ok, so, the uboot libfdt_env.h should be fixed to define uintXX_t and
fdtXX_t (either by including stdint or my other means).  The purpose
of libfdt_env.h is to define the things that libfdt requires, and
those types are (now) such a requirement.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kbCYTQG2MZjuOjyn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlD4jlgACgkQaILKxv3ab8aBvgCeMHZzRCrMOJMXCaxW/+KcYFGG
KiUAni0sBD/uhAU5m078nxtK4o5jUR0q
=N8Un
-----END PGP SIGNATURE-----

--kbCYTQG2MZjuOjyn--

--===============6019633198883085318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6019633198883085318==--
