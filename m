From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/5] ARC: AXS103: DTS: Add core pll node to manage cpu
 frequency
Date: Tue, 22 Aug 2017 13:45:28 -0700
Message-ID: <9624a76d-a31f-10fc-aec5-5ffa1d437c3d@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
 <20170814161213.17522-4-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170814161213.17522-4-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/14/2017 09:12 AM, Eugeniy Paltsev wrote:
> Add core pll node (core_clk) to manage cpu frequency.
> core_clk represents pll itself.
> input_clk represents clock signal source (basically xtal) which
> comes to pll input.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>   arch/arc/boot/dts/axc003.dtsi     | 11 +++++++++--
>   arch/arc/boot/dts/axc003_idu.dtsi | 11 +++++++++--
>   2 files changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
> index cc9239e..dca7e39 100644
> --- a/arch/arc/boot/dts/axc003.dtsi
> +++ b/arch/arc/boot/dts/axc003.dtsi
> @@ -24,10 +24,17 @@
>   
>   		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
>   
> -		core_clk: core_clk {
> +		input_clk: input-clk {
>   			#clock-cells = <0>;
>   			compatible = "fixed-clock";
> -			clock-frequency = <90000000>;
> +			clock-frequency = <33333333>;
> +		};
> +
> +		core_clk: core-clk@80 {
> +			compatible = "snps,axs10x-arc-pll-clock";
> +			reg = <0x80 0x10>, <0x100 0x10>;
> +			#clock-cells = <0>;
> +			clocks = <&input_clk>;
>   		};
>   
>   		core_intc: archs-intc@cpu {
> diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
> index 4ebb2170..5b56bef 100644
> --- a/arch/arc/boot/dts/axc003_idu.dtsi
> +++ b/arch/arc/boot/dts/axc003_idu.dtsi
> @@ -24,10 +24,17 @@
>   
>   		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
>   
> -		core_clk: core_clk {
> +		input_clk: input-clk {
>   			#clock-cells = <0>;
>   			compatible = "fixed-clock";
> -			clock-frequency = <100000000>;
> +			clock-frequency = <33333333>;
> +		};
> +
> +		core_clk: core-clk@80 {
> +			compatible = "snps,axs10x-arc-pll-clock";
> +			reg = <0x80 0x10>, <0x100 0x10>;
> +			#clock-cells = <0>;
> +			clocks = <&input_clk>;
>   		};
>   
>   		core_intc: archs-intc@cpu {


Do we have a bisectability issue here - isn't system broken temporarily at 2/5 - 
and only 3/5 makes it work again - if so we need to squash them together !

-Vineet
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
