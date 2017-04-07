From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Add coresight DT nodes for hi6220-hikey
Date: Fri, 7 Apr 2017 17:38:11 +0800
Message-ID: <20170407093811.GA17455@leoy-linaro>
References: <1491552418-74386-1-git-send-email-lipengcheng8@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1491552418-74386-1-git-send-email-lipengcheng8-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Pengcheng <lipengcheng8-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lizhong11-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pengcheng,

[ + Mathieu ]

On Fri, Apr 07, 2017 at 04:06:58PM +0800, Li Pengcheng wrote:
> Add coresight DT nodes for hikey board.
> 
> Signed-off-by: Li Pengcheng <lipengcheng8-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Li Zhong <lizhong11-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>  .../arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 318 +++++++++++++++++++++
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |   1 +
>  2 files changed, 319 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
> new file mode 100644
> index 0000000..a523e43
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
> @@ -0,0 +1,318 @@
> +/*
> + * Hisilicon Ltd. Hi6220 SoC
> + *
> + * Copyright (C) 2015-2016 Hisilicon Ltd.
> + * Author: lipengcheng  <lipengcheng8-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * publishhed by the Free Software Foundation.
> + */
> +/ {
> +	amba {

Here I'm curious if can use the similiar implementation with Juno?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi?id=refs/tags/v4.11-rc5

So finally can include this file into hi6220.dtsi 'soc' section; this
can reflect the hardware topology more clearly:

        soc {
                [...]

                #include "hi6220-coresight.dtsi"
        }

> +		/* A53 cluster0 internal coresight */
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "arm,amba-bus";

Usually the compatible string should be documented in
Documentation/devicetree/bindings/, so please drop it.

I think "#address-cells" and "#size-cells" also can remove. This is
defined by its parent node.

> +		ranges;
> +		etm@0,f659c000 {

Change to etm@f659c000?

> +			compatible = "arm,coresight-etm4x","arm,primecell";
> +			reg = <0 0xf659c000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu0>;
> +			port {
> +				etm0_out_port: endpoint {
> +					remote-endpoint = <&funnel0_in_port0>;
> +				};
> +			};
> +		};
> +
> +		etm@1,f659d000 {

Same with above.

> +			compatible = "arm,coresight-etm4x","arm,primecell";
> +			reg = <0 0xf659d000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu1>;
> +			port {
> +				etm1_out_port: endpoint {
> +					remote-endpoint = <&funnel0_in_port1>;
> +				};
> +			};
> +
> +		};
> +
> +		etm@2,f659e000 {

Same with above.

> +			compatible = "arm,coresight-etm4x","arm,primecell";
> +			reg = <0 0xf659e000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu2>;
> +			port {
> +				etm2_out_port: endpoint {
> +					remote-endpoint = <&funnel0_in_port2>;
> +				};
> +			};
> +		};
> +
> +		etm@3,f659f000 {

Same with above.

> +			compatible = "arm,coresight-etm4x","arm,primecell";
> +			reg = <0 0xf659f000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu3>;
> +			port {
> +				etm3_out_port: endpoint {
> +					remote-endpoint = <&funnel0_in_port3>;
> +				};
> +			};
> +		};
> +
> +		/* A53 cluster1 internal coresight */
> +		etm@4,f65dc000 {

Same with above.

> +			compatible = "arm,coresight-etm4x","arm,primecell";
> +			reg = <0 0xf65dc000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu4>;
> +			port {
> +				etm4_out_port: endpoint {
> +				remote-endpoint = <&funnel0_in_port4>;

Wrong indent.

> +				};
> +			};
> +		};
> +
> +		etm@5,f65dd000 {

Same with above.

> +			compatible = "arm,coresight-etm4x","arm,primecell";
> +			reg = <0 0xf65dd000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu5>;
> +			port {
> +				etm5_out_port: endpoint {
> +				remote-endpoint = <&funnel0_in_port5>;

Wrong indent.

> +				};
> +			};
> +		};
> +
> +		etm@6,f65de000 {

Change to etm@f65de000?

> +			compatible = "arm,coresight-etm4x","arm,primecell";
> +			reg = <0 0xf65de000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu6>;
> +			port {
> +				etm6_out_port: endpoint {
> +					remote-endpoint = <&funnel0_in_port6>;
> +				};
> +			};
> +		};
> +
> +		etm@7,f65df000 {

Same with above.

> +			compatible = "arm,coresight-etm4x","arm,primecell";
> +			reg = <0 0xf65df000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu7>;
> +			port {
> +				etm7_out_port: endpoint {
> +					remote-endpoint = <&funnel0_in_port7>;
> +				};
> +			};
> +		};
> +
> +		funnel0:funnel@0,f6501000 {

funnel0@f6501000.

> +			compatible = "arm,coresight-funnel","arm,primecell";
> +			reg = <0 0xf6501000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* funnel output port */
> +				port@0 {
> +					reg = <0>;
> +					funnel0_out_port: endpoint {
> +						remote-endpoint = <&funnel1_in_port>;
> +					};
> +				};
> +
> +				/* funnel input ports */
> +				port@1 {
> +					reg = <0>;
> +					funnel0_in_port0: endpoint {
> +						slave-mode;
> +						remote-endpoint = <&etm0_out_port>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <1>;
> +					funnel0_in_port1: endpoint {
> +						slave-mode;
> +						remote-endpoint = <&etm1_out_port>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <2>;
> +					funnel0_in_port2: endpoint {
> +						slave-mode;
> +						remote-endpoint = <&etm2_out_port>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <3>;
> +					funnel0_in_port3: endpoint {
> +						slave-mode;
> +						remote-endpoint = <&etm3_out_port>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <4>;
> +					funnel0_in_port4: endpoint {
> +						slave-mode;
> +						remote-endpoint = <&etm4_out_port>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <5>;
> +					funnel0_in_port5: endpoint {
> +						slave-mode;
> +						remote-endpoint = <&etm5_out_port>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <6>;
> +					funnel0_in_port6: endpoint {
> +						slave-mode;
> +						remote-endpoint = <&etm6_out_port>;
> +					};
> +				};
> +
> +				port@8 {
> +					reg = <7>;
> +					funnel0_in_port7: endpoint {
> +						slave-mode;
> +						remote-endpoint = <&etm7_out_port>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel1:funnel@1,f6401000 {

funnel1@f6401000

> +			compatible = "arm,coresight-funnel","arm,primecell";
> +			reg = <0 0xf6401000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				/* funnel1 output port */
> +				port@0 {
> +					reg = <0>;
> +					funnel1_out_port: endpoint {
> +						remote-endpoint = <&etf_in_port>;
> +					};
> +				};
> +
> +				/* funnel1 input port */
> +				port@1 {
> +					reg = <0>;
> +					funnel1_in_port: endpoint {
> +						slave-mode;
> +						remote-endpoint = <&funnel0_out_port>;
> +					};
> +				};
> +			};
> +		};

Extra blank line.

> +		etf:etf@0,f6402000 {
> +			compatible = "arm,coresight-tmc","arm,primecell";
> +			reg = <0 0xf6402000 0 0x1000>;
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				/* etf input port */
> +				port@0 {
> +					reg = <0>;
> +					etf_in_port: endpoint {
> +						slave-mode;
> +						remote-endpoint = <&funnel1_out_port>;
> +					};
> +				};
> +				/* etf output port */
> +				port@1 {
> +					reg = <0>;
> +					etf_out_port: endpoint {
> +						remote-endpoint = <&replicator0_in_port>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@0{
> +			compatible = "arm,coresight-replicator";
> +
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				/* replicator input port  */
> +				port@0 {
> +					reg = <0>;
> +					replicator0_in_port: endpoint{
> +					slave-mode;
> +					remote-endpoint = <&etf_out_port>;

Wrong indent.

> +					};
> +				};
> +				/* replicator out port  */
> +				port@1 {
> +					reg = <0>;
> +					replicator0_out_port: endpoint {
> +						remote-endpoint = <&etr0_in_port>;
> +					};
> +				};
> +			};
> +		};
> +
> +		etr@0,f6404000 {
> +			compatible = "arm,coresight-tmc","arm,primecell";
> +			reg = <0 0xf6404000 0 0x1000>;
> +
> +			coresight-default-sink;
> +			clocks = <&sys_ctrl HI6220_CS_ATB>;
> +			clock-names = "apb_pclk";
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				/* etr input port  */
> +				port@0 {
> +					etr0_in_port: endpoint{
> +					slave-mode;
> +					remote-endpoint = <&replicator0_out_port>;

Wrong indent.

> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> index dba3c13..fb70c9b 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
>  #include "hi6220.dtsi"
>  #include "hikey-pinctrl.dtsi"
> +#include "hi6220-coresight.dtsi"

Please review upper comments for adding it into 'soc' node.

BTW, it's good to use script ./scripts/checkpatch.pl to check the
patch.

>  #include <dt-bindings/gpio/gpio.h>
>  
>  / {
> -- 
> 2.1.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
