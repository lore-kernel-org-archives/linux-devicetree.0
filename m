From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH 04/11] dt-bindings: clock: qcom: add remaining clocks for
 IPQ8074
Date: Tue, 28 Nov 2017 20:54:33 +0530
Message-ID: <8db28dda018f43ac3038d33f1020eb57@codeaurora.org>
References: <1506428644-2996-1-git-send-email-absahu@codeaurora.org>
 <1506428644-2996-5-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506428644-2996-5-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2017-09-26 17:53, Abhishek Sahu wrote:
> This patch adds the DT bindings for following IPQ8074 clocks
> 
>  - General PLL’s, NSS UBI PLL and NSS Crypto PLL.
>  - 2 instances of PCIE, USB, SDCC.
>  - 2 NSS UBI core and common NSS clocks. NSS is network switching
>    system which accelerates the ethernet traffic. IPQ8074
>    NSS has two UBI cores. Some clocks are separate for each UBI core
>    and remaining NSS clocks are common.
>  - NSS ethernet port clocks. IPQ8074 has 6 ethernet ports and
>    each port uses different TX and RX clocks.
>  - Crypto engine clocks.
>  - General purpose clocks which comes over GPIO.
> 

Hi Rob,

Could you please review this DT bindings change and give
your Acked-by if its OK.

Thanks,
Abhishek

> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h | 180 
> +++++++++++++++++++++++++++
>  1 file changed, 180 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> index 370c83c..ff0b4ac 100644
> --- a/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> +++ b/include/dt-bindings/clock/qcom,gcc-ipq8074.h
> @@ -58,6 +58,186 @@
>  #define GCC_QPIC_AHB_CLK			41
>  #define GCC_QPIC_CLK				42
>  #define PCNOC_BFDCD_CLK_SRC			43
> +#define GPLL2_MAIN				44
> +#define GPLL2					45
> +#define GPLL4_MAIN				46
> +#define GPLL4					47
> +#define GPLL6_MAIN				48
> +#define GPLL6					49
> +#define UBI32_PLL_MAIN				50
> +#define UBI32_PLL				51
> +#define NSS_CRYPTO_PLL_MAIN			52
> +#define NSS_CRYPTO_PLL				53
> +#define PCIE0_AXI_CLK_SRC			54
> +#define PCIE0_AUX_CLK_SRC			55
> +#define PCIE0_PIPE_CLK_SRC			56
> +#define PCIE1_AXI_CLK_SRC			57
> +#define PCIE1_AUX_CLK_SRC			58
> +#define PCIE1_PIPE_CLK_SRC			59
> +#define SDCC1_APPS_CLK_SRC			60
> +#define SDCC1_ICE_CORE_CLK_SRC			61
> +#define SDCC2_APPS_CLK_SRC			62
> +#define USB0_MASTER_CLK_SRC			63
> +#define USB0_AUX_CLK_SRC			64
> +#define USB0_MOCK_UTMI_CLK_SRC			65
> +#define USB0_PIPE_CLK_SRC			66
> +#define USB1_MASTER_CLK_SRC			67
> +#define USB1_AUX_CLK_SRC			68
> +#define USB1_MOCK_UTMI_CLK_SRC			69
> +#define USB1_PIPE_CLK_SRC			70
> +#define GCC_XO_CLK_SRC				71
> +#define SYSTEM_NOC_BFDCD_CLK_SRC		72
> +#define NSS_CE_CLK_SRC				73
> +#define NSS_NOC_BFDCD_CLK_SRC			74
> +#define NSS_CRYPTO_CLK_SRC			75
> +#define NSS_UBI0_CLK_SRC			76
> +#define NSS_UBI0_DIV_CLK_SRC			77
> +#define NSS_UBI1_CLK_SRC			78
> +#define NSS_UBI1_DIV_CLK_SRC			79
> +#define UBI_MPT_CLK_SRC				80
> +#define NSS_IMEM_CLK_SRC			81
> +#define NSS_PPE_CLK_SRC				82
> +#define NSS_PORT1_RX_CLK_SRC			83
> +#define NSS_PORT1_RX_DIV_CLK_SRC		84
> +#define NSS_PORT1_TX_CLK_SRC			85
> +#define NSS_PORT1_TX_DIV_CLK_SRC		86
> +#define NSS_PORT2_RX_CLK_SRC			87
> +#define NSS_PORT2_RX_DIV_CLK_SRC		88
> +#define NSS_PORT2_TX_CLK_SRC			89
> +#define NSS_PORT2_TX_DIV_CLK_SRC		90
> +#define NSS_PORT3_RX_CLK_SRC			91
> +#define NSS_PORT3_RX_DIV_CLK_SRC		92
> +#define NSS_PORT3_TX_CLK_SRC			93
> +#define NSS_PORT3_TX_DIV_CLK_SRC		94
> +#define NSS_PORT4_RX_CLK_SRC			95
> +#define NSS_PORT4_RX_DIV_CLK_SRC		96
> +#define NSS_PORT4_TX_CLK_SRC			97
> +#define NSS_PORT4_TX_DIV_CLK_SRC		98
> +#define NSS_PORT5_RX_CLK_SRC			99
> +#define NSS_PORT5_RX_DIV_CLK_SRC		100
> +#define NSS_PORT5_TX_CLK_SRC			101
> +#define NSS_PORT5_TX_DIV_CLK_SRC		102
> +#define NSS_PORT6_RX_CLK_SRC			103
> +#define NSS_PORT6_RX_DIV_CLK_SRC		104
> +#define NSS_PORT6_TX_CLK_SRC			105
> +#define NSS_PORT6_TX_DIV_CLK_SRC		106
> +#define CRYPTO_CLK_SRC				107
> +#define GP1_CLK_SRC				108
> +#define GP2_CLK_SRC				109
> +#define GP3_CLK_SRC				110
> +#define GCC_PCIE0_AHB_CLK			111
> +#define GCC_PCIE0_AUX_CLK			112
> +#define GCC_PCIE0_AXI_M_CLK			113
> +#define GCC_PCIE0_AXI_S_CLK			114
> +#define GCC_PCIE0_PIPE_CLK			115
> +#define GCC_SYS_NOC_PCIE0_AXI_CLK		116
> +#define GCC_PCIE1_AHB_CLK			117
> +#define GCC_PCIE1_AUX_CLK			118
> +#define GCC_PCIE1_AXI_M_CLK			119
> +#define GCC_PCIE1_AXI_S_CLK			120
> +#define GCC_PCIE1_PIPE_CLK			121
> +#define GCC_SYS_NOC_PCIE1_AXI_CLK		122
> +#define GCC_USB0_AUX_CLK			123
> +#define GCC_SYS_NOC_USB0_AXI_CLK		124
> +#define GCC_USB0_MASTER_CLK			125
> +#define GCC_USB0_MOCK_UTMI_CLK			126
> +#define GCC_USB0_PHY_CFG_AHB_CLK		127
> +#define GCC_USB0_PIPE_CLK			128
> +#define GCC_USB0_SLEEP_CLK			129
> +#define GCC_USB1_AUX_CLK			130
> +#define GCC_SYS_NOC_USB1_AXI_CLK		131
> +#define GCC_USB1_MASTER_CLK			132
> +#define GCC_USB1_MOCK_UTMI_CLK			133
> +#define GCC_USB1_PHY_CFG_AHB_CLK		134
> +#define GCC_USB1_PIPE_CLK			135
> +#define GCC_USB1_SLEEP_CLK			136
> +#define GCC_SDCC1_AHB_CLK			137
> +#define GCC_SDCC1_APPS_CLK			138
> +#define GCC_SDCC1_ICE_CORE_CLK			139
> +#define GCC_SDCC2_AHB_CLK			140
> +#define GCC_SDCC2_APPS_CLK			141
> +#define GCC_MEM_NOC_NSS_AXI_CLK			142
> +#define GCC_NSS_CE_APB_CLK			143
> +#define GCC_NSS_CE_AXI_CLK			144
> +#define GCC_NSS_CFG_CLK				145
> +#define GCC_NSS_CRYPTO_CLK			146
> +#define GCC_NSS_CSR_CLK				147
> +#define GCC_NSS_EDMA_CFG_CLK			148
> +#define GCC_NSS_EDMA_CLK			149
> +#define GCC_NSS_IMEM_CLK			150
> +#define GCC_NSS_NOC_CLK				151
> +#define GCC_NSS_PPE_BTQ_CLK			152
> +#define GCC_NSS_PPE_CFG_CLK			153
> +#define GCC_NSS_PPE_CLK				154
> +#define GCC_NSS_PPE_IPE_CLK			155
> +#define GCC_NSS_PTP_REF_CLK			156
> +#define GCC_NSSNOC_CE_APB_CLK			157
> +#define GCC_NSSNOC_CE_AXI_CLK			158
> +#define GCC_NSSNOC_CRYPTO_CLK			159
> +#define GCC_NSSNOC_PPE_CFG_CLK			160
> +#define GCC_NSSNOC_PPE_CLK			161
> +#define GCC_NSSNOC_QOSGEN_REF_CLK		162
> +#define GCC_NSSNOC_SNOC_CLK			163
> +#define GCC_NSSNOC_TIMEOUT_REF_CLK		164
> +#define GCC_NSSNOC_UBI0_AHB_CLK			165
> +#define GCC_NSSNOC_UBI1_AHB_CLK			166
> +#define GCC_UBI0_AHB_CLK			167
> +#define GCC_UBI0_AXI_CLK			168
> +#define GCC_UBI0_NC_AXI_CLK			169
> +#define GCC_UBI0_CORE_CLK			170
> +#define GCC_UBI0_MPT_CLK			171
> +#define GCC_UBI1_AHB_CLK			172
> +#define GCC_UBI1_AXI_CLK			173
> +#define GCC_UBI1_NC_AXI_CLK			174
> +#define GCC_UBI1_CORE_CLK			175
> +#define GCC_UBI1_MPT_CLK			176
> +#define GCC_CMN_12GPLL_AHB_CLK			177
> +#define GCC_CMN_12GPLL_SYS_CLK			178
> +#define GCC_MDIO_AHB_CLK			179
> +#define GCC_UNIPHY0_AHB_CLK			180
> +#define GCC_UNIPHY0_SYS_CLK			181
> +#define GCC_UNIPHY1_AHB_CLK			182
> +#define GCC_UNIPHY1_SYS_CLK			183
> +#define GCC_UNIPHY2_AHB_CLK			184
> +#define GCC_UNIPHY2_SYS_CLK			185
> +#define GCC_NSS_PORT1_RX_CLK			186
> +#define GCC_NSS_PORT1_TX_CLK			187
> +#define GCC_NSS_PORT2_RX_CLK			188
> +#define GCC_NSS_PORT2_TX_CLK			189
> +#define GCC_NSS_PORT3_RX_CLK			190
> +#define GCC_NSS_PORT3_TX_CLK			191
> +#define GCC_NSS_PORT4_RX_CLK			192
> +#define GCC_NSS_PORT4_TX_CLK			193
> +#define GCC_NSS_PORT5_RX_CLK			194
> +#define GCC_NSS_PORT5_TX_CLK			195
> +#define GCC_NSS_PORT6_RX_CLK			196
> +#define GCC_NSS_PORT6_TX_CLK			197
> +#define GCC_PORT1_MAC_CLK			198
> +#define GCC_PORT2_MAC_CLK			199
> +#define GCC_PORT3_MAC_CLK			200
> +#define GCC_PORT4_MAC_CLK			201
> +#define GCC_PORT5_MAC_CLK			202
> +#define GCC_PORT6_MAC_CLK			203
> +#define GCC_UNIPHY0_PORT1_RX_CLK		204
> +#define GCC_UNIPHY0_PORT1_TX_CLK		205
> +#define GCC_UNIPHY0_PORT2_RX_CLK		206
> +#define GCC_UNIPHY0_PORT2_TX_CLK		207
> +#define GCC_UNIPHY0_PORT3_RX_CLK		208
> +#define GCC_UNIPHY0_PORT3_TX_CLK		209
> +#define GCC_UNIPHY0_PORT4_RX_CLK		210
> +#define GCC_UNIPHY0_PORT4_TX_CLK		211
> +#define GCC_UNIPHY0_PORT5_RX_CLK		212
> +#define GCC_UNIPHY0_PORT5_TX_CLK		213
> +#define GCC_UNIPHY1_PORT5_RX_CLK		214
> +#define GCC_UNIPHY1_PORT5_TX_CLK		215
> +#define GCC_UNIPHY2_PORT6_RX_CLK		216
> +#define GCC_UNIPHY2_PORT6_TX_CLK		217
> +#define GCC_CRYPTO_AHB_CLK			218
> +#define GCC_CRYPTO_AXI_CLK			219
> +#define GCC_CRYPTO_CLK				220
> +#define GCC_GP1_CLK				221
> +#define GCC_GP2_CLK				222
> +#define GCC_GP3_CLK				223
> 
>  #define GCC_BLSP1_BCR				0
>  #define GCC_BLSP1_QUP1_BCR			1
