From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Subject: Re: [PATCH] ARM: dts: socfpga: update more missing reset properties
Date: Tue, 29 Jan 2019 21:05:55 +0100
Message-ID: <d2080ae3-8bc9-1346-8ef6-3bba0274a425@gmail.com>
References: <20190129194625.19218-1-goldsimon@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129194625.19218-1-goldsimon@gmx.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Simon Goldschmidt <goldsimon@gmx.de>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 29.01.2019 um 20:46 schrieb Simon Goldschmidt:
> Add reset property for dma, can and sdram on socfpga gen5.
> 
> Signed-off-by: Simon Goldschmidt <goldsimon@gmx.de>

That should have been:
Signed-off-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>

Regards,
Simon

> 
> ---
> This series applies on top of  kernel/git/dinguyen/linux.git,
> branch socfpga_for_next_v5.1_dts_v1
> 
>   arch/arm/boot/dts/socfpga.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index f365003f0..ec1966480 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -84,6 +84,7 @@
>   				#dma-requests = <32>;
>   				clocks = <&l4_main_clk>;
>   				clock-names = "apb_pclk";
> +				resets = <&rst DMA_RESET>;
>   			};
>   		};
>   
> @@ -100,6 +101,7 @@
>   			reg = <0xffc00000 0x1000>;
>   			interrupts = <0 131 4>, <0 132 4>, <0 133 4>, <0 134 4>;
>   			clocks = <&can0_clk>;
> +			resets = <&rst CAN0_RESET>;
>   			status = "disabled";
>   		};
>   
> @@ -108,6 +110,7 @@
>   			reg = <0xffc01000 0x1000>;
>   			interrupts = <0 135 4>, <0 136 4>, <0 137 4>, <0 138 4>;
>   			clocks = <&can1_clk>;
> +			resets = <&rst CAN1_RESET>;
>   			status = "disabled";
>   		};
>   
> @@ -791,6 +794,7 @@
>   		sdr: sdr@ffc25000 {
>   			compatible = "altr,sdr-ctl", "syscon";
>   			reg = <0xffc25000 0x1000>;
> +			resets = <&rst SDR_RESET>;
>   		};
>   
>   		sdramedac {
> 
