From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 7/7] arm64: dts: marvell: use new binding for the system controller on ap806
Date: Thu, 08 Jun 2017 19:09:15 +0200
Message-ID: <87lgp2pft0.fsf@free-electrons.com>
References: <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
        <cover.21754b3184e2122d1c83a664477ed26ec562b3e9.1496239589.git-series.gregory.clement@free-electrons.com>
        <e12e9b027462646e16cb51783d6e14660a019ba6.1496239589.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e12e9b027462646e16cb51783d6e14660a019ba6.1496239589.git-series.gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
        (Gregory CLEMENT's message of "Wed, 31 May 2017 16:07:28 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Kostya Porotchkin <kostap-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
 
 On mer., mai 31 2017, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> The new binding for the system controller on ap806 moved the clock into a
> subnode. This preliminary step will allow to add gpio and pinctrl
> subnodes
>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>


Applied on mvebu/dt64

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> index 0c25ec62a2a3..205037e3e7dc 100644
> --- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> @@ -193,7 +193,7 @@
>  				#size-cells = <0>;
>  				cell-index = <0>;
>  				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&ap_syscon 3>;
> +				clocks = <&ap_clk 3>;
>  				status = "disabled";
>  			};
>  
> @@ -204,7 +204,7 @@
>  				#size-cells = <0>;
>  				interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>  				timeout-ms = <1000>;
> -				clocks = <&ap_syscon 3>;
> +				clocks = <&ap_clk 3>;
>  				status = "disabled";
>  			};
>  
> @@ -214,7 +214,7 @@
>  				reg-shift = <2>;
>  				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
>  				reg-io-width = <1>;
> -				clocks = <&ap_syscon 3>;
> +				clocks = <&ap_clk 3>;
>  				status = "disabled";
>  			};
>  
> @@ -224,7 +224,7 @@
>  				reg-shift = <2>;
>  				interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
>  				reg-io-width = <1>;
> -				clocks = <&ap_syscon 3>;
> +				clocks = <&ap_clk 3>;
>  				status = "disabled";
>  
>  			};
> @@ -234,17 +234,20 @@
>  				reg = <0x6e0000 0x300>;
>  				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>  				clock-names = "core";
> -				clocks = <&ap_syscon 4>;
> +				clocks = <&ap_clk 4>;
>  				dma-coherent;
>  				marvell,xenon-phy-slow-mode;
>  				status = "disabled";
>  			};
>  
>  			ap_syscon: system-controller@6f4000 {
> -				compatible = "marvell,ap806-system-controller",
> -					     "syscon";
> -				#clock-cells = <1>;
> +				compatible = "syscon", "simple-mfd";
>  				reg = <0x6f4000 0x1000>;
> +
> +				ap_clk: clock {
> +					compatible = "marvell,ap806-clock";
> +					#clock-cells = <1>;
> +				};
>  			};
>  		};
>  	};
> -- 
> git-series 0.9.1
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
