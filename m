From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 12/12] arm64: dts: allwinner: bananapi-m64:
 Bananapi S070WV20-CT16 DSI panel
Date: Thu, 27 Sep 2018 19:17:47 +0200
Message-ID: <20180927171747.wqdt5eiwktyyoefz@flea>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-13-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBPFBWTOQKGQEBMNDDLA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180927114850.24565-13-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 05:18:50PM +0530, Jagan Teki wrote:
> This patch add support for Bananapi S070WV20-CT16 DSI panel to
> BPI-M64 board.
> 
> DSI panel connected via board DSI port with,
> - DC1SW as AVDD supply
> - DCDC1 as DVDD supply
> - PD6 gpio for reset pin
> - PD5 gpio for backlight enable pin
> - PD7 gpio for backlight vdd supply
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> index ef1c90401bb2..c0be949be68d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> @@ -45,6 +45,7 @@
>  #include "sun50i-a64.dtsi"
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pwm/pwm.h>
>  
>  / {
>  	model = "BananaPi-M64";
> @@ -56,6 +57,24 @@
>  		serial1 = &uart1;
>  	};
>  
> +	vdd_bl: regulator@0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "bl-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pio 3 7 GPIO_ACTIVE_HIGH>; /* PD7 */
> +		enable-active-high;
> +	};
> +
> +	backlight_dsi: backlight-dsi {
> +		compatible = "pwm-backlight";
> +		pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
> +		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;

The brightness levels should be increasing linearly from a user point
of view. Usually, with a PWM backlight, a quadratic rule works much
better.

MMaxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
