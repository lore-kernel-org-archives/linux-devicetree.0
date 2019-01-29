From: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH 4/6] arm64: dts: Add Adreno GPU and GPU smmu definitions
Date: Tue, 29 Jan 2019 09:04:26 -0700
Message-ID: <20190129160426.GA18874@jcrouse1-lnx.qualcomm.com>
References: <20190129132335.30695-1-srinivas.kandagatla@linaro.org>
 <20190129132335.30695-5-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190129132335.30695-5-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2019 at 01:23:33PM +0000, Srinivas Kandagatla wrote:
> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Add an initial node for the Adreno GPU and it's companion
> SMMU. The GPU node is mostly complete except for a bare
> bones power table that will be filled out more completely
> later.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> [Remove mmagic clocks from GPU/smmu nodes]
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks for sending this.

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 52 +++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 0d0b9482aa4d..b5f23594905c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -84,6 +84,12 @@
>  			qcom,client-id = <1>;
>  			qcom,vmid = <15>;
>  		};
> +
> +		zap_shader_region: gpu@8f200000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x90b00000 0x0 0xa00000>;
> +			no-map;
> +		};
>  	};
>  
>  	cpus {
> @@ -1338,6 +1344,52 @@
>  			};
>  		};
>  
> +		gpu@b00000 {
> +			compatible = "qcom,adreno-530.2", "qcom,adreno";
> +			#stream-id-cells = <16>;
> +
> +			reg = <0xb00000 0x3f000>;
> +			reg-names = "kgsl_3d0_reg_memory";
> +
> +			interrupts = <0 300 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "kgsl_3d0_irq";

We dropped the interrupt name as of:

https://cgit.freedesktop.org/~robclark/linux/commit/?h=msm-next&id=2255f244f92e651dbd410f92d2968c6dae4ead8e

You should be able to safely omit it.

> +
> +			clocks = <&mmcc GPU_GX_GFX3D_CLK>,
> +				<&mmcc GPU_AHB_CLK>,
> +				<&mmcc GPU_GX_RBBMTIMER_CLK>,
> +				<&gcc GCC_BIMC_GFX_CLK>,
> +				<&gcc GCC_MMSS_BIMC_GFX_CLK>;
> +
> +			clock-names = "core",
> +				"iface",
> +				"rbbmtimer",
> +				"mem",
> +				"mem_iface";
> +
> +			power-domains = <&mmcc GPU_GDSC>;
> +			iommus = <&adreno_smmu 0>;
> +
> +			qcom,gpu-quirk-two-pass-use-wfi;
> +			qcom,gpu-quirk-fault-detect-mask;

This was downstream silliness - neither of these "flags" made it upstream
(thankfully).

> +
> +			/* This is a safe speed for bring up in all bin levels.
> +			 * This isn't the fastest the chip can go, but we can
> +			 * get there eventually */
> +			qcom,gpu-pwrlevels {
> +				compatible = "qcom,gpu-pwrlevels";
> +				qcom,gpu-pwrlevel@0 {
> +					qcom,gpu-freq = <510000000>;
> +				};
> +				qcom,gpu-pwrlevel@1 {
> +					qcom,gpu-freq = <27000000>;
> +				};

Hmm - I haven't looked at the integration branch in a while but I'm positive
that we had opp tables at some point because the driver supports
opp-supported-hw. I hope I didn't just leave that sitting on my hard drive
somewhere. I'll check and let you know.

Jordan


> +			};
> +
> +			zap-shader {
> +				memory-region = <&zap_shader_region>;
> +			};
> +		};
> +
>  		mdss: mdss@900000 {
>  			compatible = "qcom,mdss";
>  
> -- 
> 2.20.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
