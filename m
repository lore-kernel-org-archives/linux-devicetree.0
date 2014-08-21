From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: zynq: DT: Fix Ethernet phy modes
Date: Thu, 21 Aug 2014 10:42:37 +0200
Message-ID: <9d406f69-6022-4e61-84df-20eee5d9cd1b@BL2FFO11FD024.protection.gbl>
References: <1408550219-19825-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="meCTC0GEiCeAGG3Pll6VifOgPRkHWi5Of"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408550219-19825-1-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--meCTC0GEiCeAGG3Pll6VifOgPRkHWi5Of
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 08/20/2014 05:56 PM, Soren Brinkmann wrote:
> The used PHYs should be qualified as 'rgmii-id' instead of just 'rgmii'=
=2E
> For the Zed board this seems to make a difference between working and
> broken Ethernet.
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/zynq-zc702.dts | 2 +-
>  arch/arm/boot/dts/zynq-zc706.dts | 2 +-
>  arch/arm/boot/dts/zynq-zed.dts   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-=
zc702.dts
> index 835c3089c61c..30bcfe20f0bc 100644
> --- a/arch/arm/boot/dts/zynq-zc702.dts
> +++ b/arch/arm/boot/dts/zynq-zc702.dts
> @@ -35,7 +35,7 @@
> =20
>  &gem0 {
>  	status =3D "okay";
> -	phy-mode =3D "rgmii";
> +	phy-mode =3D "rgmii-id";
>  };
> =20
>  &i2c0 {
> diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-=
zc706.dts
> index 4cc9913078cd..3d9cb023e158 100644
> --- a/arch/arm/boot/dts/zynq-zc706.dts
> +++ b/arch/arm/boot/dts/zynq-zc706.dts
> @@ -32,7 +32,7 @@
> =20
>  &gem0 {
>  	status =3D "okay";
> -	phy-mode =3D "rgmii";
> +	phy-mode =3D "rgmii-id";
>  };
> =20
>  &i2c0 {
> diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-ze=
d.dts
> index 82d7ef1a9a9c..42deb1b7dbc8 100644
> --- a/arch/arm/boot/dts/zynq-zed.dts
> +++ b/arch/arm/boot/dts/zynq-zed.dts
> @@ -32,7 +32,7 @@
> =20
>  &gem0 {
>  	status =3D "okay";
> -	phy-mode =3D "rgmii";
> +	phy-mode =3D "rgmii-id";
>  };
> =20
>  &sdhci0 {
>=20

Applied.

M



--meCTC0GEiCeAGG3Pll6VifOgPRkHWi5Of
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAlP1sP0ACgkQykllyylKDCEVFwCfewhmCF5o3PzWZaObGPDBCGJD
REAAn3wq/tDiPGpfgBKSb26keh5jMT39
=4SmW
-----END PGP SIGNATURE-----

--meCTC0GEiCeAGG3Pll6VifOgPRkHWi5Of--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
