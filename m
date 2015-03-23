From: Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: hummingboard: Setup pwm lines
Date: Mon, 23 Mar 2015 20:06:27 +0200
Message-ID: <55105623.1010804@solid-run.com>
References: <E1YSWZL-0002Aw-B5@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1YSWZL-0002Aw-B5-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/02/2015 10:03 PM, Russell King wrote:
> From: Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
>
> Setup pwm lines as follows -
> pwm1: In case HummingBoard base carrier; this pin drives through a serial
>        capacitor the mono out of the audio jack.
>        In case HummingBoard pro the this pad can be reached by wiring to
>        C8 capacitors on the board.
> pwm2: Setup pwm2 on gpio-1 but leave the default function of the iopad as
>        a gpio.
>        The user can change the io pad mux in user space and therefore use
>        this function on gpio-1 (pin number 7 on the 26 pin header).
> pwm3,pwm4: unused
>
> Signed-off-by: Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
> [tweaked alias for pwm pinctrl group --rmk]
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> ---
> For acks please.
Ack.
>
>   arch/arm/boot/dts/imx6qdl-hummingboard.dtsi | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
> index 93588c987d2c..c0dc5948fa3c 100644
> --- a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
> @@ -164,6 +164,10 @@
>   			>;
>   		};
>   
> +		pinctrl_hummingboard_pwm1: pwm1grp {
> +			fsl,pins = <MX6QDL_PAD_DISP0_DAT8__PWM1_OUT 0x1b0b1>;
> +		};
> +
>   		pinctrl_hummingboard_spdif: hummingboard-spdif {
>   			fsl,pins = <MX6QDL_PAD_GPIO_17__SPDIF_OUT 0x13091>;
>   		};
> @@ -203,6 +207,25 @@
>   	};
>   };
>   
> +&pwm1 {
> +	 pinctrl-names = "default";
> +	 pinctrl-0 = <&pinctrl_hummingboard_pwm1>;
> +	 status = "okay";
> +};
> +
> +&pwm2 {
> +	 pinctrl-names = "default";
> +	 status = "okay";
> +};
> +
> +&pwm3 {
> +	status = "disabled";
> +};
> +
> +&pwm4 {
> +	status = "disabled";
> +};
> +
>   &spdif {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_hummingboard_spdif>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
