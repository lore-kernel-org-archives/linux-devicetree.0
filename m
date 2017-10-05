From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] scripts/dtc: add fdt_overlay.c and fdt_addresses.c
 to sync script
Date: Thu, 5 Oct 2017 15:50:07 -0400
Message-ID: <20171005195007.GD25966@bill-the-cat>
References: <20171003183118.2438-1-robh@kernel.org>
 <20171003220417.GA13661@bill-the-cat>
 <CAL_Jsq+Ruvu11Nu92FtgGcO0PqxCQk5KhiQAgj8JzbzPKNseqQ@mail.gmail.com>
 <20171005143930.GB25966@bill-the-cat>
 <CAL_JsqLGm_OhJUUys7-1s_+rk48sJPKBVR_dTJOB4Lu92GL_Zg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLGm_OhJUUys7-1s_+rk48sJPKBVR_dTJOB4Lu92GL_Zg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kyle Yan <kyan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 05, 2017 at 10:09:39AM -0500, Rob Herring wrote:
> On Thu, Oct 5, 2017 at 9:39 AM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > On Tue, Oct 03, 2017 at 05:23:28PM -0500, Rob Herring wrote:
> >> On Tue, Oct 3, 2017 at 5:04 PM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> > On Tue, Oct 03, 2017 at 01:31:17PM -0500, Rob Herring wrote:
> >> >
> >> >> libfdt has gained some new files. We need to include them in the
> >> >> kernel's copy.
> >> >>
> >> >> Reported-by: Kyle Yan <kyan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> >> >> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> >> ---
> >> >>  scripts/dtc/update-dtc-source.sh | 4 +++-
> >> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >> >>
> >> >> diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-=
dtc-source.sh
> >> >> index b8ebcc6722d2..f3e5c596050a 100755
> >> >> --- a/scripts/dtc/update-dtc-source.sh
> >> >> +++ b/scripts/dtc/update-dtc-source.sh
> >> >> @@ -34,7 +34,9 @@ DTC_SOURCE=3D"checks.c data.c dtc.c dtc.h flattre=
e.c fstree.c livetree.c srcpos.c
> >> >>               srcpos.h treesource.c util.c util.h version_gen.h Mak=
efile.dtc \
> >> >>               dtc-lexer.l dtc-parser.y"
> >> >>  DTC_GENERATED=3D"dtc-lexer.lex.c dtc-parser.tab.c dtc-parser.tab.h"
> >> >> -LIBFDT_SOURCE=3D"Makefile.libfdt fdt.c fdt.h fdt_empty_tree.c fdt_=
ro.c fdt_rw.c fdt_strerror.c fdt_sw.c fdt_wip.c libfdt.h libfdt_env.h libfd=
t_internal.h"
> >> >> +LIBFDT_SOURCE=3D"Makefile.libfdt fdt.c fdt.h fdt_addresses.c fdt_e=
mpty_tree.c \
> >> >> +             fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw=
=2Ec \
> >> >> +             fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
> >> >
> >> > Should there be a patch #3 to update the kernel libfdt to include th=
ese
> >> > new files that we're copying in too?  That seems to be the main user
> >> > in-tree of the libfdt C files, aside from the 'libfdt' targets under
> >> > arch/{arm,powerpc}/boot/  Thanks!
> >>
> >> Yes, good point. But we can add them when someone wants to use them.
> >> Adding them to the build will bloat the kernel because libfdt doesn't
> >> get built as a static lib (another problem to solve).
> >
> > Well, isn't the kernel starting to more widely use
> > -ffunction-sections/-fdata-sections/--gc-unused-sections ?
>=20
> Unfortunately, no. Nico Pitre did some work there, and I think it
> helps some but is incomplete because of how some of the kernel's
> assembly code works.

Yes, dealing with all assembly is difficult in that case, over in U-Boot
we have 'most' covered with manual labeling but ENTRY/ENDPROC got too
complex.  Oh well, I guess it's less of a concern in the kernel.

--=20
Tom

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZ1ozvAAoJEIf59jXTHXZSaXMP/3bTm4/oLUG46kR+y+3GlWX9
ESzkgakNPk1LrTz+YdtysE1lCZk7shLJnjHVJSeYEz9aZvqa245f7hyrUf81wvSp
QBC5vLzDFcgyUCHsBXs8xqLpkPW3EqyhCpUrjjifZqslU7i5NR73A9JFcS0Pb+I4
QGLCTtqBz24MpnRB1YbeomX4Cnr2iqtQJfGfE0rcFzHbtWhPeoEudtC8zHl87GTu
aoA45WoMCB/IoX7Y9gFUFtsr3EEnGv+GFUXtPO9sfBjgyxR663/wlM6kHNJcwOLT
THGv2aD8LDAeh0UZbF/IB4e8xmc5iAjJgfHkcrlcDrtLlIkBwnpWEtEqav/VTpqz
9jx8jp0d83y4zCxiSxo3uFOeP0PAqMEpqzQvipNSWfvCXiJOZhaYyXUdv0FQLdk7
Ske5uv9+D4sa0BxAlLPgFKsF1Zb5Sx+H4KG3FAT9y687sUThJn6SLWWvnvQtJRCE
8rptwFsMF1RrJg0UyXU64/ce5GscGdUr6MZMYgVOPRT4yL9nl2b3sO4eOR1hJNPl
IO811kh5HFSVKKxglWix3vxamuwmEHf1o0HQwFAzCkfW3TE0ouIv01dZ3Zbg91rd
YJQ51KYKC9ao7HiPABn/mSUctmEYaLHV5bABC65VqBXIT3/0dDz2Fy+q0cIw6+kG
yf7KIx+AAKDnn806bXgv
=T6Aq
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
