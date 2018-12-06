From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] ARM: dts: sunxi: Fix PMU compatible strings
Date: Thu, 6 Dec 2018 19:13:54 +0000
Message-ID: <20181206191353.GA20680@arm.com>
References: <20181206191142.14118-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181206191142.14118-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 06, 2018 at 01:11:42PM -0600, Rob Herring wrote:
> "arm,cortex-a15-pmu" is not a valid fallback compatible string for an
> Cortex-A7 PMU, so drop it.
> 
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 2 +-
>  arch/arm/boot/dts/sun7i-a20.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
> index a960b8ef7822..9e7931d5e42a 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -202,7 +202,7 @@
>  	};
>  
>  	pmu {
> -		compatible = "arm,cortex-a7-pmu", "arm,cortex-a15-pmu";
> +		compatible = "arm,cortex-a7-pmu";
>  		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
> index 3c571dc599c3..5e413a5d9f6d 100644
> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
> @@ -199,7 +199,7 @@
>  	};
>  
>  	pmu {
> -		compatible = "arm,cortex-a7-pmu", "arm,cortex-a15-pmu";
> +		compatible = "arm,cortex-a7-pmu";
>  		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
>  			     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;

Acked-by: Will Deacon <will.deacon@arm.com>

Will
