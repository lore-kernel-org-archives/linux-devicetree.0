From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 07/13] ARM: dts: rv1108: Fix the timer mask
Date: Mon, 26 Nov 2018 06:26:36 +0100
Message-ID: <4443441.F7S2jYBxxL@phil>
References: <20181125211907.9895-1-otavio@ossystems.com.br> <20181125211907.9895-7-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181125211907.9895-7-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Fabio Berton <fabio.berton@ossystems.com.br>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Am Sonntag, 25. November 2018, 22:19:01 CET schrieb Otavio Salvador:
> As done in the Rockchip vendor tree and also on other
> "arm,armv7-timer" instances, the correct GIC_CPU_MASK_SIMPLE mask
> is 4 instead of 1.

Nope. That value represents the number of cores in the system.
As the rv1108 only has one core, that should likely stay as it is.

Also, it seems I only got patches 6-13 what happened to 1-5?

Heiko

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
> 
>  arch/arm/boot/dts/rv1108.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
> index c7a26f82655b..7b331766120d 100644
> --- a/arch/arm/boot/dts/rv1108.dtsi
> +++ b/arch/arm/boot/dts/rv1108.dtsi
> @@ -71,8 +71,8 @@
>  
>  	timer {
>  		compatible = "arm,armv7-timer";
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>  		clock-frequency = <24000000>;
>  	};
>  
> 
