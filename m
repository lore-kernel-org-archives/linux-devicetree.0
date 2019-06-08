From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 6/6] arm64: defconfig: Enable qcom ipq6018 clock and
 pinctrl
Date: Fri, 7 Jun 2019 20:32:53 -0700
Message-ID: <20190608033253.GF24059@builder>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-7-git-send-email-sricharan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559754961-26783-7-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sricharan R <sricharan@codeaurora.org>
Cc: robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org, agross@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed 05 Jun 10:16 PDT 2019, Sricharan R wrote:

> These configs are required for booting kernel in qcom
> ipq6018 boards.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 4d58351..abf64ee 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -373,6 +373,7 @@ CONFIG_PINCTRL_MAX77620=y
>  CONFIG_PINCTRL_IMX8MQ=y
>  CONFIG_PINCTRL_IMX8QXP=y
>  CONFIG_PINCTRL_IPQ8074=y
> +CONFIG_PINCTRL_IPQ6018=y
>  CONFIG_PINCTRL_MSM8916=y
>  CONFIG_PINCTRL_MSM8994=y
>  CONFIG_PINCTRL_MSM8996=y
> @@ -646,6 +647,7 @@ CONFIG_COMMON_CLK_QCOM=y
>  CONFIG_QCOM_CLK_SMD_RPM=y
>  CONFIG_QCOM_CLK_RPMH=y
>  CONFIG_IPQ_GCC_8074=y
> +CONFIG_IPQ_GCC_6018=y
>  CONFIG_MSM_GCC_8916=y
>  CONFIG_MSM_GCC_8994=y
>  CONFIG_MSM_MMCC_8996=y
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> 
