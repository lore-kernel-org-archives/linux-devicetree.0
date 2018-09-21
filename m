From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2 03/11] arm64: dts: hi6220: Update coresight bindings
 for hardware ports
Date: Fri, 21 Sep 2018 15:06:34 +0100
Message-ID: <5BA4FAEA.3010502@hisilicon.com>
References: <20180912135352.19722-1-suzuki.poulose@arm.com>
 <20180912135352.19722-4-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180912135352.19722-4-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, frowand.list@gmail.com, coresight@lists.linaro.org, leo.yan@linaro.org, lipengcheng8@huawei.com
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On 2018/9/12 14:53, Suzuki K Poulose wrote:
> Switch to updated coresight bindings for hw ports.
> 
> Cc: xuwei5@hisilicon.com
> Cc: lipengcheng8@huawei.com
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Tested-by: Leo Yan <leo.yan@linaro.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks!
Applied to the hisilicon dt tree.

Best Regards,
Wei

> ---
>  .../boot/dts/hisilicon/hi6220-coresight.dtsi  | 181 +++++++++---------
>  1 file changed, 86 insertions(+), 95 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
> index 7afee5d5087b..68c52f1149be 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
> @@ -20,22 +20,18 @@
>  			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
>  			clock-names = "apb_pclk";
>  
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> +			out-ports {
> +				port {
>  					soc_funnel_out: endpoint {
>  						remote-endpoint =
>  							<&etf_in>;
>  					};
>  				};
> +			};
>  
> -				port@1 {
> -					reg = <0>;
> +			in-ports {
> +				port {
>  					soc_funnel_in: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&acpu_funnel_out>;
>  					};
> @@ -49,21 +45,17 @@
>  			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
>  			clock-names = "apb_pclk";
>  
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> +			in-ports {
> +				port {
>  					etf_in: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&soc_funnel_out>;
>  					};
>  				};
> +			};
>  
> -				port@1 {
> -					reg = <0>;
> +			out-ports {
> +				port {
>  					etf_out: endpoint {
>  						remote-endpoint =
>  							<&replicator_in>;
> @@ -77,20 +69,20 @@
>  			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
>  			clock-names = "apb_pclk";
>  
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> +			in-ports {
> +				port {
>  					replicator_in: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&etf_out>;
>  					};
>  				};
> +			};
>  
> -				port@1 {
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
>  					reg = <0>;
>  					replicator_out0: endpoint {
>  						remote-endpoint =
> @@ -98,7 +90,7 @@
>  					};
>  				};
>  
> -				port@2 {
> +				port@1 {
>  					reg = <1>;
>  					replicator_out1: endpoint {
>  						remote-endpoint =
> @@ -114,14 +106,9 @@
>  			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
>  			clock-names = "apb_pclk";
>  
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> +			in-ports {
> +				port {
>  					etr_in: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&replicator_out0>;
>  					};
> @@ -135,14 +122,9 @@
>  			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
>  			clock-names = "apb_pclk";
>  
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> +			in-ports {
> +				port {
>  					tpiu_in: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&replicator_out1>;
>  					};
> @@ -156,85 +138,78 @@
>  			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
>  			clock-names = "apb_pclk";
>  
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> +			out-ports {
> +				port {
>  					acpu_funnel_out: endpoint {
>  						remote-endpoint =
>  							<&soc_funnel_in>;
>  					};
>  				};
> +			};
>  
> -				port@1 {
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
>  					reg = <0>;
>  					acpu_funnel_in0: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&etm0_out>;
>  					};
>  				};
>  
> -				port@2 {
> +				port@1 {
>  					reg = <1>;
>  					acpu_funnel_in1: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&etm1_out>;
>  					};
>  				};
>  
> -				port@3 {
> +				port@2 {
>  					reg = <2>;
>  					acpu_funnel_in2: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&etm2_out>;
>  					};
>  				};
>  
> -				port@4 {
> +				port@3 {
>  					reg = <3>;
>  					acpu_funnel_in3: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&etm3_out>;
>  					};
>  				};
>  
> -				port@5 {
> +				port@4 {
>  					reg = <4>;
>  					acpu_funnel_in4: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&etm4_out>;
>  					};
>  				};
>  
> -				port@6 {
> +				port@5 {
>  					reg = <5>;
>  					acpu_funnel_in5: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&etm5_out>;
>  					};
>  				};
>  
> -				port@7 {
> +				port@6 {
>  					reg = <6>;
>  					acpu_funnel_in6: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&etm6_out>;
>  					};
>  				};
>  
> -				port@8 {
> +				port@7 {
>  					reg = <7>;
>  					acpu_funnel_in7: endpoint {
> -						slave-mode;
>  						remote-endpoint =
>  							<&etm7_out>;
>  					};
> @@ -251,10 +226,12 @@
>  
>  			cpu = <&cpu0>;
>  
> -			port {
> -				etm0_out: endpoint {
> -					remote-endpoint =
> -						<&acpu_funnel_in0>;
> +			out-ports {
> +				port {
> +					etm0_out: endpoint {
> +						remote-endpoint =
> +							<&acpu_funnel_in0>;
> +					};
>  				};
>  			};
>  		};
> @@ -268,10 +245,12 @@
>  
>  			cpu = <&cpu1>;
>  
> -			port {
> -				etm1_out: endpoint {
> -					remote-endpoint =
> -						<&acpu_funnel_in1>;
> +			out-ports {
> +				port {
> +					etm1_out: endpoint {
> +						remote-endpoint =
> +							<&acpu_funnel_in1>;
> +					};
>  				};
>  			};
>  		};
> @@ -285,10 +264,12 @@
>  
>  			cpu = <&cpu2>;
>  
> -			port {
> -				etm2_out: endpoint {
> -					remote-endpoint =
> -						<&acpu_funnel_in2>;
> +			out-ports {
> +				port {
> +					etm2_out: endpoint {
> +						remote-endpoint =
> +							<&acpu_funnel_in2>;
> +					};
>  				};
>  			};
>  		};
> @@ -302,10 +283,12 @@
>  
>  			cpu = <&cpu3>;
>  
> -			port {
> -				etm3_out: endpoint {
> -					remote-endpoint =
> -						<&acpu_funnel_in3>;
> +			out-ports {
> +				port {
> +					etm3_out: endpoint {
> +						remote-endpoint =
> +							<&acpu_funnel_in3>;
> +					};
>  				};
>  			};
>  		};
> @@ -319,10 +302,12 @@
>  
>  			cpu = <&cpu4>;
>  
> -			port {
> -				etm4_out: endpoint {
> -					remote-endpoint =
> -						<&acpu_funnel_in4>;
> +			out-ports {
> +				port {
> +					etm4_out: endpoint {
> +						remote-endpoint =
> +							<&acpu_funnel_in4>;
> +					};
>  				};
>  			};
>  		};
> @@ -336,10 +321,12 @@
>  
>  			cpu = <&cpu5>;
>  
> -			port {
> -				etm5_out: endpoint {
> -					remote-endpoint =
> -						<&acpu_funnel_in5>;
> +			out-ports {
> +				port {
> +					etm5_out: endpoint {
> +						remote-endpoint =
> +							<&acpu_funnel_in5>;
> +					};
>  				};
>  			};
>  		};
> @@ -353,10 +340,12 @@
>  
>  			cpu = <&cpu6>;
>  
> -			port {
> -				etm6_out: endpoint {
> -					remote-endpoint =
> -						<&acpu_funnel_in6>;
> +			out-ports {
> +				port {
> +					etm6_out: endpoint {
> +						remote-endpoint =
> +							<&acpu_funnel_in6>;
> +					};
>  				};
>  			};
>  		};
> @@ -370,10 +359,12 @@
>  
>  			cpu = <&cpu7>;
>  
> -			port {
> -				etm7_out: endpoint {
> -					remote-endpoint =
> -						<&acpu_funnel_in7>;
> +			out-ports {
> +				port {
> +					etm7_out: endpoint {
> +						remote-endpoint =
> +							<&acpu_funnel_in7>;
> +					};
>  				};
>  			};
>  		};
> 
