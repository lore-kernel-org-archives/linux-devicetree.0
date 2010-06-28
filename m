From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH] of/Kconfig: Add "config OF"
Date: Tue, 29 Jun 2010 04:11:12 +1000
Message-ID: <20100629041112.0eed017a.sfr@canb.auug.org.au>
References: <a528d660-c029-4a84-840c-1fb9278ea861@VA3EHSMHS031.ehs.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4075107025624797747=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <a528d660-c029-4a84-840c-1fb9278ea861-+Ck8Kgl/v0/nHLUNXTEFU7jjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============4075107025624797747==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__29_Jun_2010_04_11_12_+1000_L+9UgcVVz06t6xKZ"

--Signature=_Tue__29_Jun_2010_04_11_12_+1000_L+9UgcVVz06t6xKZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, 28 Jun 2010 10:47:55 -0700 Stephen Neuendorffer <stephen.neuendorff=
er-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
> Conceivably, device tree parsing could work on any architecture, but
> unless this is defined somewhere in Kconfig that is not architecture spec=
ific, it won't work.
>=20
> The architecture specific versions of this should get abstracted.
> ---
>  drivers/of/Kconfig |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index e8286d4..26957a2 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -1,3 +1,7 @@
> +config OF
> +	bool
> +	default n

You don't need the "default n", it is implicit.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__29_Jun_2010_04_11_12_+1000_L+9UgcVVz06t6xKZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMKOXAAAoJEDMEi1NhKgbs8vgIAJLc5RoKhYargmt+X4E71SHM
SiGqVqSJapaHeZNtnDzp2mKqbsJSUVIwmsOabbJUD9tucADQUtiB/+T9Cuve/DAk
YCb/N/R+eU6fKDaP5oPLpcT54NIcAN1x2p8dV3JwMalaLIATBWGfL8lkUE36NGKs
BCC04w5m5utcX7rCu3H7jz3uFKoWOjOc1zxxItm+6wOr7DMlPDw6CJmcuSphcTkw
a3M6MWo6DWh/xoKz8TKQ4UGMH+CUqS3erhU8Pqu1UNEs+zHKTwPnTR5kFWdszMX8
XXN0TYbtRXCljlqNBFJWjFyDRxOuXrGWe3b5/rCmcI/NIueCOZN+Ttn4cdc6tbQ=
=k+HY
-----END PGP SIGNATURE-----

--Signature=_Tue__29_Jun_2010_04_11_12_+1000_L+9UgcVVz06t6xKZ--

--===============4075107025624797747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4075107025624797747==--
