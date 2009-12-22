From: Michael Ellerman <michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH] of/flattree: use callback to setup initrd from /chosen
Date: Tue, 22 Dec 2009 21:47:48 +1100
Message-ID: <1261478868.10767.2.camel@concordia>
References: <1261474791.289871.854376051633.1.gpush@pororo>
Reply-To: michael-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0952070966579577654=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1261474791.289871.854376051633.1.gpush@pororo>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0952070966579577654==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-KrmK5jScTDR/5IkVIssI"


--=-KrmK5jScTDR/5IkVIssI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2009-12-22 at 17:39 +0800, Jeremy Kerr wrote:
> At present, the fdt code sets the kernel-wide initrd_start and
> initrd_end variables when parsing /chosen. On ARM, we only set these
> once the bootmem has been reserved.
>=20
> This change adds an arch callback to setup the initrd from the device
> tree:
>=20
>  void early_init_dt_setup_initrd_arch(unsigned long start,
> 				      unsigned long end);

arch_early_init_dt_setup_initrd() makes more sense to me, but ..

> +#ifdef CONFIG_BLK_DEV_INITRD
> +void __init early_init_dt_setup_initrd_arch(unsigned long start,
> +		unsigned long end)
> +{
> +	initrd_start =3D (unsigned long)__va(start);
> +	initrd_end =3D (unsigned long)__va(end);
> +	initrd_below_start_ok =3D 1;
> +}
> +#endif

Given you have two identical implementations why not make that the
default and make it weak, and let ARM override it.

cheers



--=-KrmK5jScTDR/5IkVIssI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkswo9AACgkQdSjSd0sB4dIdMgCgvF4W8MGiNrOwiZ5YJXzyqNiP
vskAn39avWrLiMN1s8MJ9G4ey9Lg+Mlq
=l4Gm
-----END PGP SIGNATURE-----

--=-KrmK5jScTDR/5IkVIssI--


--===============0952070966579577654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0952070966579577654==--
