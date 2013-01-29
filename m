From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] Use the libfdt.h include as the interface definition
Date: Tue, 29 Jan 2013 12:20:57 +1100
Message-ID: <20130129012057.GD16729@truffula.fritz.box>
References: <5105E3EA.2070306@cideas.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5124075951515513033=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <5105E3EA.2070306-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
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
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============5124075951515513033==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Content-Disposition: inline


--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 27, 2013 at 09:35:22PM -0500, Gerald Van Baren wrote:
> libfdt.h is the libfdt interface definition.  It includes fdt.h and
> libfdt_env.h, so there is no reason to include those in the general code.
>=20
> Signed-off-by: Gerald Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> No code changes, just cleaning up the #include situation WRT libfdt.h,
> fdt.h, and libfdt_env.h (the later two being redundant).
>=20
> I looked at moving the fdt64_t, fdt32_t, fdt16_t definitions from
> libfdt_env.h to fdt.h.  I'm not sure this is a Good Thing[tm], but will
> send a separate patch for consideration and discussion.
>=20
>  dtc.h                    |    3 +--
>  fdtdump.c                |    3 +--
>  libfdt/fdt.c             |    3 ---
>  libfdt/fdt_empty_tree.c  |    3 ---
>  libfdt/fdt_ro.c          |    3 ---
>  libfdt/fdt_rw.c          |    3 ---
>  libfdt/fdt_strerror.c    |    3 ---
>  libfdt/fdt_sw.c          |    3 ---
>  libfdt/fdt_wip.c         |    3 ---
>  libfdt/libfdt_internal.h |    1 -
>  10 files changed, 2 insertions(+), 26 deletions(-)
>=20
> diff --git a/dtc.h b/dtc.h
> index 3e42a07..a032645 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -32,8 +32,7 @@
>  #include <errno.h>
>  #include <unistd.h>
>=20
> -#include <libfdt_env.h>
> -#include <fdt.h>
> +#include <libfdt.h>

For dtc.h, this is wrong - dtc uses the structures in fdt.h, but
(deliberately) nothing in libfdt.h.

For the other cases, I'm a bit undecided.  As you say, the individual
includes are redundant.  In some cases the explicit inclusions kind of
document that the C code has direct dependencies on the stuff in
libfdt_env.h and fdt.h as well as the indirect dependencies from the
libfdt.h API.  I'm not really sold either way.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlEHI/kACgkQaILKxv3ab8YLKwCfS7RIBCFV5FCwRII0PNZjhLtM
rYwAnRPjXsLvQ/l3yJehYoJahUiaQwvi
=D1Jo
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--

--===============5124075951515513033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5124075951515513033==--
