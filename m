From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: rk3288 Tinker Board (S) add wi-fi
Date: Sun, 17 Feb 2019 21:43:28 +0100 (CET)
Message-ID: <1528638260.343699.1550436208775@email.ionos.de>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190217121513.22965-3-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190217121513.22965-3-beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

> David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org> hat am 17. Februar 2019 um 13:15 geschrieben:
> 
> 
> This patch adds the wifi to the ASUS Tinker Board (S) machines.
> 
> Unfortunatly neither the Tinker Board nor the Tinker Board S schematic
> indicate how the WiFi is wired up on these devices. The WiFi is
> provided by the RTL8723BS device, that has sdio WiFi and UART
> Bluetooth. This patch just adds the WiFi interface.
> 
> With no schematic, most of the wiring has been derived from the ASUS
> patch to Debian:
> 
> https://github.com/TinkerBoard/debian_kernel/commit/6a3128ade33f758887048578ada61a4b7ab8e678
> 
> In conjunction with the pin out of the RTL8723BS device:
> 
> http://files.pine64.org/doc/datasheet/pine64/RTL8723BS.pdf
> http://cit.odessa.ua/media/pdf/Intel-Compute-Stick/FN-Link_F23BDSM25-W1.pdf
> 
> The only unusual part is that to bring the card up, both the pins
> RK_PD3 and RK_PD4 need to be pulled. Why this needs to be done is not
> clear, best explaination is that they are connected to the RTL8723BS
> pins WL_DIS# and BT_DIS#, which the data sheet vaguely says:
> 
> Shared with GPIO9 This Pin Can Externally Shutdown the RTL8723BS WLAN
> function when BT_DISn is Pulled Low. When this pin deasserted, SDIO
> interface will be disabled. This pin can also support the WLAN Ra
> dio-off function with host interface remaining connected.
> 
> Anyway extensive testing the TheSaint on ArchLinux Arm Forum 
> 
> https://archlinuxarm.org/forum/viewtopic.php?f=44&t=13064&start=120#p60548
> 
> Signed-off-by: David Summers <beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-tinker.dtsi | 39 +++++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
> index fceaeed44e34..e1796f340eef 100644
> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
> @@ -3,8 +3,9 @@
>   * Copyright (c) 2017 Fuzhou Rockchip Electronics Co., Ltd.
>   */
>  
>  #include "rk3288.dtsi"
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/clock/rockchip,rk808.h>
>  
>  / {
>  	chosen {
> @@ -98,6 +97,15 @@
>  		startup-delay-us = <100000>;
>  		vin-supply = <&vcc_io>;
>  	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rk808 RK808_CLKOUT1>;
> +		clock-names = "ext_clock";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_enable>;

As i wrote at the Arch board it would be nice to keep the Asus comment here:

/*
 * On the module itself this is one of these (depending
 * on the actual card populated):
 * - SDIO_RESET_L_WL_REG_ON
 * - PDN (power down when low)
 */

> +		reset-gpios = <&gpio4 RK_PD3 GPIO_ACTIVE_LOW>, <&gpio4 RK_PD4 GPIO_ACTIVE_LOW>;
> +	};
>  };
>  
>  &cpu0 {
> @@ -337,8 +345,8 @@
>  
>  &io_domains {
>  	status = "okay";
> -

Please drop this whitespace change

>  	sdcard-supply = <&vccio_sd>;
> +	wifi-supply = <&vcc_18>;
>  };
>  
>  &pinctrl {
> @@ -417,6 +425,12 @@
>  			rockchip,pins = <7 8 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
> +
> +	sdio {
> +		wifi_enable: wifi-enable {
> +			rockchip,pins = <4 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>, <4 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;

Please make a line break after the first pin definition

> +		};
> +	};
>  };
>  
>  &pwm0 {
> @@ -440,6 +454,25 @@
>  	vqmmc-supply = <&vccio_sd>;
>  };
>  
> +&sdio0 {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	non-removable;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdio0_bus4>, <&sdio0_cmd>, <&sdio0_clk>, <&sdio0_int>;
> +	max-frequency = <50000000>;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-ddr50;

I'm okay with Tony's suggestion to remove sd-ush-ddr50.

> +	vmmc-supply = <&vcc_io>;
> +	vqmmc-supply = <&vcc_18>;
> +	status = "okay";
> +};
> +
>  &tsadc {
>  	rockchip,hw-tshut-mode = <1>; /* tshut mode 0:CRU 1:GPIO */
>  	rockchip,hw-tshut-polarity = <1>; /* tshut polarity 0:LOW 1:HIGH */
> -- 
> beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
