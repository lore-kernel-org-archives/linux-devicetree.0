From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: sdm845: Add interconnect properties
 for Venus
Date: Thu, 10 Oct 2019 17:24:26 +0300
Message-ID: <3c222f45-2db7-42a7-c79a-492bb587c331@linaro.org>
References: <20190912082948.22836-1-stanimir.varbanov@linaro.org>
 <20190912082948.22836-3-stanimir.varbanov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912082948.22836-3-stanimir.varbanov@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Vikash Garodia <vgarodia@codeaurora.org>, Andy Gross <agross@kernel.org>, David Dai <daidavid1@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 9/12/19 11:29, Stanimir Varbanov wrote:
> Populate Venus DT node with interconnect properties.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 0323e3da190a..567bfc89bd77 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2039,6 +2039,9 @@
>  			iommus = <&apps_smmu 0x10a0 0x8>,
>  				 <&apps_smmu 0x10b0 0x0>;
>  			memory-region = <&venus_mem>;
> +			interconnects = <&rsc_hlos MASTER_VIDEO_P0 &rsc_hlos SLAVE_EBI1>,
> +					<&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_VENUS_CFG>;
> +			interconnect-names = "video-mem", "cpu-cfg";
>  
>  			video-core0 {
>  				compatible = "venus-decoder";
> 

The patch look fine to me, but David is currently working on some patches that
split the rsc_hlos node into multiple DT nodes (for each NoC). So maybe wait
until we conclude on that first and then add Venus as user in DT.

Thanks,
Georgi
