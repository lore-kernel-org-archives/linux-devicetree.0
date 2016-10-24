From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6sx: Add UDOO Neo support
Date: Mon, 24 Oct 2016 19:33:37 +0800
Message-ID: <20161024113337.GE30578@tiger>
References: <1476629064-10634-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476629064-10634-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Micael Meixeiro <micael.meixeiro-c/GvoJY37lk@public.gmane.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 16, 2016 at 04:44:23PM +0200, Andreas Färber wrote:
> Add initial device trees for UDOO Neo Basic, Extended and Full boards:
> * Serial console is enabled, other serial ports are prepared.
> * I2C based PMIC is enabled.
> * Ethernet is enabled for Basic and Full.
> * SDHC is enabled, with the SDIO_PWR GPIO modeled as a regulator.
> * Both user LEDs are enabled, with the orange one reserved for the M4
>   and with the SD card as default trigger for the red LED.
> 
> The decision on a board compatible string is deferred to later.
> 
> Cc: Ettore Chimenti <ettore.chimenti-GcR40IO4/Fc@public.gmane.org>
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>

<snip>

> +/ {
> +	compatible = "fsl,imx6sx";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		red {
> +			label = "udoo-neo:red:mmc";
> +			gpios = <&gpio6 0 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +			linux,default-trigger = "mmc0";
> +		};
> +
> +		orange {
> +			label = "udoo-neo:orange:user";
> +			gpios = <&gpio4 6 GPIO_ACTIVE_HIGH>;
> +			default-state = "keep";
> +		};
> +	};
> +
> +	sdio_pwr_reg: sd-gpio-regulator {

We do have a recommended naming schema for fixed regulator.  I updated
it a bit as below, and applied the patch.

Shawn

> +		compatible = "regulator-fixed";
> +		gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-name = "SDIO_PWR";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +	};
> +};

diff --git a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
index 314d25b15641..2b65d26f4396 100644
--- a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
+++ b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
@@ -66,7 +66,7 @@
                };
        };
 
-       sdio_pwr_reg: sd-gpio-regulator {
+       reg_sdio_pwr: regulator-sdio-pwr {
                compatible = "regulator-fixed";
                gpio = <&gpio6 1 GPIO_ACTIVE_HIGH>;
                enable-active-high;
@@ -283,7 +283,7 @@
 &usdhc2 {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_usdhc2>;
-       vmmc-supply = <&sdio_pwr_reg>;
+       vmmc-supply = <&reg_sdio_pwr>;
        bus-width = <4>;
        cd-gpios = <&gpio6 2 GPIO_ACTIVE_LOW>;
        no-1-8-v;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
