From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4 25/26] [DO NOT MERGE] arm64: dts:
 allwinner: bananapi-m64: Bananapi S070WV20-CT16 DSI panel
Date: Tue, 13 Nov 2018 12:22:04 +0000
Message-ID: <20181113122204.337db8b1@donnerap.cambridge.arm.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
	<20181113111633.20189-26-jagan@amarulasolutions.com>
Reply-To: andre.przywara-5wv7dgnIgG8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDNZNK75ZIKRB5MDVPPQKGQEUATWVRY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181113111633.20189-26-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 13 Nov 2018 16:46:32 +0530
Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:

Hi,

> This patch add support for Bananapi S070WV20-CT16 DSI panel to
> BPI-M64 board.
> 
> DSI panel connected via board DSI port with,
> - DC1SW as AVDD supply

Are you sure of that? I don't see anything in the schematic to support
this. The only power lines that go to the DSI connector are DCDC1 and
PS. DC1SW is only connected to PortD on the SoC and to the Ethernet PHY.
Is there anything I miss?

> - DCDC1 as DVDD supply

That seems right, but doesn't match with what you write below.

> - PD6 gpio for reset pin
> - PD5 gpio for backlight enable pin
> - PD7 gpio for backlight vdd supply
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 42
> +++++++++++++++++++ 1 file changed, 42 insertions(+)
> 
> diff --git
> a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts index
> ef1c90401bb2..6cb010e3bbd9 100644 ---
> a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts +++
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts @@ -45,6
> +45,7 @@ #include "sun50i-a64.dtsi" 
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pwm/pwm.h>
>  
>  / {
>  	model = "BananaPi-M64";
> @@ -56,6 +57,15 @@
>  		serial1 = &uart1;
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
> +		brightness-levels = <1 2 4 8 16 32 64 128 512>;
> +		default-brightness-level = <2>;
> +		enable-gpios = <&pio 3 5 GPIO_ACTIVE_HIGH>; /*
> LCD-BL-EN: PD5 */
> +		power-supply = <&reg_vdd_backlight>;
> +	};
> +
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> @@ -91,6 +101,15 @@
>  		};
>  	};
>  
> +	reg_vdd_backlight: vdd-backlight {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-backlight";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pio 3 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN:
> PD7 */
> +		enable-active-high;
> +	};
> +
>  	wifi_pwrseq: wifi_pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> @@ -101,6 +120,23 @@
>  	status = "okay";
>  };
>  
> +&dphy {
> +	status = "okay";
> +};
> +
> +&dsi {
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "bananapi,s070wv20-ct16-icn6211";
> +		reg = <0>;
> +		avdd-supply = <&reg_dc1sw>;

As mentioned above, I don't see this on the DSI connector.

> +		dvdd-supply = <&reg_dldo1>;

Mmh, this line is connected to the *SoC*, to drive the DSI data lines
or the DPHY, presumably. So I wouldn't expect it in the panel node, but
rather in the DPHY or DSI node. Although I can't find a power-supply
property in those bindings.

Cheers,
Andre.

> +		reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /*
> LCD-RST: PD6 */
> +		backlight = <&backlight>;
> +	};
> +};
> +
>  &ehci0 {
>  	status = "okay";
>  };
> @@ -193,6 +229,12 @@
>  	status = "okay";
>  };
>  
> +&r_pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&r_pwm_pin>;
> +	status = "okay";
> +};
> +
>  &r_rsb {
>  	status = "okay";
>  
