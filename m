From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v5 3/4] ARM: dts: stm32: Add MDMA support for STM32H743
 SoC
Date: Mon, 16 Oct 2017 18:30:52 +0200
Message-ID: <3398ee25-4219-a7e5-d842-200d87317584@st.com>
References: <1506613003-28376-1-git-send-email-pierre-yves.mordret@st.com>
 <1506613003-28376-4-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506613003-28376-4-git-send-email-pierre-yves.mordret@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi

On 09/28/2017 05:36 PM, Pierre-Yves MORDRET wrote:
> This patch adds MDMA support for STM32H743 SoC.
> 
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> ---
>   Version history:
>      v5:
>      v4:
>      v3:
>          * None
>      v2:
>          * Add MDMA support in DT for H7
> ---
> ---
>   arch/arm/boot/dts/stm32h743.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> index 58ec227..8e0aeb7 100644
> --- a/arch/arm/boot/dts/stm32h743.dtsi
> +++ b/arch/arm/boot/dts/stm32h743.dtsi
> @@ -193,6 +193,16 @@
>   				status = "disabled";
>   			};
>   		};
> +
> +		mdma1: dma@52000000 {
> +			compatible = "st,stm32h7-mdma";
> +			reg = <0x52000000 0x1000>;
> +			interrupts = <122>;
> +			clocks = <&timer_clk>;
> +			#dma-cells = <5>;
> +			dma-channels = <16>;
> +			dma-requests = <32>;
> +		};
>   	};
>   };
>   
> 
Applied on stm32-dt-for-v4.15.

Thanks
Alex
