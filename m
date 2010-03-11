From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH 2/3] of/flattree: Make unflatten_device_tree() safe to
	call from any arch
Date: Fri, 12 Mar 2010 10:48:40 +1100
Message-ID: <20100312104840.2128fe99.sfr@canb.auug.org.au>
References: <20100311173024.4423.53178.stgit@angua>
	<20100311173203.4423.8733.stgit@angua>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7050782989686761174=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100311173203.4423.8733.stgit@angua>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============7050782989686761174==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__12_Mar_2010_10_48_40_+1100_78MdD8qFEPUyYrv3"

--Signature=_Fri__12_Mar_2010_10_48_40_+1100_78MdD8qFEPUyYrv3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Thu, 11 Mar 2010 10:32:03 -0700 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>
> - If CONFIG_OF_FLATTREE is not set, then make unflatten_device_tree()
>   an empty #define.

"an empty static inline funtion."

> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index f0fdd1f..54399f1 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -99,6 +99,8 @@ extern int early_init_dt_scan_root(unsigned long node, =
const char *uname,
>  /* Other Prototypes */
>  extern void unflatten_device_tree(void);
>  extern void early_init_devtree(void *);
> +#else /* CONFIG_OF_FLATTREE */
> +static inline void define unflatten_device_tree(void) {}
                      ^^^^^^
You need to remove that.

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__12_Mar_2010_10_48_40_+1100_78MdD8qFEPUyYrv3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuZgVgACgkQjjKRsyhoI8xIfQCffmMd7zivdpAOUCKyMUTfwkRG
UZwAoKelHuq+xFrCqlSQ1N5yRUrxfCxR
=R7bC
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Mar_2010_10_48_40_+1100_78MdD8qFEPUyYrv3--

--===============7050782989686761174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7050782989686761174==--
