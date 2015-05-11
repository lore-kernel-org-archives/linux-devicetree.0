From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: rockchip: add system-power-controller to act8846
Date: Mon, 11 May 2015 23:57:50 +0200
Message-ID: <2270228.43yCmaWq86@phil>
References: <64DE272A-FD25-406C-A51B-6C5B76DA5171@stud.hs-offenburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <64DE272A-FD25-406C-A51B-6C5B76DA5171-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Michael =?ISO-8859-1?Q?Niew=F6hner?= <mniewoeh-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, 11. Mai 2015, 22:57:21 schrieb Michael Niew=F6hner:
> Add system-power-controller to act8846 in rk3188-radxarock.dts in add=
ition
> to the act8846 patch fixing the reboot kernel panic
>=20
> Signed-off-by: Michael Niewoehner <mniewoeh-0BV18Q16miHGpFsiFCTsGXqWYbMAw+HU@public.gmane.org>

I have to ask, are you ok with the pending dts relicensing to a gpl2/x1=
1 dual=20
license [0]?

Otherwise this looks fine and the act8846 is the power-controller of th=
e=20
radxarock in any case, so I'll take this one in any case.


Heiko

[0] http://lists.infradead.org/pipermail/linux-rockchip/2015-March/0026=
44.html


> ---
>  arch/arm/boot/dts/rk3188-radxarock.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/rk3188-radxarock.dts
> b/arch/arm/boot/dts/rk3188-radxarock.dts index bdf8570..225a0eb 10064=
4
> --- a/arch/arm/boot/dts/rk3188-radxarock.dts
> +++ b/arch/arm/boot/dts/rk3188-radxarock.dts
> @@ -152,6 +152,7 @@
>  		compatible =3D "active-semi,act8846";
>  		reg =3D <0x5a>;
>  		status =3D "okay";
> +		system-power-controller;
>=20
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&act8846_dvs0_ctl>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
