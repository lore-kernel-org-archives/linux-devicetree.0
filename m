From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH V4 5/8] ARM: dts: stm32: Add ethernet dwmac on stm32mp1
Date: Tue, 26 Jun 2018 15:21:57 +0200
Message-ID: <c88813df-a5a8-3c24-fbc4-bc4d2cebcab1@st.com>
References: <1527090479-5263-1-git-send-email-christophe.roullier@st.com>
 <1527090479-5263-6-git-send-email-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1527090479-5263-6-git-send-email-christophe.roullier@st.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Christophe Roullier <christophe.roullier@st.com>, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

Hi christophe

On 05/23/2018 05:47 PM, Christophe Roullier wrote:
> Add Ethernet support (Synopsys MAC IP 4.20a) on stm32mp1 SOC.
> Enable feature supported by the stmmac driver, such as TSO.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>   arch/arm/boot/dts/stm32mp157c.dtsi | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c.dtsi b/arch/arm/boot/dts/stm32mp157c.dtsi
> index 3db03a2..ea7b6cb 100644
> --- a/arch/arm/boot/dts/stm32mp157c.dtsi
> +++ b/arch/arm/boot/dts/stm32mp157c.dtsi
> @@ -179,5 +179,35 @@
>   			clocks = <&rcc USART1_K>;
>   			status = "disabled";
>   		};
> +
> +		stmmac_axi_config_0: stmmac-axi-config {
> +			snps,wr_osr_lmt = <0x7>;
> +			snps,rd_osr_lmt = <0x7>;
> +			snps,blen = <0 0 0 0 16 8 4>;
> +		};
> +
> +		ethernet0: ethernet@5800a000 {
> +			compatible = "st,stm32mp1-dwmac", "snps,dwmac-4.20a";
> +			reg = <0x5800a000 0x2000>;
> +			reg-names = "stmmaceth";
> +			interrupts-extended = <&intc GIC_SPI 61 IRQ_TYPE_NONE>;

IRQ_TYPE_NONE souldn't be used. Please provide edge sensitiv or level 
sensitic type.

> +			interrupt-names = "macirq";
> +			clock-names = "stmmaceth",
> +				      "mac-clk-tx",
> +				      "mac-clk-rx",
> +				      "ethstp",
> +				      "syscfg-clk";
> +			clocks = <&rcc ETHMAC>,
> +				 <&rcc ETHTX>,
> +				 <&rcc ETHRX>,
> +				 <&rcc ETHSTP>,
> +				 <&rcc SYSCFG>;
> +			st,syscon = <&syscfg 0x4>;
> +			snps,mixed-burst;
> +			snps,pbl = <2>;
> +			snps,axi-config = <&stmmac_axi_config_0>;
> +			snps,tso;
> +			status = "disabled";
> +		};
>   	};
>   };
> 
