From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] arm64: ARM: Fix the Generic Timers interrupt active level
 description
Date: Thu, 27 Nov 2014 14:43:38 +0000
Message-ID: <5477389A.8010606@arm.com>
References: <1417099005-18638-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417099005-18638-1-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Rob Herring <robherring2@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Will Deacon <Will.Deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 27/11/14 14:36, Liviu Dudau wrote:
> The Cortex-A5x TRM states in paragraph "9.2 Generic Timer functional
> description" that generic timers provide an active-LOW interrupt
> output. Fix the device trees to correctly describe this.
> 
> While doing this update the CPU mask to match the number of described
> CPUs as well.
> 
> Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> ---
> 
> Arnd, Olof: This is on top of linux-next/master as it patches the Juno
> as well as all the other ARM DTs.
> 
>  arch/arm64/boot/dts/arm/foundation-v8.dts  | 8 ++++----
>  arch/arm64/boot/dts/arm/juno.dts           | 8 ++++----
>  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts | 8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dts b/arch/arm64/boot/dts/arm/foundation-v8.dts
> index 4a06090..27f3296 100644
> --- a/arch/arm64/boot/dts/arm/foundation-v8.dts
> +++ b/arch/arm64/boot/dts/arm/foundation-v8.dts
> @@ -78,10 +78,10 @@
>  
>  	timer {
>  		compatible = "arm,armv8-timer";
> -		interrupts = <1 13 0xff01>,
> -			     <1 14 0xff01>,
> -			     <1 11 0xff01>,
> -			     <1 10 0xff01>;
> +		interrupts = <1 13 0xf08>,
> +			     <1 14 0xf08>,
> +			     <1 11 0xf08>,
> +			     <1 10 0xf08>;
>  		clock-frequency = <100000000>;
>  	};
>  
> diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
> index 097ecc4..cb3073e 100644
> --- a/arch/arm64/boot/dts/arm/juno.dts
> +++ b/arch/arm64/boot/dts/arm/juno.dts
> @@ -98,10 +98,10 @@
>  
>  	timer {
>  		compatible = "arm,armv8-timer";
> -		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>,
> -			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>,
> -			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>,
> -			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>;
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
>  	pmu {
> diff --git a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> index 572005e..efc59b3 100644
> --- a/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> +++ b/arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts
> @@ -81,10 +81,10 @@
>  
>  	timer {
>  		compatible = "arm,armv8-timer";
> -		interrupts = <1 13 0xff01>,
> -			     <1 14 0xff01>,
> -			     <1 11 0xff01>,
> -			     <1 10 0xff01>;
> +		interrupts = <1 13 0xf08>,
> +			     <1 14 0xf08>,
> +			     <1 11 0xf08>,
> +			     <1 10 0xf08>;
>  		clock-frequency = <100000000>;
>  	};
>  
> 

Sorry, but that's wrong. Despite the *cores* having an level-low output,
the GIC only triggers on *level-high*. Yes, there is probably an
inverter in between.

	M.
-- 
Jazz is not dead. It just smells funny...
