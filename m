From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: Add PWM properties to .dtsi files
Date: Tue, 13 Jun 2017 10:48:41 +0200
Message-ID: <8737b49st2.fsf@free-electrons.com>
References: <20170601200926.22453-1-ralph.sennhauser@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170601200926.22453-1-ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Ralph
        Sennhauser's message of "Thu, 1 Jun 2017 22:09:26 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ralph,
 
 On jeu., juin 01 2017, Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>
> Add properties to the GPIO nodes for Armada 370/XP to allow them to be
> also used as PWM lines.
>
> Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> URL: https://patchwork.ozlabs.org/patch/427294/
> [Ralph Sennhauser: Add new compatible string marvell,armada-370-gpio]
> Signed-off-by: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Applied on mvebu/dt as a replacement on the former version.

Thanks,

Gregory

>
> ---
>
> Hi Gregory,
>
> I took the commit which is already in next, updated the compatible
> string to "marvell,armada-370-gpio" and ammended the commit message
> accordingly.
>
> This one is intended to replace the one in next if/when the the change
> to the compatible string from "marvell,armada-370-xp-gpio" to
> "marvell,armada-370-gpio" is accepted. ("gpio: mvebu: change compatible
> string for PWM support")
>
> Ralph
> ---
>  arch/arm/boot/dts/armada-370.dtsi        | 19 ++++++++++++++-----
>  arch/arm/boot/dts/armada-xp-mv78230.dtsi | 16 ++++++++++++----
>  arch/arm/boot/dts/armada-xp-mv78260.dtsi | 19 ++++++++++++++-----
>  arch/arm/boot/dts/armada-xp-mv78460.dtsi | 19 ++++++++++++++-----
>  4 files changed, 54 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
> index cc011c8..f9cf127 100644
> --- a/arch/arm/boot/dts/armada-370.dtsi
> +++ b/arch/arm/boot/dts/armada-370.dtsi
> @@ -137,29 +137,38 @@
>  			};
>  
>  			gpio0: gpio@18100 {
> -				compatible = "marvell,orion-gpio";
> -				reg = <0x18100 0x40>;
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
> +				reg = <0x18100 0x40>, <0x181c0 0x08>;
> +				reg-names = "gpio", "pwm";
>  				ngpios = <32>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
> +				#pwm-cells = <2>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				interrupts = <82>, <83>, <84>, <85>;
> +				clocks = <&coreclk 0>;
>  			};
>  
>  			gpio1: gpio@18140 {
> -				compatible = "marvell,orion-gpio";
> -				reg = <0x18140 0x40>;
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
> +				reg = <0x18140 0x40>, <0x181c8 0x08>;
> +				reg-names = "gpio", "pwm";
>  				ngpios = <32>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
> +				#pwm-cells = <2>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				interrupts = <87>, <88>, <89>, <90>;
> +				clocks = <&coreclk 0>;
>  			};
>  
>  			gpio2: gpio@18180 {
> -				compatible = "marvell,orion-gpio";
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
>  				reg = <0x18180 0x40>;
>  				ngpios = <2>;
>  				gpio-controller;
> diff --git a/arch/arm/boot/dts/armada-xp-mv78230.dtsi b/arch/arm/boot/dts/armada-xp-mv78230.dtsi
> index 07c5090..9f25814 100644
> --- a/arch/arm/boot/dts/armada-xp-mv78230.dtsi
> +++ b/arch/arm/boot/dts/armada-xp-mv78230.dtsi
> @@ -202,25 +202,33 @@
>  
>  		internal-regs {
>  			gpio0: gpio@18100 {
> -				compatible = "marvell,orion-gpio";
> -				reg = <0x18100 0x40>;
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
> +				reg = <0x18100 0x40>, <0x181c0 0x08>;
> +				reg-names = "gpio", "pwm";
>  				ngpios = <32>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
> +				#pwm-cells = <2>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				interrupts = <82>, <83>, <84>, <85>;
> +				clocks = <&coreclk 0>;
>  			};
>  
>  			gpio1: gpio@18140 {
> -				compatible = "marvell,orion-gpio";
> -				reg = <0x18140 0x40>;
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
> +				reg = <0x18140 0x40>, <0x181c8 0x08>;
> +				reg-names = "gpio", "pwm";
>  				ngpios = <17>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
> +				#pwm-cells = <2>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				interrupts = <87>, <88>, <89>;
> +				clocks = <&coreclk 0>;
>  			};
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/armada-xp-mv78260.dtsi b/arch/arm/boot/dts/armada-xp-mv78260.dtsi
> index 64e936a..2bfe07a 100644
> --- a/arch/arm/boot/dts/armada-xp-mv78260.dtsi
> +++ b/arch/arm/boot/dts/armada-xp-mv78260.dtsi
> @@ -285,29 +285,38 @@
>  
>  		internal-regs {
>  			gpio0: gpio@18100 {
> -				compatible = "marvell,orion-gpio";
> -				reg = <0x18100 0x40>;
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
> +				reg = <0x18100 0x40>, <0x181c0 0x08>;
> +				reg-names = "gpio", "pwm";
>  				ngpios = <32>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
> +				#pwm-cells = <2>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				interrupts = <82>, <83>, <84>, <85>;
> +				clocks = <&coreclk 0>;
>  			};
>  
>  			gpio1: gpio@18140 {
> -				compatible = "marvell,orion-gpio";
> -				reg = <0x18140 0x40>;
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
> +				reg = <0x18140 0x40>, <0x181c8 0x08>;
> +				reg-names = "gpio", "pwm";
>  				ngpios = <32>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
> +				#pwm-cells = <2>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				interrupts = <87>, <88>, <89>, <90>;
> +				clocks = <&coreclk 0>;
>  			};
>  
>  			gpio2: gpio@18180 {
> -				compatible = "marvell,orion-gpio";
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
>  				reg = <0x18180 0x40>;
>  				ngpios = <3>;
>  				gpio-controller;
> diff --git a/arch/arm/boot/dts/armada-xp-mv78460.dtsi b/arch/arm/boot/dts/armada-xp-mv78460.dtsi
> index d1383dd..6c33935 100644
> --- a/arch/arm/boot/dts/armada-xp-mv78460.dtsi
> +++ b/arch/arm/boot/dts/armada-xp-mv78460.dtsi
> @@ -323,29 +323,38 @@
>  
>  		internal-regs {
>  			gpio0: gpio@18100 {
> -				compatible = "marvell,orion-gpio";
> -				reg = <0x18100 0x40>;
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
> +				reg = <0x18100 0x40>, <0x181c0 0x08>;
> +				reg-names = "gpio", "pwm";
>  				ngpios = <32>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
> +				#pwm-cells = <2>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				interrupts = <82>, <83>, <84>, <85>;
> +				clocks = <&coreclk 0>;
>  			};
>  
>  			gpio1: gpio@18140 {
> -				compatible = "marvell,orion-gpio";
> -				reg = <0x18140 0x40>;
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
> +				reg = <0x18140 0x40>, <0x181c8 0x08>;
> +				reg-names = "gpio", "pwm";
>  				ngpios = <32>;
>  				gpio-controller;
>  				#gpio-cells = <2>;
> +				#pwm-cells = <2>;
>  				interrupt-controller;
>  				#interrupt-cells = <2>;
>  				interrupts = <87>, <88>, <89>, <90>;
> +				clocks = <&coreclk 0>;
>  			};
>  
>  			gpio2: gpio@18180 {
> -				compatible = "marvell,orion-gpio";
> +				compatible = "marvell,armada-370-gpio",
> +					     "marvell,orion-gpio";
>  				reg = <0x18180 0x40>;
>  				ngpios = <3>;
>  				gpio-controller;
> -- 
> 2.10.2
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
