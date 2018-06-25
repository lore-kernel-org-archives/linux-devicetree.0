From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 1/1] ARM: dts: stm32: Add HASH support on stm32mp157c
Date: Mon, 25 Jun 2018 14:16:19 +0200
Message-ID: <e830c0ab-409a-7d6c-b654-9640f0fe36fd@st.com>
References: <20180514100034.10282-1-lionel.debieve@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180514100034.10282-1-lionel.debieve@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lionel Debieve <lionel.debieve@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lionel,

On 05/14/2018 12:00 PM, Lionel Debieve wrote:
> This patch add HASH instance of the stm32mp157c SoC
> 
> Signed-off-by: Lionel Debieve <lionel.debieve@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index b66f673b5038..cb39fb6d9960 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -702,6 +702,18 @@
>   			status = "disabled";
>   		};
>   
> +		hash1: hash@54002000 {
> +			compatible = "st,stm32f756-hash";
> +			reg = <0x54002000 0x400>;
> +			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&rcc HASH1>;
> +			resets = <&rcc HASH1_R>;
> +			dmas = <&mdma1 31 0x10 0x1000A02 0x0 0x0 0x0>;
> +			dma-names = "in";
> +			dma-maxburst = <2>;
> +			status = "disabled";
> +		};
> +
>   		rng1: rng@54003000 {
>   			compatible = "st,stm32-rng";
>   			reg = <0x54003000 0x400>;
> 

Applied on stm32-next.

Thanks.
Alex
