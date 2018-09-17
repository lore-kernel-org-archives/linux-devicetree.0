Return-Path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Introduce QCOM LPASS clock
 bindings
Message-ID: <20180917031811.GA11141@bogus>
References: <1536685206-12239-1-git-send-email-tdas@codeaurora.org>
 <1536685206-12239-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1536685206-12239-2-git-send-email-tdas@codeaurora.org>
Date: Sun, 16 Sep 2018 22:18:14 -0500
To: Taniya Das <tdas@codeaurora.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 11, 2018 at 10:30:05PM +0530, Taniya Das wrote:
> Add device tree bindings for Low Power Audio subsystem clock controller for
> Qualcomm Technology Inc's SDM845 SoCs.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |  2 ++
>  .../devicetree/bindings/clock/qcom,lpasscc.txt     | 31 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sdm845.h        |  2 ++
>  include/dt-bindings/clock/qcom,lpass-sdm845.h      | 16 +++++++++++
>  4 files changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
>  create mode 100644 include/dt-bindings/clock/qcom,lpass-sdm845.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> index 664ea1f..b3ff6e8 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -32,6 +32,8 @@ be part of GCC and hence the TSENS properties can also be
>  part of the GCC/clock-controller node.
>  For more details on the TSENS properties please refer
>  Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> +- qcom,lpass-protected : Indicate that the LPASS clock branches within GCC are
> +			 unusable due to firmware access control restrictions.
>  
>  Example:
>  	clock-controller@900000 {
> diff --git a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
> new file mode 100644
> index 0000000..d312957
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
> @@ -0,0 +1,31 @@
> +Qualcomm LPASS Clock Controller Binding
> +-----------------------------------------------
> +
> +Required properties :
> +- compatible		: shall contain "qcom,sdm845-lpasscc"
> +- #clock-cells		: from common clock binding, shall contain 1.
> +- reg			: shall contain base register address and size,
> +			  in the order
> +			Index-0 maps to LPASS_CC register region
> +			Index-1 maps to LPASS_QDSP6SS register region
> +
> +Optional properties :
> +- reg-names	: register names of LPASS domain
> +		 "lpass_cc", "lpass_qdsp6ss".

"cc" and "qdsp6ss" is sufficient.

> +
> +Example:
> +
> +The below node has to be defined in the cases where the LPASS peripheral loader
> +would bring the subsystem out of reset.
> +
> +	lpasscc: clock-controller {

Needs a unit-address.

> +		compatible = "qcom,sdm845-lpasscc";
> +		reg = <0x17014000 0x1f004>, <0x17300000 0x200>;
> +		reg-names = "lpass_cc", "lpass_qdsp6ss";
> +		#clock-cells = <1>;
> +	};
> +
> +	gcc: clock-controller@100000 {

This needs a reg property. 

> +		compatible = "qcom,gcc-sdm845";
> +		qcom,lpass-protected;
> +	};

> diff --git a/include/dt-bindings/clock/qcom,gcc-sdm845.h b/include/dt-bindings/clock/qcom,gcc-sdm845.h
> index b8eae5a..968fa65 100644
> --- a/include/dt-bindings/clock/qcom,gcc-sdm845.h
> +++ b/include/dt-bindings/clock/qcom,gcc-sdm845.h
> @@ -197,6 +197,8 @@
>  #define GCC_QSPI_CORE_CLK_SRC					187
>  #define GCC_QSPI_CORE_CLK					188
>  #define GCC_QSPI_CNOC_PERIPH_AHB_CLK				189
> +#define GCC_LPASS_Q6_AXI_CLK					190
> +#define GCC_LPASS_SWAY_CLK					191
>  
>  /* GCC Resets */
>  #define GCC_MMSS_BCR						0
> diff --git a/include/dt-bindings/clock/qcom,lpass-sdm845.h b/include/dt-bindings/clock/qcom,lpass-sdm845.h
> new file mode 100644
> index 0000000..015968e
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,lpass-sdm845.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
> +#define _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
> +
> +#define LPASS_AUDIO_WRAPPER_AON_CLK			0
> +#define LPASS_Q6SS_AHBM_AON_CLK				1
> +#define LPASS_Q6SS_AHBS_AON_CLK				2
> +#define LPASS_QDSP6SS_XO_CLK				3
> +#define LPASS_QDSP6SS_SLEEP_CLK				4
> +#define LPASS_QDSP6SS_CORE_CLK				5
> +
> +#endif
> -- 
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
