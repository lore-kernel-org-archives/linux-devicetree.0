From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: sun4i: Add backlight node to
 pov protab2 ips9 tablet
Date: Fri, 20 Nov 2015 17:41:09 +0100
Message-ID: <20151120164109.GI32142@lukather>
References: <1448027950-14629-1-git-send-email-hdegoede@redhat.com>
 <1448027950-14629-3-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SqJDPA0lBYgnDFWV"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBJU2XWZAKGQERIAPJGA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448027950-14629-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--SqJDPA0lBYgnDFWV
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Nov 20, 2015 at 02:59:09PM +0100, Hans de Goede wrote:
> Add a node describing the lcd panel backlight on the pov protab2 ips9
> tablet.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Fixed the conflict and applied. Thanks,

Maxime

> ---
>  arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts b/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
> index 0e5124f..1f92ec7 100644
> --- a/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
> +++ b/arch/arm/boot/dts/sun4i-a10-pov-protab2-ips9.dts
> @@ -47,6 +47,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
> +#include <dt-bindings/pwm/pwm.h>
>  
>  / {
>  	model = "Point of View Protab2-IPS9";
> @@ -56,6 +57,16 @@
>  		serial0 = &uart0;
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bl_en_pin_protab>;
> +		pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
> +		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
> +		default-brightness-level = <8>;
> +		enable-gpios = <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
> +	};
> +
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> @@ -145,6 +156,13 @@
>  };
>  
>  &pio {
> +	bl_en_pin_protab: bl_en_pin@0 {
> +		allwinner,pins = "PH7";
> +		allwinner,function = "gpio_out";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +	};
> +
>  	touchscreen_pins: touchscreen_pins@0 {
>  		allwinner,pins = "PA5", "PB13";
>  		allwinner,function = "gpio_out";
> @@ -167,6 +185,12 @@
>  	};
>  };
>  
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm0_pins_a>;
> +	status = "okay";
> +};
> +
>  &reg_dcdc2 {
>  	regulator-always-on;
>  	regulator-min-microvolt = <1000000>;
> -- 
> 2.5.0
> 

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--SqJDPA0lBYgnDFWV--
