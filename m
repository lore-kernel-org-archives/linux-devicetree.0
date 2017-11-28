From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH 10/11] dt-bindings: clock: qcom: add misc resets for PCIE
 and NSS
Date: Tue, 28 Nov 2017 20:55:29 +0530
Message-ID: <e5e7264b04f95f3621ee85f5cee2aad7@codeaurora.org>
References: <1506428644-2996-1-git-send-email-absahu@codeaurora.org>
 <1506428644-2996-11-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506428644-2996-11-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2017-09-26 17:54, Abhishek Sahu wrote:
> PCIE and NSS has MISC reset register in which single register has
> multiple reset bit. The patch adds the DT bindings for these MISC
> resets.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

Hi Rob,

Could you please review this DT bindings change and give
your Acked-by if its OK.

Thanks,
Abhishek

> ---
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h | 42 
> ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> index ff0b4ac..238f872 100644
> --- a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> +++ b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> @@ -328,5 +328,47 @@
>  #define GCC_APC0_VOLTAGE_DROOP_DETECTOR_BCR	86
>  #define GCC_APC1_VOLTAGE_DROOP_DETECTOR_BCR	87
>  #define GCC_SMMU_CATS_BCR			88
> +#define GCC_UBI0_AXI_ARES			89
> +#define GCC_UBI0_AHB_ARES			90
> +#define GCC_UBI0_NC_AXI_ARES			91
> +#define GCC_UBI0_DBG_ARES			92
> +#define GCC_UBI0_CORE_CLAMP_ENABLE		93
> +#define GCC_UBI0_CLKRST_CLAMP_ENABLE		94
> +#define GCC_UBI1_AXI_ARES			95
> +#define GCC_UBI1_AHB_ARES			96
> +#define GCC_UBI1_NC_AXI_ARES			97
> +#define GCC_UBI1_DBG_ARES			98
> +#define GCC_UBI1_CORE_CLAMP_ENABLE		99
> +#define GCC_UBI1_CLKRST_CLAMP_ENABLE		100
> +#define GCC_NSS_CFG_ARES			101
> +#define GCC_NSS_IMEM_ARES			102
> +#define GCC_NSS_NOC_ARES			103
> +#define GCC_NSS_CRYPTO_ARES			104
> +#define GCC_NSS_CSR_ARES			105
> +#define GCC_NSS_CE_APB_ARES			106
> +#define GCC_NSS_CE_AXI_ARES			107
> +#define GCC_NSSNOC_CE_APB_ARES			108
> +#define GCC_NSSNOC_CE_AXI_ARES			109
> +#define GCC_NSSNOC_UBI0_AHB_ARES		110
> +#define GCC_NSSNOC_UBI1_AHB_ARES		111
> +#define GCC_NSSNOC_SNOC_ARES			112
> +#define GCC_NSSNOC_CRYPTO_ARES			113
> +#define GCC_NSSNOC_ATB_ARES			114
> +#define GCC_NSSNOC_QOSGEN_REF_ARES		115
> +#define GCC_NSSNOC_TIMEOUT_REF_ARES		116
> +#define GCC_PCIE0_PIPE_ARES			117
> +#define GCC_PCIE0_SLEEP_ARES			118
> +#define GCC_PCIE0_CORE_STICKY_ARES		119
> +#define GCC_PCIE0_AXI_MASTER_ARES		120
> +#define GCC_PCIE0_AXI_SLAVE_ARES		121
> +#define GCC_PCIE0_AHB_ARES			122
> +#define GCC_PCIE0_AXI_MASTER_STICKY_ARES	123
> +#define GCC_PCIE1_PIPE_ARES			124
> +#define GCC_PCIE1_SLEEP_ARES			125
> +#define GCC_PCIE1_CORE_STICKY_ARES		126
> +#define GCC_PCIE1_AXI_MASTER_ARES		127
> +#define GCC_PCIE1_AXI_SLAVE_ARES		128
> +#define GCC_PCIE1_AHB_ARES			129
> +#define GCC_PCIE1_AXI_MASTER_STICKY_ARES	130
> 
>  #endif
