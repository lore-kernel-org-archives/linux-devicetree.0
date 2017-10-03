From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] scripts/dtc: add fdt_overlay.c and fdt_addresses.c
 to sync script
Date: Tue, 3 Oct 2017 18:04:17 -0400
Message-ID: <20171003220417.GA13661@bill-the-cat>
References: <20171003183118.2438-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171003183118.2438-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kyle Yan <kyan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 01:31:17PM -0500, Rob Herring wrote:

> libfdt has gained some new files. We need to include them in the
> kernel's copy.
>=20
> Reported-by: Kyle Yan <kyan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  scripts/dtc/update-dtc-source.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-so=
urce.sh
> index b8ebcc6722d2..f3e5c596050a 100755
> --- a/scripts/dtc/update-dtc-source.sh
> +++ b/scripts/dtc/update-dtc-source.sh
> @@ -34,7 +34,9 @@ DTC_SOURCE=3D"checks.c data.c dtc.c dtc.h flattree.c fs=
tree.c livetree.c srcpos.c
>  		srcpos.h treesource.c util.c util.h version_gen.h Makefile.dtc \
>  		dtc-lexer.l dtc-parser.y"
>  DTC_GENERATED=3D"dtc-lexer.lex.c dtc-parser.tab.c dtc-parser.tab.h"
> -LIBFDT_SOURCE=3D"Makefile.libfdt fdt.c fdt.h fdt_empty_tree.c fdt_ro.c f=
dt_rw.c fdt_strerror.c fdt_sw.c fdt_wip.c libfdt.h libfdt_env.h libfdt_inte=
rnal.h"
> +LIBFDT_SOURCE=3D"Makefile.libfdt fdt.c fdt.h fdt_addresses.c fdt_empty_t=
ree.c \
> +		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
> +		fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"

Should there be a patch #3 to update the kernel libfdt to include these
new files that we're copying in too?  That seems to be the main user
in-tree of the libfdt C files, aside from the 'libfdt' targets under
arch/{arm,powerpc}/boot/  Thanks!

--=20
Tom

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZ1AlhAAoJEIf59jXTHXZSE1AQAJb+/aEfWI6tLictWUdNME/E
T4BMPRaNiQcGkYW+eFpnZgAYg3pUwUdCkC2xnQal9JgsKGUAbpbatUzIHYUATNWK
TkSCsuU+VDqCtt3aiMlPIFcN200D98HU8/jF8V6kAuVrlAlVCzUV/R25izSngkyP
5HpwPXnLUiiXymMNkoHuGneueFmrggd9/hEQdY6w7t777NTnWUH8uewSQV1DWiWN
Hgo4iLaII8sgOKmdqLvflFMe0TUSIlUuimVKTpa/b5bLvbjtiWYL9QEKe8o+xQz3
+WxqJ0A776lYCiFxMfhSS528E6BswCFF6q8uGAL1uCLEdewVLxjmGkY/VnWJppLu
FEM3oyQbIW9D7x2y7z2ymUgMdlgkRp4yi63SEW9Ii2IUxuP7GfZ1ZXK3cewysEMt
1Mb8ehQIGX1cuC/huF8rV6bZCzNj59EcL41GG0+b1UEgfZlRuv974QXbWNWkEC25
Qc9WP7nljbpvSjzOWOcN2L/CFYw6SYvW5TbpVxLEi5Yzn16Z2uyPBGgynT7nnejj
1zQJfrA2S1sB4VaHQqFdjSq6eJJTDuWWhm5gSRbkK2XiaEYgWwvE8TxkOY9nisyp
dHNMNyxKgxeTpgGluuh/Q3iNmQ8cZy/ANEl85ArtWpXCl0PmgJo0fdfJPRZcLiGR
u/0uS+L9zJkqOy8OxOJ6
=/cVa
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
