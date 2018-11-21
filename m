From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r9a06g032: Correct the GIC DT node name
Date: Wed, 21 Nov 2018 11:01:42 +0100
Message-ID: <20181121100142.q3wwgcu5pywsdzpx@verge.net.au>
References: <20181120103427.23950-1-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181120103427.23950-1-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 20, 2018 at 10:34:27AM +0000, Phil Edworthy wrote:
> Harmless mistake, but it's incorrect.

Hi Phil,

please fill-out this changelog with an explanation of "why".

Thanks!

> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
>  arch/arm/boot/dts/r9a06g032.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
> index 2322268bc862..4c1ab49c7d39 100644
> --- a/arch/arm/boot/dts/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> @@ -173,7 +173,7 @@
>  			status = "okay";
>  		};
>  
> -		gic: gic@44101000 {
> +		gic: interrupt-controller@44101000 {
>  			compatible = "arm,cortex-a7-gic", "arm,gic-400";
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
> -- 
> 2.17.1
> 
