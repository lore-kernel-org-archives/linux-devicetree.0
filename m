From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: qcom: Add support for IPQ8064's global clock
 controller (GCC)
Date: Fri, 25 Apr 2014 18:53:05 -0700
Message-ID: <535B1181.4010209@codeaurora.org>
References: <1396642749-12979-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1396642749-12979-1-git-send-email-galak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/04/14 13:19, Kumar Gala wrote:
> +
> +#define P_PXO	0
> +#define P_PLL8	1
> +#define P_CXO	2
> +#define P_PLL3	3

This #define needs to be 1. Unfortunately the way we do this mapping
requires that they match the parents string array. If you have a better
idea I'm all for it.

> +
> +static const u8 gcc_pxo_pll8_map[] = {
> +	[P_PXO]		= 0,
> +	[P_PLL8]	= 3,
> +};
> +
> +static const char *gcc_pxo_pll8[] = {
> +	"pxo",
> +	"pll8_vote",
> +};
> +
> +static const u8 gcc_pxo_pll8_cxo_map[] = {
> +	[P_PXO]		= 0,
> +	[P_PLL8]	= 3,
> +	[P_CXO]		= 5,
> +};
> +
> +static const char *gcc_pxo_pll8_cxo[] = {
> +	"pxo",
> +	"pll8_vote",
> +	"cxo",
> +};
> +
> +static const u8 gcc_pxo_pll3_map[] = {
> +	[P_PXO]		= 0,
> +	[P_PLL3]	= 1,
> +};
> +
> +static const char *gcc_pxo_pll3[] = {
> +	"pxo",
> +	"pll3",
> +};
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
