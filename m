From: =?windows-1252?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: zynq: Add missing alias node for zybo and
 parallella
Date: Wed, 11 Feb 2015 18:22:50 +0100
Message-ID: <54DB8FEA.3050008@suse.de>
References: <0a0e0579fb6e2794d2c0c6fb9186c5b43618f448.1423657710.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="aTC3dX8PEw823gN4UG4p9A7CqDJqgwFft"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0a0e0579fb6e2794d2c0c6fb9186c5b43618f448.1423657710.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Josh Cartwright <josh.cartwright-acOepvfBmUk@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?windows-1252?Q?S=F6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Ola Jeppsson <ola-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aTC3dX8PEw823gN4UG4p9A7CqDJqgwFft
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Am 11.02.2015 um 13:29 schrieb Michal Simek:
> Add missing alias node.
>=20
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>=20
>  arch/arm/boot/dts/zynq-parallella.dts | 5 +++++
>  arch/arm/boot/dts/zynq-zybo.dts       | 5 +++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/=
zynq-parallella.dts
> index ab1dc0a56cdd..6a5f51daa708 100644
> --- a/arch/arm/boot/dts/zynq-parallella.dts
> +++ b/arch/arm/boot/dts/zynq-parallella.dts
> @@ -23,6 +23,11 @@
>  	model =3D "Adapteva Parallella Board";
>  	compatible =3D "adapteva,parallella", "xlnx,zynq-7000";
> =20
> +	aliases {
> +		ethernet0 =3D &gem0;
> +		serial0 =3D &uart1;
> +	};
> +
>  	memory {
>  		device_type =3D "memory";
>  		reg =3D <0x0 0x40000000>;
[snip]

Reviewed-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>

Please CC me next time, as I am refactoring this file into a .dtsi for
adding the USB nodes. I'll rebase on this one then.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Jennifer Guild, Dilip Upmanyu,
Graham Norton; HRB 21284 (AG N=FCrnberg)


--aTC3dX8PEw823gN4UG4p9A7CqDJqgwFft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJU24/tAAoJEPou0S0+fgE/ddcP/RDPOA+pdb6TzV2pWc8pfJDC
vowv3tUbOTPDdyWzqEsKG/Gm3DGX8fEwhuY7WVyChX0PogJtdVMZs76H8/3eRQ41
BsrJ1msLS9mzVyLFTmc14LRwN87XaYvGl67H40IdhqtYC6jW4MGNnXmhLS1iRQBA
ZzNBrt3z7s2xQ/OHJUCO99w4gu0TBE2PyGKiu0Ev4wvRwZPaidfLR1J3wZpTp2Y0
aw+JGk43DAa3xYQ9+R5DiHTaHTZnXK+FxAxyaYCwBRM6ElLiCC1o0KcNCsPIqgSj
iF355lEWrQqkLIaLqRbCwRKbF1qhdqoABhyfWN2TSKKhHn8G8JOOqJKU48e6YXKe
Sk6G3jnEzvqnKB9rafW//MSfk7+YWtSnW28wWDBwr0HbpCYq95PPPALhpG1CF2Ls
enZXuh/TfjwwRdIbKPeEY/WHsX/0/iHFR5Oups8Jwp9rCpGtDKOPuITeWb0ISIfT
zgpARgJdHR/kuZ4PaMBJdOm/mVLM2S05cSxAcEUP55/Ps1l/PlbfSbOM/R5Jet0E
7liM9rOh0PLRUXyUxM9I2hbibsmyHUXyq+gVcZqBOURVJUtOST+9RWZHHBLYra4L
gDgjrv12hS0y7HLH+AFkeIqOlJLjmRMzskaT27/VZc1LP/K5poNiQ1dDQDpuVcuU
mLdjy03++94H6Cy1aIxF
=u49u
-----END PGP SIGNATURE-----

--aTC3dX8PEw823gN4UG4p9A7CqDJqgwFft--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
