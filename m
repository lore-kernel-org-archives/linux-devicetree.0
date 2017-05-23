From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 12/12] arm64: dts: hikey960: add LED nodes
Date: Mon, 22 May 2017 19:48:20 -0500
Message-ID: <20170523004820.6x3lo3woqgrlnrtn@rob-hp-laptop>
References: <20170517083745.24479-1-guodong.xu@linaro.org>
 <20170517083745.24479-13-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170517083745.24479-13-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 17, 2017 at 04:37:45PM +0800, Guodong Xu wrote:
> HiKey960 has four user LEDs, and two special purpose LEDs: WiFi and BT
> respectively.
> 
> All of them are implemented as GPIO.
> 
> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 48 +++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index 6de86c0..4839885 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -48,6 +48,54 @@
>  				linux,code = <KEY_POWER>;
>  			};
>  		};
> +
> +		leds {

This too should move out of the soc node.

> +			compatible = "gpio-leds";
> +			status = "disabled";
> +			user_led1 {
> +				label = "user_led1";
> +				/* gpio_150_user_led1 */
> +				gpios = <&gpio18 6 0>;
> +				linux,default-trigger = "heartbeat";
> +			};
> +
> +			user_led2 {
> +				label = "user_led2";
> +				/* gpio_151_user_led2 */
> +				gpios = <&gpio18 7 0>;
> +				linux,default-trigger = "mmc0";
> +			};
> +
> +			user_led3 {
> +				label = "user_led3";
> +				/* gpio_189_user_led3 */
> +				gpios = <&gpio23 5 0>;
> +				default-state = "off";
> +			};
> +
> +			user_led4 {
> +				label = "user_led4";
> +				/* gpio_190_user_led4 */
> +				gpios = <&gpio23 6 0>;
> +				linux,default-trigger = "cpu0";
> +			};
> +
> +			wlan_active_led {
> +				label = "wifi_active";
> +				/* gpio_205_wifi_active */
> +				gpios = <&gpio25 5 0>;
> +				linux,default-trigger = "phy0tx";
> +				default-state = "off";
> +			};
> +
> +			bt_active_led {
> +				label = "bt_active";
> +				gpios = <&gpio25 7 0>;
> +				/* gpio_207_user_led1 */
> +				linux,default-trigger = "hci0rx";
> +				default-state = "off";
> +			};
> +		};
>  	};
>  };
>  
> -- 
> 2.10.2
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
