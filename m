From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 4/5] ARM: dts: add the wifi/bt regulator for kylin board
Date: Tue, 22 Dec 2015 10:50:32 +0100
Message-ID: <1796344.o2BSs8sx7m@diego>
References: <1450776833-27639-1-git-send-email-wxt@rock-chips.com> <1450776833-27639-5-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450776833-27639-5-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, leecam-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Caesaer,

Am Dienstag, 22. Dezember 2015, 17:33:52 schrieb Caesar Wang:
> Without this the wifi/bluetooth module doesn't work
> properly at bootup.
> 
> Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> 
> Patchset: Rockchip kylin board Patch[6/6], bring up kylin board.
> We need add the wifi regulator to control the power.
> 
> (am https://patchwork.kernel.org/patch/7873721/)
> ---
> 
>  arch/arm/boot/dts/rk3036-kylin.dts | 43
> +++++++++++++++++++++++++++++++++++++- 1 file changed, 42 insertions(+), 1
> deletion(-)
> 
> diff --git a/arch/arm/boot/dts/rk3036-kylin.dts
> b/arch/arm/boot/dts/rk3036-kylin.dts index 2ef38be..ed0466f 100644
> --- a/arch/arm/boot/dts/rk3036-kylin.dts
> +++ b/arch/arm/boot/dts/rk3036-kylin.dts
> @@ -76,6 +76,32 @@
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
> +
> +	bt_regulator: bt-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio2 9 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bt_rst_l>;
> +		regulator-name = "bt_regulator";
> +	};
> +
> +	wifi_regulator: wifi-regulator {
> +		/*
> +		 * On the module itself this is one of these (depending
> +		 * on the actual card populated):
> +		 * - SDIO_RESET_L_WL_REG_ON
> +		 * - PDN (power down when low)
> +		 */
> +
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio0 26 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_enable_h>;
> +		regulator-name = "wifi_regulator";
> +		vin-supply = <&bt_regulator>;
> +	};
>  };
> 
>  &acodec {
> @@ -303,12 +329,13 @@
>  	sd-uhs-sdr50;
>  	sd-uhs-sdr104;
>  	cap-sdio-irq;
> +	card-external-vcc-supply = <&wifi_regulator>;

as I said in our chat, that concept didn't make it into the kernel. mmc-power-
sequences are the new thing. Please look into the sdio-pwrseq node in rk3288-
veyron.dtsi for examples.


Heiko

>  	default-sample-phase = <90>;
>  	keep-power-in-suspend;
>  	non-removable;
>  	num-slots = <1>;
>  	pinctrl-names = "default";
> -	pinctrl-0 = <&sdio_clk &sdio_cmd &sdio_bus4>;
> +	pinctrl-0 = <&sdio_clk &sdio_cmd &sdio_bus4 &bt_wake_h>;
>  };
> 
>  &uart2 {
> @@ -330,6 +357,20 @@
>  		};
>  	};
> 
> +	sdio {
> +		wifi_enable_h: wifienable-h {
> +			rockchip,pins = <0 26 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		bt_rst_l: bt-rst-l {
> +			rockchip,pins = <2 9 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		bt_wake_h: bt-wake-h {
> +			rockchip,pins = <2 8 RK_FUNC_GPIO &pcfg_pull_default>;
> +		};
> +	};
> +
>  	sleep {
>  		global_pwroff: global-pwroff {
>  			rockchip,pins = <2 7 RK_FUNC_1 &pcfg_pull_none>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
