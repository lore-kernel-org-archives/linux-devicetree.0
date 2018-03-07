Return-Path: <SRS0=WAEb=F5=vger.kernel.org=devicetree-compiler-owner@kernel.org>
Date: Wed, 7 Mar 2018 13:39:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] libfdt: include "..." instead of <...> from libfdt.h
Message-ID: <20180307023915.GD3083@umbus.fritz.box>
References: <1520172484-26867-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RYJh/3oyKhIjGcML"
Content-Disposition: inline
In-Reply-To: <1520172484-26867-1-git-send-email-yamada.masahiro@socionext.com>
Sender: devicetree-compiler-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--RYJh/3oyKhIjGcML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 04, 2018 at 11:08:04PM +0900, Masahiro Yamada wrote:
> Assuming fdt.h, libfdt.h, and libfdt_env.h will be installed to the
> same directory,

That's very likely for fdt.h and libfdt.h, but not so much for
libfdt_env.h.  libfdt is designed so that libfdt_env.h can be replaced
with something suitable for embedding in a different environment, and
in that case it's often inconvenient to put libfdt_env.h in the same
directory (because then it wouldn't be an exact copy of dtc upstream).

> it wouldn't hurt to use #include "..." for inclusion
> among installed headers.
>=20
> This change is useful for cases where those headers do not reside in
> the header search paths.

The general idea has been that to compile libfdt you should set your
header search paths to something suitable.  What situations does that
become difficult or impossible in?

> For example, Linux kernel edits these two lines when importing libfdt
> (see scripts/dtc/update-dtc-source.sh)  It is needed for kernel because
> include/linux/libfdt.h is a wrapper of scripts/dtc/libfdt/libfdt.h, and
> scripts/dtc/libfdt is not contained in the header search paths.

Oh, yuck.  I hadn't realised the kernel was using such a gross hack.
We need to find a better way, but I'm not certain if this is it.

>=20
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>=20
>  libfdt/libfdt.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> index c8c00fa..1e27780 100644
> --- a/libfdt/libfdt.h
> +++ b/libfdt/libfdt.h
> @@ -51,8 +51,8 @@
>   *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>   */
> =20
> -#include <libfdt_env.h>
> -#include <fdt.h>
> +#include "libfdt_env.h"
> +#include "fdt.h"
> =20
>  #define FDT_FIRST_SUPPORTED_VERSION	0x02
>  #define FDT_LAST_SUPPORTED_VERSION	0x11

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--RYJh/3oyKhIjGcML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlqfUNIACgkQbDjKyiDZ
s5IychAAzZG1P5ZSiQCn4FzyIF2Pm0n09XLMG6GQwOAJ8qmNdrq2DUCZgahMFh+3
prpbAcQoaKWZL9vROUlQ5n50PUFFsk4EyeeP9TiKDNk7ANRNPTcDESvS001+HCkj
kOfhpLAMOq28mxSz6yXnSsM2JllYdvRpzpXM54EdvReEmWuBzA4s+dxPb2tV5WqK
oquL/U3zsUw/UiQxO2Iy66NPx1DbkN/Fm5XPzxUc8px/ohjqsNWg95tLebH/SH10
FGGkfv4DlJVynrayp5VfgZw2WynUbtCs1/pFwpz9tUqyx3rs+h0FqLmajP2RxtDf
FEuvOKwXbTvWkO7+JD3ZfCm16rSsxF6x0idLyNK6qbqK7Ygh+3EKustEehzEQSpM
oR3JqNA836zIHyy/2vlwlahXuLgWVNe6sV/+6731tgrQaNG3kcR4uXid3ji3KMXR
hsX2EKCOJ3eiZ9Ti0dNhSBDDigqea/9fOq5FXpi9SrdHK3z5NUdwRlwGAqY831ns
hT4OFFgdmDWAYCfsC6sNJk/vopJJq67gFn/PNWhyRyVevqOy5tDXgY5NkNUYTKtM
DXlrvCHq4syCcF3oD/GBaE2PTj8EW2YaH4J0SFrJPUOAH5Tvn5hs3rwgMiFS8j/3
QXe6bTYst1p6iA3WPnkfeSLoP43H+oGOd+95kAYAtaGpJpCZY78=
=GGYk
-----END PGP SIGNATURE-----

--RYJh/3oyKhIjGcML--
