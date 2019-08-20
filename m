From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm8150: Add reserved-memory
 regions
Date: Tue, 20 Aug 2019 14:24:37 +0200
Message-ID: <20190820122437.GA28228@centauri>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-8-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190820064216.8629-8-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 20, 2019 at 12:12:15PM +0530, Vinod Koul wrote:
> Add the reserved memory regions in SM8150

Is there a reason not to squash this this patch 1/8 ?

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 111 +++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index d9dc95f851b7..8bf4b4c17ae0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -153,6 +153,117 @@
>  		method = "smc";
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		hyp_mem: memory@85700000 {
> +			reg = <0x0 0x85700000 0x0 0x600000>;
> +			no-map;
> +		};
> +
> +		xbl_mem: memory@85d00000 {
> +			reg = <0x0 0x85d00000 0x0 0x140000>;
> +			no-map;
> +		};
> +
> +		aop_mem: memory@85f00000 {
> +			reg = <0x0 0x85f00000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		aop_cmd_db: memory@85f20000 {
> +			compatible = "qcom,cmd-db";
> +			reg = <0x0 0x85f20000 0x0 0x20000>;
> +			no-map;
> +		};
> +
> +		smem_mem: memory@86000000 {
> +			reg = <0x0 0x86000000 0x0 0x200000>;
> +			no-map;
> +		};
> +
> +		tz_mem: memory@86200000 {
> +			reg = <0x0 0x86200000 0x0 0x3900000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: memory@89b00000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0x0 0x89b00000 0x0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <15>;
> +		};
> +
> +		camera_mem: memory@8b700000 {
> +			reg = <0x0 0x8b700000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		wlan_mem: memory@8bc00000 {
> +			reg = <0x0 0x8bc00000 0x0 0x180000>;
> +			no-map;
> +		};
> +
> +		npu_mem: memory@8bd80000 {
> +			reg = <0x0 0x8bd80000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: memory@8be00000 {
> +			reg = <0x0 0x8be00000 0x0 0x1a00000>;
> +			no-map;
> +		};
> +
> +		mpss_mem: memory@8d800000 {
> +			reg = <0x0 0x8d800000 0x0 0x9600000>;
> +			no-map;
> +		};
> +
> +		venus_mem: memory@96e00000 {
> +			reg = <0x0 0x96e00000 0x0 0x500000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: memory@97300000 {
> +			reg = <0x0 0x97300000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: memory@98700000 {
> +			reg = <0x0 0x98700000 0x0 0x10000>;
> +			no-map;
> +		};
> +
> +		ipa_gsi_mem: memory@98710000 {
> +			reg = <0x0 0x98710000 0x0 0x5000>;
> +			no-map;
> +		};
> +
> +		gpu_mem: memory@98715000 {
> +			reg = <0x0 0x98715000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		spss_mem: memory@98800000 {
> +			reg = <0x0 0x98800000 0x0 0x100000>;
> +			no-map;
> +		};
> +
> +		cdsp_mem: memory@98900000 {
> +			reg = <0x0 0x98900000 0x0 0x1400000>;
> +			no-map;
> +		};
> +
> +		qseecom_mem: memory@9e400000 {
> +			reg = <0 0x9e400000 0 0x1400000>;
> +			no-map;
> +		};
> +	};
> +
>  	soc: soc@0 {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -- 
> 2.20.1
> 
