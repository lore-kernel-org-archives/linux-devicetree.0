From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 7/7] ARM: dts: meson8b: add support for booting the
 secondary CPU cores
Date: Tue, 25 Jul 2017 10:01:01 +0200
Message-ID: <5976FABD.7050104@baylibre.com>
References: <20170722191946.22938-1-martin.blumenstingl@googlemail.com> <20170722191946.22938-8-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170722191946.22938-8-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org



Le 22/07/2017 21:19, Martin Blumenstingl a écrit :
> From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
> 
> Booting the secondary CPU cores involves the following nodes/devices:
> - SCU (Snoop-Control-Unit, for which we already have a DT node)
> - a reset line for each CPU core, provided by the reset-controller
>   which is built into the clock-controller
> - the PMU (power management unit) which controls the power of the CPU
>   cores
> - a range in the SRAM specifically reserved for booting secondary CPU
>   cores
> - the "enable-method" which activates booting the secondary CPU cores
> 
> This adds all required nodes and properties to boot the secondary CPU
> cores.
> 
> Signed-off-by: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
> ---
>  arch/arm/boot/dts/meson8b.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index bc278da7df0d..c9e74d2fcbdf 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -59,6 +59,8 @@
>  			compatible = "arm,cortex-a5";
>  			next-level-cache = <&L2>;
>  			reg = <0x200>;
> +			enable-method = "amlogic,meson8b-smp";
> +			resets = <&clkc RESETID_CPU0_SOFT_RESET>;
>  		};
>  
>  		cpu@201 {
> @@ -66,6 +68,8 @@
>  			compatible = "arm,cortex-a5";
>  			next-level-cache = <&L2>;
>  			reg = <0x201>;
> +			enable-method = "amlogic,meson8b-smp";
> +			resets = <&clkc RESETID_CPU1_SOFT_RESET>;
>  		};
>  
>  		cpu@202 {
> @@ -73,6 +77,8 @@
>  			compatible = "arm,cortex-a5";
>  			next-level-cache = <&L2>;
>  			reg = <0x202>;
> +			enable-method = "amlogic,meson8b-smp";
> +			resets = <&clkc RESETID_CPU2_SOFT_RESET>;
>  		};
>  
>  		cpu@203 {
> @@ -80,6 +86,8 @@
>  			compatible = "arm,cortex-a5";
>  			next-level-cache = <&L2>;
>  			reg = <0x203>;
> +			enable-method = "amlogic,meson8b-smp";
> +			resets = <&clkc RESETID_CPU3_SOFT_RESET>;
>  		};
>  	};
>  
> @@ -90,6 +98,11 @@
>  }; /* end of / */
>  
>  &aobus {
> +	pmu: pmu@e0 {
> +		compatible = "amlogic,meson8b-pmu", "syscon";
> +		reg = <0xe0 0x18>;
> +	};
> +
>  	pinctrl_aobus: pinctrl@84 {
>  		compatible = "amlogic,meson8b-aobus-pinctrl";
>  		reg = <0x84 0xc>;
> @@ -157,6 +170,13 @@
>  	};
>  };
>  
> +&ahb_sram {
> +	smp-sram@1ff80 {
> +		compatible = "amlogic,meson8b-smp-sram";
> +		reg = <0x1ff80 0x8>;
> +	};
> +};
> +
>  &ethmac {
>  	clocks = <&clkc CLKID_ETH>;
>  	clock-names = "stmmaceth";
> 

Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
