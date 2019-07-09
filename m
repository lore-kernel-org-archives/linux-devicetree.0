From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: add mtk svs dt-bindings
Date: Tue, 9 Jul 2019 15:47:11 -0600
Message-ID: <20190709214711.GA9818@bogus>
References: <20190621084348.16834-1-roger.lu@mediatek.com>
 <20190621084348.16834-2-roger.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190621084348.16834-2-roger.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Lu <roger.lu@mediatek.com>
Cc: Kevin Hilman <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>, Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 21, 2019 at 04:43:47PM +0800, Roger Lu wrote:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../devicetree/bindings/power/mtk-svs.txt     | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt
> 
> diff --git a/Documentation/devicetree/bindings/power/mtk-svs.txt b/Documentation/devicetree/bindings/power/mtk-svs.txt
> new file mode 100644
> index 000000000000..6a71992ef162
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/mtk-svs.txt
> @@ -0,0 +1,88 @@
> +* Mediatek Smart Voltage Scaling (MTK SVS)
> +
> +This describes the device tree binding for the MTK SVS controller (bank)
> +which helps provide the optimized CPU/GPU/CCI voltages. This device also
> +needs thermal data to calculate thermal slope for accurately compensate
> +the voltages when temperature change.
> +
> +Required properties:
> +- compatible:
> +  - "mediatek,mt8183-svs" : For MT8183 family of SoCs
> +- reg: Address range of the MTK SVS controller.
> +- interrupts: IRQ for the MTK SVS controller.
> +- clocks, clock-names: Clocks needed for the svs controller. required
> +                       clocks are:
> +		       "main_clk": Main clock needed for register access

'_clk' is redundant and can be dropped.

> +- nvmem-cells: Phandle to the calibration data provided by a nvmem device.
> +- nvmem-cell-names: Should be "svs-calibration-data" and "calibration-data"
> +
> +Subnodes:
> +- svs_cpu_little: SVS bank device node of little CPU
> +  compatible: "mediatek,mt8183-svs-cpu-little"
> +  operating-points-v2: OPP table hooked by SVS little CPU bank.
> +		       SVS will optimze this OPP table voltage part.
> +  vcpu-little-supply: PMIC buck of little CPU
> +- svs_cpu_big: SVS bank device node of big CPU
> +  compatible: "mediatek,mt8183-svs-cpu-big"
> +  operating-points-v2: OPP table hooked by SVS big CPU bank.
> +		       SVS will optimze this OPP table voltage part.
> +  vcpu-big-supply: PMIC buck of big CPU
> +- svs_cci: SVS bank device node of CCI
> +  compatible: "mediatek,mt8183-svs-cci"
> +  operating-points-v2: OPP table hooked by SVS CCI bank.
> +		       SVS will optimze this OPP table voltage part.
> +  vcci-supply: PMIC buck of CCI
> +- svs_gpu: SVS bank device node of GPU
> +  compatible: "mediatek,mt8183-svs-gpu"
> +  operating-points-v2: OPP table hooked by SVS GPU bank.
> +		       SVS will optimze this OPP table voltage part.
> +  vgpu-spply: PMIC buck of GPU

typo

> +
> +Example:
> +
> +	svs: svs@1100b000 {
> +		compatible = "mediatek,mt8183-svs";
> +		reg = <0 0x1100b000 0 0x1000>;
> +		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW 0>;
> +		clocks = <&infracfg CLK_INFRA_THERM>;
> +		clock-names = "main_clk";
> +		nvmem-cells = <&svs_calibration>, <&thermal_calibration>;
> +		nvmem-cell-names = "svs-calibration-data", "calibration-data";
> +
> +		svs_cpu_little: svs_cpu_little {
> +			compatible = "mediatek,mt8183-svs-cpu-little";
> +			operating-points-v2 = <&cluster0_opp>;
> +		};
> +
> +		svs_cpu_big: svs_cpu_big {
> +			compatible = "mediatek,mt8183-svs-cpu-big";
> +			operating-points-v2 = <&cluster1_opp>;
> +		};
> +
> +		svs_cci: svs_cci {
> +			compatible = "mediatek,mt8183-svs-cci";
> +			operating-points-v2 = <&cci_opp>;
> +		};
> +
> +		svs_gpu: svs_gpu {
> +			compatible = "mediatek,mt8183-svs-gpu";
> +			power-domains = <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +		};

This all looks like redundant data which can be found in the cpu, gpu, 
etc. nodes. Can't you parse those nodes to get the information?

> +	};
> +
> +	&svs_cpu_little {
> +		vcpu-little-supply = <&mt6358_vproc12_reg>;

Don't split examples like this. Just should one flat example.

> +	};
> +
> +	&svs_cpu_big {
> +		vcpu-big-supply = <&mt6358_vproc11_reg>;
> +	};
> +
> +	&svs_cci {
> +		vcci-supply = <&mt6358_vproc12_reg>;
> +	};
> +
> +	&svs_gpu {
> +		vgpu-spply = <&mt6358_vgpu_reg>;
> +	};
> -- 
> 2.18.0
> 
