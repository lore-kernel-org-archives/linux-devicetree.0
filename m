From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Delete unused dummy clocks
Date: Wed, 21 Jun 2017 11:01:32 +0800
Message-ID: <1498014092.810.3.camel@mtkswgap22>
References: <20170620102854.9346-1-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170620102854.9346-1-matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kevin-cw-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Matthias

On Tue, 2017-06-20 at 12:28 +0200, Matthias Brugger wrote:
> After adding the clock subsystem to the SOC, the dummy
> clocks clk26m and clk32k are not longer needed. Delete them.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> index 3512c8e6dc65..09d46befa86b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
> @@ -102,20 +102,6 @@
>  		};
>  	};
>  
> -	clk26m: oscillator@0 {
> -		compatible = "fixed-clock";
> -		#clock-cells = <0>;
> -		clock-frequency = <26000000>;
> -		clock-output-names = "clk26m";
> -	};

clk26m is referenced by drivers/clk/mediatek/clk-mt6797.c:
static const char * const axi_parents[] = {
	"clk26m",
	"syspll_d7",
	"ulposc_axi_ck_mux",
};

Please just delete clk32k which is dummy, and keep clk26m. Or might get
PLL wrongly.

Thanks.

> -
> -	clk32k: oscillator@1 {
> -		compatible = "fixed-clock";
> -		#clock-cells = <0>;
> -		clock-frequency = <32000>;
> -		clock-output-names = "clk32k";
> -	};
> -
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupt-parent = <&gic>;


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
