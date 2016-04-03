From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: amlogic: Add hiu and periphs buses
Date: Sun, 3 Apr 2016 19:19:07 +0200
Message-ID: <5701508B.1050403@suse.de>
References: <1459703681-8689-1-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459703681-8689-1-git-send-email-carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 03.04.2016 um 19:14 schrieb Carlo Caione:
> From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
>=20
> Add two new buses in the DTS: hiu and periphs buses.
> In the Amlogic S905/GXBB SoC several devices (clock / eth / pin
> controllers, etc...) are mapped under these two buses. Add them in th=
e
> DT before starting to add new devices.
>=20
> Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64=
/boot/dts/amlogic/meson-gxbb.dtsi
> index 832815d..3126f0c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -167,6 +167,22 @@
>  			};
>  		};
> =20
> +		periphs: periphs@c8834000 {
> +			compatible =3D "simple-bus";
> +			reg =3D <0x0 0xc8834000 0x0 0x2000>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges =3D <0x0 0x0 0x0 0xc8834000 0x0 0x2000>;
> +		};
> +
> +		hiubus: hiubus@c883c000 {
> +			compatible =3D "simple-bus";
> +			reg =3D <0x0 0xc883c000 0x0 0x2000>;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			ranges =3D <0x0 0x0 0x0 0xc883c000 0x0 0x2000>;
> +		};
> +
>  		apb: apb@d0000000 {
>  			compatible =3D "simple-bus";
>  			reg =3D <0x0 0xd0000000 0x0 0x200000>;

Looks sane, but where did you get that info from? The others I had foun=
d
in an iomap node or so but did not spot these.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG N=FC=
rnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
