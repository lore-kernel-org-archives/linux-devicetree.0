From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v4 3/4] ARM: dts: stm32: Add MDMA support for STM32H743
 SoC
Date: Tue, 26 Sep 2017 23:14:42 +0530
Message-ID: <20170926174442.GU30097@localhost>
References: <1503671466-32029-1-git-send-email-pierre-yves.mordret@st.com>
 <1503671466-32029-4-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503671466-32029-4-git-send-email-pierre-yves.mordret@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Dan Williams <dan.j.williams@intel.com>, M'boumba Cedric Madianga <cedric.madianga@gmail.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Herbert Xu <herbert@gondor.apana.org.au>, Fabien DESSENNE <fabien.dessenne@st.com>, Amelie Delaunay <amelie.delaunay@st.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 25, 2017 at 04:31:05PM +0200, Pierre-Yves MORDRET wrote:
> This patch adds MDMA support for STM32H743 SoC.

Need ACK from ARM folks

> 
> Signed-off-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> ---
>  Version history:
>     v4:
>     v3:
>         * None
>     v2:
>         * Add MDMA support in DT for H7
> ---
> ---
>  arch/arm/boot/dts/stm32h743.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
> index 36a99db..af44eae 100644
> --- a/arch/arm/boot/dts/stm32h743.dtsi
> +++ b/arch/arm/boot/dts/stm32h743.dtsi
> @@ -82,6 +82,16 @@
>  			interrupts = <50>;
>  			clocks = <&timer_clk>;
>  		};
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
>  	};
>  };
>  
> -- 
> 2.7.4
> 

-- 
~Vinod
