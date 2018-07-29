From: Parthiban Nallathambi <pn@denx.de>
Subject: Re: [PATCH 5/9] arm64: dts: actions: Add Reset Controller support for
 S700 SoC
Date: Sun, 29 Jul 2018 20:34:41 +0200
Message-ID: <6df29971-c9e6-7015-9955-6a8159cc0f47@denx.de>
References: <20180727184527.13287-1-manivannan.sadhasivam@linaro.org>
 <20180727184527.13287-6-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727184527.13287-6-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org, afaerber@suse.de, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, manivannanece23@gmail.com, thomas.liau@actions-semi.com, jeff.chen@actions-semi.com, edgar.righi@lsitec.org.br, sravanhome@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Mani,

On 07/27/2018 08:45 PM, Manivannan Sadhasivam wrote:
> Add reset controller property and bindings header for the
> Actions Semi S700 SoC DTS.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/actions/s700.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
> index 59d29e4ca404..db4c544d5311 100644
> --- a/arch/arm64/boot/dts/actions/s700.dtsi
> +++ b/arch/arm64/boot/dts/actions/s700.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/actions,s700-cmu.h>
> +#include <dt-bindings/reset/actions,s900-reset.h>

Typo here, this should be s700-reset.h

>  
>  / {
>  	compatible = "actions,s700";
> @@ -165,6 +166,7 @@
>  			reg = <0x0 0xe0168000 0x0 0x1000>;
>  			clocks = <&hosc>, <&losc>;
>  			#clock-cells = <1>;
> +			#reset-cells = <1>;
>  		};
>  
>  		sps: power-controller@e01b0100 {
> 

-- 
Thanks,
Parthiban N
