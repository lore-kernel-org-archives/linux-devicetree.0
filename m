From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: zynq: Enable USB and USB PHY for ZYBO
Date: Tue, 9 Feb 2016 13:17:13 +0100
Message-ID: <56B9D8C9.7060000@xilinx.com>
References: <1454503265-20605-1-git-send-email-nathan@nathanrossi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454503265-20605-1-git-send-email-nathan-RujqobwCo1oIa9VG7nliCQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Rossi <nathan-RujqobwCo1oIa9VG7nliCQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 3.2.2016 13:41, Nathan Rossi wrote:
> Setup the USB controller and configure it to operate in host mode.
> Additionally add the USB phy node for the ZYBO, including reset gpio
> which is connected to a external MIO pin.
>=20
> Signed-off-by: Nathan Rossi <nathan-RujqobwCo1oIa9VG7nliCQ@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: S=C3=B6ren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/zynq-zybo.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/zynq-zybo.dts b/arch/arm/boot/dts/zynq=
-zybo.dts
> index 16c9cac..8f085b3 100644
> --- a/arch/arm/boot/dts/zynq-zybo.dts
> +++ b/arch/arm/boot/dts/zynq-zybo.dts
> @@ -33,6 +33,11 @@
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> +	usb_phy0: phy0 {
> +		#phy-cells =3D <0>;
> +		compatible =3D "usb-nop-xceiv";
> +		reset-gpios =3D <&gpio0 46 1>;
> +	};
>  };
> =20
>  &clkc {
> @@ -56,3 +61,9 @@
>  &uart1 {
>  	status =3D "okay";
>  };
> +
> +&usb0 {
> +	status =3D "okay";
> +	dr_mode =3D "host";
> +	usb-phy =3D <&usb_phy0>;
> +};
>=20


Applied.

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
