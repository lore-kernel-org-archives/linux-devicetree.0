From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 3/5] clk: qcom: ipq8074: Add Global Clock Controller
 support
Date: Fri, 2 Jun 2017 15:52:31 -0700
Message-ID: <20170602225231.GD20170@codeaurora.org>
References: <1496316482-25468-1-git-send-email-varada@codeaurora.org>
 <1496316482-25468-4-git-send-email-varada@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1496316482-25468-4-git-send-email-varada@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, linus.walleij@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, absahu@codeaurora.org, sjaganat@codeaurora.org, sricharan@codeaurora.org, mraghava@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 06/01, Varadarajan Narayanan wrote:
> From: Abhishek Sahu <absahu@codeaurora.org>
> 
> This patch adds support for the global clock controller found on
> the IPQ8074 based devices. This includes UART, I2C, SPI etc.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
>  drivers/clk/qcom/Kconfig                           |    9 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/gcc-ipq8074.c                     | 1009 ++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-ipq8074.h       |  152 +++

The new world order is to split these includes from the driver
changes. Then someone (clk or arm-soc related maintainers) can
merge that #define change somewhere stable and then apply the
driver code on top or the dts file on top.

So can you please split the header file off into it's own patch
before this one and resend?

> diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
> new file mode 100644
> index 0000000..b62db77
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-ipq8074.c
> +
> +static int gcc_ipq8074_probe(struct platform_device *pdev)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(gcc_ipq8074_hws); i++) {
> +		ret = devm_clk_hw_register(&pdev->dev, gcc_ipq8074_hws[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = qcom_cc_probe(pdev, &gcc_ipq8074_desc);
> +
> +	return ret;

Just return qcom_cc_probe() please.

> +}
> +
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
