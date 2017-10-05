From: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH 1/2] scripts/dtc: add fdt_overlay.c and fdt_addresses.c
 to sync script
Date: Thu, 5 Oct 2017 10:39:30 -0400
Message-ID: <20171005143930.GB25966@bill-the-cat>
References: <20171003183118.2438-1-robh@kernel.org>
 <20171003220417.GA13661@bill-the-cat>
 <CAL_Jsq+Ruvu11Nu92FtgGcO0PqxCQk5KhiQAgj8JzbzPKNseqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Ruvu11Nu92FtgGcO0PqxCQk5KhiQAgj8JzbzPKNseqQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Kyle Yan <kyan@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 05:23:28PM -0500, Rob Herring wrote:
> On Tue, Oct 3, 2017 at 5:04 PM, Tom Rini <trini@konsulko.com> wrote:
> > On Tue, Oct 03, 2017 at 01:31:17PM -0500, Rob Herring wrote:
> >
> >> libfdt has gained some new files. We need to include them in the
> >> kernel's copy.
> >>
> >> Reported-by: Kyle Yan <kyan@codeaurora.org>
> >> Signed-off-by: Rob Herring <robh@kernel.org>
> >> ---
> >>  scripts/dtc/update-dtc-source.sh | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc=
-source.sh
> >> index b8ebcc6722d2..f3e5c596050a 100755
> >> --- a/scripts/dtc/update-dtc-source.sh
> >> +++ b/scripts/dtc/update-dtc-source.sh
> >> @@ -34,7 +34,9 @@ DTC_SOURCE=3D"checks.c data.c dtc.c dtc.h flattree.c=
 fstree.c livetree.c srcpos.c
> >>               srcpos.h treesource.c util.c util.h version_gen.h Makefi=
le.dtc \
> >>               dtc-lexer.l dtc-parser.y"
> >>  DTC_GENERATED=3D"dtc-lexer.lex.c dtc-parser.tab.c dtc-parser.tab.h"
> >> -LIBFDT_SOURCE=3D"Makefile.libfdt fdt.c fdt.h fdt_empty_tree.c fdt_ro.=
c fdt_rw.c fdt_strerror.c fdt_sw.c fdt_wip.c libfdt.h libfdt_env.h libfdt_i=
nternal.h"
> >> +LIBFDT_SOURCE=3D"Makefile.libfdt fdt.c fdt.h fdt_addresses.c fdt_empt=
y_tree.c \
> >> +             fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
> >> +             fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
> >
> > Should there be a patch #3 to update the kernel libfdt to include these
> > new files that we're copying in too?  That seems to be the main user
> > in-tree of the libfdt C files, aside from the 'libfdt' targets under
> > arch/{arm,powerpc}/boot/  Thanks!
>=20
> Yes, good point. But we can add them when someone wants to use them.
> Adding them to the build will bloat the kernel because libfdt doesn't
> get built as a static lib (another problem to solve).

Well, isn't the kernel starting to more widely use
-ffunction-sections/-fdata-sections/--gc-unused-sections ?

--=20
Tom

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZ1kQhAAoJEIf59jXTHXZSLgUP/jdI/okH+7kDwx9YpURYP2Ts
ysHGu7A7onZmrqr00XH/mNzJMpQRVM6oDy9zMae0HimA4ZT2wbdSrOK8U62aHtbW
nsT/Cc+WbLZcmz1icWKiFOFL+9yvQKf5Du507U4kAg+ckalZLQ2q1dL6oBpnYCzE
r+uNq7YpLgXTICGvh6Me5A5/AE/xVc/7veVu/Zw2sTCG9ja5Gd0z4X6NVXyEdVaK
ffT9n6xlr8gSjxfvETflH6DmAWyKaKnUjqBiix5QqHWtmJk8WOuDmGcl06s05DP9
9nWH49wTzweyAbpekLEpFSOfqbyKQNBbRFzdId5SKMOlD3a2ChWIdwvKCxecDJow
LDqy+cZItiwXxHgy/0G5hQ1ZORCOOQdR834Bku6jU6sfqB+gGLv/Z0p+GBg8vrOt
rjpLBzP1E3epyfrV45eqIdzJAmYRVjDTrz7UVXcd/zlJLHKJ1w9d+gAwsFPYrXI1
YZxejHRpGxmHOSZd76T6FDCpqh1ugebIDthQmAoB2bIOW3cuZ2tcUwoWKinKzJJT
MH824v522re3B7iXe/azB/5lRvagZJEokC+zgdr25pamS53bD1YGzjAtbGpnydlJ
kEkpxyc+OtkYOsSwy+baVnNEb7eOdU8mpglh3kmCK12rsTBCGx1OdlEfrqI1JBNg
GC8EssbbPbzjMCwk3TiO
=yVMK
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
