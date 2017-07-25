From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 09/10] arm64: zynqmp: Add new uartps compatible string
Date: Tue, 25 Jul 2017 09:49:17 -0700
Message-ID: <20170725164917.GB30669@tyrael.ni.corp.natinst.com>
References: <cover.1500552941.git.michal.simek@xilinx.com>
 <4babfd9b8311073566a5d5730353c035bb5afa2a.1500552941.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4babfd9b8311073566a5d5730353c035bb5afa2a.1500552941.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, "Edgar E. Iglesias" <edgar.iglesias-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Krsmanovic <stefan.krsmanovic-XdEHnvbJQ9jQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 02:17:08PM +0200, Michal Simek wrote:
> Mainline kernel has r1p12 compatible string now. Use this new compatible
> string and also append generic compatible string.
> Keep in your mind that using this generic compatible string not all uart
> features will be available.
>=20
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>=20
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts=
/xilinx/zynqmp.dtsi
> index 4adf5285f56d..9304249a23ed 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -407,7 +407,7 @@
>  		};
> =20
>  		uart0: serial@ff000000 {
> -			compatible =3D "cdns,uart-r1p8";
> +			compatible =3D "cdns,uart-r1p12", "xlnx,xuartps";
>  			status =3D "disabled";
>  			interrupt-parent =3D <&gic>;
>  			interrupts =3D <0 21 4>;
> @@ -416,7 +416,7 @@
>  		};
> =20
>  		uart1: serial@ff010000 {
> -			compatible =3D "cdns,uart-r1p8";
> +			compatible =3D "cdns,uart-r1p12", "xlnx,xuartps";
>  			status =3D "disabled";
>  			interrupt-parent =3D <&gic>;
>  			interrupts =3D <0 22 4>;
> --=20
> 1.9.1
>=20

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZd3aLAAoJEL5CEHepFqovIH4H/3cEi2Rr9M2TR9pBgJ8EpPoV
E9Ip8DmMys8buw8aeVLl1CKmbAkci4PeW4t+p4PeCDnoeLumuAx9DZFEwtrHoin1
eA2QXuyS/G3PBoX0HHaOmT0/edv8ConjW1vFirDppkKG8oouYg/xb8JOh919NuNH
NCmqLJ6/QZOvwpWmjHppaK/5Sd8MtjeAmGnUukM7rVv86wQU+AaYubUDFgcH7t7K
A5ZM8xAzdwqGQlsK8tMDoyD77cE7lfFwpsbcfieybUj2uLDnImQXK50WPSoBz89U
areuIft4zZc34zdq6jeUYIH5dYTIdw+NbQC8pbrWxQSqivDWtGdEtmpZoS29n94=
=RwOE
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
