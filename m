From: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/5] ARC: AXS103: DTS: Set cpu frequency explicitly via
 dts
Date: Tue, 22 Aug 2017 14:40:50 -0700
Message-ID: <4685c3d5-7a2f-78cd-a11b-2eda0de2dd35@synopsys.com>
References: <20170814161213.17522-1-Eugeniy.Paltsev@synopsys.com>
 <20170814161213.17522-5-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170814161213.17522-5-Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Brodkin <Alexey.Brodkin-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/14/2017 09:12 AM, Eugeniy Paltsev wrote:
> Set cpu frequency explicitly via "cpu-freq" param in cpu 0 node
> in device tree.
>
> We add "cpu-freq" only to cpu 0 as all cpus are clocking from same
> clock source (same pll in our case).
>
> We override cpus node in skeleton as we don't need this change for
> nsim.

Given that you added a generic feature as part of 1/5 - do other platforms 
abilis/nps need corresponding fixups as this one !

>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>   arch/arc/boot/dts/axc003.dtsi     | 13 +++++++++++++
>   arch/arc/boot/dts/axc003_idu.dtsi | 35 +++++++++++++++++++++++++++++++++++
>   2 files changed, 48 insertions(+)
>
> diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
> index dca7e39..7c7411c 100644
> --- a/arch/arc/boot/dts/axc003.dtsi
> +++ b/arch/arc/boot/dts/axc003.dtsi
> @@ -17,6 +17,19 @@
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "snps,archs38";
> +			reg = <0>;
> +			cpu-freq = <100000000>;
> +			clocks = <&core_clk>;
> +		};
> +	};
> +
>   	cpu_card {
>   		compatible = "simple-bus";
>   		#address-cells = <1>;
> diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
> index 5b56bef..44bc01e 100644
> --- a/arch/arc/boot/dts/axc003_idu.dtsi
> +++ b/arch/arc/boot/dts/axc003_idu.dtsi
> @@ -17,6 +17,41 @@
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/*
> +		 * "cpu-freq" was added only to cpu 0 as all cpus are clocking
> +		 * from same clock source (same pll (core_clk) in our case).
> +		 */
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "snps,archs38";
> +			reg = <0>;
> +			cpu-freq = <100000000>;
> +			clocks = <&core_clk>;
> +		};
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "snps,archs38";
> +			reg = <1>;
> +			clocks = <&core_clk>;
> +		};
> +		cpu@2 {
> +			device_type = "cpu";
> +			compatible = "snps,archs38";
> +			reg = <2>;
> +			clocks = <&core_clk>;
> +		};
> +		cpu@3 {
> +			device_type = "cpu";
> +			compatible = "snps,archs38";
> +			reg = <3>;
> +			clocks = <&core_clk>;
> +		};
> +	};
> +
>   	cpu_card {
>   		compatible = "simple-bus";
>   		#address-cells = <1>;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
