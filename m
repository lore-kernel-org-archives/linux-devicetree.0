From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: Re: [PATCH] ARM: dts: imx7d: sbc-iot-imx7: add recovery for i2c3/4
Date: Sat, 10 Aug 2019 22:58:17 +0100
Message-ID: <20190810215817.5118-1-git@andred.net>
References: <20190807082556.5013-6-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-6-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>, Max Krummenacher <max.krummenacher@toradex.com>, Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 07 Aug 2019 08:26:15 +0000, Philippe Schenker wrote:
> From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
>
> - add recovery mode for applicable i2c buses for
>   Colibri iMX7 module.
>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  arch/arm/boot/dts/imx7-colibri.dtsi | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
> index a8d992f3e897..2480623c92ff 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -140,8 +140,12 @@
>
>  &i2c1 {
>  	clock-frequency = <100000>;
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_i2c1 &pinctrl_i2c1_int>;
> +	pinctrl-1 = <&pinctrl_i2c1_recovery &pinctrl_i2c1_int>;
> +	scl-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;

scl-gpios should be (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN) since
commit d2d0ad2aec4a ("i2c: imx: use open drain for recovery GPIO")

Otherwise you'll get a boot-time warning:
   enforced open drain please flag it properly in DT/ACPI DSDT/board file

> +	sda-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
> +
>  	status = "okay";
>
>  	codec: sgtl5000@a {
> @@ -242,8 +246,11 @@
>
>  &i2c4 {
>  	clock-frequency = <100000>;
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_i2c4>;
> +	pinctrl-1 = <&pinctrl_i2c4_recovery>;
> +	scl-gpios = <&gpio7 8 GPIO_ACTIVE_HIGH>;

and here, too.

Cheers,
André
