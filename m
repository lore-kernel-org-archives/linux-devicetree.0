From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RFC 1/2] libfdt: Add node and property realloc functions.
Date: Thu, 11 Apr 2013 11:46:32 +1000
Message-ID: <20130411014632.GO8165@truffula.fritz.box>
References: <1365604278-17956-1-git-send-email-srinivas.kandagatla@st.com>
 <1365604398-18064-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2992273947620610172=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365604398-18064-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============2992273947620610172==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+NfgObvpQT1Q9Yq"
Content-Disposition: inline

--U+NfgObvpQT1Q9Yq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 03:33:18PM +0100, Srinivas KANDAGATLA wrote:
> libfdt has code to add new property or node or extend a property to an
> arbitary value, however it cannot be used because all the library
> functions take preallocated fdt pointer limted to a size.
>=20
> Adding realloc function into libfdt can help tools like fdtput to insert
> nodes or properties or extend a property.
>=20
> Without this patch if we try to add a new node/property to a dtb, the
> libfdt errors with FDT_ERR_NOSPACE.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> ---
>  libfdt/fdt_rw.c |   39 +++++++++++++++++++++++++++++++++++++++
>  libfdt/libfdt.h |    4 ++++
>  2 files changed, 43 insertions(+), 0 deletions(-)
>=20
> diff --git a/libfdt/fdt_rw.c b/libfdt/fdt_rw.c
> index fdba618..e7766d0 100644
> --- a/libfdt/fdt_rw.c
> +++ b/libfdt/fdt_rw.c
> @@ -52,6 +52,7 @@
> =20
>  #include <fdt.h>
>  #include <libfdt.h>
> +#include <stdlib.h>

This is kind of the heart of the matter.  libfdt is supposed to be
embeddeable into bootloaders and other weird and limited environments.
For this reason we can never directly include standard libc headers.
Instead *every* dependency of libfdt must be provided by libfdt_env.h
(which can be replaced depending on your build environment).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--U+NfgObvpQT1Q9Yq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFmFfgACgkQaILKxv3ab8Z1XACfaqMvvAzqS1dM9izY9g9NgHYG
KEEAoIR9DJmVSBtXC+VT2H0KCFeySIJ5
=/c8h
-----END PGP SIGNATURE-----

--U+NfgObvpQT1Q9Yq--


--===============2992273947620610172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2992273947620610172==--
