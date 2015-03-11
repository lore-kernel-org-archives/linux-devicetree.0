From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 4/4] ARM: dts: Specify VMMC and VQMMC on rk3288-evb
Date: Thu, 12 Mar 2015 00:30:14 +0100
Message-ID: <10565603.LCTpLmy44N@phil>
References: <1426112117-18220-1-git-send-email-dianders@chromium.org> <1426112117-18220-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426112117-18220-4-git-send-email-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Seungwon Jeon <tgih.jun@samsung.com>, Mark Brown <broonie@kernel.org>, Alexandru Stan <amstan@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sonny Rao <sonnyrao@chromium.org>, Andrew Bresticker <abrestic@chromium.org>, Addy Ke <addy.ke@rock-chips.com>, javier.martinez@collabora.co.uk, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 11. M=E4rz 2015, 15:15:17 schrieb Doug Anderson:
> Specifying these rails should eventually let us do UHS.
>=20
> Signed-off-by: Doug Anderson <dianders@chromium.org>

This one looks good to me and I'll take it into my dts branch.

But due to the deferal issue fixed in patch1, I'll wait a bit for patch=
1=20
hopefully getting applied, so that we have a "clean" behaviour when eve=
rything=20
reaches linux-next.

> ---
> Changes in v4:
> - Add vcc_sd regulator which is present on EVB 2.0 boards
>=20
> Changes in v3: None
> Changes in v2:
> - Fix subject line
>=20
>  arch/arm/boot/dts/rk3288-evb.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi
> b/arch/arm/boot/dts/rk3288-evb.dtsi index 5e895a5..6d4ae9f 100644
> --- a/arch/arm/boot/dts/rk3288-evb.dtsi
> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
> @@ -103,6 +103,23 @@
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	/*
> +	 * NOTE: vcc_sd isn't hooked up on v1.0 boards where power comes fr=
om
> +	 * vcc_io directly.  Those boards won't be able to power cycle SD c=
ards
> +	 * but it shouldn't hurt to toggle this pin there anyway.
> +	 */
> +	vcc_sd: sdmmc-regulator {
> +		compatible =3D "regulator-fixed";
> +		gpio =3D <&gpio7 11 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&sdmmc_pwr>;
> +		regulator-name =3D "vcc_sd";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		startup-delay-us =3D <100000>;
> +		vin-supply =3D <&vcc_io>;
> +	};
>  };
>=20
>  &emmc {
> @@ -132,6 +149,8 @@
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd &sdmmc_cd &sdmmc_bus4>;
>  	status =3D "okay";
> +	vmmc-supply =3D <&vcc_sd>;
> +	vqmmc-supply =3D <&vccio_sd>;
>  };
>=20
>  &i2c0 {
> @@ -223,6 +242,10 @@
>  		sdmmc_cmd: sdmmc-cmd {
>  			rockchip,pins =3D <6 21 RK_FUNC_1 &pcfg_pull_up_drv_8ma>;
>  		};
> +
> +		sdmmc_pwr: sdmmc-pwr {
> +			rockchip,pins =3D <7 11 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
>  	};
>=20
>  	usb {
