From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH] arm64: zynqmp: Add ZynqMP SDHCI compatible string
Date: Wed, 12 Jun 2019 09:05:16 +0200
Message-ID: <dd22a1b2-1563-c9ba-d2ca-f17421b8edcf@xilinx.com>
References: <1560247635-29281-1-git-send-email-manish.narani@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560247635-29281-1-git-send-email-manish.narani@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manish Narani <manish.narani@xilinx.com>, robh+dt@kernel.org, mark.rutland@arm.com, michal.simek@xilinx.com, chanho.min@lge.com, rrichter@cavium.com, leoyang.li@nxp.com, amit.kucheria@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11. 06. 19 12:07, Manish Narani wrote:
> Add the new compatible string for ZynqMP SD Host Controller for its use
> in the Arasan SDHCI driver for some of the ZynqMP specific operations.
> Add required properties for the same.
> 
> Signed-off-by: Manish Narani <manish.narani@xilinx.com>
> ---
> This patch depends on the below series of patches:
> https://lkml.org/lkml/2019/6/11/286
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index 9aa6734..6da5b82 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -493,21 +493,25 @@
>  		};
>  
>  		sdhci0: mmc@ff160000 {
> -			compatible = "arasan,sdhci-8.9a";
> +			compatible = "xlnx,zynqmp-8.9a", "arasan,sdhci-8.9a";
>  			status = "disabled";
>  			interrupt-parent = <&gic>;
>  			interrupts = <0 48 4>;
>  			reg = <0x0 0xff160000 0x0 0x1000>;
>  			clock-names = "clk_xin", "clk_ahb";
> +			clock-output-names = "clk_sd0";
> +			#clock-cells = <0>;
>  		};
>  
>  		sdhci1: mmc@ff170000 {
> -			compatible = "arasan,sdhci-8.9a";
> +			compatible = "xlnx,zynqmp-8.9a", "arasan,sdhci-8.9a";
>  			status = "disabled";
>  			interrupt-parent = <&gic>;
>  			interrupts = <0 49 4>;
>  			reg = <0x0 0xff170000 0x0 0x1000>;
>  			clock-names = "clk_xin", "clk_ahb";
> +			clock-output-names = "clk_sd1";
> +			#clock-cells = <0>;
>  		};
>  
>  		smmu: smmu@fd800000 {
> 

note: I am waiting when binding is acked and then this can go to my tree.

Thanks,
Michal
