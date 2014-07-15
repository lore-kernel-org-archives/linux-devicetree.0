From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] DT: add vendor prefix for Foxlink Group
Date: Tue, 15 Jul 2014 12:44:09 +0200
Message-ID: <20140715104408.GC6616@ulmo>
References: <1401976412-27436-1-git-send-email-boris.brezillon@free-electrons.com>
 <1401976412-27436-2-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eHhjakXzOLJAF9wJ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1401976412-27436-2-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--eHhjakXzOLJAF9wJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2014 at 03:53:31PM +0200, Boris BREZILLON wrote:
> Add vendor prefix for Foxlink Group.
>=20
> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index abc3080..71c7749 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -46,6 +46,7 @@ epson	Seiko Epson Corp.
>  est	ESTeem Wireless Modems
>  eukrea  Eukr=C3=A9a Electromatique
>  excito	Excito
> +foxlink	Foxlink Group
>  fsl	Freescale Semiconductor
>  GEFanuc	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
>  gef	GE Fanuc Intelligent Platforms Embedded Systems, Inc.
> --=20
> 1.8.3.2

Rob,

are you going to take this via the DT tree or do you want me to pick it
up along with patch 2/2? In the latter case, can I have your Acked-by?

Thierry

--eHhjakXzOLJAF9wJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxQX4AAoJEN0jrNd/PrOhX7cP/iDo+2ymOYGGAdIrGEWRg9GU
rKaEfMhWOYlbAWwhAaDMSn6Qojgbq9uGlPX2RNeyOHAaowNmyHySu9WqdxJ0AtkW
C45bQ75Qx+Oro8ShQ/p4xQj06P7e6EBgGNBywahmrbwmDDWLRVXPPrTe9a4xfFbX
NcFylN9k4QSXEOoYWOXwl5aRVSeal3C7k6LmsozhWEt43vMFB34nPusTLKPkOIFL
V/iK7vj+EneWZoN/5R677dVhUt15WSgMut0wuVzs0g3DgW6G6vRWKdq+N5MVhKsJ
adgEMiBP/gfmQ3qD2b1xXVCn2qJ5CsYa9kkPXtPWZYILkr8u/dEzqrwMVSZH5jnw
KdFOCgpHfbm8qB/pyEk9yiey3DYG0Or+0Eq0FdZbc1CDHhG9SaiPjB6ONktTEFeV
4dNoq4FgNOcSO4eOc91XroUp/NMUKV/LFxFE9CDcpVv79asedf6gzpmflf6iWMQ+
m5XwEzVMr1XYhnjkOSAM4g+uD5fdgSROPT1Hp6getoXydKcmyKXZFqN+ND5gYgEp
/49hKNuJiPQY87CxNfLLCVvND8/pO4ETCtrpx2z7CxXyYHUYtEEx5T+CFOYPkxrp
xlMKYGF0qUflDj1NuzCwOnQ4iNAyJzS5CS0E9sVQpo2CDGAIkxjGeZcmc3k7KF8n
71Qk01I1+EVhadyCVuiv
=HnAT
-----END PGP SIGNATURE-----

--eHhjakXzOLJAF9wJ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
