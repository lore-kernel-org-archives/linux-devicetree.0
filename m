Return-Path: <SRS0=pEqb=R7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from foss.arm.com ([217.140.101.70]:47832 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726082AbfC1QRg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 28 Mar 2019 12:17:36 -0400
Date: Thu, 28 Mar 2019 16:17:33 +0000
From: "liviu.dudau@arm.com" <liviu.dudau@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: ls1028a: Add properties for Mali DP500
 node
Message-ID: <20190328161733.GN21747@e110455-lin.cambridge.arm.com>
References: <20190328035309.18703-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190328035309.18703-1-wen.he_1@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "brian.starkey@arm.com" <brian.starkey@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 28, 2019 at 03:51:46AM +0000, Wen He wrote:
> The LS1028A has a LCD controller and Displayport interface that
> connects to eDP and Displayport connectors on the LS1028A board.
> 
> This patch enables the LCD controller driver on the LS1028A.
> 
> Signed-off-by: Alison Wang <alison.wang@nxp.com>
> Signed-off-by: Wen He <wen.he_1@nxp.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 8dd3501b1333..0d5963bb46c5 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -70,6 +70,27 @@
>  		clock-output-names = "sysclk";
>  	};
>  
> +	dpclk: dpclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <27000000>;
> +		clock-output-names= "dpclk";
> +	};
> +
> +	aclk: aclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <650000000>;
> +		clock-output-names= "aclk";
> +	};
> +
> +	pclk: pclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <650000000>;
> +		clock-output-names= "pclk";
> +	};
> +
>  	reboot {
>  		compatible ="syscon-reboot";
>  		regmap = <&dcfg>;
> @@ -433,4 +454,20 @@
>  			};
>  		};
>  	};
> +
> +	dp0: malidp@f080000 {
> +		compatible = "arm,mali-dp500";
> +		reg = <0x0 0xf080000 0x0 0x10000>;
> +		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 223 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "DE", "SE";
> +		clocks = <&dpclk>, <&aclk>, <&aclk>, <&pclk>;
> +		clock-names = "pxlclk", "mclk", "aclk", "pclk";
> +		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> +		port {
> +			dp0_out: endpoint {
> +
> +			};
> +		};
> +	};
>  };
> -- 
> 2.17.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
