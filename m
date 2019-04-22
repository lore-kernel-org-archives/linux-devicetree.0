Return-Path: <SRS0=1iwi=SY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725961AbfDVBt0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 21 Apr 2019 21:49:26 -0400
Date: Mon, 22 Apr 2019 09:49:10 +0800
From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [v3] arm64: dts: ls1028a: Add properties for Mali DP500 node
Message-ID: <20190422014909.GQ19962@dragon>
References: <20190416021906.40443-1-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190416021906.40443-1-wen.he_1@nxp.com>
Sender: devicetree-owner@vger.kernel.org
To: Wen He <wen.he_1@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 16, 2019 at 02:17:31AM +0000, Wen He wrote:
> The LS1028A has a LCD controller and Displayport interface that
> connects to eDP and Displayport connectors on the LS1028A board.
> 
> This patch enables the LCD controller driver on the LS1028A.
> 
> Signed-off-by: Alison Wang <alison.wang@nxp.com>
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
> change in v3:
>         - using 'display0' instead of node name 'display-0' to
>         fixed syntax error.
> 
> change in v2:
>         - renamed node name 'dp0' to be generic name 'display-0'.
>         - replace clk name 'xxclk' to 'clock-xx'.
>         - add newline between properties and child node.
> 
>  .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 8dd3501b1333..3c724eb8cb20 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -70,6 +70,27 @@
>  		clock-output-names = "sysclk";
>  	};
>  
> +	dpclk: clock-dp {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <27000000>;
> +		clock-output-names= "dpclk";
> +	};
> +
> +	aclk: clock-axi {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <650000000>;
> +		clock-output-names= "aclk";
> +	};
> +
> +	pclk: clock-apb {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <650000000>;
> +		clock-output-names= "pclk";
> +	};
> +
>  	reboot {
>  		compatible ="syscon-reboot";
>  		regmap = <&dcfg>;
> @@ -433,4 +454,21 @@
>  			};
>  		};
>  	};
> +
> +	display0: malidp@f080000 {

Hmm, I was saying that node name should be generic, not label name.
That said, the following is actually what I would like to see:

	malidp0: display@f080000 {

Shawn

> +		compatible = "arm,mali-dp500";
> +		reg = <0x0 0xf080000 0x0 0x10000>;
> +		interrupts = <0 222 IRQ_TYPE_LEVEL_HIGH>,
> +			     <0 223 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "DE", "SE";
> +		clocks = <&dpclk>, <&aclk>, <&aclk>, <&pclk>;
> +		clock-names = "pxlclk", "mclk", "aclk", "pclk";
> +		arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> +
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
