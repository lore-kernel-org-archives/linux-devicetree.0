From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: arm: coresight: Unify funnel DT
 binding
Date: Mon, 8 Apr 2019 11:51:16 +0100
Message-ID: <7f63abef-76fc-a767-723d-caacc8da29ae@arm.com>
References: <20190406112145.15184-1-leo.yan@linaro.org>
 <20190406112145.15184-4-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190406112145.15184-4-leo.yan@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: leo.yan@linaro.org, mathieu.poirier@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, shiwanglai@hisilicon.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/06/2019 12:21 PM, Leo Yan wrote:
> Following the same fashion with replicator DT binding, this patch is to
> unify the DT binding for funnel to support static and dynamic modes;
> finally we get the funnel DT binding as below:
> 
> Before patch:
> 
>    Static funnel, aka. non-configurable funnel:
>      Not supported;
> 
>    Dynamic funnel, aka. configurable funnel:
>      "arm,coresight-funnel", "arm,primecell";
> 
> After patch:
> 
>    Static funnel:
>      "arm,coresight-static-funnel";
> 
>    Dynamic funnel:
>      "arm,coresight-funnel", "arm,primecell"; (obsolete)
>      "arm,coresight-dynamic-funnel", "arm,primecell";
> 
> At the end of this patch, it gives an example for static funnel DT
> binding, and updates the dynamic funnel example.
> 
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Wanglai Shi <shiwanglai@hisilicon.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>   .../devicetree/bindings/arm/coresight.txt     | 52 +++++++++++++++++--
>   1 file changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index f8f794869af2..f8ad11a17cd5 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -8,7 +8,8 @@ through the intermediate links connecting the source to the currently selected
>   sink. Each CoreSight component device should use these properties to describe
>   its hardware characteristcs.
>   
> -* Required properties for all components *except* non-configurable replicators:
> +* Required properties for all components *except* non-configurable replicators
> +  and non-configurable funnels:
>   
>   	* compatible: These have to be supplemented with "arm,primecell" as
>   	  drivers are using the AMBA bus interface.  Possible values include:
> @@ -24,8 +25,11 @@ its hardware characteristcs.
>   		  discovered at boot time when the device is probed.
>   			"arm,coresight-tmc", "arm,primecell";
>   
> -		- Trace Funnel:
> +		- Trace Programmable Funnel, the compatible string
> +		  "arm,coresight-funnel" is obsolete, keep it to support
> +		  the old DT bindings:
>   			"arm,coresight-funnel", "arm,primecell";
> +			"arm,coresight-dynamic-funnel", "arm,primecell";

Same comments as the first patch here.


> +	funnel {
> +		/*
> +		 * non-configurable funnel don't show up on the AMBA
> +		 * bus.  As such no need to add "arm,primecell".
> +		 */
> +		compatible = "arm,coresight-static-funnel";
> +		clocks = <&crg_ctrl HI3660_PCLK>;
> +		clock-names = "apb_pclk";
> +
> +		out-ports {
> +			port {
> +				combo_funnel_out: endpoint {
> +					remote-endpoint = <&top_funnel_in>;
> +				};
> +			};
> +		};
> +
> +		in-ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				combo_funnel_in0: endpoint {
> +					remote-endpoint = <&cluster0_etf_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				combo_funnel_in1: endpoint {
> +					remote-endpoint = <&cluster1_etf_out>;
> +				};
> +			};
> +		};
> +	};
> +
>   	funnel@20040000 {

Should we rename this to say dynamic_funnel@2004000 { ?

> -		compatible = "arm,coresight-funnel", "arm,primecell";
> +		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>   		reg = <0 0x20040000 0 0x1000>;


Rest looks fine to me.

Suzuki
