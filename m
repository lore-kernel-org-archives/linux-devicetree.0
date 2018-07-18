From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hikey960: Remove keep-power-in-suspend
 property
Date: Wed, 18 Jul 2018 16:33:25 +0100
Message-ID: <5B4F5DC4.5010500@hisilicon.com>
References: <20180713155348.24343-1-ryan@edited.us>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180713155348.24343-1-ryan@edited.us>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryan Grachek <ryan@edited.us>
Cc: john.stultz@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ryan,

On 2018/7/13 16:53, Ryan Grachek wrote:
> Remove the keep-power-in-suspend property because it keeps wifi power
> on during suspend. This property is only required when enabling WoWLAN
> and should only be enabled based on need. Also remove dupplicate property
> 
> Signed-off-by: Ryan Grachek <ryan@edited.us>

Thanks!
Applied to the hisilicon dt tree.

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 1 -
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index 68c5a6c819ae..a927ce4ec40b 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -586,7 +586,6 @@
>  	ti,non-removable;
>  	non-removable;
>  	cap-power-off-card;
> -	keep-power-in-suspend;
>  	#address-cells = <0x1>;
>  	#size-cells = <0x0>;
>  	status = "ok";
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index 8d477dcbfa58..4588fe4e00a8 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -1050,7 +1050,6 @@
>  			reset-names = "reset";
>  			card-detect-delay = <200>;
>  			supports-highspeed;
> -			keep-power-in-suspend;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&sdio_pmx_func
>  				     &sdio_clk_cfg_func
> 
