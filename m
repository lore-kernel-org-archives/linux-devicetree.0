From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 04/10] ARM64: dts: rockchip: Add GMAC to GeekBox
Date: Mon, 08 Feb 2016 11:28:22 +0100
Message-ID: <5875277.Y7zJ7W9GkY@phil>
References: <1454897859-7601-1-git-send-email-afaerber@suse.de> <1454897859-7601-5-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454897859-7601-5-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Andreas,

Am Montag, 8. Februar 2016, 03:17:33 schrieb Andreas F=E4rber:
> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>

is there some special reason that gmac, emmc, ir, etc are in separate=20
patches? I guess I'll just fold them into the core patch otherwise.


Heiko

> ---
>  v2: New
>=20
>  arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts | 20 +++++++++++++++=
+++++
> 1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts index
> bc91d39758ab..a8dcf3c2b0c1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
> @@ -56,6 +56,13 @@
>  		reg =3D <0x0 0x0 0x0 0x80000000>;
>  	};
>=20
> +	ext_gmac: gmac-clk {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <125000000>;
> +		clock-output-names =3D "ext_gmac";
> +		#clock-cells =3D <0>;
> +	};
> +
>  	leds: gpio-leds {
>  		compatible =3D "gpio-leds";
>=20
> @@ -82,6 +89,19 @@
>  	};
>  };
>=20
> +&gmac {
> +	status =3D "okay";
> +	phy-supply =3D <&vcc_lan>;
> +	phy-mode =3D "rgmii";
> +	clock_in_out =3D "input";
> +	assigned-clocks =3D <&cru SCLK_MAC>;
> +	assigned-clock-parents =3D <&ext_gmac>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&rgmii_pins>;
> +	tx_delay =3D <0x30>;
> +	rx_delay =3D <0x10>;
> +};
> +
>  &i2c0 {
>  	status =3D "okay";
