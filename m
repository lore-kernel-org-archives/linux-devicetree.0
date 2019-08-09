From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [PATCH v3 06/21] ARM: dts: imx7-colibri: add GPIO wakeup key
Date: Fri, 9 Aug 2019 14:46:48 +0000
Message-ID: <8088ec7589bea82c185253466dee2276e763d2ce.camel@toradex.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com>
 <20190807082556.5013-7-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190807082556.5013-7-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <D4D46136C27E614B8CD7EB6377F8E038@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, Philippe Schenker <philippe.schenker@toradex.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "michal.vokac@ysoft.com" <michal.vokac@ysoft.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: Stefan Agner <stefan.agner@toradex.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-08-07 at 08:26 +0000, Philippe Schenker wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> Add wakeup GPIO key which is able to wake the system from sleep
> modes (e.g. Suspend-to-Memory).
> 
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

> ---
> 
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi | 14 ++++++++++++++
>  arch/arm/boot/dts/imx7-colibri.dtsi         |  7 ++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
> b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
> index 3f2746169181..d4dbc4fc1adf 100644
> --- a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
> @@ -52,6 +52,20 @@
>  		clock-frequency = <16000000>;
>  	};
>  
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpiokeys>;
> +
> +		power {
> +			label = "Wake-Up";
> +			gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
> +			linux,code = <KEY_WAKEUP>;
> +			debounce-interval = <10>;
> +			gpio-key,wakeup;
> +		};
> +	};
> +
>  	panel: panel {
>  		compatible = "edt,et057090dhu";
>  		backlight = <&bl>;
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi
> b/arch/arm/boot/dts/imx7-colibri.dtsi
> index 2480623c92ff..16d1a1ed1aff 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -741,12 +741,17 @@
>  
>  	pinctrl_gpio_lpsr: gpio1-grp {
>  		fsl,pins = <
> -			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1	0x59
>  			MX7D_PAD_LPSR_GPIO1_IO02__GPIO1_IO2	0x59
>  			MX7D_PAD_LPSR_GPIO1_IO03__GPIO1_IO3	0x59
>  		>;
>  	};
>  
> +	pinctrl_gpiokeys: gpiokeysgrp {
> +		fsl,pins = <
> +			MX7D_PAD_LPSR_GPIO1_IO01__GPIO1_IO1	0x19
> +		>;
> +	};
> +
>  	pinctrl_i2c1: i2c1-grp {
>  		fsl,pins = <
>  			MX7D_PAD_LPSR_GPIO1_IO05__I2C1_SDA	0x400
> 0007f
