From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: add hym8563 rtc to Radxa Rock board
Date: Wed, 27 Aug 2014 23:44:56 +0200
Message-ID: <6745529.KGldgCPX1B@diego>
References: <2306550.nl6CA81PdX@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2306550.nl6CA81PdX@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 20. August 2014, 21:07:22 schrieb Heiko St=FCbner:
> The Radxa Rock uses a hym8563 as rtc. Add the i2c device and necessar=
y
> pinconfig for the interrupt pin - labeled rtc_int in the schematics.
>=20
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

Added both patches to my v3.18-next/dts branch.


> ---
> if nobody complains I'll queue this into my v3.18-next/dts branch
>=20
>  arch/arm/boot/dts/rk3188-radxarock.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts
> b/arch/arm/boot/dts/rk3188-radxarock.dts index ef72faf..ff35acfa 1006=
44
> --- a/arch/arm/boot/dts/rk3188-radxarock.dts
> +++ b/arch/arm/boot/dts/rk3188-radxarock.dts
> @@ -80,6 +80,17 @@
>  	status =3D "okay";
>  	clock-frequency =3D <400000>;
>=20
> +	rtc@51 {
> +		compatible =3D "haoyu,hym8563";
> +		reg =3D <0x51>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <13 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&rtc_int>;
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "xin32k";
> +	};
> +
>  	act8846: act8846@5a {
>  		compatible =3D "active-semi,act8846";
>  		reg =3D <0x5a>;
> @@ -196,6 +207,12 @@
>  		};
>  	};
>=20
> +	hym8563 {
> +		rtc_int: rtc-int {
> +			rockchip,pins =3D <RK_GPIO0 0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
>  	ir-receiver {
>  		ir_recv_pin: ir-recv-pin {
>  			rockchip,pins =3D <RK_GPIO0 10 RK_FUNC_GPIO &pcfg_pull_none>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
