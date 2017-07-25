From: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/10] arm64: zynqmp: Add references to cpu nodes
Date: Tue, 25 Jul 2017 09:47:22 -0700
Message-ID: <20170725164722.GA30669@tyrael.ni.corp.natinst.com>
References: <cover.1500552941.git.michal.simek@xilinx.com>
 <b9a61dfe7f5d4309b3131c1b9a82890888838087.1500552941.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b9a61dfe7f5d4309b3131c1b9a82890888838087.1500552941.git.michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?iso-8859-1?Q?S=F6ren?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, "Edgar E. Iglesias" <edgar.iglesias-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Krsmanovic <stefan.krsmanovic-XdEHnvbJQ9jQT0dZR+AlfA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Will Wong <willw-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2017 at 02:17:00PM +0200, Michal Simek wrote:
> Add missing references to all cpu nodes.
>=20
> Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>=20
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts=
/xilinx/zynqmp.dtsi
> index 1a3f5e928bb9..4f7d9905e235 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -20,28 +20,28 @@
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20
> -		cpu@0 {
> +		cpu0: cpu@0 {
>  			compatible =3D "arm,cortex-a53", "arm,armv8";
>  			device_type =3D "cpu";
>  			enable-method =3D "psci";
>  			reg =3D <0x0>;
>  		};
> =20
> -		cpu@1 {
> +		cpu1: cpu@1 {
>  			compatible =3D "arm,cortex-a53", "arm,armv8";
>  			device_type =3D "cpu";
>  			enable-method =3D "psci";
>  			reg =3D <0x1>;
>  		};
> =20
> -		cpu@2 {
> +		cpu2: cpu@2 {
>  			compatible =3D "arm,cortex-a53", "arm,armv8";
>  			device_type =3D "cpu";
>  			enable-method =3D "psci";
>  			reg =3D <0x2>;
>  		};
> =20
> -		cpu@3 {
> +		cpu3: cpu@3 {
>  			compatible =3D "arm,cortex-a53", "arm,armv8";
>  			device_type =3D "cpu";
>  			enable-method =3D "psci";
> --=20
> 1.9.1
>=20

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZd3YYAAoJEL5CEHepFqovGXgH/jKcTf0b/WGO/LjWeyZ7mLGe
+E0Y8rlgMHDorpxInrRWERm7EZOzYoTAsiNBUR/xPeGzmTusfIaUC7N9BUh1N2u8
yFKVqtHPtHZzm0+A002WbMdY9Ro4EwNyjR/V5JcjvABSgr+nk4vySmvbSChklGK8
/MHdTx81Y+DVpvvM1YvFpxX7i6mOaGTy/G17A0tMqZD2RacEfq8h4TldXBOJs+CY
umY4vTsXx+HxkjTMGopS9fbl2x3icfcvEqzUj8YUnaIk/g1Jf86wtxfNqruYeBw+
jWDcHufS4A4mDiB+hAzQHeaEFeyuX/AWG/hHJh1GnKQl96OkQHMI5zvO3s7S9Rs=
=6iBI
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
