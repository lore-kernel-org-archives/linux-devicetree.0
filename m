From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: msm: gmu: add optional
 ocmem property
Date: Mon, 22 Jul 2019 11:37:34 -0600
Message-ID: <20190722173734.GA20285@bogus>
References: <20190626022148.23712-1-masneyb@onstation.org>
 <20190626022148.23712-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190626022148.23712-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: agross@kernel.org, robdclark@gmail.com, sean@poorly.run, bjorn.andersson@linaro.org, airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, jcrouse@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 10:21:44PM -0400, Brian Masney wrote:
> Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> optional ocmem property to the Adreno Graphics Management Unit bindings.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v2:
> - Add a3xx example with OCMEM
> 
> Changes since v1:
> - None
> 
>  .../devicetree/bindings/display/msm/gmu.txt   | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> index 90af5b0a56a9..e5596994df7b 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> @@ -31,6 +31,10 @@ Required properties:
>  - iommus: phandle to the adreno iommu
>  - operating-points-v2: phandle to the OPP operating points
>  
> +Optional properties:
> +- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> +         SoCs. See Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml.

You missed my comment on v1 about using 'sram'...

> +
>  Example:
>  
>  / {
> @@ -63,3 +67,49 @@ Example:
>  		operating-points-v2 = <&gmu_opp_table>;
>  	};
>  };
> +
> +a3xx example with OCMEM support:
> +
> +/ {
> +	...
> +
> +	gpu: adreno@fdb00000 {
> +		compatible = "qcom,adreno-330.2",
> +		             "qcom,adreno";
> +		reg = <0xfdb00000 0x10000>;
> +		reg-names = "kgsl_3d0_reg_memory";
> +		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "kgsl_3d0_irq";
> +		clock-names = "core",
> +		              "iface",
> +		              "mem_iface";
> +		clocks = <&mmcc OXILI_GFX3D_CLK>,
> +		         <&mmcc OXILICX_AHB_CLK>,
> +		         <&mmcc OXILICX_AXI_CLK>;
> +		ocmem = <&ocmem>;
> +		power-domains = <&mmcc OXILICX_GDSC>;
> +		operating-points-v2 = <&gpu_opp_table>;
> +		iommus = <&gpu_iommu 0>;
> +	};
> +
> +	ocmem: ocmem@fdd00000 {
> +		compatible = "qcom,msm8974-ocmem";
> +
> +		reg = <0xfdd00000 0x2000>,
> +		      <0xfec00000 0x180000>;
> +		reg-names = "ctrl",
> +		             "mem";
> +
> +		clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> +		         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> +		clock-names = "core",
> +		              "iface";
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		gmu-sram@0 {
> +			reg = <0x0 0x100000>;
> +		};
> +	};
> +};
> -- 
> 2.20.1
> 
